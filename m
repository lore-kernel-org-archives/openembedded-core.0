Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB73D32D72
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.82733.1731403534088361604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FLjqh7gt;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403538; x=1762939538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3+pkaUvwkJP3f5W+FMTstvtVIibMvuaZB+7fxZ5NnaU=;
  b=FLjqh7gtsbjH5/i5e1MmQDBnDnxLtoj+zKZqf4ZgvWxn2bDmi9YO8q+M
   /bAbDYOE3PImMURM1ArqjRzWkQ61AU9LTLyLyuOa7D7teWSNeQ7WObK+y
   h3xs/7wcJ1BVP/axlc0B8ANBiPS3dIB62IlYPhKfq75W0XyGhODTrglWZ
   /g0S/AhYQvFFIRc6z3WD14bn6y4WoFryZrZ99PAoc4DY3UYG4zC20b/fS
   JZMfhnQJjF+1QJfweWdZ7hNVd0ly5TsoEC0nlBwYsiPo1Exxs8kf37dQK
   w+BCFBrHVQ9YD3iUnAYjlkPxDazPNFVANjWokZj5PL9X0LZZS6ZPK3neu
   w==;
X-CSE-ConnectionGUID: tZDytzcCQ86lF5emqBJ8OQ==
X-CSE-MsgGUID: dYA7NmB1QE+btOy1eKqm+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="159037391"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="159037391"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E0496D9C0E
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:34 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 77E69140EA
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1366920071A35
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B6D6F1A000A;
	Tue, 12 Nov 2024 17:25:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/47] python3-markupsafe: upgrade 3.0.1 -> 3.0.2
Date: Tue, 12 Nov 2024 17:24:29 +0800
Message-Id: <1731403483-21399-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10-2.867800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbys8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeGAN6i+va16uEok
	GD3z/g2egPPok7JOqQIAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtuVfc976pNypaAU
	PZ83X8OQWR9H3mnOKn9Vc8N66bMbH6DBtAssI1rgkYR7kO+etoom3HwmfjyeqcWL3dHhRH6O9ki
	SQGgv7E7OnD6HyxEr7yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207019

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix compatibility when __str__ returns a str subclass.
- Build requires setuptools >= 70.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-markupsafe_3.0.1.bb => python3-markupsafe_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_3.0.1.bb => python3-markupsafe_3.0.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
index 03be78a022..7e48bc36c7 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344"
+SRC_URI[sha256sum] = "ee55d3edf80167e48ea11a923c7386f4669df67d7994554387f84e7d8b0a2bf0"
 
 PYPI_PACKAGE = "markupsafe"
 UPSTREAM_CHECK_PYPI_PACKAGE = "MarkupSafe"
-- 
2.34.1


