Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6A37646B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407511"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:37 +0300
Message-Id: <95aac2b2774586e9acecb9cda5db26a3d98b6272.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/26] libmad: use ftp instead of sourceforge for consistency with libid3tag
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:28 -0000

Both ftp and SF are official code sources, but ftp is less finicky
for upstream version checks.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 30937eb..9e08b16 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 DEPENDS = "libid3tag"
 PR = "r3"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libmad-${PV}.tar.gz \
+SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
            file://no-force-mem.patch \
            file://add-pkgconfig.patch \
            file://fix_for_mips_with_gcc-4.5.0.patch \
-- 
2.1.4


