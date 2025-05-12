Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3782CC3ABDE
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.45913.1747040637212932732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S25AqG2J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040645; x=1778576645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=epLKapKlfE8MY7LIc6a1zF6zcqjdCugggcwhEMiv+ak=;
  b=S25AqG2JC2GIAV72hOcqncKYSGhpm96FIsdoxEUCoDuYGdEL4mXn2lGQ
   tiVG4DN76cJb213enBGATJDC7cjKvFBIFwL1mFf7nSunoTFKhpl+IdTOA
   +z25qRnOb/GFztSVlHi4RcBIbmJa9JuulnPzdhJwX/t4C9iNV9x+dl6TM
   x+EpvQEc3rf6Y4iDPmPjiXArohZEYZZgswXdsi/3Ff+0FJmaZ5RboTocH
   XFpvoMxHtdkwvreYYp2JPqz4GxW/G5bIdVchILpvxDaf/k4rA8Yj5tbpI
   UgJo8Gztp3fjbGtjJjmtllp0TBTT8A44NURS70NOgsj8591VtIISroCOa
   A==;
X-CSE-ConnectionGUID: zvMwFVVMRneE94RbrsLKzQ==
X-CSE-MsgGUID: dQWpvQP5R86lBXDefsRI7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199193698"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199193698"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FA3BD687A
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31170D5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E43481A00A0;
	Mon, 12 May 2025 17:04:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/56] python3-hypothesis: upgrade 6.131.0 -> 6.131.14
Date: Mon, 12 May 2025 17:03:21 +0800
Message-Id: <1747040619-7566-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216334

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-hypothesis_6.131.0.bb => python3-hypothesis_6.131.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.131.0.bb => python3-hypothesis_6.131.14.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
index d7656dc1d8..269ed936b6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.131.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "4b807daeeee47852edfd9818ba0e33df14902f1b78a5524f1a3fb71f80c7cec3"
+SRC_URI[sha256sum] = "347edc46cfe9bfcfb0598c4c927ed8fd573edfc8bacd2162023c4cf16accb702"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


