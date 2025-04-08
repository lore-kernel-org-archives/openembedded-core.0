Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0561BC3601E
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.64297.1744073526713324137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lrVNnd7E;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073527; x=1775609527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BGqLIct2ZgRh3MvGkDOvrsg+EkxGHvJszHRyrq3FSIs=;
  b=lrVNnd7E2lu2vWNJTVaC3yFsSuklSb3vayl5uxcVV7/Z4AVy3sRfXq0+
   fIcyx2LTTjMxu29j0vJJrsoVsaQzIJnG2m1NpdnHz1zF/BKWb0tnCL7Lk
   97d/GauvPKL2tRb739yqonYag2GhY+Vop3ac7wqxFXXe7MB8UlvJp1qtG
   sp9IQrz6C1BaFuBm6LqZRwar/ryyMrpQjerX7KVwJH9V9kqmLgzVo8MvJ
   gN0bZgmNckTMw1NIkVs+jcoBJx7AuffoRiR7odznKix8As+qZQ2vnvJ/P
   BiFRJr6tW3ZuJx6ru9FcMZlbiGIlP221Yveq39+aqkoUzYaBfb1QTAqHZ
   g==;
X-CSE-ConnectionGUID: M7f0TxPoQoi7qxhaoNiKyw==
X-CSE-MsgGUID: 6+XbrV2fSTuWy7kFAsv5NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="174619207"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="174619207"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:01 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4015DDBB80
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1B05D73AB
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B0E591A00A1;
	Tue,  8 Apr 2025 08:51:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/15] python3-flit-core: upgrade 3.11.0 -> 3.12.0
Date: Tue,  8 Apr 2025 08:51:38 +0800
Message-Id: <1744073502-27695-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214489

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-flit-core_3.11.0.bb => python3-flit-core_3.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.11.0.bb => python3-flit-core_3.12.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
index 1d44b58830..e40ffd0d0f 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "58d0a07f684c315700c9c54a661a1130995798c3e495db0db53ce6e7d0121825"
+SRC_URI[sha256sum] = "1c80f34dd96992e7758b40423d2809f48f640ca285d0b7821825e50745ec3740"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


