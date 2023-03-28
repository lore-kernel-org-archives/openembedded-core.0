Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3ABC76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 08:02:54 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.60806.1679990564667379846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 01:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout06.t-online.de (Postfix) with SMTP id C64B01C234
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:02:41 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.166]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph4Hv-0oOtmb0; Tue, 28 Mar 2023 10:02:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] import libadwaita from meta-gnome
Date: Tue, 28 Mar 2023 10:01:56 +0200
Message-Id: <20230328080156.854975-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679990559-837FDC79-9CB9369B/0/0 CLEAN NORMAL
X-TOI-MSGID: 595103ab-6250-4fb1-99dc-e4b1dbff6cb9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 08:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179208

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../libadwaita/libadwaita_1.3.1.bb            | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 1fec9bc6f4..62272cd1bd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -303,6 +303,7 @@ RECIPE_MAINTAINER:pn-ldconfig-native =3D "Khem Raj <r=
aj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-liba52 =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libacpi =3D "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libadwaita =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-libaio =3D "Alexander Kanavin <alex.kanavin@gmail.c=
om>"
 RECIPE_MAINTAINER:pn-libarchive =3D "Otavio Salvador <otavio.salvador@os=
systems.com.br>"
 RECIPE_MAINTAINER:pn-libassuan =3D "Unassigned <unassigned@yoctoproject.=
org>"
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb b/meta/rec=
ipes-gnome/libadwaita/libadwaita_1.3.1.bb
new file mode 100644
index 0000000000..8f927e3f7e
--- /dev/null
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.3.1.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Building blocks for modern GNOME applications"
+LICENSE=3D"LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D " \
+    gtk4 \
+"
+
+inherit gnomebase gobject-introspection gtk-doc vala features_check
+
+SRC_URI[archive.sha256sum] =3D "6b8bbf413c501b46c8616a0e5b836d7a34091140=
941412520bbd9ddda6df8cbd"
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
+
+PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
+
+FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.34.1


