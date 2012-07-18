Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5T-0004XN-J4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736823"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:43:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:44 -0700
Message-Id: <b049cf9ccae0f16c0dd789b4f21775adbc181deb.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/18] puzzles, mkelfimage: Add protocol=http
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:25 -0000

This would fail in some firewall situations otherwise

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |    2 +-
 meta/recipes-sato/puzzles/puzzles_r9561.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
index c670f23..eb6aa71 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 DEPENDS += "zlib"
 
-SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage \
+SRC_URI = "svn://coreboot.org/coreboot/trunk/util;module=mkelfImage;protocol=http \
            file://cross-compile.patch \
           "
 
diff --git a/meta/recipes-sato/puzzles/puzzles_r9561.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
index 5b64cda..7c18421 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9561.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV};protocol=http"
 S = "${WORKDIR}/${BPN}"
 
 #SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-- 
1.7.7.6



