Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171F8C44508
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 23:44:39 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9087.1783986272317420930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 16:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 14 Jul 2026 08:44:28 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.127 with ESMTP; 14 Jul 2026 08:44:28 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2 1/4] python3-cryptography: set CVE_PRODUCT
Date: Tue, 14 Jul 2026 08:44:14 +0900
Message-ID: <20260713234417.4071754-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 23:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240858

From: "mark.yang" <mark.yang@lge.com>

NVD lists it as cryptography.io:cryptography and CNA lists it as
pyca:cryptography, so set both vendor:product pairs to match correctly
and precisely.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: use explicit vendor:product list

 meta/recipes-devtools/python/python3-cryptography.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 4730c34997..4672f47520 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -71,4 +71,6 @@ do_install_ptest() {
     cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
 }
 
+CVE_PRODUCT = "cryptography.io:cryptography pyca:cryptography"
+
 BBCLASSEXTEND = "native nativesdk"

