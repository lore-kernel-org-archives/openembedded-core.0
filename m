Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6024C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 08:19:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.43645.1752740388011265468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 01:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o6Ri7XkJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD1B71FD37;
	Thu, 17 Jul 2025 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752740386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rcgSA6/5ggTN+8lBD9pXHN0zbIY7PHZxjWXzVF8YI4=;
	b=o6Ri7XkJ6G6q4DiTtxZt5Mm3PG4Vq8gQheowjyOSxBDaLtsofslHKAkmTvXGuJ9DSAjHdX
	RLAgzZl9JM+rsZz+riBvwDXUVZtF7VIpBMiQRvMcv/F4U3iGLW8FsKHCx5kTGIu85Vyf5D
	jYds5pZIgrfSRlmTGi/1D1xEMDy0W2PSmiBtbyYb2lU1XqvfRiN9iR7zsl9HJTL2hFOFgL
	VK9c9XhbxSI2BOYUVE1Vose4O+y5umqrVtLfqo/L342H8zGV+ej50+BNBOTVE5bARoIlpM
	PDXssPnQa+8mKfwTPE7gotMgxpegwtboJckkKA68WW+RIm+0xL+egu9oTN/VSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 10:19:45 +0200
Message-Id: <DBE6M18ID41K.956HRERV352W@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: upgrade 2025.04 -> 2025.07
Cc: "Fabio Estevam" <festevam@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250716080437.189201-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250716080437.189201-1-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffgteekveevgfeukedthffgffdthfdufeekjeefvdffuefgudfgiedttdeifefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdplhhisgdqfhhigidqpggvfhhirdhsohdptdegrdgssgdptdejrdgssgdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrt
 ghpthhtohepfedprhgtphhtthhopehmihhkkhhordhrrghpvghliheslhhinhgrrhhordhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220519

On Wed Jul 16, 2025 at 10:04 AM CEST, Mikko Rapeli via lists.openembedded.o=
rg wrote:
> From: Fabio Estevam <festevam@gmail.com>
>
> Upgrade to U-Boot 2025.07. Added patch for build race condition.
> Removed qemu KVM USB workaround since issue is fixed upstream.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  ...-Makefile.lib-fix-_efi.so-dependency.patch | 116 ++++++++++++++++++
>  .../u-boot/files/disable_CONFIG_USB.cfg       |   1 -
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |   7 +-
>  ...ols_2025.04.bb =3D> u-boot-tools_2025.07.bb} |   0
>  .../{u-boot_2025.04.bb =3D> u-boot_2025.07.bb}  |   4 +-
>  5 files changed, 123 insertions(+), 5 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-scripts-M=
akefile.lib-fix-_efi.so-dependency.patch
>  delete mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
>  rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb =3D> u-boot-tool=
s_2025.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-boot_2025.07.bb=
} (64%)
>
> v2: added upstreamed patch to fix build race conditon, removed qemu kvm w=
orkaround
>     fixed upstream. Would be nice to check if builds now pass.
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/220004
>

Hi Mikko, Fabio,

Thanks for the new version, I really had some hope, but it looks like we
still have a similar fail:

ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
...
| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fi=
le or directory

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2123
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1971
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1907

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


