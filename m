Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E02DC54756
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.45915.1747040638714823342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UUTu8qNV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040644; x=1778576644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ip6Bqfa4LAbI/gPcAym8EugDR/ivIkwnEodSC7tPc18=;
  b=UUTu8qNVYGe2A1iCUk+awF1nSh9z7UOHmJzKRCiiyIyca6mS6u2tFm7Q
   61byFauhJ1OIitRr5qbt3fvSc/d+UB0QKyXSjd9S0puHAxk95AItAV4UG
   OaBfCzdOlpsLhzyzHz7yMtYqIW5uRfw1YVCqw73cD6nMPxA+T85dSnGa1
   FgIiR4BKTsbE3RLrntHcJU5hWxibGT5AZgE/AFzVQGRLJV6pk4ZHxpTs1
   XngOLgjLzxkEcGMyOiXpujr5s2VfsIGLuvIv0Of9ImawmNJSREAdiAnMs
   JHJAEAM6GSZDgJmihQGJaP61Cz58q7otWI1At7c306zjnwh1QeF9K6p4L
   w==;
X-CSE-ConnectionGUID: g5V5f2TWT5a26DVruse62g==
X-CSE-MsgGUID: ShBPW3lUS7SUA16LAzvjeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187549316"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187549316"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02087D5010
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6EFAD5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 757F21A00A0;
	Mon, 12 May 2025 17:04:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/56] python3-certifi: upgrade 2025.1.31 -> 2025.4.26
Date: Mon, 12 May 2025 17:03:19 +0800
Message-Id: <1747040619-7566-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216332

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-certifi_2025.1.31.bb => python3-certifi_2025.4.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.1.31.bb => python3-certifi_2025.4.26.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb b/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
index 69b39ba100..07f9f3bfc8 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
+SRC_URI[sha256sum] = "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
 
 inherit pypi setuptools3
 
-- 
2.43.0


