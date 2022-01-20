Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424B1C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 15:18:45 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.13198.1642691924686272807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout12.t-online.de (Postfix) with SMTP id 6037312444
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:18:43 +0100 (CET)
Received: from localhost.localdomain ([84.163.38.111]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAZD1-43uzwI0; Thu, 20 Jan 2022 16:18:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/2] folks: initial add recipe
Date: Thu, 20 Jan 2022 16:18:24 +0100
Message-Id: <20220120151824.61601-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120151824.61601-1-f_l_k@t-online.de>
References: <20220120151824.61601-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642691923-000116DC-75825C07/0/0 CLEAN NORMAL
X-TOI-MSGID: 671c48e3-b032-40b0-afbe-e2b2b0a658ee
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 15:18:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160768

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../folks/folks_0.15.4.bb                     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb b/meta=
-gnome/recipes-connectivity/folks/folks_0.15.4.bb
new file mode 100644
index 000000000..e7160bde9
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Folks is a contact aggregation library."
+LICENSE =3D "LGPLv2.1"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
+
+DEPENDS =3D " \
+    glib-2.0 \
+    libgee \
+    dbus-glib \
+    telepathy-glib \
+"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+GIR_MESON_OPTION =3D ""
+
+EXTRA_OEMESON =3D "-Deds_backend=3Dfalse -Dbluez_backend=3Dfalse -Dofono=
_backend=3Dfalse -Dtelepathy_backend=3Dfalse"
+
+inherit gnomebase gettext gobject-introspection vala features_check
+
+SRC_URI[archive.sha256sum] =3D "e71099afc9e88fad4e757ae134bc3fd63e12b901=
ad62b0ed5536afb79124af5f"
+
--=20
2.25.1


