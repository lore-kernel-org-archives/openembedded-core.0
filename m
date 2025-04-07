Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41E1C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 07:53:57 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.41123.1744012428022684878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 00:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g/AnRADx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8D8344376;
	Mon,  7 Apr 2025 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744012426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tqm73uAVEf4CYDX6qHz8LuTCLStDAo5Zw5eEQ3QXpVw=;
	b=g/AnRADxLFfSR+D/pzJOLVRRiD+rXJGbXrv8v2DnPlf+dAqvhwjjpse3gvhSx+Ps99fR0U
	+7yVWOPiMPOaHUXctR3VEp4V2n0Pi90XrxU7izBAfbmmqiWDDXVovVF4eujXy+wQUzsO8B
	2tnVAUsVmd9pZxe86LNRgDFOY+c5f9hBmRjo3cVRNLAToPRsDqR1eAFdd9mzgu3ksmfmPW
	eO3yiPbHw9QmG8CQ7z3W/fL0mNJKQ5Reu7JRzCYr/0QvMCeJKJ1Nie8Zd3vGD1WpJenN8t
	iuP5l3ocVeXcnYmsvgzmWou8Fddbc2b5BmGCwb2MsfYfNxMEKX5e+ouOIvx8qw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 09:53:45 +0200
Message-Id: <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250404162932.447699-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrghdprhgtphhtthhopehop
 hgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 07:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214400

On Fri Apr 4, 2025 at 6:29 PM CEST, Mikko Rapeli via lists.openembedded.org=
 wrote:
> systemd based initrd supports more security, encryption etc features
> than custom shell script ones but oe-core lacks support for it.
> Convert core-image-initramfs-boot to create systemd based initrd
> if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> for this initrd to mount rootfs via Unified Kernel Image uki.py.
>
> Sadly the boot time is really slow, e.g. over 30 seconds with
> systemd based initrd. One of the major reasons is the large
> amount of kernel modules built into the linux-yocto kernel and
> processing of their udev events in userspace. Thus add
> kernel-initrd-modules meta package to easily install
> subset of all kernel modules to initrd. The subset
> supports "mount rootfs from any block device" but
> doesn't include graphics, UBS etc support. Without this
> generated meta package, initrd recipe needs to manually define
> which exact kernel modules to include which breaks if
> those modules are built into the kernel. Thus the initrd
> becomes machine and kernel config specific and hard to maintain.
> With this meta package a generic initrd can be created.
>
> Separate changes to linux-yocto compile a lot more drivers
> as modules but they depend on these initrd changes.
>

Hi Mikko,

Thanks for your patch.

I believe one of these wic related patches is responsible of some
oe-selftest failures we can see on the autobuilder:

2025-04-06 15:51:49,317 - oe-selftest - INFO - wic.Wic.test_permissions (su=
bunit.RemotedTestCase)
2025-04-06 15:51:49,318 - oe-selftest - INFO -  ... FAIL

...

ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_checkuri, the =
basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45=
030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df=
8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_checkuri -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_checkuri -Sprintdiff

ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_fetch, the bas=
ehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57f68=
e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c64a9=
cfba7cf. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_fetch -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_fetch -Sprintdiff

ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_unpack, the ba=
sehash value changed from ae9d94aafc721d891f8754df82ed90da8191357178f3db642=
21a49d5c1de3bcd to 1ac8f87a71db151b8eb2ae8d13f9a6ea1a0c884ef98555d61d2c2fe0=
7a476a8a. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_unpack -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_unpack -Sprintdiff

...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1391

Can you have a look at this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


