Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5105674616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 11:07:03 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id d6so12045355itl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qaz5dItWYx/GquAMj118/cRqoBjy21/jAFns8z/iENc=;
	b=G8DdaAc6xFN431zF83Smt3UgortGUn4EqVIxffoCqoGLK6NnLR3dpMsR25/R3MbKyo
	z1EU1BBZweSjtsWJF+YcfybATEQHomslMHDDj2GvHTOwi+IeziWaMuGVxvVRxtvN0W8+
	Tis5RgPY6WkJbV/WaW3sR1KGSyYCXhkkr0/6UQqzlADQ0586t7mlQsBqDua/XDGix+/+
	qvlqBPkIc8UM6+G63OKMlNi4Tw56Qn7N0XBJOAWZpAbtHjYA1nViAm8fC9LEmg9vDAML
	qZfn3L0lnbQIaL9HsrZA9i5WE7FGGjAX2O8Hi+7ZNbHzpL1G2A+do21jbSubC/JL1uoh
	Si+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qaz5dItWYx/GquAMj118/cRqoBjy21/jAFns8z/iENc=;
	b=VZDEEc0Iut+tBXkFmAYae9gAes/PReJMOl0GwTucPx+uzqRfClAYBqZHniwQdf7Lmi
	7aEo5IrzYkusitAeRTGe+U+Ucjs9ym5tkKHL9uC1esdh/3+9kmWoO2p8mDsomXmV0Zgn
	UDfwaQxkK6YNNtQsQguMN5LHtvWFHp3Z2ZW+ZbU8uMtqZxP/QYhnyL9xk6vZm4fn4cib
	ZUmprfhkrcy9buUUgla3AN+zB2YC3qTwH/kE7Qmfts23SMdbI9Tv7osYWUqH+7s+iNFf
	HJ4Pc6XcXCqPlW7OzsbVYStfXkZkQcrCdFh0a9a4hweIgZ6sqyQENWtj+4DlUdKS/5Jx
	sabQ==
X-Gm-Message-State: AGRZ1gKjMo8FqKrK3j5vmP2M5ekwJsX5Wq3/UriJexS3MfiTjIPqCKYZ
	Bc0KukSU8e2xXQc3AMdyRHw1JgrIQmFsIfxrOkJ8xg==
X-Google-Smtp-Source: AJdET5e1zOlVbColK5kvNze6387WMNxvUrp6ntIH8I6ue+zKxiDnrr0s5Ymmdg2E0nG7RctAu5xGmO2tl5uKO+lvTAU=
X-Received: by 2002:a05:660c:a06:: with SMTP id
	e6mr1583397itk.62.1540984024146; 
	Wed, 31 Oct 2018 04:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20181030093655.26251-1-hugues.kamba@arm.com>
	<CAJTo0LZsRLrwRTDyU6iFHjdm6PwajpLjRN3RbufZLuik0bCdxw@mail.gmail.com>
	<VI1PR08MB36316D19DEB81B04D36EE6C798CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<CAJTo0LZeQheF0VN=cOiyu+Ju6=38uCUBjv_=oRSgJmMP+cuM4w@mail.gmail.com>
	<VI1PR08MB363149A6F54AF72EF72DE29598CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR08MB363149A6F54AF72EF72DE29598CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Oct 2018 11:06:52 +0000
Message-ID: <CAJTo0La2bCYcSOVrp_ohhPDRpu4Pajje5rOw8HDwmLHHMq8MKQ@mail.gmail.com>
To: Hugues.Kamba@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2018 11:07:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Oct 2018 at 17:23, Hugues Kamba <Hugues.Kamba@arm.com> wrote:
> I am still new to Yocto but my understanding of adding pyvenv to venv's RPROVIDES is that python3-pyvenv is available (albeit as an alias of python3-venv).
> I therefore have not removed the possibility for one to choose to include the pyvenv package instead of the new venv package.
> In fact, I tested building with python3-pyvenv included.
> Which parts of the conmit message are contradicting according to you?

"    This patch adds the python3-venv module as a self-contained package which
    python3-pyvenv must depend on at run-time."

python3-pyvenv does't exist.

I'd simply rewrite the message along the follow lines:

  python3: add python3-venv package
  Package both the venv module and the pyvenv binaries into the
python3-venv package.
  Add python3-pyvenv RPROVIDES to python3-venv for backward compatibility.

Ross

