Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D2CC369D7
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:21:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.3637.1745396462183102114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=S4+3dtQ7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B6F9433E8;
	Wed, 23 Apr 2025 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745396460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkt+nQdjs2+rSBzjCPHQdI8juuT3I1ESk+AbDRbShjE=;
	b=S4+3dtQ7lpihKDst5XgqGqsnPthgKB1SgXMoVIXPFcaenLBfjObVU0gwLxsy4tsphGycTY
	ol/CcKJDWCCNN2bgZcQZ9rb89E0Vpcx/np1hlWC5duZOkg6wPTRt7bLkanxe8X+7+QjttX
	iAzyTb/uuyVJYzUNk+4JUHlXC0ZFlz0SJLxe07JM8tHq+/oGsuLzFoBvSIe378YF6CUNTL
	hlDJ/Ju08vq/NL9TaVxJwh2pLYADF6PNsS+ubYC39TQrcUUjn/ZrZIQh5rjkT3gPbIjugH
	Jfl4GF1Qbp/lQWpdgRRXZtWc9thRVpNHMDFgSzChH2fuTsqKjZBHWGBS2qaASQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Apr 2025 10:20:59 +0200
Message-Id: <D9DVEOE91D8S.3QLY2DBLUJHAA@bootlin.com>
Subject: Re: [OE-core] [PATCH] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250422144106.100804-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250422144106.100804-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeiudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehop
 hgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215267

On Tue Apr 22, 2025 at 4:41 PM CEST, Mikko Rapeli via lists.openembedded.or=
g wrote:
> To support "slirp" userspace networking which works more easily
> on various build machines, also without root and sudo rights
> to setup loop interfaces.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---

Hi Mikko,

Thanks for your patch.

> diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selfte=
st/cases/uboot.py
> index 96da4efb06..de082fe266 100644
> --- a/meta/lib/oeqa/selftest/cases/uboot.py
> +++ b/meta/lib/oeqa/selftest/cases/uboot.py
> @@ -33,7 +33,8 @@ QEMU_USE_KVM =3D "False"
>  """)
>          bitbake("virtual/bootloader core-image-minimal")
> =20
> -        with runqemu('core-image-minimal', ssh=3DFalse, runqemuparams=3D=
'nographic',
> +        runqemu_params =3D get_bb_var('TEST_RUNQEMUPARAMS', "core-image-=
minimal") or ""

I believe you forgot to add import for get_bb_var:

2025-04-23 06:21:37,461 - oe-selftest - INFO - 0: 43/44 533/625 (104.54s) (=
0 failed) (uboot.UBootTest.test_boot_uboot)
2025-04-23 06:21:37,467 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/uboot.py", line 36, in test_boot_uboot
    runqemu_params =3D get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal=
") or ""
                     ^^^^^^^^^^
NameError: name 'get_bb_var' is not defined

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1491

> +        with runqemu('core-image-minimal', ssh=3DFalse, runqemuparams=3D=
'nographic %s' % runqemu_params,
>                       boot_patterns=3Duboot_boot_patterns) as qemu:
> =20
>              # test if u-boot console works


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


