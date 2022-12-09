Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3B4C4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:11:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.1982.1670595089610108110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 06:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 15A0076F0
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Dec 2022 15:11:27 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.94]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3e61-3QaSEF0; Fri, 9 Dec 2022 15:11:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv10 3/6] gcr: rename gcr -> gcr3
Date: Fri,  9 Dec 2022 15:11:14 +0100
Message-Id: <20221209141117.1311827-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209141117.1311827-1-f_l_k@t-online.de>
References: <20221209141117.1311827-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670595086-5AFEE991-C3D38A26/0/0 CLEAN NORMAL
X-TOI-MSGID: cb19a284-f2e1-4cca-9865-8ad8fb39aa55
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 14:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174456

gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rena=
me to gcr3.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...1-gcr-meson.build-fix-one-parallel-build-failure.patch | 0
 .../b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch        | 0
 meta/recipes-gnome/gcr/{gcr_3.40.0.bb =3D> gcr3_3.40.0.bb}  | 8 ++++++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr =3D> gcr3}/0001-gcr-meson.build-fix-o=
ne-parallel-build-failure.patch (100%)
 rename meta/recipes-gnome/gcr/{gcr =3D> gcr3}/b3ca1d02bb0148ca787ac4aead=
164d7c8ce2c4d8.patch (100%)
 rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb =3D> gcr3_3.40.0.bb} (87%)

diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-para=
llel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.bui=
ld-fix-one-parallel-build-failure.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-paral=
lel-build-failure.patch
rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parall=
el-build-failure.patch
diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8=
ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164=
d7c8ce2c4d8.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8c=
e2c4d8.patch
rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce=
2c4d8.patch
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gc=
r/gcr3_3.40.0.bb
similarity index 87%
rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
index 917be5938b..5318768db6 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
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
--=20
2.34.1


