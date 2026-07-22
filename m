Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61C5C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:59:01 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41831.1784699938613095626
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
Subject: [PATCH 5/5] python3-xmltodict: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 14:58:49 +0900
Message-ID: <20260722055849.184046-5-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722055849.184046-1-mark.yang@lge.com>
References: <20260722055849.184046-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241596

From: "mark.yang" <mark.yang@lge.com>

The CVE databases track xmltodict as xmltodict:xmltodict, so the
default python:xmltodict vendor prefix never matches and its CVEs
are not evaluated at all. Use the exact vendor:product pair.

The only existing CVE (CVE-2025-9375, disputed by upstream) affects
0.14.2 before 0.15.1, so it resolves as not affected at 1.0.4.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
index e622c00dae..04632de099 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.4.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "6d94c9f834dd9e44514162799d344d815a3a4faec913717a9ecbfa5be1
 
 PYPI_PACKAGE = "xmltodict"
 
+CVE_PRODUCT = "xmltodict:xmltodict"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest

