Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD8AC3ABDD
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.45973.1747040641170452848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LD+P6X7I;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040646; x=1778576646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xaPIYqT1s2oDjLUEQ7doEmtOvwn/czc6U/h2Tc9AcbU=;
  b=LD+P6X7Ifr2qPfUirsTWUldwOF7zmuPeCJ7PtNpJXy++VS2ziqGFVvlW
   hF6l1dvXmnPcRO5nqE/Ga3u6OH2ERliXeI80SFNAC+0ZrBgfSIfUp7xSD
   Y10A+vfNIrzGxAtLjJg+Tcs4Y9Gkc2pn7s6aGFRRuiCu8gq+I9K2jnrNu
   sp98JrpSkB6tZNPbQgHqmUc+e19c8mIv3RezpEFFnV2kzshkcipnCWumS
   BGgh7XVW3B/nnT+u7tZ84TeC4riLFa3hNV7TYOFf9VqrN7kxw1jDjUZoB
   UbtXbd7yCKh/Z819pyO9t+YpyVXU5QZWs9zRnW3Nx3toOq59+6m/sb3Mu
   g==;
X-CSE-ConnectionGUID: m72XllqQRSu55DAEcunv+A==
X-CSE-MsgGUID: OREuUHdCQBesK7g/sMAjMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178035540"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178035540"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06020C68A4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAD61D5060
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E59F1A009B;
	Mon, 12 May 2025 17:04:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 44/56] python3-packaging: upgrade 24.2 -> 25.0
Date: Mon, 12 May 2025 17:03:27 +0800
Message-Id: <1747040619-7566-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216339

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Re-add a test for Unicode file name parsing
- Upgrade to ruff 0.9.1
- Add support for PEP 738 Android tags
- feat(markers): support 'extras' and 'dependency_groups' markers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-packaging_24.2.bb => python3-packaging_25.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_24.2.bb => python3-packaging_25.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-packaging_24.2.bb b/meta/recipes-devtools/python/python3-packaging_25.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-packaging_24.2.bb
rename to meta/recipes-devtools/python/python3-packaging_25.0.bb
index 3526cd5b39..9cb5c68f58 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_25.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f"
+SRC_URI[sha256sum] = "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.43.0


