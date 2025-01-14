Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DC3C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 07:06:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.39750.1736838352055317401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 23:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 78011572
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:05:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.43.240]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tXazl-1akCsD0; Tue, 14 Jan 2025 08:05:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] libsecret: update patch Upstream-Status
Date: Tue, 14 Jan 2025 08:05:56 +0100
Message-ID: <20250114070556.3084-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736838349-6CFF699A-AB3F38BE/0/0 CLEAN NORMAL
X-TOI-MSGID: a3418fcc-5e65-474c-b449-ce8ddc839bfd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 07:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209775

Upstream does not want the pam tests to be skipped

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsecret/0001-meson-add-option-to-disable-pam-tests.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-meson-add-option=
-to-disable-pam-tests.patch b/meta/recipes-gnome/libsecret/libsecret/0001=
-meson-add-option-to-disable-pam-tests.patch
index 87ab8a32cd..1bd49bbc38 100644
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
+Upstream-Status: Denied [https://gitlab.gnome.org/GNOME/libsecret/-/merg=
e_requests/151]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
--=20
2.47.1


