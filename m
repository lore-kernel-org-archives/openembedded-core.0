Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtH-0001A9-AM
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269367"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:27 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:19 +0300
Message-Id: <586c53aa2a404686525860d3d15477b57e24596d.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 4/9] lsof: upgrade to 4.86
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:48 -0000

License checksum change due to the modification of the pre-compiled
binaries section (no change in the license part).

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../lsof/{lsof_4.85.bb => lsof_4.86.bb}            |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.85.bb => lsof_4.86.bb} (88%)

diff --git a/meta/recipes-extended/lsof/lsof_4.85.bb b/meta/recipes-extended/lsof/lsof_4.86.bb
similarity index 88%
rename from meta/recipes-extended/lsof/lsof_4.85.bb
rename to meta/recipes-extended/lsof/lsof_4.86.bb
index de7ff68..e3f5ef3 100644
--- a/meta/recipes-extended/lsof/lsof_4.85.bb
+++ b/meta/recipes-extended/lsof/lsof_4.86.bb
@@ -3,17 +3,17 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "102ee2081172bbe76dccaa6cceda8573"
-SRC_URI[sha256sum] = "49aa58e63539c45bada514a6a2e5a1c9f946ada1f4137dc9154cf4bf6054a1c1"
+SRC_URI[md5sum] = "9f1cda41f35add068c7b81f873fa56b5"
+SRC_URI[sha256sum] = "13e52b8e87dddf1b2e219004e315d755c659217ce6ffc6a5f1102969f1c4dd0c"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
 
-LIC_FILES_CHKSUM = "file://${S}/00README;beginline=645;endline=679;md5=e0108f7811919035515a97f872eb8ee2"
+LIC_FILES_CHKSUM = "file://${S}/00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
 python do_unpack () {
     bb.build.exec_func('base_do_unpack', d)
-- 
1.7.9.5



