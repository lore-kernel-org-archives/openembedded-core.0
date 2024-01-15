Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF16C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:22:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.73911.1705310521228295439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146008467"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146008467"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:21:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0638ED9DA5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:21:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41AB1D3F04
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:21:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BFC8C6895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:21:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47AAB1A0070;
	Mon, 15 Jan 2024 17:21:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-markdown: upgrade 3.5 -> 3.5.2
Date: Mon, 15 Jan 2024 17:21:31 +0800
Message-Id: <1705310491-24562-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--1.251500-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytcX1NU5enwR28q
	nFk+BWUX84H0QJCUuBsb8xI2OD3Z7XY7STt9vUc6nrsEDDAvkjr5UnqVnIHSz+EDha0Az3zpINg
	qCKnAJMGfy0kvYTP7ww0q7qx0Uti5wUzWRGreVlA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IXymVDB8yZElJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOxyD4YXVcG0XcIOEePFCmnMYXk8A6vQ0A443jWDc/E4WvM63hU1i+ili8j1Og5lQbzq06
	HiddL5N8cnGGTtM+3eHcJ+poncnfgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193657

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix type annotations for convertFile - it accepts only bytes-based buffers.
 Also remove legacy checks from Python 2
-Remove legacy import needed only in Python 2
-Fix typo that left the attribute AdmonitionProcessor.content_indent unset
-Fix edge-case crash in InlineProcessor with AtomicString.
-Fix edge-case crash in codehilite with an empty code tag.
-Improve and expand type annotations in the code base.
-Fix handling of bogus comments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.5.bb => python3-markdown_3.5.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.5.bb => python3-markdown_3.5.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.5.bb b/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-markdown_3.5.bb
rename to meta/recipes-devtools/python/python3-markdown_3.5.2.bb
index 1ad3f7828d..6836c5638f 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.5.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.5.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "a807eb2e4778d9156c8f07876c6e4d50b5494c5665c4834f67b06459dfd877b3"
+SRC_URI[sha256sum] = "e1ac7b3dc550ee80e602e71c1d168002f062e49f1b11e26a36264dafd4df2ef8"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


