Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D6A108E1D4
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:20:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7943.1773915631548567094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XRY3YVpE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915632; x=1805451632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1myKblAVXE32KQoz8+JprSsRc9l8LkZ8z1GI8Es3xMA=;
  b=XRY3YVpE6yM5J0oM2f2Wee8om2JvjA17M9On0x7GhrJN2mWB1TlWIZ0B
   lU/9fsZ07z9SeAoJnnDsKvUDXhTt9Y9y+A0cRTtzK3Feuy8wezm90FL5F
   2ieZlJzXA4WJeTbXeL+KPJ6ktpQ7w+wlYL2Dfx2TJxp6BrYp28sHJVQPl
   w0iBWtTDw/WjtCsHDRaJQX/Y1IjoXDcgYT9DjUL5vALFYp+jY27THdWcm
   k5CSyXsC3WY6p9hrTR0dwOKnqGnV8veCmTt1CuX70aU94pUWAM/9R71Og
   mUNV97Yd9Uyg7RuAYGMDuIck9kAjc6Li4pCIolrB1oakze1TY26HQ+a2L
   A==;
X-CSE-ConnectionGUID: /7sCiq6DQwqS3e0PWweAig==
X-CSE-MsgGUID: 5H4JJ42/QnmK1kSboD/7jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233833300"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233833300"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CE9C41C166CC
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 826BF180ABF9
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 95ADC101E529;
	Thu, 19 Mar 2026 10:14:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/40] ethtool: upgrade 6.15 -> 6.19
Date: Thu, 19 Mar 2026 18:13:01 +0800
Message-ID: <20260319101332.2067-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233504

From: Wang Mingyu <wangmy@fujitsu.com>

avoid_parallel_tests.patch
refreshed for 6.19

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.15.bb => ethtool_6.19.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.15.bb => ethtool_6.19.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 79232a6b00..c8e54663c8 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 27757ce1a8956591d22e7f9dc8cef37e37be8e9f Mon Sep 17 00:00:00 2001
+From 63f7fd18fe8ede3bde7fa54ef22980b4815330ed Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f5fdc8b..3eab387 100644
+index ebb978f..57b624b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.15, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.19, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.15.bb b/meta/recipes-extended/ethtool/ethtool_6.19.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_6.15.bb
rename to meta/recipes-extended/ethtool/ethtool_6.19.bb
index eb6b272d4a..9ed94a901c 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.19.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "5d21a75b54c5e617b8ac0fe161e2ef3a75ecdf569ab64831474882dd3ece6077"
+SRC_URI[sha256sum] = "1c1a2f9fc02670ab005fb3e5de16688852bd6cea7e15ebc6ec91d0278b00dd79"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.43.0


