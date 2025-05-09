Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA829C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:50 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.6513.1746763006500052350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QN/gFCfP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763006; x=1778299006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LrNlnp+zn79KNvCsplaEiZSZ0WFXN2QFvkuSqkq+ytg=;
  b=QN/gFCfPD2GO83C2BlDYGgmzTzoTm1IkltlUJC9FK+zyd8oAmyCnLa74
   5iniGPd7aRFR0XgsG20l520IgVWpcxx9PDzwJu0nL+uilT22TrSs5+0DR
   V0urxWyb+TR+v/5IUUo3jGKu72amN4t1ADTBOAdg6Dw2NJRafefVv8QkT
   21ViKkex+dJrKwG/+UnpMqN+267RE95+8gjoGk8fZA0sPQy3DF54fGUAO
   dAEyNRo8aiW/E6iDCrEzS/HqSq9O6FGcy11R9iX8LsbK8Eh4cI2O/BDC9
   MAbwdkvx9ewL+KilGtoJ5uwfn3Xwv+K3QuHB2y7+uSDXaMiiC9XkrGaBt
   A==;
X-CSE-ConnectionGUID: WLdF1NG4TRqZDNPmMj9hXQ==
X-CSE-MsgGUID: bQNBeec2SbSEA/HVR8JQbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="178352877"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="178352877"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:44 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74DE1D4C44
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 309D2BDC9B
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B771D1A00A0;
	Fri,  9 May 2025 11:56:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/19] gstreamer1.0-plugins-good: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:07 +0800
Message-Id: <1746762980-12783-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216168

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.26.0.bb => gstreamer1.0-plugins-good_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.0.bb => gstreamer1.0-plugins-good_1.26.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
index a2c6426c34..ea1322a5e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "9e18f139ef69ad0867c2dfbb8fe1d1736d76df11aac83f60e8d3adb1e2eaf03b"
+SRC_URI[sha256sum] = "fcdcb2f77620a599557b2843d1c6c55c2b660f5fc28222b542847d11d9ca982f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


