Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817A0C021AF
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.14678.1739864482814925242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C1g8yRPL;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864485; x=1771400485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f7TcYyFg+B3FLu3nl0KfOQFcTTYy+SEw3oJ562HC5tk=;
  b=C1g8yRPL1rFnZdXXmpqsvVzyMlXtLIxIR4hLJdWprPyXcu4AR8fE0Oz/
   J1Qxtierk6lApL8RtMUpTji156Keg4mEZSkG6GPN8HfX5zby8I4eUi/E4
   FpsIn8oDwspaYCI6Qvfg6DolQFZCJy0Dmi8maNjE9uw3ML5d3X1xvWmVb
   7WovtKw0qCyipABN1QBKuBWwLcdNlftnRHxy67UneOB43adnl/TpHqFu1
   3HM/0mPpFXjx0xZ0X/ukVXp2tx6S3ENOqgyY/v1CTtyAlPcytfOGmFncl
   3SfyOSVedCpYQra5VEpqRPuta3UVQvB3VJr6WRbE4M3ETpnnl+vXTbFvZ
   A==;
X-CSE-ConnectionGUID: Nc8BQsYdSMigQQWgcVYkkQ==
X-CSE-MsgGUID: rMouWJJXSFyd6oo334Yg8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169273905"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169273905"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:24 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DB80CD6EA7
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2594D3F2F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 454CD1A000B;
	Tue, 18 Feb 2025 15:41:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/32] libpcre2: upgrade 10.44 -> 10.45
Date: Tue, 18 Feb 2025 15:39:11 +0800
Message-Id: <1739864375-21394-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211569

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: LICENCE renamed to LICENCE.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpcre/{libpcre2_10.44.bb => libpcre2_10.45.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.44.bb => libpcre2_10.45.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.44.bb b/meta/recipes-support/libpcre/libpcre2_10.45.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre2_10.44.bb
rename to meta/recipes-support/libpcre/libpcre2_10.45.bb
index 36f58e4612..e82de0fa5b 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.44.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.45.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=8446a1fd12e40d9d64c79234fbb1f812"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96"
+SRC_URI[sha256sum] = "21547f3516120c75597e5b30a992e27a592a31950b5140e7b8bfde3f192033c4"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.43.0


