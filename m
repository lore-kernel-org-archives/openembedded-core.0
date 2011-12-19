Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVU-0003em-HP
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:52:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940406"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:44:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:44:05 +0000
Message-Id: <1cc5be0200d1031c8834243c29ff03c6a95d69e8.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/8] mtools: fix SRC_URI for GPLv2 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 15:52:04 -0000

* folks.o-hand.com no longer exists, use the yoctoproject.org mirror
  instead (folks.o-hand.com was only being used because the upstream
  site removed this version in any case.)
* Update HOMEPAGE
* Fix spacing

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/mtools/mtools_3.9.9.bb |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index f0428c1..02921f7 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -2,18 +2,21 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-DESCRIPTION="Mtools is a collection of utilities for accessing MS-DOS disks from Unix without mounting them."
-HOMEPAGE="http://mtools.linux.lu"
-LICENSE="GPLv2+"
+DESCRIPTION = "Mtools is a collection of utilities for accessing MS-DOS disks from Unix without mounting them."
+HOMEPAGE = "http://www.gnu.org/software/mtools/"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92b58ec77696788ce278b044d2a8e9d3"
 PR = "r4"
 
 #http://mtools.linux.lu/mtools-${PV}.tar.gz 
-SRC_URI="http://folks.o-hand.com/richard/poky/sources/mtools-${PV}.tar.gz \
+SRC_URI = "http://autobuilder.yoctoproject.org/sources/mtools-${PV}.tar.gz \
 	file://mtools-makeinfo.patch \
 	file://mtools.patch \
 	file://no-x11.patch"
 
+SRC_URI[md5sum] = "3e68b857b4e1f3a6521d1dfefbd30a36"
+SRC_URI[sha256sum] = "af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb834690e"
+
 S = "${WORKDIR}/mtools-${PV}"
 
 inherit autotools
-- 
1.7.5.4



