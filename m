Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21E0C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 16:43:48 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.171907.1673887425127857165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 08:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout05.t-online.de (Postfix) with SMTP id 737DF249A3
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 17:43:42 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.233.67]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pHSaE-2Oihxh0; Mon, 16 Jan 2023 17:43:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] neard: dont pull in wpa-supplicant unconditionally
Date: Mon, 16 Jan 2023 17:43:25 +0100
Message-Id: <20230116164325.289867-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673887422-3BFF6A0B-6F977254/0/0 CLEAN NORMAL
X-TOI-MSGID: c5ea9f05-68b7-4f44-8560-bd83c310f736
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 16:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176003

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-connectivity/neard/neard_0.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes=
-connectivity/neard/neard_0.18.bb
index 23e999acc4..17dbfc4378 100644
--- a/meta/recipes-connectivity/neard/neard_0.18.bb
+++ b/meta/recipes-connectivity/neard/neard_0.18.bb
@@ -42,7 +42,7 @@ RDEPENDS:${PN} =3D "dbus"
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS:${PN} =3D "\
                      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa=
-supplicant', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','${W=
IRELESS_DAEMON}', '', d)} \
                     "
=20
 INITSCRIPT_NAME =3D "neard"
--=20
2.34.1


