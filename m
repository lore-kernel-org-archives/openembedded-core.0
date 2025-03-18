Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5013FC35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.5378.1742278923370526890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ic42CGMX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278923; x=1773814923;
  h=from:to:cc:subject:date:message-id;
  bh=cmTk/NMiC8dgOD/eLyAJXYdKHT7C5x6P5yywDBBNCXk=;
  b=ic42CGMXk+xZ8Xf4afp+c/EEjVl3h57a21CWEKqF8Zd9Chra44Fh1ODY
   vSaeTkuaFPeOeRfFHyxB9anJC0yGgMEQTOcgha3wZvvwEh1FDYBDaS/Cz
   aM+iyrVlClwQL5LHSVYMHYrLqpBwBXJMfSdTkLGHB7ck1Bbw9kC9vodsT
   /RpCVz1JfQJZ37McsWnVKUBfzfUNumn1wzXo8IDeBjWkNZS57gFcw52J2
   Yob6pTwDxaqW4GgKRBsDNKJgs6evFqUX/86TexQbtlNkv8a9YOQmKjLwJ
   +wZCW7GT+yD5s9w27c0+kdv1BSrIugKkbbtNR8gQZOY0eWdYjUIRpq1Ky
   Q==;
X-CSE-ConnectionGUID: MoKvd4JlQ7iPp2rRCuj+eQ==
X-CSE-MsgGUID: cR3KUarCRbSfHvbc2EjEJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="172328383"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="172328383"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 168E4D4809
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:21:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C622AD4BD3
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:21:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D0E61A0078;
	Tue, 18 Mar 2025 14:21:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/12] adwaita-icon-theme: upgrade 47.0 -> 48.0
Date: Tue, 18 Mar 2025 14:21:41 +0800
Message-Id: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{adwaita-icon-theme_47.0.bb => adwaita-icon-theme_48.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_47.0.bb => adwaita-icon-theme_48.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb
index 1ae08f7f05..38b5410086 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_47.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "ad088a22958cb8469e41d9f1bba0efb27e586a2102213cd89cc26db2e002bdfe"
+SRC_URI[archive.sha256sum] = "847068888650d9673115be6dbf2bfdc31a46aebc528a6a9db4420e60e656b8d4"
 
 DEPENDS += "librsvg-native"
 
-- 
2.43.0


