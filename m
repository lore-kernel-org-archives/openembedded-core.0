Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC0DC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 13:10:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12708.1741266639881132440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 05:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QRCLStOI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDAF8443D0;
	Thu,  6 Mar 2025 13:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741266638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p4AYl+IeiIWIi8COz9Hi9YD1eyP/BZ66Hoanc8kHkxw=;
	b=QRCLStOIjKDv1nwuO7LjWOfVwe1euAj4Lp2J6tfVdD+YYQrvlNrVS2lvU5glLMBRauG/tM
	54O1rd4OH9mc/rQxo+qLdQSYC1/BuNXF7kS+bRJ/dKZXRq+JFEDMp2YJDfOudhP8KpN3zt
	v5IkiVbNxpaAV6T7NoqF3kIBwla+0L4KCuAum4fa/9vRsC5Uo/oFBJCnQXH1FbIDys466u
	q/HrCOER2bfm3tFo/70v/SSq4Vb+9E1ACoGPX2bHSDeaoQE0mTfgeY5YXZ/v6reggOFzOF
	7+BUoI+oTBx1iYcDuqTvhCVeyIS0QJ+MmomnJ6CCVHxP/mf8t+UfCDldjBTVuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 14:10:37 +0100
Message-Id: <D897IA2JDVDD.MBR1KBH9YWBE@bootlin.com>
To: <festevam@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] mtd-utils: Upgrade to 2.3.0
Cc: <ross.burton@arm.com>, <raj.khem@gmail.com>, "Fabio Estevam"
 <festevam@denx.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250304131105.1187410-1-festevam@gmail.com>
In-Reply-To: <20250304131105.1187410-1-festevam@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekheegtdfgjeekjefglefhfeduieekiedujeeivdettdffleeufeelieevieduvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhinhhfrhgruggvrggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguv
 gguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesuggvnhigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 13:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212388

Hi Fabio,

On Tue Mar 4, 2025 at 2:11 PM CET, Fabio Estevam via lists.openembedded.org=
 wrote:
[...]
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb b/meta/recipes-=
devtools/mtd/mtd-utils_2.3.0.bb
> similarity index 91%
> rename from meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
> rename to meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> index 5ab5f6c729..7a132a9aef 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_2.2.1.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> @@ -11,8 +11,12 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS =3D "zlib e2fsprogs util-linux"
>  RDEPENDS:mtd-utils-tests +=3D "bash"
> =20
> -SRCREV =3D "13ec33609213c1dbd75852a09560a707a7f19a5c"
> +SRCREV =3D "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
>  SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster"
> +SRC_URI +=3D "file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch"
> +SRC_URI +=3D "file://0002-ubifs-utils-journal-Include-sys-stat.h.patch"
> +SRC_URI +=3D "file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo=
.h-isn.patch"
> +SRC_URI +=3D "file://0004-ubifs-utils-extract_files-Include-linux-limits=
.h.patch"

You can make a single SRC_URI assignment here:

  SRC_URI =3D "git://git.infradead.org/mtd-utils.git;branch=3Dmaster \
             file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch \
             file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
             file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-i=
sn.patch \
             file://0004-ubifs-utils-extract_files-Include-linux-limits.h.p=
atch \
             "

It will make parsing a bit faster.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

