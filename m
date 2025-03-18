Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5BCC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:11:33 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.7273.1742289089170872944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k/iMZisO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742289089; x=1773825089;
  h=from:to:cc:subject:date:message-id;
  bh=vOQ4Xuy4KK/qe0UVVe0dD+6zndkznBu07TnOjQSBPh0=;
  b=k/iMZisOM9RTrbZurr6cjq73FVMEyHFM9cDiOJjgl/YZMDUiFhAW5mnG
   qlVX3ldRkWjl92OBksO3zwDbU62SdXHAox5+yI6iF6LeeLu1uV22ktFM3
   pFAZDu0X8+TqF5wxlszdJxE7MY+FCE0jl7zZvkRLOIXsY0QS23h9ImAN9
   de0xThYRiUJTNm6k7dKyhkzDyrY27deRzSk/dyl5Ix4syZJvz8lr1MFrm
   F0fIR4dy4oEOBLMlxCrS/oGJsvmL7RYDYVkWNeaL1O8FGB1mDprgVUzB8
   05V7sjytRIL/ugDrZrXX20QlBYkIvlHooX76lCvdW3/YHsGmORFqaGcDp
   Q==;
X-CSE-ConnectionGUID: ezlWeKzbSu+3VQjaaryDRg==
X-CSE-MsgGUID: so6+mJXRQ9aMPTZ9e2hCbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="172924047"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="172924047"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 18:11:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3531E8525
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:11:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E3DBD20AF
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:11:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C448A1A0078;
	Tue, 18 Mar 2025 17:11:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH v2] systemd: upgrade 257.3 -> 257.4
Date: Tue, 18 Mar 2025 17:11:20 +0800
Message-Id: <1742289080-4051-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213188

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ystemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} | 0
 .../systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb}    | 0
 ...temctl-native_257.3.bb => systemd-systemctl-native_257.4.bb} | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_257.3.bb => systemd-boot-native_257.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_257.3.bb => systemd-boot_257.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_257.3.bb => systemd-systemctl-native_257.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_257.3.bb => systemd_257.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.3.bb b/meta/recipes-core/systemd/systemd-boot-native_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_257.3.bb
rename to meta/recipes-core/systemd/systemd-boot-native_257.4.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_257.3.bb b/meta/recipes-core/systemd/systemd-boot_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_257.3.bb
rename to meta/recipes-core/systemd/systemd-boot_257.4.bb
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 31d26a9fc1..55389f1050 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "876ee10e0eb4bbb0920bdab7817a9f06cc34910f"
+SRCREV = "5ce1c02abc0cc386332384497b5939108314d80d"
 SRCBRANCH = "v257-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_257.3.bb
rename to meta/recipes-core/systemd/systemd_257.4.bb
-- 
2.43.0


