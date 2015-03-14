Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A21A965CD0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2015 18:50:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2015 11:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,401,1422950400"; d="scan'208";a="680177394"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2015 11:50:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2015 10:45:05 +0000
Message-Id: <84b857f508e9c0bdcb887f4323c0aeb243cef14c.1426328088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1426328088.git.anibal.limon@linux.intel.com>
References: <cover.1426328088.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426328088.git.anibal.limon@linux.intel.com>
References: <cover.1426328088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] glibc/glibc-collateral.inc: Add LIC_FILES_CHKSUM to avoid warnings in manifest creation
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
X-List-Received-Date: Sat, 14 Mar 2015 18:50:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add licenses point to COMMON_LICENSE_DIR because glibc-collateral.inc is
a recipe that don't provide tarball/repo with LICENSE files.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/glibc/glibc-collateral.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index dfcebae..f82db06 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -1,5 +1,7 @@
 INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                     file://${COMMON_LICENSE_DIR}/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 HOMEPAGE = "http://www.gnu.org/software/libc/index.html"
 
 # This needs to match with glibc.inc, otherwise glibc-scripts and glibc-locale
-- 
1.8.4.5


