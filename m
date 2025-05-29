Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9CCC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 13:56:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.21680.1748526960535490454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 06:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MZxBahMz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598B2439B1;
	Thu, 29 May 2025 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748526958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSPr0fXOa9t0cF6y4jfz8y0qKIGXbQ2m7enIT4Mvn98=;
	b=MZxBahMzUAmIZP7k/eDizf0pOWbyPWcXCiDaNxbKGhPftW3XuET3It5xLQmcDr0j7n+as2
	WU+UiUGA+nZXJkd4K68PAoL1zRL8VLXjZ+quuV31zYnx+HaNy1IXw5y2opuTCtPF3pykRb
	RvXvNpKKu9mVsTztuVoBHkf43ZXaYrDT3juEb25H7CUOqG1ivsgdbAkffxWmuU7TPLrYXS
	MBafaZ8pqOR3DicoN7j2igM6QUkx/RWOzg7PS5mVSPIplq5nW6TpIdnVIwuaFZj0LjSBA5
	Y0onuUadT/A07o/nXOFonJ/kH/q19FK169JTQ0ToFXN/SZvvj+ROzGSf499bkQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 15:55:56 +0200
Message-Id: <DA8P2QRAA1SJ.3VHA71AFG09UZ@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 1/4] wic bootimg-efi.py: fail build if no
 binaries installed
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250528125635.684302-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250528125635.684302-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvieeftdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvffuhffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedtjedvfedugeeujeejheekjeeutedujedvvdegleeggeekieeguddvjedtgfegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegsfeeiheemkeegjegtmegrrggvkeemkehfvgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemsgefieehmeekgeejtgemrggrvgekmeekfhgvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgp
 dhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217413

On Wed May 28, 2025 at 2:56 PM CEST, Mikko Rapeli via lists.openembedded.or=
g wrote:
> With systemd-boot, some builds included correct EFI
> bootloader binaries and some not. Thus some builds
> booted and some not. Check that some boot binary
> was installed so that build fails if none were installed.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---

Hi Mikko,

It looks like we have a new selftest error:

2025-05-29 06:41:09,920 - oe-selftest - INFO - overlayfs.OverlayFSEtcRunTim=
eTests.test_image_feature_is_missing (subunit.RemotedTestCase)
2025-05-29 06:41:09,921 - oe-selftest - INFO -  ... FAIL
...
ERROR: core-image-minimal-1.0-r0 do_image_wic: Execution of '/srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/build-st-1199444/tmp/work/qemux86_64=
-poky-linux/core-image-minimal/1.0/temp/run.do_image_wic.2027179' failed wi=
th exit code 1
...
| ERROR: No EFI loaders installed to ESP partition. Check that grub-efi, sy=
stemd-boot or similar is installed.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1649
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1590

Can you have a look please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


