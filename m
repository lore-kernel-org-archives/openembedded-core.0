Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TsrkT-0002ES-7a
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:15:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jan 2013 00:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,436,1355126400"; d="scan'208";a="189196779"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jan 2013 00:59:46 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 11:00:22 +0200
Message-Id: <98050646a9c484e73d1500c087f37f8adac0a1ef.1357721541.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1357721541.git.constantinx.musca@intel.com>
References: <cover.1357721541.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1357721541.git.constantinx.musca@intel.com>
References: <cover.1357721541.git.constantinx.musca@intel.com>
Subject: [PATCH 1/3] gcc: add missing dependency (zlib)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 09:15:11 -0000

- add zlib to DEPENDS (it fails otherwise)

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 378caf0..08a0103 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r13"
+PR = "r14"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -20,7 +20,7 @@ BINV = "4.7.2"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
 
-DEPENDS =+ "mpfr gmp libmpc"
+DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
 LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
-- 
1.7.11.7



