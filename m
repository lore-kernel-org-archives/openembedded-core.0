Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05695C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18201.1741079370122954640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZoQ947nN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079373; x=1772615373;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=INHeWgfFefOObD7o5EZWkWmS5zas4vPMUKIzPuqXwKU=;
  b=ZoQ947nNI5zirMvu/sfaoQJZpAla1ExvQmMgMo1HCLfBdf99IS0vbIyr
   QWsbcwiFh9C/mTlSkMV8Uc5xV5SslpXoqK3xnShampTUhhGsCLqhZYMQa
   /lmFVKl1vNQpzDBo2Hqk0iJd3Akw01OLpndBBElgLNeaIO3/JikUmSku8
   veM3DaYskC5aZ0Vyv2AQAtXSqhpQ5uya1FCHO7Q6uLmSjF/GwqrvIN+NR
   E3hnJU/3vu+3ZfvmD5eQ+ODiNIsDhgIhpi3/Uaxb/Gq2j1a7hCO4AREaC
   nZZu6PXLFzwEl5eeCapa5Btaxfq23RWRwMbDZogMWENCWBi9F7L5l9Vzs
   w==;
X-CSE-ConnectionGUID: 4ZG9E0f6QN2rnuvTQstiyw==
X-CSE-MsgGUID: f6ffbbp8QtqHm7xoztxisg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191869478"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191869478"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:32 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C30CE614B
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B398D8B83
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B87E1A0071;
	Tue,  4 Mar 2025 17:09:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/31] python3-hypothesis: upgrade 6.125.3 -> 6.127.4
Date: Tue,  4 Mar 2025 17:09:05 +0800
Message-Id: <1741079356-13445-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212245

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.125.3.bb => python3-hypothesis_6.127.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.125.3.bb => python3-hypothesis_6.127.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.125.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.127.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.125.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.127.4.bb
index e5c1dfc6b4..d5ea706b9a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.125.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.127.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6276d9d8f7f91ebd7ad95081f004bcf5699afb4d680a8321861cbf3a5de45d3b"
+SRC_URI[sha256sum] = "3ab8dd0e2d985ea90169b0b0e5b77ef3a7bcaf3fc6bb038927a4e977e3477908"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.43.0


