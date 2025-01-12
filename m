Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7532FE77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 23:16:52 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.5378.1736723803299327341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 15:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id 5A8024AA
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 00:16:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.248]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tX7CC-1fLMaf0; Mon, 13 Jan 2025 00:16:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libsecret: update patch Upstream-Status
Date: Mon, 13 Jan 2025 00:16:53 +0100
Message-ID: <20250112231653.673597-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736723800-D67FB9FE-FC71EC8C/0/0 CLEAN NORMAL
X-TOI-MSGID: 719d0464-dfe2-4f7e-8339-3e76f3415295
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 23:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209698

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsecret/0001-meson-add-option-to-disable-pam-tests.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option=
-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001=
-meson-add-option-to-disable-pam-tests.patch
index 87ab8a32cd..e1daffb50d 100644
--- a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option-to-dis=
able-pam-tests.patch
@@ -3,7 +3,7 @@ From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 3 Dec 2024 15:58:17 +0100
 Subject: [PATCH] meson: add option to disable pam tests
=20
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/m=
erge_requests/151/commits]
+Upstream-Status: Rejected [https://gitlab.gnome.org/GNOME/libsecret/-/me=
rge_requests/151]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
--=20
2.47.1


