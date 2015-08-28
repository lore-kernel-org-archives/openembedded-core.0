Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21C8B76DEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:17:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Aug 2015 05:17:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550250986"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 05:17:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 15:18:52 +0300
Message-Id: <a02caece4d5c019d7bd0ad282e7998a1edeaa490.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/8] dropbear: update to 2015.68
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
X-List-Received-Date: Fri, 28 Aug 2015 12:17:47 -0000

LICENSE checksum has changed because the copyright year was changed
from 2014 to 2015 in it:
https://github.com/mkj/dropbear/commit/19e1afbd1ca6d306166ce74bcd6c6889f8d196f3

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear.inc        | 2 +-
 meta/recipes-core/dropbear/dropbear_2015.67.bb | 4 ----
 meta/recipes-core/dropbear/dropbear_2015.68.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.67.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index e187d04..a2c736e 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -5,7 +5,7 @@ SECTION = "console/network"
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
 LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e3a1b9604afd1648b28b0c6f1709e9f4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a5ec40cafba26fc4396d0b550f824e01"
 
 DEPENDS = "zlib"
 RPROVIDES_${PN} = "ssh sshd" 
diff --git a/meta/recipes-core/dropbear/dropbear_2015.67.bb b/meta/recipes-core/dropbear/dropbear_2015.67.bb
deleted file mode 100644
index 5f7fe7b..0000000
--- a/meta/recipes-core/dropbear/dropbear_2015.67.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "e967e320344cd4bfebe321e3ab8514d6"
-SRC_URI[sha256sum] = "7e690594645dfde5787065c78a5d2e4d15e288babfa06e140197ce05f698c8e5"
diff --git a/meta/recipes-core/dropbear/dropbear_2015.68.bb b/meta/recipes-core/dropbear/dropbear_2015.68.bb
new file mode 100644
index 0000000..1b749d7
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2015.68.bb
@@ -0,0 +1,4 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "7664ac10f7cc2301c530eb80c756fc5d"
+SRC_URI[sha256sum] = "55ea7c1e904ffe4b1cdbe1addca8291a2533d7d285fd22ac33608e9502a62446"
-- 
2.1.4


