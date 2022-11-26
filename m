Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1EBC43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:06:18 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.81108.1669503970355513596
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id A561E16F8F
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 00:06:08 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4FH-0J7An40; Sun, 27 Nov 2022 00:06:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/2] gcr: add recipe for gcr-4, needed to build with gtk4
Date: Sun, 27 Nov 2022 00:05:47 +0100
Message-Id: <20221126230547.1432326-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230547.1432326-1-f_l_k@t-online.de>
References: <20221126230547.1432326-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503963-EFFE97E2-4053919C/0/0 CLEAN NORMAL
X-TOI-MSGID: 9247c916-2b1c-41ba-aa05-f0e1f3290948
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 23:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173832

gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rena=
me to gcr3.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...build-fix-one-parallel-build-failure.patch |  0
 ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
 .../gcr_3.40.0.bb =3D> gcr4/gcr3_3.40.0.bb}     |  8 ++-
 meta/recipes-gnome/gcr4/gcr4_4.0.0.bb         | 59 +++++++++++++++++++
 4 files changed, 65 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/{gcr/gcr =3D> gcr4/gcr3}/0001-gcr-meson.build-=
fix-one-parallel-build-failure.patch (100%)
 rename meta/recipes-gnome/{gcr/gcr =3D> gcr4/gcr3}/b3ca1d02bb0148ca787ac=
4aead164d7c8ce2c4d8.patch (100%)
 rename meta/recipes-gnome/{gcr/gcr_3.40.0.bb =3D> gcr4/gcr3_3.40.0.bb} (=
87%)
 create mode 100644 meta/recipes-gnome/gcr4/gcr4_4.0.0.bb

diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-para=
llel-build-failure.patch b/meta/recipes-gnome/gcr4/gcr3/0001-gcr-meson.bu=
ild-fix-one-parallel-build-failure.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-paral=
lel-build-failure.patch
rename to meta/recipes-gnome/gcr4/gcr3/0001-gcr-meson.build-fix-one-paral=
lel-build-failure.patch
diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8=
ce2c4d8.patch b/meta/recipes-gnome/gcr4/gcr3/b3ca1d02bb0148ca787ac4aead16=
4d7c8ce2c4d8.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8c=
e2c4d8.patch
rename to meta/recipes-gnome/gcr4/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8c=
e2c4d8.patch
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gc=
r4/gcr3_3.40.0.bb
similarity index 87%
rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
rename to meta/recipes-gnome/gcr4/gcr3_3.40.0.bb
index 917be5938b..5318768db6 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr4/gcr3_3.40.0.bb
@@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\=
d+)+)\.tar"
=20
-SRC_URI +=3D "file://0001-gcr-meson.build-fix-one-parallel-build-failure=
.patch \=20
-            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
+SRC_URI =3D " \
+	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=3Darc=
hive \
+	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
+	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
=20
 SRC_URI[archive.sha256sum] =3D "b9d3645a5fd953a54285cc64d4fc046736463dbd=
4dcc25caf5c7b59bed3027f5"
=20
+S =3D "${WORKDIR}/gcr-${PV}"
+
 PACKAGECONFIG ??=3D " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
diff --git a/meta/recipes-gnome/gcr4/gcr4_4.0.0.bb b/meta/recipes-gnome/g=
cr4/gcr4_4.0.0.bb
new file mode 100644
index 0000000000..13efdcc2bd
--- /dev/null
+++ b/meta/recipes-gnome/gcr4/gcr4_4.0.0.bb
@@ -0,0 +1,59 @@
+SUMMARY =3D "A library for bits of crypto UI and parsing etc"
+DESCRIPTION =3D "GCR is a library for displaying certificates, and crypt=
o UI, \
+accessing key stores. It also provides the viewer for crypto files on th=
e \
+GNOME desktop."
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
+
+DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native libsecret \
+           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-nati=
ve', '', d)}"
+
+CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
+
+CFLAGS +=3D "-D_GNU_SOURCE"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg
+UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\=
d+)+)\.tar"
+
+SRC_URI =3D "https://download.gnome.org/sources/gcr/${PV}/gcr-${PV}.tar.=
xz;name=3Darchive"
+SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9=
864341c0161e171173dcec7c"
+
+S =3D "${WORKDIR}/gcr-${PV}"
+
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
+"
+PACKAGECONFIG[gtk] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
+PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,,op=
enssh"
+#'Use systemd socket activation for server programs'
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gcr-4 \
+"
+
+# http://errors.yoctoproject.org/Errors/Details/20229/
+ARM_INSTRUCTION_SET:armv4 =3D "arm"
+ARM_INSTRUCTION_SET:armv5 =3D "arm"
+ARM_INSTRUCTION_SET:armv6 =3D "arm"
+
+EXTRA_OEMESON +=3D "--cross-file ${WORKDIR}/meson-${PN}.cross"
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+gpg2 =3D '${bindir}/gpg2'
+EOF
+}
+
+do_configure:prepend() {
+    sed -i "s|ssh_add_path =3D find_program('ssh-add', required: get_opt=
ion('ssh_agent')).full_path()|ssh_add_path =3D '${bindir}/ssh-add'|" ${S}=
/meson.build
+    sed -i "s|ssh_agent_path =3D find_program('ssh-agent', required: get=
_option('ssh_agent')).full_path()|ssh_agent_path =3D '${bindir}/ssh-agent=
'|" ${S}/meson.build
+}
--=20
2.34.1


