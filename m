Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAF7C4708E
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:11:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.1978.1670595088019693175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 06:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id C6615173C7
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Dec 2022 15:11:25 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.94]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3e61-3QaSED0; Fri, 9 Dec 2022 15:11:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv10 1/6] graphene: import from meta-oe
Date: Fri,  9 Dec 2022 15:11:12 +0100
Message-Id: <20221209141117.1311827-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670595085-5B7E9991-C44A0247/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c05fc90-ef04-46e2-bd20-d8e9621fcac6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 14:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174454

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../graphene/graphene_1.10.8.bb               | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/graphene/graphene_1.10.8.bb

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
new file mode 100644
index 0000000000..813ff74adf
--- /dev/null
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -0,0 +1,22 @@
+SUMMARY =3D "A thin layer of graphic data types"
+HOMEPAGE =3D "http://ebassi.github.io/graphene/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da7d871d9e23c450c421a85bb2=
819f648"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+inherit gnomebase gobject-introspection gtk-doc
+
+SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
+
+# gtk4 & mutter 41.0 requires graphene build with introspection
+PACKAGECONFIG ?=3D "introspection"
+PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
+
+FILES:${PN} +=3D "${libdir}/graphene-1.0"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


