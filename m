Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67503C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:59:01 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41832.1784699938746799270
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
Subject: [PATCH 2/5] python3-idna: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 14:58:46 +0900
Message-ID: <20260722055849.184046-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722055849.184046-1-mark.yang@lge.com>
References: <20260722055849.184046-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241597

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:idna matches nothing in the CVE
databases, which track the Python idna CVEs as:

* CVE-2024-3651 (kjd:internationalized_domain_names_in_applications) [1]
* CVE-2026-45409 (kjd:idna in the CNA record, same NVD CPE as above)

Set both vendor:product pairs. Both CVEs are fixed before 3.18, so
they resolve as not affected.

The bare product name is not an option here: it would also match
"servo:idna", the Rust idna crate (e.g. CVE-2024-12224).

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-3651

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/python/python3-idna_3.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-idna_3.18.bb b/meta/recipes-devtools/python/python3-idna_3.18.bb
index cac86a8594..70405819e7 100644
--- a/meta/recipes-devtools/python/python3-idna_3.18.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.18.bb
@@ -10,4 +10,6 @@ inherit pypi python_flit_core ptest-python-pytest
 RDEPENDS:${PN} += "python3-codecs"
 RDEPENDS:${PN}-ptest += "python3-unittest-automake-output"
 
+CVE_PRODUCT = "kjd:idna kjd:internationalized_domain_names_in_applications"
+
 BBCLASSEXTEND = "native nativesdk"

