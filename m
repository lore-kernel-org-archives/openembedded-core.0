Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014C7C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 23:26:14 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.103516.1738625168518227225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 15:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ojAaw49U;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 17B35240101
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Feb 2025 00:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1738625167; bh=AJ9oelzqUm6RCEhs7tJm0u9A+hKeorgYmOVCBK9whP4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ojAaw49UnlA0nHe7tnLzNdBqr+1lXlqntFgfBppxcnJVXFUBjBUq+PttAA4mPwVtM
	 MHoKCx3W+UDkmQySUCZ1stbC9V/PJ6qFJNnE4pxkExSdYUyiJAWqP6k0Zuh97Gz7cU
	 Hl7osZ2zG1wU1xtbs/+kcRMOZ3H01Svp+zvfeKoseC5sWu1NLXRzXBI82vKamwpVrQ
	 gMzXo/idnwUnd2Vr0KLLKyNcPuBF2Fm8smdORSx/raOjEiHi3422vI3eCvXpKbvxd1
	 exp6KnPHP33e+8cGBUpo9F0wVbAkX4dicBV9hZay+28O8x1ZLjuxg0wEuUiEXQoZWt
	 yxJl0BaQ4CfZQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yn2gL1twSz9rxD;
	Tue,  4 Feb 2025 00:26:06 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH 2/2] libadwaita: upgrade 1.6.2 -> 1.6.4
Date: Mon,  3 Feb 2025 23:25:43 +0000
Message-Id: <20250203232543.830904-2-simone.p.weiss@posteo.com>
In-Reply-To: <20250203232543.830904-1-simone.p.weiss@posteo.com>
References: <20250203232543.830904-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 23:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210742

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Add sassc-native as in libadwaita the handling wrt to pre build artifacts
changed and sassc is now needed.

Changelog
---------
- AdwBreakpoint
  - Fix to_string() with locales using comma as decimal separator
- AdwComboRow
  - Fix very short strings not being displayed
- AdwDialog
  - Fix ::closed emission with window-backed dialogs
  - Fix a focus-related crash
- AdwPreferencesDialog
  - Document navigation.pop action
- AdwTabBox, AdwTabGrid
  - Fix scrolling to newly appearing tabs
  - Fix a copy-paste error
- Translation updates
  - Italian

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libadwaita/{libadwaita_1.6.2.bb =3D> libadwaita_1.6.4.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.6.2.bb =3D> libadwait=
a_1.6.4.bb} (86%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.6.4.bb
similarity index 86%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
index d24025acd0..a8cf642ff0 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.6.2.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.6.4.bb
@@ -6,11 +6,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd=
255951079008b364516c"
 DEPENDS =3D " \
     gtk4 \
     appstream \
+    sassc-native \
 "
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "7542f8354e6808dd4e9a31551bbdfc0170735e4a=
f4d1b3e69186500ccb9c01eb"
+SRC_URI[archive.sha256sum] =3D "1011a5a93dc3b87e82da19910d7fab01a3b9d7fc=
b0b09751babb476eedb3d9a3"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.39.5


