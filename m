Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6673F8923E
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20462.1776765432953188443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CyS0Ltu/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765433; x=1808301433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NIckFMdTBTQFeOWYipYsOP9r9r+xiHaHJ/Im0+pUWlw=;
  b=CyS0Ltu/5BAXLja5yK7HOHq7DW7N8UhQQOaje/K8HmMFTLaXSaYNIGiL
   yXFz1d5IBgz2E1g7fLiQtzoq57iKU9UEL2rJS+Ev1yfml+punI+PlWfb/
   Ex+OvuV9dXem3ZpM6DXr8VNnST0LyHxeIoEE/chPt+RyAafuwcY4UrUVv
   yYGRzWGJmsT/d05vYzhxvu3tLtXMlDp3WKSRXO4PBlsatEUyQRD5JbHMc
   sfmKKYIQCQygsEglHGXm42Y56U5EdtKPwbm/Y2yahJGEPill1JdBhdX8c
   1R+AE8nN65a8HzwajwSK9WlQDPmPBL8QSzANFxNTh1IlgQinFXPzvq2Tz
   Q==;
X-CSE-ConnectionGUID: m4ksNVLKR6qxhIZs7pKBNw==
X-CSE-MsgGUID: z+3CWzW7Qpia0H8NJ9EVAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216684719"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216684719"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:57:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7EE3E1C1C703
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 353B4C00314
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C19B314002C2;
	Tue, 21 Apr 2026 09:57:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 37/49] python3-shacl2code: upgrade 0.0.24 -> 1.0.1
Date: Tue, 21 Apr 2026 17:55:47 +0800
Message-ID: <20260421095559.1856-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235645

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
index 93ed9a2530..904940926f 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


