Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383B0C433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 23:41:49 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web09.4573.1642722108126296241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 15:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 4DB621555E
	for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 00:41:46 +0100 (CET)
Received: from localhost.localdomain ([84.163.38.111]) by fwd79.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nAh3p-23eohV0; Fri, 21 Jan 2022 00:41:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [OE-core][PATCH 1/2] python3-dbusmock: add BBCLASSEXTEND = "native
 nativesdk"
Date: Fri, 21 Jan 2022 00:41:28 +0100
Message-Id: <20220120234129.4160546-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642722105-00010BFA-EA3F474B/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ef6a82f-2b12-4d85-956b-793f9f47185a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 23:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160804

Gnome 'folks' backends depend on python3-dbusmock-native

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/me=
ta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
index e64e343a1e..44f85d50d5 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
@@ -16,3 +16,5 @@ RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
     "
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


