Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 464BBF89236
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:04 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20402.1776765412223009380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ew6houUN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765419; x=1808301419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V1qihoO/8otaC7AlbJBD0n/N/JwQjuUKgV+9O3z9Mhg=;
  b=ew6houUNHVK+JQZ670sBMPl5+qf1S2I/j9GRWSCOz1Ezq7s83/WGSrsa
   Oaqpvva5DRYGDmjY0n+bh9FDuHM/o2HmvtSxUyJHTtGLlvWklpcHPF8vX
   kNnbFR36sjK6jvZdkuRcmapB1Az3dhVk8Zu491psWXtkl3Hj3AE4TMPJa
   TV38Ba19RogvrpA7f45KQ6iW3gAfFKVSS+dr0fF/bXWWZY14azmpdiTYb
   lo7b4yeMvvLE9xw1L9xLog+qj/n7t2F1yUoCvADRzO7fPF7fnJp/3bdPr
   iPmAUPqpRucbNAXYngIC2mcAUf51/hXOCQjIRCvM6ztZMLQ8uYeq+deQs
   g==;
X-CSE-ConnectionGUID: 2bHmMPzYS5WoTHC1/YAQbg==
X-CSE-MsgGUID: h688KZu4R92pCGn6tZJjLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="216474326"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="216474326"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:58 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BCFA8143C
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:58 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6E6B31800D5E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id E52B4140025F;
	Tue, 21 Apr 2026 09:56:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/49] python3-pdm-backend: upgrade 2.4.7 -> 2.4.8
Date: Tue, 21 Apr 2026 17:55:39 +0800
Message-ID: <20260421095559.1856-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235637

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Support omitting source in version table when path is declared

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.4.7.bb => python3-pdm-backend_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.7.bb => python3-pdm-backend_2.4.8.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
index 94d40ac528..5833bb717b 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.7.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f"
+SRC_URI[sha256sum] = "d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0"
 
 inherit pypi python_pep517
 
-- 
2.43.0


