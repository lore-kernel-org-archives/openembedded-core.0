Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A46C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 18:10:10 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.43850.1707070204734872516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 10:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=SAvgMeGR;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from vitani.co-bxl (vitani.co-bxl [10.0.0.37])
	by wilbur.contactoffice.com (Postfix) with ESMTP id D54CE15EB;
	Sun,  4 Feb 2024 19:10:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1707070202;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=1504; bh=rAkbPdkIZa29w1iMsXOSO4Y+S+Erw/aZT3dKZGD3lbo=;
	b=SAvgMeGR6P0MMcrtKZpEyMaPKM9I7KpLqgB/ab3LjJCmad3d8Zat8Ds0rIi5BVo1
	DL/ySgcS5W/2DtKFKfq5Z5ayMgoGrOS8oUpbuK/3PFOsqLvQKbcu5ptMJ/iSTvqapSZ
	87tqVYoafFMPCoL4EiT52EAKHuklbRraeYX9MTATmWGBz5+R2FDJIwfw2gwCbIxcByv
	7BeWfnFquWCY/pixtgOt8SDwbCfehoS57qGTeY8XGmRlG4qTvBMb4tcKcBVbq8FVRd8
	UT5OR2V6NTpyqGofmLiPpqoUlFON8jWTfSB4/tAJyWnQl73GmJFcVamucrBZaao8Inz
	PEXGrUlVxw==
Received: by smtp.mailfence.com with ESMTPSA ; Sat, 3 Feb 2024 19:09:48 +0100 (CET)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] gtk: Set CVE_PRODUCT
Date: Sat,  3 Feb 2024 10:09:17 -0800
Message-ID: <20240203180917.761766-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 18:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194905

From: Robert Joslyn <robert.joslyn@redrectangle.org>

The CPE vendor is "gnome" and the CPE product is "gtk" for both gtk+3
and gtk4 recipes. Set CVE_PRODUCT so we properly match the NVD database.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb | 2 ++
 meta/recipes-gnome/gtk+/gtk4_4.12.5.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.38.bb
index 37fa0a7290..c23c46a689 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
@@ -13,3 +13,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfd=
d0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa262=
87a271dce88af737 \
                     file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f0=
6d3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=3D25;md5=3Dcb732daee1=
d82af7a2bf953cf3cf26f1"
+
+CVE_PRODUCT =3D "gnome:gtk"
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.5.bb
index 65ac1071f8..a418ef878f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
@@ -41,6 +41,8 @@ SRC_URI[sha256sum] =3D "28b356d590ee68ef626e2ef9820b2dd=
21441484a9a042a5a3f0c40e9df
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
+CVE_PRODUCT =3D "gnome:gtk"
+
 inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings =
features_check gobject-introspection
=20
 # TBD: nativesdk
--=20
2.43.0


