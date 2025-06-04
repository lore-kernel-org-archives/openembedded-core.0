Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF2BC67861
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.11651.1749026737185652181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jrnLVulZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026742; x=1780562742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8anpbQ/ZYdVPaJIMQto135UG6dVxmg4KVilbwagGFs0=;
  b=jrnLVulZPqjQ7fn1FRB36//7QY1tGlOK2IrEHHMdAQcKe5R3y4yCp1RX
   AXOG1lTbDedOsWGuFF5u6rfOdieL0d9WlPcLfxcZXFz4tVEh91eXs0JyJ
   Qc5WCMCq+mNWGNZDj9Nmg7QmnTgAjHHab0KOtkKJ0hYrsv1nhhEBsujrt
   YikVya9mvH+Hxv1ap0Emiy10pQ2BJQd6QWKxACdAo5/HVI8e+C7QwzVWJ
   XQc6gE+bNAke0ykSBNkIsp0FVbeSrYSHwnz+C+xisYa8MGGp4itBEgtmC
   VIrokiz5herEN2Yi7vd0nTJ0limCTaAX98s/JO46qveXJmja9rITA/gi+
   g==;
X-CSE-ConnectionGUID: ahSSX7QrRRyYR6Ai6H75Uw==
X-CSE-MsgGUID: 9mTlAySGRC2ioWcI0+1p2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="204701656"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="204701656"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DDACD5004
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 043CBD50A9
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:38 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 76E781A009A;
	Wed,  4 Jun 2025 16:45:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/45] liburcu: upgrade 0.15.2 -> 0.15.3
Date: Wed,  4 Jun 2025 16:45:05 +0800
Message-ID: <20250604084524.864-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217872

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburcu/{liburcu_0.15.2.bb => liburcu_0.15.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.2.bb => liburcu_0.15.3.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.2.bb b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.3.bb
index 93d6a6551f..fb4e457719 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "59f36f2b8bda1b7620a7eced2634f26c549444818a8313025a3bb09c0766a61d"
+SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.43.0


