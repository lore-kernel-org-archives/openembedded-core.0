Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5F0C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:14:57 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.11395.1676283296005024652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 97ADF1EC94
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:14:43 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.111]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRVr9-1TxCzp0; Mon, 13 Feb 2023 11:14:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] graphene: add a PACKAGECONFIG for arm_neon
Date: Mon, 13 Feb 2023 11:14:35 +0100
Message-Id: <20230213101435.59787-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676283283-63FEAD99-9148DE33/0/0 CLEAN NORMAL
X-TOI-MSGID: b2ac7a2f-4188-40af-9d78-a9a4a37783e1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177089

Not all arm platforms support neon and runtime detection for this feature=
 is
currently not reliable. Add a PACKAGECONFIG that disables neon support fo=
r arm
but can be manually enabled.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/graphene/graphene_1.10.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/rec=
ipes-graphics/graphene/graphene_1.10.8.bb
index 813ff74adf..4f1a0047fd 100644
--- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
+++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
@@ -12,6 +12,7 @@ SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c70=
27bcff52f5ec2367c25ec859da3
 # gtk4 & mutter 41.0 requires graphene build with introspection
 PACKAGECONFIG ?=3D "introspection"
 PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
+PACKAGECONFIG[neon] =3D "-Darm_neon=3Dtrue,-Darm_neon=3Dfalse,"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.34.1


