Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286C2C88E7D
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 11:43:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12965.1789559010018193895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 04:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qZcF8npw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BBD5C4E405BC;
	Wed, 16 Sep 2026 11:43:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9016060337;
	Wed, 16 Sep 2026 11:43:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81A8211C7AFE8;
	Wed, 16 Sep 2026 13:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789559007; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CD20eYbD9A7MkzUzD+RoQMtYRg+SfZxmpjmkmTMs5Kc=;
	b=qZcF8npwpxIiV8J4KZ7fPlYYHnM4Y3T/q4rmINrH17vLDNp3f1ak4+jHaZfWGT6uBrkLOR
	1RKnbOakxBzHev6BiSzsaD1U3TOzlCGqtTGD0QoX0k4jIMLnwGzW99navMpd05675jad1X
	Mric7QWQjhfsKSWA6k5XuEkE+EnSFr/XAiDSCjek67aPWS1j/rXBU2nlei1SXtEUi4ujDo
	TzqQ9n6lCUz9Q4FPzdArbKkjMnjLQ1Q4go1fMszpJRn7I2JrutkiA1bfCHPPXyXv+cruS/
	ovaGcuJMJ605pRZXxabcbiGkQV6J47fPHkH43JXNXECNnG38FoXn+zfcR4MuhQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 13:43:25 +0200
Message-Id: <DLGPQ1X40IXU.3E13NLLX5ZW3M@bootlin.com>
To: <f_l_k@t-online.de>, <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260916055325.3396270-1-f_l_k@t-online.de>
In-Reply-To: <20260916055325.3396270-1-f_l_k@t-online.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 11:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245953

Hi,

On Wed Sep 16, 2026 at 7:53 AM CEST, Markus Volk via lists.openembedded.org=
 wrote:
> Needs glib-2.0 >=3D 2.89.3, which the 2.90.0 upgrade provides.
>
> AI-Generated: Uses Claude Code (Claude Opus 5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb} (97%=
)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.24.0.bb
> similarity index 97%
> rename from meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
> index 5d7385d29a..8a350d44f2 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
> @@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D " \
>      file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19=
d29fb2 \
>  "
> =20
> -SRC_URI[archive.sha256sum] =3D "7fd725deb2cb3f8dc218ad862c5056ff8548f49d=
3b0e4081796e444c22d19686"
> +SRC_URI[archive.sha256sum] =3D "28ba4ac1c04f86eac09b79a163cb163a4c2b5444=
2d9f7eccc04679062a581044"
> =20
>  S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
> =20

I think your patch triggers the following error:

ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gtk4/4.2=
4.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in package gtk4-src contains re=
ference to TMPDIR [buildpaths]
ERROR: gtk4-4.24.0-r0 do_package_qa: QA Issue: File /usr/src/debug/gtk4/4.2=
4.0/gtk/svg/libgtk_svg.a.p/gtk_svg-unity0.c in package gtk4-src contains a =
reference to the build host HOME directory. If upstream hardcodes a directo=
ry path that matches your home, you can set OEQA_BUILDPATHS_SKIP =3D "/srv/=
pokybuild" in the recipe. [buildpaths]

Full log: https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/8949458=
/raw_inline
Parent build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/b=
uilds/4634

Not sure we are going to merge this yet after reading the thread, but you m=
ight
want to look into it.

Antonin

