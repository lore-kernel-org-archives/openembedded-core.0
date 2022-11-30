Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00577C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 05:35:11 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.3893.1669786505739975625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 21:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 0C158C1EC
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:35:04 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.245]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0FkK-0QHosD0; Wed, 30 Nov 2022 06:35:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv8 1/4] graphene: import from meta-oe
Date: Wed, 30 Nov 2022 06:34:47 +0100
Message-Id: <20221130053450.95655-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669786500-E6FDD07E-7B7AE494/0/0 CLEAN NORMAL
X-TOI-MSGID: 1237a0c3-dc3e-42dd-b833-c17d597354d7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 05:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173991

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


