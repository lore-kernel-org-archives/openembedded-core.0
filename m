Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id AB165701A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:32:28 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id v10so3064291qac.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 03:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PEayxUqeIW0s/KyWhtM0qvCbY8UcE3tQG2MJv9A5nkg=;
	b=PR2QIN3xh19XFpJ3+XmAfTV3FeL0mlAI+jpLasIHynCAPaFCM9a0HuCOIh4ncnUgh/
	H22zoCyuUkZfnXXpViG3Cx+vHbcBaVN15OvtMg/56gqIOAlx6JbjnyHqU7rAtbh7Iajz
	DD9zD5jTfJjMAjG/MihJNlBgdbKWRKMX5lG8bfwjgoz6RUpVxtEAPNM8EcBB9mBqzUch
	4CU5G1gOP5NKsF6EwODNoE2uQb3vSdLp+6PD6D1Xwi/OgnBwnFmkdlbf3kPNLqYqx8qO
	g/kpztNkKH2ni1hngkOGV8JaKbskzlCJ7uGWYT7zQeXFzOA8uG4qk/Ng1XQRcoC6vC0s
	FndQ==
X-Gm-Message-State: ALoCoQk1FFlvvcmh/nU3h8shs96PCdnH4uI/n5QWAzsiErLDs+6yGUlo2thtsPR1Z4FQKdkaCTY+
X-Received: by 10.224.167.136 with SMTP id q8mr20756218qay.35.1405333949175;
	Mon, 14 Jul 2014 03:32:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 14 Jul 2014 03:32:09 -0700 (PDT)
In-Reply-To: <1405328638-7688-1-git-send-email-jackie.huang@windriver.com>
References: <1405328638-7688-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jul 2014 11:32:09 +0100
Message-ID: <CAJTo0LbBpWLoJq_LP_PtnGDVcYoE6V+ChzODDV2anPW1cgoZ3w@mail.gmail.com>
To: jackie.huang@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] setserial: package depends on groff-native to build
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
X-List-Received-Date: Mon, 14 Jul 2014 10:32:34 -0000
Content-Type: text/plain; charset=UTF-8

On 14 July 2014 10:03,  <jackie.huang@windriver.com> wrote:
> Add explicit depends to avoid host contamination.

That's not host contamination, please reword the commit to explain
that it's a missing build dependency.

Ross

