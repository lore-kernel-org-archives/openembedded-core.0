Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9445CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.13238.1757495865568982212
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hW/oJVVQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495869; x=1789031869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o9zt1U3qAvRgIcAepqQnoLN4KUar3iU6XmNmmi3AvtY=;
  b=hW/oJVVQfL6kimlAEi7YOxw/r+ZxGzwlSAeZPHQa3Vb47Al/H8IMtGtl
   isBjHS+ebb4i4nmDEVbjZzdJgUZa3hTUM1ZQiEntHPD+NBvey0JSp1FKQ
   dhaLeqGVnZXJCZ3lJkQwScaErpaPITZkCJE/OYcdsnQ6VgQ3z/kLyzF4S
   iH7+qHR1YZ3zwa9gqMw7ig97HnxUuUAmKH0/OETIEnkPLLtvkghI35rXC
   vVzp0vGsSeLpoIlluUSALLMd4Uu0oCIuLXbUlCUwrAFRKVotCtJ0U4YTn
   oN52urmdZfDkKB55aImdaFXOKWZYxnAnkX4/eJAw2hxiNDVcDn/HAj9Z1
   A==;
X-CSE-ConnectionGUID: jMGih7IqT1i91/ll8Gig6w==
X-CSE-MsgGUID: jGVLjURJSsyWFS3u3hOdDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212437523"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212437523"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:49 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 7896882070F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:47 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 30CEFC01192
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:47 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 858FB829F3A
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 78A0D1A006C;
	Wed, 10 Sep 2025 17:17:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/40] python3-markdown: upgrade 3.8.2 -> 3.9
Date: Wed, 10 Sep 2025 17:16:37 +0800
Message-ID: <20250910091646.998-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223182

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.8.2.bb => python3-markdown_3.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.8.2.bb => python3-markdown_3.9.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.8.2.bb b/meta/recipes-devtools/python/python3-markdown_3.9.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.8.2.bb
rename to meta/recipes-devtools/python/python3-markdown_3.9.bb
index d7ab34b915..67375e1321 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "247b9a70dd12e27f67431ce62523e675b866d254f900c4fe75ce3dda62237c45"
+SRC_URI[sha256sum] = "d2900fe1782bd33bdbbd56859defef70c2e78fc46668f8eb9df3128138f2cb6a"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


