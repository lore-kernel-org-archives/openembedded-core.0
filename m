Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB75EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 11:16:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5149.1689679012852487783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 04:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124410758"
X-IronPort-AV: E=Sophos;i="6.01,214,1684767600"; 
   d="scan'208";a="124410758"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 20:16:50 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C8DDD29E8
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 20:16:48 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 206C1D53F5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 20:16:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44F09881D7;
	Tue, 18 Jul 2023 20:16:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libva: upgrade to 2.19.0
Date: Tue, 18 Jul 2023 19:16:37 +0800
Message-Id: <1689678997-832-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27758.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27758.005
X-TMASE-Result: 10--12.842300-10.000000
X-TMASE-MatchedRID: sujxEcxUy51rri3hfrKUxirLqyE6Ur/jF4r8H5YrEqyOEENgsUAuYgTg
	sjIJUJZIOuCrsY1oUqjFwrFCk+En9sYWFkGp5y6AeDbLSPm9dkYL//VMxXlyE84tlnb0ey8wcQn
	7AixVvVxngukTeEViUXUu7PS8tlw4PubnqD2XLwjy3h9RQZ4StBCE2NlBjIjcF0dwcR3eNq98LE
	+Yxd1gviL637QCIVpiDmIE4Tvg5l/pZnwb/PFSE2gws6g0ewz24SkIdSwphgYkt9BigJAcVjQXT
	kSM3COGS0Y8NDjN7tYua2HxxNDjveVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu/558CedkGIvqcoA
	hihTwvj2kXy+x4wPKTbREH2EfM8ZZoopGA6t8r98qwIyBkvr0YLUq2AqkdZ8
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 11:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184499

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
 .../{libva-initial_2.18.0.bb => libva-initial_2.19.0.bb}      | 0
 .../libva/{libva-utils_2.18.2.bb => libva-utils_2.19.0.bb}    | 4 ++--
 meta/recipes-graphics/libva/libva.inc                         | 2 +-
 .../libva/{libva_2.18.0.bb => libva_2.19.0.bb}                | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.18.0.bb => libva-initial_2.19.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.18.2.bb => libva-utils_2.19.0.bb} (90%)
 rename meta/recipes-graphics/libva/{libva_2.18.0.bb => libva_2.19.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.18.0.bb b/meta/recipes-graphics/libva/libva-initial_2.19.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.18.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.19.0.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.18.2.bb b/meta/recipes-graphics/libva/libva-utils_2.19.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.18.2.bb
rename to meta/recipes-graphics/libva/libva-utils_2.19.0.bb
index c7bf36023d..acb25a3f0d 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.18.2.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.19.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.18-branch;protocol=https"
-SRCREV = "76993ae8d0fbd17e5bfff80ed495c71e727f0d06"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.19-branch;protocol=https"
+SRCREV = "5bf107ec4f7b18a6457d23abf57560dfb382a751"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
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


