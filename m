Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3F3C5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11729.1749026746926071789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UqG0Jz7p;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026747; x=1780562747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vqh2MhVQaNaFcgE5P5JjY/7zTUw09ZVq93PvI4s9kbc=;
  b=UqG0Jz7pVvhjdfsvZLJLFXDHNNbi8CjVeHRMkkTBwYio7Bq/HfjY88fl
   itqfgsJGem4IrzuHrUHpy2NJtXQJQYu22HnftOCpLqeAB75goTnbrG09A
   PMdnReAgqmOzv5pZrbGBgCJt6sFZQJfJQvkzKKLcgM5+4a1nxVo8XQS9v
   5jNhTjcffFmo/j4CH+fE37n47ZmfxAjnp+emHULZdMzV/SjQ8nHt/zabk
   UGfPEfZ6raRXdelCnNIuyO4VGY1of7JIWGD2j58jtRoe4PaINIHLDGFsz
   oa6PdjB4JJbCdB709ISH/ZwHCRBZxnXIhTIBHv1H3mWbosy1ASFgZHcgu
   w==;
X-CSE-ConnectionGUID: nApkwjP2Q2GpsV6CeWqyQQ==
X-CSE-MsgGUID: utURNzrBT5yyVM2LD5rnGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="189040718"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="189040718"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:44 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 61199D6861
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 217AF296E7E
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 956061A0078;
	Wed,  4 Jun 2025 16:45:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/45] python3-pdm: upgrade 2.24.1 -> 2.24.2
Date: Wed,  4 Jun 2025 16:45:16 +0800
Message-ID: <20250604084524.864-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217887

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.24.1.bb => python3-pdm_2.24.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.24.1.bb => python3-pdm_2.24.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.24.1.bb b/meta/recipes-devtools/python/python3-pdm_2.24.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.24.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.24.2.bb
index 3f251c7f0f..d24e03d650 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.24.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.24.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "fc8adf011caa4ee2b0f25dabf890152aa4153cc21599ea67fe0c14e533dcd6d9"
+SRC_URI[sha256sum] = "ce0d5e9005fe26238b8ba5cf0e37ac00acab2fb90f904bf0219a5e8445849dfb"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


