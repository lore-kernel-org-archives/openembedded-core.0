Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF5BD6409C
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 13:26:43 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.35878.1731245196314695100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 05:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id 63145415
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 14:26:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.121]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tA7xX-2K0g1R0; Sun, 10 Nov 2024 14:26:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] systemd: dont allow autoselect for meson
Date: Sun, 10 Nov 2024 14:28:48 +0100
Message-ID: <20241110132848.2135721-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1731245191-1E7FA416-355792D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 6cf59ed4-efbe-4dbe-9746-a545a13e419e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 13:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206919

This might help avoid reproducibility issues

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-co=
re/systemd/systemd_256.7.bb
index bf829c4931..159a0e25b8 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -258,6 +258,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dsystem-gid-max=3D999 \
                   -Dcreate-log-dirs=3Dfalse \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '-=
Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
+                  --auto-features=3Ddisabled \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or wors=
e
--=20
2.47.0


