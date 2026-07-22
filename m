Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCE2C4451C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:59:01 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41805.1784699938725593475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 22 Jul 2026 14:58:56 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.127 with ESMTP; 22 Jul 2026 14:58:56 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 3/5] python3-pyopenssl: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 14:58:47 +0900
Message-ID: <20260722055849.184046-3-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722055849.184046-1-mark.yang@lge.com>
References: <20260722055849.184046-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241595

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:pyopenssl matches nothing in the CVE
databases, which have used four vendor spellings for pyOpenSSL over
the years:

* CVE-2013-4314 (jean-paul_calderone:pyopenssl)
* CVE-2018-1000807 (pyopenssl:pyopenssl)
* CVE-2018-1000808 (pyopenssl_project:pyopenssl)
* CVE-2026-27448, CVE-2026-27459 (pyca:pyopenssl in the CNA records,
pyopenssl:pyopenssl in the NVD CPEs)

Set all four vendor:product pairs. All five CVEs are fixed before
26.3.0 (the two 2026 ones in 26.0.0), so they resolve as not
affected.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
index c27f0719d1..ca6754d462 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.3.0.bb
@@ -18,4 +18,6 @@ RDEPENDS:${PN}:class-target = " \
 "
 RDEPENDS:${PN}-tests = "${PN}"
 
+CVE_PRODUCT = "jean-paul_calderone:pyopenssl pyca:pyopenssl pyopenssl:pyopenssl pyopenssl_project:pyopenssl"
+
 BBCLASSEXTEND = "native nativesdk"

