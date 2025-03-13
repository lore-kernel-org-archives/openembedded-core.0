Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CC9C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 06:58:58 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.8973.1741849133520669635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 23:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout11.t-online.de (Postfix) with SMTP id 8B3C3FB2
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:58:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tscWo-1AmSZN0; Thu, 13 Mar 2025 07:58:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] vala: update 0.56.17 -> 0.56.18
Date: Thu, 13 Mar 2025 07:59:34 +0100
Message-ID: <20250313065934.4147-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741849130-6D7F8447-C35FD4A7/0/0 CLEAN NORMAL
X-TOI-MSGID: c4e79b24-16c1-460b-991f-cb1c90baa998
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 06:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212735

- this update is required to work with gobject-introspection >=3D 1.83.2

Vala 0.56.18
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 * Various improvements and bug fixes:
  - vala: Don't allow inheritance of compact class from non-compact class
  - vala, libvaladoc: Fix color support detection in log reporting
  - girparser: Handle `doc:format` element in root:repository [#1586]
  - codegen: Use correct ctype for result variable in methods in more cas=
es
  - codegen: Fix conditional expression with only one void side
  - valadoc: Sync gir argument handling from valacompiler.vala
  - Update links to GNOME Wiki project and refer to new Vala websites
  - Add CI for tarball release service
 * Bindings:
  - gio-2.0: Improve the {Input,Output}Message bindings
  - glib-2.0: Fix the binding of `get_console_charset`
  - glib-2.0: Add missing CCode.array_null_terminated attributes to IConv=
.iconv()
  - glib-2.0: Make FileStream.*printf() return int [#1547]
  - glib-2.0: Update RegexMatchFlags and RegexCompileFlags's binding to 2=
.74
  - glib-2.0: Add Regex.escape_nul in GLib
  - gnu: add binding for 'relocate' APIs
  - gobject-2.0: Add TypeFlags missing values
  - gstreamer-1.0: Skip ParamSpecArray and ParamSpecFraction
  - libusb-1.0: Fix the LibUSB.TransferCb declaration
  - libusb-1.0: Fix the LibUSB.HotPlugCb declaration
  - sdl2: Fix CCode.destroy_function of SDL.RWops and usage of
    SDL.RWops.from_file() [#1550]
  - sdl2: Fix missing integer type for JoystickID [#1563]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/vala/{vala_0.56.17.bb =3D> vala_0.56.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.17.bb =3D> vala_0.56.18.bb}=
 (97%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.17.bb b/meta/recipes-de=
vtools/vala/vala_0.56.18.bb
similarity index 97%
rename from meta/recipes-devtools/vala/vala_0.56.17.bb
rename to meta/recipes-devtools/vala/vala_0.56.18.bb
index acd6c43096..32105a3c23 100644
--- a/meta/recipes-devtools/vala/vala_0.56.17.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.18.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/$=
{BP}.tar.xz"
-SRC_URI[sha256sum] =3D "26100c4e4ef0049c619275f140d97cf565883d00c7543c82=
bcce5a426934ed6a"
+SRC_URI[sha256sum] =3D "f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d=
795f482fe926a382"
=20
 inherit autotools pkgconfig upstream-version-is-even
=20
--=20
2.48.1


