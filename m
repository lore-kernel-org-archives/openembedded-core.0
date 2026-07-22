Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E62C44538
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:59:01 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41803.1784699938508332932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 22 Jul 2026 14:58:56 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.127 with ESMTP; 22 Jul 2026 14:58:55 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 1/5] python3-certifi: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 14:58:45 +0900
Message-ID: <20260722055849.184046-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241593

From: "mark.yang" <mark.yang@lge.com>

NVD tracks certifi as certifi:certifi, so the default python:certifi
vendor prefix never matches and its CVEs are not evaluated at all.
Use the exact vendor:product pair.

All three existing CVEs (CVE-2022-23491, CVE-2023-37920,
CVE-2024-39689) affect versions below 2026.6.17, so they resolve as
not affected; nothing new shows as unpatched.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/python/python3-certifi_2026.6.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
index db78aaea0c..69c505b510 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f
 
 inherit pypi python_setuptools_build_meta
 
+CVE_PRODUCT = "certifi:certifi"
+
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += "python3-io"

