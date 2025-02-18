Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D9AC021B1
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.14629.1739864486245215891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dK7ZMJvV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864487; x=1771400487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z5j/AyznwbsHiRExjGgUCKoj53TMjh8vKSZlk26A7Tc=;
  b=dK7ZMJvVwEWihLcleemayrQilsX+F+NMMcT/Kfk4dCppjmrtR2EdBLUI
   wLECxalStUtc+o2xfFxROB2leepbn9WMdQfJYWf7iyufvYcWtx9mHcJJf
   m/8Q31BDyMccAeqU46zynofMuL7VkJnQKvWj69g2Kx2oZPnAkaBfU+WK6
   pwfePzzen3X6U0Qq+HEvGRZa45aesUCVvuVkxVJXbw+Gnze9bZK34FnzE
   +xFl/lN/hwWyzcfsZAu3e81mvTxun71I54Y7asRUsxUhP6rG0MzE0tBGL
   FUbOfr5SVuxmYxakZRRrCAYG3qYY0bJvd+6VO2qW/Rop25biMkoZhIdma
   A==;
X-CSE-ConnectionGUID: gWEtRhfxSg2vk6ckHGVm7A==
X-CSE-MsgGUID: 0rfiISC+RpqcMz5wOEf1mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190317076"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190317076"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 12527D4809
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF45AD4BD5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73C681A006C;
	Tue, 18 Feb 2025 15:41:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/32] libx11: upgrade 1.8.10 -> 1.8.11
Date: Tue, 18 Feb 2025 15:39:16 +0800
Message-Id: <1739864375-21394-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211574

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.8.10.bb => libx11_1.8.11.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.10.bb => libx11_1.8.11.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb
index eda184cb35..d7c34c74a1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "2b3b3dad9347db41dca56beb7db5878f283bde1142f04d9f8e478af435dfdc53"
+SRC_URI[sha256sum] = "3b74e82943924b45a0b778cc6842976909c3010d9445a8fd185e1dca4d380e88"
 
 inherit gettext
 
-- 
2.43.0


