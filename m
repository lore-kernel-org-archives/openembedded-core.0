Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhQ-0006st-K2
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443338"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:21 -0700
Message-Id: <8f30d41ede28a86564c402ce5b467e51aec6b15d.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/30] puzzles: convert to use SVN
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:05 -0000

Recently the tarball has been changing due the fact it gets rebuilt
nightly and timestamps are getting updated and changed internal to
the tarball.  Moving back to SVN to try and address this.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/puzzles/puzzles_r9561.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9561.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
index 83fabdf..5b64cda 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9561.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
@@ -9,13 +9,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-#SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
-SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-SRC_URI[md5sum] = "c86695aebfc95efe1d6241863849101b"
-SRC_URI[sha256sum] = "2c20a45189387e3de8804a58bdb4e47ac4bb0f890001a509dfbdc015b5a84b95"
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
+S = "${WORKDIR}/${BPN}"
 
-
-S = "${WORKDIR}/${BPN}-${PV}"
+#SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
+#SRC_URI[md5sum] = "9d84769562007e0f99edac77a3b2d27c"
+#SRC_URI[sha256sum] = "b688b5196f8406a23741e973178bdde78e5f8af4d2a88c33ca1ae1cc1a069d15"
+#S = "${WORKDIR}/${BPN}-${PV}"
 
 do_configure () {
 	./mkfiles.pl
-- 
1.7.7.6



