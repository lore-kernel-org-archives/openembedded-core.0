Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B517C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.45973.1747040641170452848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mcH2gug+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040641; x=1778576641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bNyvf7bubclXYsWhBhF9E9EvqAIu7AdxcdwdLusS8HM=;
  b=mcH2gug+VDLJ3FO4OmSjHb/3GtB6WFQQ7i7GSAIUi/N0Ei3LskdI8SoM
   eiGZqtlYBb6p5UlFJjMSJlluhRnkn1ekc1r5MzLwXOm28FiGvtzTC17zw
   UIsbWZg+73aB5iqM3LyZRt84cyqQadRSrxvyHAEONjwUQ3LLc75MPzlSI
   b7gjB9qMRdtWM8n/yrqBKpkftQjhlULsHadpSxV7tCNjDfDiSzD2dPG3U
   Dcb/bxp+9EhEMnpLssySc0Pdb/5XVLELaU83nk6wxSe9+j51L1rrsYkaQ
   XKqYB1IHTyUjcEC06j9Tuy/K4hMDRu/FRG6kJ44ClPiQtYeEZ7+kXLfM2
   A==;
X-CSE-ConnectionGUID: vtWMUsJmS8mVSDq6Oam5TQ==
X-CSE-MsgGUID: oTERMyy4Qh6tvCv8buMUzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="178035528"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="178035528"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B03EAC68A2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 728BBD5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 314B01A009A;
	Mon, 12 May 2025 17:03:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/56] iso-codes: upgrade 4.17.0 -> 4.18.0
Date: Mon, 12 May 2025 17:03:01 +0800
Message-Id: <1747040619-7566-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216316

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Replace FSF postal address with their website

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iso-codes/{iso-codes_4.17.0.bb => iso-codes_4.18.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.17.0.bb => iso-codes_4.18.0.bb} (82%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
similarity index 82%
rename from meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
index bba2cd9de1..c737cfd59f 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.17.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
 BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;"
-SRCREV = "0640070a001ca6edfa8ab6b61fe3230e66b3963b"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "5be4d112d420706eacd913a3ebd85549fe9eeae4"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.43.0


