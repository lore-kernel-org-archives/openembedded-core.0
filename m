Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEDBC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:59:01 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41804.1784699938613794769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 22 Jul 2026 14:58:56 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.127 with ESMTP; 22 Jul 2026 14:58:56 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 4/5] python3-pyyaml: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 14:58:48 +0900
Message-ID: <20260722055849.184046-4-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722055849.184046-1-mark.yang@lge.com>
References: <20260722055849.184046-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241594

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyyaml vendor prefix matches nothing,
so PyYAML CVEs are not evaluated at all. The databases use two
vendor spellings: pyyaml in the NVD CPEs, and "Red Hat" (with a
space, not expressible as a vendor:product pair) in CVE-2020-1747's
CNA record. Use the bare product name to cover both.

All four existing CVEs (CVE-2017-18342, CVE-2019-20477,
CVE-2020-1747, CVE-2020-14343) are fixed by 5.4, so they resolve as
not affected at 6.0.3.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
index 7e2b088ca5..849e2c9cc8 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb
@@ -21,4 +21,6 @@ RDEPENDS:${PN} += "\
     python3-netclient \
 "
 
+CVE_PRODUCT = "pyyaml"
+
 BBCLASSEXTEND = "native nativesdk"

