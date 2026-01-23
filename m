Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53704D6CFCD
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:22:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62025.1769145770327945761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BYp1tKBa;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145771; x=1800681771;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sH1a+jRT8+uWcXXqtVbJaFuMv8UcceSqzWPilkU3Pns=;
  b=BYp1tKBa9DYMuA2xipB91PdaRG362vvKOl2W4weyzApTvwKxpfuRn91m
   YTERyAPzk8u1BCAb5tcGWHOi02YLE6tD5itwedo+ScQXO4jknKt85IXeL
   reaVdePReVHM78L2pqeZ5NoaogpjX5BFDUsuIp3mBFdykc4lU/3wlbMm/
   CwWKS1lbCdMWK9T7b1TbcLiUzaXGMdhdCnwUWT+JgXc/GEaFICf9pdx2E
   rzuY7HqZweUnSb3Yok3gzyGReKxDLa273ukiQiYHzz3YJ5ZD3o7ZYySsx
   z2d9IAF9pG7WOlMzStVgPbpDhnQpvwSGxRCTL9ZYaG3ht7Ak8vSL3iu8W
   g==;
X-CSE-ConnectionGUID: /nmjG86yQ+2tiIOvKMN5sA==
X-CSE-MsgGUID: 250EqbHhTyKne1c2iqILLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226756535"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226756535"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:22:49 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5DA9AC020E9
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:48 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 132E5180ABC4
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CBF501401F1E
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:45 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/5] python3-schema: Add new recipe 
Date: Fri, 23 Jan 2026 13:22:31 +0800
Message-ID: <20260123052234.970-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
References: <20260123052234.970-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229862

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


