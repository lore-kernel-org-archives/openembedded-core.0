Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE0F5773AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220210"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:31 +0200
Message-Id: <9e18173d0b841417f6d54380eb390a1055c0b727.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/19] ncurses: update to revision 20160213
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:28 -0000

Also, put the revision into PV, so that a meaningful upstream version
check can be performed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/ncurses/{ncurses-6.0 => files}/config.cache       | 0
 meta/recipes-core/ncurses/{ncurses-6.0 => files}/tic-hang.patch     | 0
 .../ncurses/{ncurses_6.0.bb => ncurses_6.0+20160213.bb}             | 6 ++----
 3 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-6.0 => files}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-6.0 => files}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_6.0.bb => ncurses_6.0+20160213.bb} (62%)

diff --git a/meta/recipes-core/ncurses/ncurses-6.0/config.cache b/meta/recipes-core/ncurses/files/config.cache
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-6.0/config.cache
rename to meta/recipes-core/ncurses/files/config.cache
diff --git a/meta/recipes-core/ncurses/ncurses-6.0/tic-hang.patch b/meta/recipes-core/ncurses/files/tic-hang.patch
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-6.0/tic-hang.patch
rename to meta/recipes-core/ncurses/files/tic-hang.patch
diff --git a/meta/recipes-core/ncurses/ncurses_6.0.bb b/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
similarity index 62%
rename from meta/recipes-core/ncurses/ncurses_6.0.bb
rename to meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
index e877d67..0d56481 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0+20160213.bb
@@ -1,12 +1,10 @@
 require ncurses.inc
 
-REVISION = "20151024"
-
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
-# commit id corresponds to the above listed REVISION
-SRCREV = "c6b034b4d69f8c9092c2a1b5d5bb718282b2a522"
+# commit id corresponds to the revision in package version
+SRCREV = "a25949ff653ac5ae7a204381a3ebfd800feeaa01"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.7.0


