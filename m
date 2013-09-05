Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB5361855
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:41:48 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j6so1920793oag.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qa0PkhqWmzpzC1XrAsUHoNJ0AzGepNbA+oKUIz/GQTg=;
	b=DoDLrgVy7fuujn+wDGKkXwhfgzOIssMI4i4l1k0pst3qJ6fFZ66ZNinnfOawe04Vcn
	zMgbFLNLJi+pkP10LihUHOdwl0iFyERHm7M19kHIzqg2Wl4m6tRCguLV4cnB6INB+7RT
	m81j3GbPPIqAXSmvE4W2PlgJJJBFLVx+pxOpmR3VXBeQklcJPeLLG/k8X3ZHO4k6+4ZX
	IemCk9lyzqMXSyLFUxSpwHLuoN2agrpJMtgUekwMn72hnY+8l2+B/mIDNI6HKuyQq+gT
	bRyMbeYqZZvTj8f1Nh0g+0LI+EWdJ94tsBVAziWr0DUbTWdvhNzK98KjBOgAsY/WFsFO
	HzGQ==
X-Received: by 10.182.101.165 with SMTP id fh5mr5755932obb.58.1378374109717;
	Thu, 05 Sep 2013 02:41:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.44.66 with HTTP; Thu, 5 Sep 2013 02:41:29 -0700 (PDT)
In-Reply-To: <52200080.4010401@windriver.com>
References: <CAGiJk9eorCAGAynkdn=eeq-NerCrx2sXpAtVS3h-R9D6tRkvpw@mail.gmail.com>
	<52200080.4010401@windriver.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 5 Sep 2013 11:41:29 +0200
Message-ID: <CAGiJk9cDook0po-4Kd7jD0BaBL4eR7-26ZuYH2u8Zbx6gdUs9g@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Busybox adduser cannot create system user "no uids left"
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
X-List-Received-Date: Thu, 05 Sep 2013 09:41:48 -0000
Content-Type: text/plain; charset=UTF-8

2013/8/30 ChenQi <Qi.Chen@windriver.com>:
>
> That's because CONFIG_SYSTEM_LAST_ID is set to 0 in defconfig.
> I'll send out a patch to fix it.
>
> Best Regards,
> Chen Qi


Hi,

sorry for the late answer, yes this would be great.

All "manual" installations (e.g. make && make install && useradd ...)
are affected.
Until now I did not test any packages that use the useradd.bbclass and
are installed after do_rootfs.
I suspect these package installations (that create system users) are
also broken, but I need to test it.


-- 
Regards
Samuel

