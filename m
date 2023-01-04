Return-Path: <mares@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD1AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 09:22:10 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.8059.1672824121850263375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 01:22:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: mares@2n.com)
From: =?UTF-8?q?Miroslav=20Mare=C5=A1?= <mares@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Miroslav=20Mare=C5=A1?= <mares@2n.com>
Subject: [PATCH] wpa-supplicant: Enable native builds
Date: Wed, 4 Jan 2023 10:21:39 +0100
Message-ID: <20230104092139.9015-1-mares@2n.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail08w.axis.com (10.20.40.14) To se-mail05w.axis.com
 (10.20.40.11)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 09:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175378

Native builds for wpa-supplicant can be enabled
without any further modifications.

Signed-off-by: Miroslav Mareš <mares@2n.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index 4e27b92bc6..ec20b8b32f 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -135,3 +135,5 @@ python split_wpa_supplicant_libs () {
         d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
 }
 PACKAGESPLITFUNCS:prepend = "split_wpa_supplicant_libs "
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


