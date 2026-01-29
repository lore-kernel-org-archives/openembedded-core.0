Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40376D25B51
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 03:54:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7876.1769658851221742520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 19:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F+i3s+wj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769658849; x=1801194849;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sH1a+jRT8+uWcXXqtVbJaFuMv8UcceSqzWPilkU3Pns=;
  b=F+i3s+wjLCBOAjw6CSpLCxodkv4GRqEz6/GN2QhNzXItoojhMgcGolNS
   3zHe7Zt5A42dzlF59pJsclXA9ee/elZHbfV9W7Io19DrtiHxoMrdx3izW
   1pochebAjRVZjP/RLJc/AXsMH6TZTQGShLntRIGinn+FozbWrxwRFvmwS
   ACwjXIGnAJJHe+AAW45NapiyYOPg2/HRWB7olFmLq+5ATLTBmlxSAAIay
   iCDwOHt+K1Wh5MMk89htwDbOxwId7bbU2kroCoZPnWYwWqs63rkjdK7NZ
   RDE1bj+WXoVlnVB343GeVn3n/jDyZjDvyzwEU9JGAMG/YozUhKB7Tsjsz
   Q==;
X-CSE-ConnectionGUID: 0VNBD07VS3qJptSChfGmrQ==
X-CSE-MsgGUID: Zqk3wC/LTWW3QsDOBrcspA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="228302520"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="228302520"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:54:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9C7AAC01816
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 556DCC0032A
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:09 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1197C1402622
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:06 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] python3-schema: Add new recipe
Date: Thu, 29 Jan 2026 11:53:49 +0800
Message-ID: <20260129035353.8982-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230114

Add this new recipe for runtime dependence of hotdoc.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-devtools/python/python3-schema_0.7.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-schema_0.7.8.bb

diff --git a/meta/recipes-devtools/python/python3-schema_0.7.8.bb b/meta/recipes-devtools/python/python3-schema_0.7.8.bb
new file mode 100644
index 0000000000..b27b890374
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-schema_0.7.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A library for validating Python data structures"
+HOMEPAGE = "https://github.com/keleshev/schema"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=7e70914c99a6ec706baa9fad5e0502df"
+
+SRC_URI[sha256sum] = "e86cc08edd6fe6e2522648f4e47e3a31920a76e82cce8937535422e310862ab5"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


