Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7107B76599
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:42:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Aug 2015 03:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="748520713"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2015 03:42:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:43:18 +0300
Message-Id: <68824010b2b6cb4de59bfa0ea84592a97d4ddff7.1439548737.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/5] tremor: update to 20150107 (svn r19427)
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
X-List-Received-Date: Fri, 14 Aug 2015 10:42:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../tremor/{tremor-20120314 => tremor}/obsolete_automake_macros.patch   | 0
 .../tremor/{tremor-20120314 => tremor}/tremor-arm-thumb2.patch          | 0
 .../tremor/{tremor_20120314.bb => tremor_20150107.bb}                   | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/tremor-arm-thumb2.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor_20120314.bb => tremor_20150107.bb} (90%)

diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/obsolete_automake_macros.patch b/meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-multimedia/tremor/tremor-20120314/obsolete_automake_macros.patch
rename to meta/recipes-multimedia/tremor/tremor/obsolete_automake_macros.patch
diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch b/meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
similarity index 100%
rename from meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch
rename to meta/recipes-multimedia/tremor/tremor/tremor-arm-thumb2.patch
diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_20150107.bb
similarity index 90%
rename from meta/recipes-multimedia/tremor/tremor_20120314.bb
rename to meta/recipes-multimedia/tremor/tremor_20150107.bb
index afc78ac..6b1776f 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20150107.bb
@@ -8,7 +8,7 @@ DEPENDS = "libogg"
 SRCDATE = "${PV}"
 PR = "r1"
 
-SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http \
+SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=19427;protocol=http \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.1.4


