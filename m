Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C29C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 03:49:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.5872.1741146563753136675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 19:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T1sG00ai;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741146563; x=1772682563;
  h=from:to:cc:subject:date:message-id;
  bh=dCK1BgH1+xNVDKGsWJRMa6nkqErQ1/n2xJSsYsc7mJA=;
  b=T1sG00aiDJiVqFgvNe+MxyKucWmCT7dpquLK7aIf48Va6UQ++q40pdem
   HecMhDsT+V+byrqDCcdhZOBZTaGy2MoKxFrz9S1tHQ7n0/rcKGwLSI6UA
   XgnZmL8IHMUvW2Orp/Lk7Bgpw4YDoL0fDpfgs+ByLMqOwL9R50GIUCf6C
   gZLkHULQDt5UhXgJdkZhNop1roioohrvbhTV0UJ+vSI2aQXtUpf7GF+T4
   pn4oiayOgpRwRE2DLZVBB4es5ze0E5HKh056DEpnxy0r1u4nOeTDQH8mf
   3jHRR07edw2g4rs5Tarpsf/ubUE8cSKSUjDxGCAYMiWBoGrAR6/sd7/TU
   A==;
X-CSE-ConnectionGUID: 2J40IBGDSAWXaNlIazPUsg==
X-CSE-MsgGUID: CleTLgCMT8C0GnMagXzpXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="179974446"
X-IronPort-AV: E=Sophos;i="6.14,221,1736780400"; 
   d="scan'208";a="179974446"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:49:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AAD6D6EA1
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 12:49:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B6F4DCFF81
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 12:49:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3E3951A0078;
	Wed,  5 Mar 2025 11:49:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] gi-docgen: upgrade 2024.1 -> 2025.3
Date: Wed,  5 Mar 2025 11:49:12 +0800
Message-Id: <1741146552-20060-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 03:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212291

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
 .../gi-docgen/{gi-docgen_2024.1.bb => gi-docgen_2025.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gi-docgen/{gi-docgen_2024.1.bb => gi-docgen_2025.3.bb} (90%)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
similarity index 90%
rename from meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
rename to meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
index 12c2b8ed21..a16574955f 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_2025.3.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-SRCREV = "eff4ec3d21df38c9d857bcf58aa98437c6610489"
+SRCREV = "9ab2ab8fa3f4a04f5d2cc24b0c8e91e73bc57b51"
 
 S = "${WORKDIR}/git"
 
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-asyncio python3-core python3-jinja2 python3-json python3-markdown python3-markupsafe python3-pygments python3-typogrify python3-xml"
 
-- 
2.43.0


