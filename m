Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE9CC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 20:43:08 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.33632.1671482585119471027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 12:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id 3B29B22733
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 21:43:03 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7MyQ-0hbtuD0; Mon, 19 Dec 2022 21:42:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] python3-dbusmock: allow to build native
Date: Mon, 19 Dec 2022 21:42:48 +0100
Message-Id: <20221219204248.3540692-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671482578-D9A4E9D3-018A0DB6/0/0 CLEAN NORMAL
X-TOI-MSGID: 57d5d3fc-e0f1-4aac-addf-865d07d23ff9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 20:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174834

This is e.g. needed by xdg-desktop-portal

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb b/me=
ta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
index dd28f115d1..1290fcd2f1 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} +=3D "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
     "
+
+BBCLASSEXTEND =3D "native"
--=20
2.34.1


