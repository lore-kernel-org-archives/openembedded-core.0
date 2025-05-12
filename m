Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570CCC5475C
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.45918.1747040642037410105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qn0iQkpZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040644; x=1778576644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UR2dY+ie+WpAt/KnRDOSFEEK2GkTk96YAwxrS2fC6jg=;
  b=qn0iQkpZf4gZ7SiZPWO6GjwAlS9oY55yKXm3znf8/gfZj8PDfZCP6TRv
   eUoaN8y7oDGuVsHJfiYmwWBpbim05zZuqwHrmXO/PGK0WLBF2nLLa568x
   OBo73HmpBWCaMTiURM0nbFK62YmKevMWqjW/K3f7fPoary43vx/Ot1pLC
   R6zUABlp2A+J+Wdq3SVJFRe0B81Uabqad78APEBY3Qwlvct3Om8Kxz/Ib
   vdjCCYs5maaolZA5upiOB+puwou/oL0huJDkesQXpScPt4mhI1zfbvq5H
   cf0ZtMAiODH2rxG2IljC4zOCTD+uSW7qkpz18WekewkQDNZJPKXOFRmyv
   Q==;
X-CSE-ConnectionGUID: HemQJKV0QNCR8gAKEt3hUA==
X-CSE-MsgGUID: CY0uFTi4SnWHsbGCfsy3nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343076"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343076"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B35E1D5051
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F63BCFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3FAB61A009A;
	Mon, 12 May 2025 17:04:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/56] python3-calver: upgrade 2025.04.02 -> 2025.04.17
Date: Mon, 12 May 2025 17:03:18 +0800
Message-Id: <1747040619-7566-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216331

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- test: Delete SOURCE_DATE_EPOCH envvar if already present for robustness

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-calver_2025.04.02.bb => python3-calver_2025.04.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-calver_2025.04.02.bb => python3-calver_2025.04.17.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-calver_2025.04.02.bb b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-calver_2025.04.02.bb
rename to meta/recipes-devtools/python/python3-calver_2025.04.17.bb
index 3f169e1f7c..290be21ce2 100644
--- a/meta/recipes-devtools/python/python3-calver_2025.04.02.bb
+++ b/meta/recipes-devtools/python/python3-calver_2025.04.17.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/di/calver;branch=master;protocol=https;tag=${PV}"
-SRCREV = "e9c8017caf3e3aff214fbb581ee7f366de55f629"
+SRCREV = "3b74bdce35f2814eb2b65db39a133d5c849ddea7"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


