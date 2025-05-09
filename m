Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0B1C3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6649.1746763071239636200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tk5L4q4H;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763073; x=1778299073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t0AfNvnc3RuMHqbDJCbmHMJRKuuwJ7X+MPhTGjWhCzk=;
  b=tk5L4q4HaT5/O0br8xTD53sLqdahBoXxSw8ReyIZfsnmlqTtFm5FfIQ8
   J9MbvlH79Ra7gbfqxOSHl7zWoALZvhZLOtxLgOcaL9xMnky98RIW/saOJ
   LY1YqIiq8MBjEDncqTj7LvxCpQqIpj4R7xFcrGwxYfYi9ngR06Rvcu2vl
   FDMH6SSAL1mYzRRx5pEizp+cAM4RtAgimNjMDP8oagHQfh7rLmcuwaz+K
   a8afnDjmt//uw8jk8/d6c1dqare8pWHAfqqb/ptTQmeezuVoOwhcVgXRL
   8UFZOKH03oC+tB/ttHzlOrcJCCH6UtA2vG9oVLrldJNC4GPSO1GHmDH87
   A==;
X-CSE-ConnectionGUID: pVYyqaD1QHOAj0JNp6eMag==
X-CSE-MsgGUID: qDWkVeoKT4ic5oMvxnwUlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="201766969"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="201766969"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:52 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B0B5FD4F43
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 694B6D3F3B
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CFB491A00A1;
	Fri,  9 May 2025 11:57:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/19] vulkan-utility-libraries: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:18 +0800
Message-Id: <1746762980-12783-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216178

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ies_1.4.309.0.bb => vulkan-utility-libraries_1.4.313.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.309.0.bb => vulkan-utility-libraries_1.4.313.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.309.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.309.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
index f3db1be06d..785c6f305b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.309.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.309;protocol=https"
-SRCREV = "897ee4d90309f5b4f8e254472863d0489e6439d2"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
+SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


