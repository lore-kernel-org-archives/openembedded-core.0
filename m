Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A3BC369AA
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.64301.1744073532396091312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HWkZfTye;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073533; x=1775609533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YSaLvyrCw16ASqdW70sSpHQMgTJ6oG1ShFSBNEiJOJw=;
  b=HWkZfTyeDuA7F7KlRuetTdQrPw2DIZfOoodYI0ke1etVJtA4L+5OZBHn
   kbxY7ou8o6wybn8mAUG3M6c6KpxRDUC6vquF4uus9f0qk3Bo2LuaYdJMy
   wn134BzPj381WuwytOKpl1Hiq3joAGGuez4QB/V+p0+/ROrtF6uFVjh+l
   CB96ssIrBD3vpSQi0T/EfoELNlNhPwemKw7NASnyFgu7tlBMPO0wg/1cy
   JeCv8BBEhzMKPTVvKaTLnhRm6eSejJ/sKpxgR5cTI/+XQBHTbqALvjKyv
   aoLbiUA9JdhAsXr8ezi9ZLpWd5ue4krEs8170qCvr0Vlp2HVAgmMGQe5L
   w==;
X-CSE-ConnectionGUID: Bak/Ybd6ThiNUkqHUbR9qA==
X-CSE-MsgGUID: n2/6pZ6xSweOcTQeQ9vvEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="198495820"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="198495820"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13721D5011
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C539D103D0
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E76E21A00B1;
	Tue,  8 Apr 2025 08:51:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/15] llvm: upgrade 20.1.1 -> 20.1.2
Date: Tue,  8 Apr 2025 08:51:35 +0800
Message-Id: <1744073502-27695-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214495

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/llvm/{llvm_20.1.1.bb => llvm_20.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_20.1.1.bb => llvm_20.1.2.bb} (99%)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
similarity index 99%
rename from meta/recipes-devtools/llvm/llvm_20.1.1.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.2.bb
index c60a604255..f1ef4c33d4 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
@@ -38,7 +38,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
+SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


