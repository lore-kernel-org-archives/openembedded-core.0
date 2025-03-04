Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43155C282DC
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.18199.1741079368646739157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mDjtu3rH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079369; x=1772615369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O0J7X0CQWD1sQcdZfoB/ZUH8TpcskaeaNRyKU5SDbNw=;
  b=mDjtu3rHCH2LWTFPbYb62oH8UWalX/IBHex7uFjebWfbsmS6RZ41fJq2
   PK3osrlgz0GVChLSXGKeHP5rrjagjDgDS5dzu2Cn2P1ECFG95WvnYjFhd
   ouAhgmQGxakM+Ul9Kpoe8yrEMiylLwIufxILfw5lxiNI7yaB+Me2Y3/DE
   lfOyLP2ThF21zA3VNfFJN9kP1QXhxeeTM+D19a+lwz5bFG8T6f6lNtsJ8
   rHJxlwYsLFftDwphMX2fmPQRvEEyIM3A7E39vi/L5oBYClUxV2ASpYtNi
   I/fI4Q1hAcqM6fuXw4mL4oxC0oZXKiWJXpFSZbmNpXNgvDTW5/Rpqwr/G
   g==;
X-CSE-ConnectionGUID: Tk7QZ53CTeipfDmBZercZw==
X-CSE-MsgGUID: Ap0btG5OSaKNjs4eVz6b3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="180271620"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="180271620"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:26 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF1AFD4F67
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D4AFD5042
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:24 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EEDED1A009A;
	Tue,  4 Mar 2025 17:09:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/31] gi-docgen: upgrade 2024.1 -> 2025.3
Date: Tue,  4 Mar 2025 17:08:49 +0800
Message-Id: <1741079356-13445-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212231

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Added
------
Add layout for tablet portrait mode
Support static virtual methods

Changed
-------
Don't generate classes hierarchy if not needed
Improve copy buttons on narrow layouts

Fixed
-------
Only consider dot data processing fail if dot returns non-zero
Show non-standard instance parameters
Fix C declaration of structure fields

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gi-docgen/{gi-docgen_2024.1.bb => gi-docgen_2025.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2024.1.bb => gi-docgen_2025.3.bb} (94%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
similarity index 94%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
index 12c2b8ed21..5dea1cdaee 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "eff4ec3d21df38c9d857bcf58aa98437c6610489"
+SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


