Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F9CC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 08:51:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.42661.1744015906052650858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 01:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kPJVIPES;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDC164328A;
	Mon,  7 Apr 2025 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744015904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCA7Jylb4We4ZgVhKhZUSmvoTPCQ7B6YPQ0CCMMaZ9I=;
	b=kPJVIPESJslwL1d7qR45VUpGFiCgFBhm6ZJsO9mNU9pAB6O04Xd53vD+VOiHC/BIYgl6WI
	x4ZcXk+121EmddDUs7AWHnFn8zd+RpgXz8NFwfcRTj0G1HIIyno8UXXdjkX5jnD5xY5uEe
	akP8aNW1nNy1S/1iv7q7cx1elo3QXv/nmiPneKDW1yPsYG01CEvKOfK7r7KTPmIXSggc+8
	qFhBfIkXaHhhwURfm6xT7tEEFdvTFtHA+OO6qZqUDChTPNqaQDJt44i5yMY+IqgWlJTALM
	agY/6WdOoPKKDClcDEddRd0ehK51Xh3oaPpZo8bWtSnbLmQW1B40n+JfOYhz5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Apr 2025 10:51:43 +0200
Message-Id: <D90A1HIWOZYV.25J0FOK1DMUDK@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 00/11] systemd based initrd and modular
 kernel support
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <D908T3Q0WX31.XYGZX5NGTRL7@bootlin.com> <Z_OIeeFp_hWMjTkJ@nuoska>
In-Reply-To: <Z_OIeeFp_hWMjTkJ@nuoska>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleeljeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeggfetgeehgeejhefhhfegleekhefgleefueektedvkeeitddtveegfeduueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhis
 ehlihhnrghrohdrohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 08:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214404

On Mon Apr 7, 2025 at 10:10 AM CEST, Mikko Rapeli wrote:
> Hi,
>
> On Mon, Apr 07, 2025 at 09:53:45AM +0200, Mathieu Dubois-Briand wrote:
>> On Fri Apr 4, 2025 at 6:29 PM CEST, Mikko Rapeli via lists.openembedded.=
org wrote:
>> > systemd based initrd supports more security, encryption etc features
>> > than custom shell script ones but oe-core lacks support for it.
>> > Convert core-image-initramfs-boot to create systemd based initrd
>> > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
>> > for this initrd to mount rootfs via Unified Kernel Image uki.py.
>> >
>> > Sadly the boot time is really slow, e.g. over 30 seconds with
>> > systemd based initrd. One of the major reasons is the large
>> > amount of kernel modules built into the linux-yocto kernel and
>> > processing of their udev events in userspace. Thus add
>> > kernel-initrd-modules meta package to easily install
>> > subset of all kernel modules to initrd. The subset
>> > supports "mount rootfs from any block device" but
>> > doesn't include graphics, UBS etc support. Without this
>> > generated meta package, initrd recipe needs to manually define
>> > which exact kernel modules to include which breaks if
>> > those modules are built into the kernel. Thus the initrd
>> > becomes machine and kernel config specific and hard to maintain.
>> > With this meta package a generic initrd can be created.
>> >
>> > Separate changes to linux-yocto compile a lot more drivers
>> > as modules but they depend on these initrd changes.
>> >
>>=20
>> Hi Mikko,
>>=20
>> Thanks for your patch.
>>=20
>> I believe one of these wic related patches is responsible of some
>> oe-selftest failures we can see on the autobuilder:
>>=20
>> 2025-04-06 15:51:49,317 - oe-selftest - INFO - wic.Wic.test_permissions =
(subunit.RemotedTestCase)
>> 2025-04-06 15:51:49,318 - oe-selftest - INFO -  ... FAIL
>>=20
>> ...
>>=20
>> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_checkuri, t=
he basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280=
a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf944=
5df8b0ea6a69e. The metadata is not deterministic and this needs to be fixed=
.
>> ERROR: The following commands may help:
>> ERROR: $ bitbake test -cdo_checkuri -Snone
>> ERROR: Then:
>> ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
>>=20
>> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_fetch, the =
basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57=
f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c6=
4a9cfba7cf. The metadata is not deterministic and this needs to be fixed.
>> ERROR: The following commands may help:
>> ERROR: $ bitbake test -cdo_fetch -Snone
>> ERROR: Then:
>> ERROR: $ bitbake test -cdo_fetch -Sprintdiff
>>=20
>> ERROR: When reparsing /tmp/selftest-fetchsrayuxoq/test.bb:do_unpack, the=
 basehash value changed from ae9d94aafc721d891f8754df82ed90da8191357178f3db=
64221a49d5c1de3bcd to 1ac8f87a71db151b8eb2ae8d13f9a6ea1a0c884ef98555d61d2c2=
fe07a476a8a. The metadata is not deterministic and this needs to be fixed.
>> ERROR: The following commands may help:
>> ERROR: $ bitbake test -cdo_unpack -Snone
>> ERROR: Then:
>> ERROR: $ bitbake test -cdo_unpack -Sprintdiff
>>=20
>> ...
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1391
>>=20
>> Can you have a look at this please?
>
> I can have a look but how can these patches change the basehash'es when t=
esting?
>
> I've seen some of the wic selftets failing on x86_64 build machine with z=
fs
> but changes to fix this was rejected multiple times.
>
> Then I've seen some of these failing with odd pseudo failures on aarch64
> build machine.
>
> With my patches the end result was the same.
>
> I ran wic and uki selftests on x86_64 and aarch64 build machines for targ=
ets qemuarm64,
> qemuarm and genericx86-64.
>
> The wic patches have actually nothing to do with this series except I ran=
 into bugs
> in wic which resulted in unbootable images, e.g. the UEFI bootloader bina=
ries
> missing from ESP partition. These were impacting some builds but not all
> which was really troubling.
>
> Cheers,
>
> -Mikko

Ok, I am running some git bisect locally anyway, I will keep you updated
a bit later today.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


