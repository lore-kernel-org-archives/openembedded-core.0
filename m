Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4E5C021A4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 00:35:12 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.649.1740443707747994724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 16:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id BF50F168A
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 01:35:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmiud-1MdDFZ0; Tue, 25 Feb 2025 01:35:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] pango: update 1.55.5 -> 1.56.1
Date: Tue, 25 Feb 2025 01:35:41 +0100
Message-ID: <20250225003541.3453-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740443703-E5FF9514-66914A69/0/0 CLEAN NORMAL
X-TOI-MSGID: 9062c4ad-13be-46f3-b0b3-3fbb441e73eb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 00:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211855

- add python3-docutils-native to avoid fail if api-documentation is built
- add PACKAGECONFIG for man-pages

Overview of changes in 1.56.1, 18-01-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Avoid criticals when there are no fonts
- fontconfig: Handle lack of FC_FONT_WRAPPER in font cache
- fontconfig: Prefer application fonts even if they are older

Overview of changes in 1.56.0, 09-01-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Support setting font features in font descriptions
- serialization: Document the tab array format
- serialization: Accept attributes without range
- win32: Improve the pango_font_map_reload_implementation
- win32: Take variations into account for caching
- layout: Fix measuring ellipsis runs with shapes
- build: Require C11
- build: Require GLib 2.80
- build: Require cairo 1.18

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pango/{pango_1.55.5.bb =3D> pango_1.56.1.bb}               | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.55.5.bb =3D> pango_1.56.1.bb=
} (86%)

diff --git a/meta/recipes-graphics/pango/pango_1.55.5.bb b/meta/recipes-g=
raphics/pango/pango_1.56.1.bb
similarity index 86%
rename from meta/recipes-graphics/pango/pango_1.55.5.bb
rename to meta/recipes-graphics/pango/pango_1.56.1.bb
index 6c7242274f..d61f5c2f49 100644
--- a/meta/recipes-graphics/pango/pango_1.55.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.56.1.bb
@@ -18,13 +18,14 @@ UPSTREAM_CHECK_REGEX =3D "pango-(?P<pver>\d+\.(?!9\d+=
)\d+\.\d+)"
 GIR_MESON_ENABLE_FLAG =3D "enabled"
 GIR_MESON_DISABLE_FLAG =3D "disabled"
=20
-SRC_URI[archive.sha256sum] =3D "e396126ea08203cbd8ef12638e6222e2e1fd8aa9=
cac6743072fedc5f2d820dd8"
+SRC_URI[archive.sha256sum] =3D "426be66460c98b8378573e7f6b0b2ab450f6bb6d=
2ec7cecc33ae81178f246480"
=20
-DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
+DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi python3-docutils-native"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
=20
 PACKAGECONFIG[x11] =3D ",,virtual/libx11 libxft"
+PACKAGECONFIG[man-pages] =3D "-Dman-pages=3Dtrue,-Dman-pages=3Dfalse"
 PACKAGECONFIG[thai] =3D "-Dlibthai=3Denabled,-Dlibthai=3Ddisabled,libtha=
i"
=20
 GIR_MESON_OPTION =3D 'introspection'
--=20
2.48.1


