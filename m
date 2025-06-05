Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EFAC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 07:05:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.1474.1749107153766501380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 00:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XtqVuDc0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EAE143B39;
	Thu,  5 Jun 2025 07:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749107152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AkI0Y3WYh+WIxPagMjNCg90E4w12+ubh/gp2R6o5Ms=;
	b=XtqVuDc0i7GQmRMhAUozdonYDqklk/cwrqNCeSPkC1I4bTzgcSEo/a4S00ykd04fhSVk9E
	/2d2Me5LfrF/yPUMzuq4eCxcy6q75cBGvp6K4mPNZFuxAJsyqZoMgiJgbQQV5POQMi8U7L
	mdt3kMilupNqPR/GC4LloErzKa79gqd3ITPE3AZCtrYdWmGO0sgrDADqro5IhsSeWJeexQ
	qgzxS5LpNFWe8cN8i+pmaDMmwYr+gl/ExBKVl0uMrQT4O6HRrkcsul0pGc7Ds1pS2Xz8Dl
	z0QdWZFaP9yGBhdJU9mzZ2ZZI3KT10HG5bVw96zYp6qJFBo1SVouqbZ5KYwLCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 09:05:47 +0200
Message-Id: <DAEEQIKAAIMY.7Z3LV7HQZ4XO@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <florian.glaser@ifm.com>, <openembedded-core@lists.openembedded.org>,
 "Steve Sakoman" <steve@sakoman.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] gtk+: add missing libdrm
 dependency #scarthgap
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <UObH.1749021541734030637.WDPL@lists.openembedded.org>
In-Reply-To: <UObH.1749021541734030637.WDPL@lists.openembedded.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeefvdejleefieekfeehleejteehueeluddtheeltddtgeeliefffeevvdefkedvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepfhhlohhrihgrnhdrghhlrghsvghrsehifhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheps
 hhtvghvvgesshgrkhhomhgrnhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 07:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217989

On Wed Jun 4, 2025 at 9:19 AM CEST, florian.glaser via lists.openembedded.o=
rg wrote:
> Hi all,
>
> This patch backports a fix from the "styhead" branch to the "scarthgap" b=
ranch. It addresses #15513 "gtk+: add missing libdrm dependency".
>
> Patch:
> From 41f7eb15fa9189b1cf2c0d862e6e4ca2e5a4e2fc Mon Sep 17 00:00:00 2001
> From: Andrew Fernandes <andrew@fernandes.org>
> Date: Thu, 13 Jun 2024 12:54:27 -0700
> Subject: [PATCH] gtk+: add missing libdrm dependency
>
> Fixes [YOCTO #15513]
>
> When built without the wayland feature, gtk4 does not
> build due to a missing explicit dependency on libdrm.
>
> Signed-off-by: Andrew Fernandes <andrew@fernandes.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> [Backported from styhead branch: b32290d9bbcfccc9b85fa5acbeaee5d32d9a9091=
]
> ---
> meta/recipes-gnome/gtk+/gtk4_4.14.1.bb | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.14.1.bb
> index 497be6805a..aae69271ac 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
> @@ -16,6 +16,7 @@ DEPENDS =3D " \
> graphene \
> harfbuzz \
> jpeg \
> + libdrm \
> libepoxy \
> libpng \
> librsvg \
> --
> 2.25.1
>
> Best regards,
> Florian Glaser

Hi Florian,

Please add [scarthgap] in mail subject for patches targeting Scarthgap.

Adding Steve in copy to make sure he sees this patch.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


