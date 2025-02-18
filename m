Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7414BC021AE
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.14629.1739864486245215891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eZ4SDTx7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864487; x=1771400487;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tZSsbNlOiDMB1W+9hOEji+Q7arFBbYDWEkAIGmJZT1E=;
  b=eZ4SDTx7FmMzNV4mZSNoFtj9KVPKt33ffcPm4NgPUvKPJtFokaN80qm/
   hs3Mtc37sv0Sm0aw0yZ6OrBgsX8Z+aLtRAvIRqh4tc5ngIL9bns/htUfl
   NH+X5LDCmfBYZ1Z6gEHdTfCV6LkeYzo7CpjafmpC4RqAsBypkQ/hP81RA
   LAjS7NNS9rw+WhZTN+JP7UepcS/xY4YHTu6rnUzmoWU7dyasfXOq96oU2
   a02ne75g6iAg4PIWwNhRufZL9eApAmeBgInGLCvlWWXRnZ/UpU6XvJ68G
   rs5U4HeOXc6guv03o5s1d3BrbtPiEqwgefpndsWuS30ciGGJAp2TvgOdc
   g==;
X-CSE-ConnectionGUID: MiOlbYrqSruHpnga/zVCgA==
X-CSE-MsgGUID: urZE0rPLS4q/rPCo5W6r1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190317073"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190317073"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 531A4D4C2B
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BCBFD72B8
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B4C9D1A006C;
	Tue, 18 Feb 2025 15:41:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/32] libportal: upgrade 0.9.0 -> 0.9.1
Date: Tue, 18 Feb 2025 15:39:12 +0800
Message-Id: <1739864375-21394-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211572

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Meson 0.55.0 is required
- Fix memory management in the Input Capture portal code
- Correct the type used for GObject signal connections
- Remove wrong '(closure)' annotations, fixing GObject-Introspection warnings
- Don't require a C++ compiler for the build architecture
- Fix Meson warnings
- Consistently use '#pragma once'
- Initialize all g_autoptr variables

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libportal/{libportal_0.9.0.bb => libportal_0.9.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.9.0.bb => libportal_0.9.1.bb} (94%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.9.0.bb b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
similarity index 94%
rename from meta/recipes-gnome/libportal/libportal_0.9.0.bb
rename to meta/recipes-gnome/libportal/libportal_0.9.1.bb
index 96c25b1db8..970db65bc5 100644
--- a/meta/recipes-gnome/libportal/libportal_0.9.0.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.9.1.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https;branch=main"
-SRCREV = "731e7410fa5765e7c4eb76a51140a19637620c13"
+SRCREV = "8f5dc8d192f6e31dafe69e35219e3b707bde71ce"
 S = "${WORKDIR}/git"
 
 inherit meson gi-docgen gobject-introspection vala features_check pkgconfig
-- 
2.43.0


