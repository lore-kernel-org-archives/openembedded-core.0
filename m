Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0549F65D73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 16:18:02 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so1147345qcz.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fNNtkIEdEmWriTxUWMyjlciw5ih7ueEBYfPybjL5BWg=;
	b=a+Hw3jsMScadcbBL0NGIksQPZ94sOfrma8KLMYRfX+Kh7MFpwBPA/4MzLHMMV7U08E
	7ro0N7pRwfbeJwvoZuxYkxdUsAYHvRjrKwyZMtkMZ5Br0pmxU9P50YHMREjyP0Mm7mOj
	kmmQKOLZ40qLYSqTl6ALNs1S0TIvBT9m/E/2npsUYtk1k49RJmn9E97Xgg4WZpgQTkTZ
	sBxxF+QU0kbpatyGxg5+Ni6rWyZ6MVvJ5wLDoNvu/xnZ3kVe36oHrRLBFneg+V9KL2C0
	7jyJ4FdWk9g0frgR7yZD9mo7Vj+7H5vLXvMVkNjxT0j+wOychGq7kCZ2cmiJs/AHPbla
	u2VA==
X-Gm-Message-State: ALoCoQnTOL3fv8zaQ2AbAOHqlfQ2Wdugpm5jUM0hxwgTBB0zFn5NYLA260qmpUPB8640DfvP7UgA
X-Received: by 10.140.86.178 with SMTP id p47mr13594920qgd.66.1398269883025;
	Wed, 23 Apr 2014 09:18:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.136 with HTTP; Wed, 23 Apr 2014 09:17:42 -0700 (PDT)
In-Reply-To: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Apr 2014 17:17:42 +0100
Message-ID: <CAJTo0LaOkcf=EJz9fPWxBBhw+yif2aSJgvWaeiWY0bSSMtNGaA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Wed, 23 Apr 2014 16:18:03 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2014 16:01, Dan McGregor <danismostlikely@gmail.com> wrote:
> Explicitly mark the dummy function as externally visible
> so that ld can find the symbol at link time. This is needed
> when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
> uses -flto anyway.

So how does this work for me currently (or the autobuilder), where
ld-is-gold isn't enabled?

Ross

