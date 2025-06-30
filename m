Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38005C83033
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.35181.1751274813564732740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CQyIR1SI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274813; x=1782810813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YBTHHJQU4uo0Qyfmn1aFFxI5GV4inz/h1FuKYyPLrys=;
  b=CQyIR1SIqH672lUr2mBmnBMrI3AIBHq6Wd//BDtCeKd9AxDpK5WyGZW6
   /F/Mb3WFoPBUt29dgvSlBhVTFGIpj/LEay8Pel0pqfLz41V3RA7indSUW
   aU623QscVYtoJ6CCPkYZo2AJC/cLnybgCpvvNeUdDt2/cF8tInCD0iVef
   LOncOu62l45S/Z5gQZLZUMp8fYZkrW2nyKowidQOWQ5hI9gRx/xgVXzyU
   41VKyVqRLPc4fVgUlh/ECVMVXul1HvGHoqhhnFcRRxIHgu3M4FTslopNk
   Q28JQe+oUoMAz1bn8yZwGyvwrzZ4PxRfwqFjXT+odfAq1YMxCI4vht4JK
   w==;
X-CSE-ConnectionGUID: 9NSkyey6Qo+BPbwSuasw+A==
X-CSE-MsgGUID: gQTsE1NuQjq5m5IvTFLMBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="192514718"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="192514718"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:31 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0F03F1C0008E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:32 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 80B03C00D4E
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E531D3DCD7
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:30 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A6B71A0073;
	Mon, 30 Jun 2025 17:13:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/37] python3-markdown: upgrade 3.8 -> 3.8.2
Date: Mon, 30 Jun 2025 17:13:08 +0800
Message-ID: <20250630091315.1897-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219488

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix codecs deprecation in Python 3.14.
- Fix issue with unclosed comment parsing in Python 3.14.
- Fix issue with unclosed declarations in Python 3.14.
- Fix issue with unclosed HTML tag < foo and Python 3.14.
- Ensure incomplete markup declaration in raw HTML doesn't crash parser (#1534).
- Fixed dropped content in md_in_html (#1526).
- Fixed HTML handling corner case that prevented some content from not being rendered

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-markdown_3.8.bb => python3-markdown_3.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.8.bb => python3-markdown_3.8.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.8.bb b/meta/recipes-devtools/python/python3-markdown_3.8.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.8.bb
rename to meta/recipes-devtools/python/python3-markdown_3.8.2.bb
index 09c2f3435b..d7ab34b915 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.8.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.8.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7df81e63f0df5c4b24b7d156eb81e4690595239b7d70937d0409f1b0de319c6f"
+SRC_URI[sha256sum] = "247b9a70dd12e27f67431ce62523e675b866d254f900c4fe75ce3dda62237c45"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


