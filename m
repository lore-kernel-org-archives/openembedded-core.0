Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E86D78318
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 12:45:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.172084.1733143555127512392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 04:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 064171063
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 04:46:23 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A6A33F58B
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 04:45:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pango: upgrade 1.54.0 -> 1.55.0
Date: Mon,  2 Dec 2024 12:45:49 +0000
Message-Id: <20241202124550.4160316-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208144

- Support Unicode 16
- Add pango_font_map_add_font_file
- fontconfig: Reject patterns without FC_FILE
- coretext: Actually use .AppleSystemUIFont
- coretext: Keep track of variations
- win32: Use font options for caching
- win32: Keep variations in PangoWin32Font
- build: Require harfbuzz 8.4.0
- build: Require fontconfig 2.15
- build: Require meson 1.2.0
- build: Require Window 10

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-graphics/pango/{pango_1.54.0.bb =3D> pango_1.55.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.54.0.bb =3D> pango_1.55.0.bb=
} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.54.0.bb b/meta/recipes-g=
raphics/pango/pango_1.55.0.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.54.0.bb
rename to meta/recipes-graphics/pango/pango_1.55.0.bb
index 31f3f3d27ce..48f06c73d81 100644
--- a/meta/recipes-graphics/pango/pango_1.54.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.55.0.bb
@@ -18,7 +18,7 @@ UPSTREAM_CHECK_REGEX =3D "pango-(?P<pver>\d+\.(?!9\d+)\=
d+\.\d+)"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI[archive.sha256sum] =3D "8a9eed75021ee734d7fc0fdf3a65c3bba51dfefe=
4ae51a9b414a60c70b2d1ed8"
+SRC_URI[archive.sha256sum] =3D "a2c17a8dc459a7267b8b167bb149d23ff473b6ff=
9d5972bee047807ee2220ccf"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
=20
--=20
2.34.1


