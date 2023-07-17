Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BF2C00528
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4248.1689585042654153737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="113014150"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="113014150"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AA45D4240
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:38 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EB58D5D44
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 355722FC8579;
	Mon, 17 Jul 2023 18:10:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva: upgrade 2.18.0 -> 2.19.0
Date: Mon, 17 Jul 2023 17:10:09 +0800
Message-Id: <1689585025-23731-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--14.142700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvk6Qbi+9i6D0WY
	FvwCgnnKEvLeYdQvcMe8A/3NddM/cTDluhiayu3QnDMS6U2JkurTuFXG66lrqoAjsy+r+wvnh0/
	Ae6okRynLtTWpL2rR9NC2zMsY4yqQitTwZYMQM2Hy3h9RQZ4StEyQ5fRSh265YA3qL69rXq53y7
	kSqxRZ34qFdXtpEJJS5p98cjyQCaIUegcXwBHh+wN+CmNIOQU3AUDqlLFoMeaBbptjxI6rdaPFj
	JEFr+olKE0Je8DR/D6No+PRbWqfROJGF26G8SWy8lP6F/raTZj6CxJ5baM0J0SKY3NuH0G5cbr3
	9d0RellS4iyxrqL79efmEyrLODYJlExlQIQeRG0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184439

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* docs: fix references and descriptions snf focyhrn mstkup
* ci: add build docs test
* win: change default driver search path to bindir
* win: rely on compiler to define link names
* add: Add mono_chrome to VAEncSequenceParameterBufferAV1
* add: Enable support for license acquisition of multiple protected playbacks
* fix: year for version 2.18.0 in NEWS
* fix: use secure_getenv instead of getenv
* trace: Improve and add VA trace log for AV1 encode
* trace: Unify va log message, replace va_TracePrint with va_TraceMsg.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.18.0.bb => libva_2.19.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.18.0.bb => libva_2.19.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 7ed0c9ed89..3388fea32b 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "a3577eeba0c23924686c7e2f2030073736c8282a80f27b5473e33ea94ccd4982"
+SRC_URI[sha256sum] = "963be798d559df7feebda6fa81aa0dae6f9409c633a37909c44c6aa8af1e2174"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.18.0.bb b/meta/recipes-graphics/libva/libva_2.19.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.18.0.bb
rename to meta/recipes-graphics/libva/libva_2.19.0.bb
-- 
2.34.1


