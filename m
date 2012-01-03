Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrT-0004O6-TX
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752320"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:31 -0800
Message-Id: <db6a4adb1f435f40b22eb53918be8613e817df65.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 105/113] puzzles: fixed SRC_URI Checksums
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/puzzles/puzzles_r9375.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9375.bb b/meta/recipes-sato/puzzles/puzzles_r9375.bb
index aec6399..1867dad 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9375.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9375.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=9928b60f3b78be315b7ab699c1b03ff5"
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
 SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-SRC_URI[md5sum] = "35e85cefb59d39cd22bf232673857727"
-SRC_URI[sha256sum] = "ae94dc8a654582c0cab61ce4699e25027ed720c06b411e5202144a5114fd338b"
+SRC_URI[md5sum] = "25f2349611cdd8fb35d27b24f5b937a8"
+SRC_URI[sha256sum] = "bddf4e52c328c98b9d95bd7daf6b9098f25e8272a7c1059ba69809eb619124a2"
 
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.6.4



