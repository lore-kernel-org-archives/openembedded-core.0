Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092BBC3ABD9
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.45914.1747040638623560703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uj3g/F5p;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040639; x=1778576639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YN2fU4wKv1bb0w9+w0nB3lQK2lBx2rC+nIB+e89lOY4=;
  b=Uj3g/F5pEsPA24DuzLp7EhHy97N4BrHiijK1pkIZvvQRgeISFQpMGF0i
   AMoVPxCMxHiPZE/RG4gjg50nKnyTxV4G0pAlg1yqF7C5cENEtY01NdekT
   lQiyslStrZyM85oJfRb6LnlDm//Ld/mEq6FOF6PL1+XyRL7260/Ewb1gJ
   +5rmV+V/I7rCK8JsmOZ8yYarYzrvPx88pY4N3zpeCtkxJcMTGAjlalyxu
   M6DYVntT/Z5BFH1s6HjWp1P3ay76WPYJHLAPPgVYmbk9ts96LR+p+u9UJ
   TciU7WuX1sI43RmF+fNQlAPWgfgeaVWDITZFpKdnBa65YDg88JQYE4XPe
   w==;
X-CSE-ConnectionGUID: 4GqRfUELS8Sdlv0u869Pmg==
X-CSE-MsgGUID: ucIK+1ShTRa80FUcvQ4EYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199533787"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199533787"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C1EFC68A4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D1E35CFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FFCF1A009B;
	Mon, 12 May 2025 17:03:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/56] diffstat: upgrade 1.67 -> 1.68
Date: Mon, 12 May 2025 17:02:54 +0800
Message-Id: <1747040619-7566-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216309

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffstat/{diffstat_1.67.bb => diffstat_1.68.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.67.bb => diffstat_1.68.bb} (81%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.67.bb b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
similarity index 81%
rename from meta/recipes-devtools/diffstat/diffstat_1.67.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.68.bb
index 8c84b30975..488f0834d6 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.67.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.68.bb
@@ -5,14 +5,14 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "X11"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6232ea974e4cbc4ee06b49ed53df6ece"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c432d3aeb935855b2ca1ad2a0542ce4"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "760ed0c99c6d643238d41b80e60278cf1683ffb94a283954ac7ef168c852766a"
+SRC_URI[sha256sum] = "89f9294a8ac74fcef6f1b9ac408f43ebedf8d208e3efe0b99b4acc16dc6582c7"
 
 inherit autotools gettext ptest
 
-- 
2.43.0


