Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05916768AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684086"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:24 +0300
Message-Id: <fc2a824dd0fa2442f893327f70c9582be5d59caf.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/8] bootchart2: update to 0.14.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Aug 2015 14:22:26 -0000

Drop bootchartd-no-bashism.patch as it's been merged upstream

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../bootchart2/bootchartd-no-bashism.patch         | 27 ----------------------
 .../{bootchart2_git.bb => bootchart2_0.14.7.bb}    |  7 +-----
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
 rename meta/recipes-devtools/bootchart2/{bootchart2_git.bb => bootchart2_0.14.7.bb} (97%)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch b/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
deleted file mode 100644
index b013995..0000000
--- a/meta/recipes-devtools/bootchart2/bootchart2/bootchartd-no-bashism.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ffb5bae5d588aaea6325623462a8070a04767196 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 14 Aug 2014 08:33:28 -0700
-Subject: [PATCH] bootchartd.in: no bashism
-
-No bashism in bootchartd.in, so use /bin/sh.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- bootchartd.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bootchartd.in b/bootchartd.in
-index a408bab..064f6a4 100755
---- a/bootchartd.in
-+++ b/bootchartd.in
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # Bootchart logger script
- # Ziga Mahkovec  <ziga.mahkovec@klika.si>
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
similarity index 97%
rename from meta/recipes-devtools/bootchart2/bootchart2_git.bb
rename to meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
index ea9f179..4b0a980 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
@@ -88,17 +88,12 @@ HOMEPAGE = "https://github.com/mmeeks/bootchart"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44ac4678311254db62edf8fd39cb8124"
 
-# one commit beyond 1.14.6 for a systemd-related bugfix
-PV = "0.14.6+git${SRCPV}"
-
 SRC_URI = "git://github.com/mmeeks/bootchart.git \
            file://bootchartd_stop.sh \
-           file://bootchartd-no-bashism.patch \
           "
 
-SRCREV = "b65ed43b0ae832080fb728245de9ef1a4b48d8b5"
-
 S = "${WORKDIR}/git"
+SRCREV = "6f050b65ae9f266645f04f0aecab9efb88375f1c"
 
 inherit systemd
 inherit update-rc.d
-- 
2.1.4


