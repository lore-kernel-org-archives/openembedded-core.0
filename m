Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E8DC83F34
	for <webhook@archiver.kernel.org>; Sat, 19 Jul 2025 06:34:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.6070.1752906881048338210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 23:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AGt1zrSt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70B9F442B1;
	Sat, 19 Jul 2025 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752906878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h0hP4ZMU+IwHQlNN//uX7/+oGqUBw+PGnNvgYPgwwWU=;
	b=AGt1zrStWmnAKJG18SC3s2cok+Cdty9Slv09acZJxVVW/w0jGYkyKnAhhkkl5e2L6NimeF
	uFQF0gV8Ha5BRRjxAnCdYI1J+iYNgkAmyX+KU22BSDQfEPruAK5Yeni9IDguE04Qw9LTbD
	KWXTAM/GZAr8lvYw8KXAobTbLt/e7YrV4o27Ix5lYdz7+AV3sSHzyoD0hDYpdruaNfj9ud
	wNlNyXdhxUYemGARC1k7eZaU5mTke1ftUWSFtxWaoMR96yHRO6O6ZI7zFodIdzNBkLOlO/
	O58/gfVjlAgKER+ZEwWpxswzDU3r+8M4fyOXTBJPx4TKPDo3HviBnoYbYuftEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Jul 2025 08:34:37 +0200
Message-Id: <DBFTMMJ8WHKL.362BOXS9ZHA6Z@bootlin.com>
Cc: "Fabio Estevam" <festevam@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] u-boot: upgrade 2025.04 -> 2025.07
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250718090123.420399-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250718090123.420399-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiheeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheehveeggfdvgefhgfehieetvddvfedtleehheffvdetteekheegtedutdfhvdehnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeelvddrudefiedrvdduhedrvdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddufeeirddvudehrddvgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvu
 gguvggurdhorhhgpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Jul 2025 06:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220609

On Fri Jul 18, 2025 at 11:01 AM CEST, Mikko Rapeli via lists.openembedded.o=
rg wrote:
> From: Fabio Estevam <festevam@gmail.com>
>
> Upgrade to U-Boot 2025.07. Added patches for build race conditions.
> Removed qemu KVM USB workaround since issue is fixed upstream.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---

Hi Mikko,

Much better, but we have another test failure now, specifically on ARM
host:

QEMU 10.0.2 monitor - type 'help' for more information
...
Loading Environment from Flash... *** Warning - bad CRC, using default envi=
ronment

In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
Register 8001040 NbrPorts 8
Starting the controller
"Synchronous Abort" handler, esr 0x96000010, far 0x10088040
elr: 000000000005a360 lr : 000000000005a344 (reloc)
elr: 000000004f6fc360 lr : 000000004f6fc344
x0 : 0000000010088040 x1 : 0000000000000001
x2 : 0000000000000000 x3 : 0000000000003e80
x4 : 0000000000000038 x5 : 000000004e6708e2
x6 : 0000000000000000 x7 : 0000000000000000
x8 : 0000000000000000 x9 : 000000000001869f
x10: 000000000000000d x11: 0000000000000006
x12: 000000004e561af8 x13: 000000004e561dd0
x14: 0000000000000002 x15: 0000000000000000
x16: 000000004f6ee774 x17: 0000000000000000
x18: 000000004e661dd0 x19: 000000004e670e40
x20: 0000000000000000 x21: 0000000010088040
x22: 0000000010088000 x23: 0000000000000000
x24: 0000000000000000 x25: 0000000000000000
x26: 0000000000000000 x27: 0000000000000000
x28: 00000000
...
2025-07-18 23:17:34,434 - oe-selftest - INFO - ERROR: uboot.UBootTest.test_=
boot_uboot_kvm_to_full_target (subunit.RemotedTestCase)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2140

Can you look into that error?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


