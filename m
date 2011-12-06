Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXkiB-00059i-G4
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:24:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 18:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,302,1320652800"; d="scan'208";a="82548334"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2011 18:18:03 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:17:59 -0800
Message-Id: <f8e0db06ca60668ca808794d6a328153f7bab0d3.1323137480.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
Subject: [PATCH 2/4] puzzles: set SRC_URI checksums
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
X-List-Received-Date: Tue, 06 Dec 2011 02:24:51 -0000

In order to set missing checksums as an error we need to ensure
all appropriate recipes have a checksum value set.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-sato/puzzles/puzzles_r9306.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9306.bb b/meta/recipes-sato/puzzles/puzzles_r9306.bb
index d9b8e3e..14b0461 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9306.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9306.bb
@@ -8,12 +8,12 @@ MOD_PV = "${@d.getVar('PV',1)[1:]}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=9928b60f3b78be315b7ab699c1b03ff5"
 
-SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-#SRC_URI[md5sum] = "e8b4c7e2341264789f3cd6733857bf1c"
-#SRC_URI[sha256sum] = "69f37e497e63b2f7ab44e7bbd50aee078269c16dbc2d78ec1b00257678f2cbd2"
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
+SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
+SRC_URI[md5sum] = "fd1b05c0e0cfb752c6136ce2e4562416"
+SRC_URI[sha256sum] = "512aa26a0d11867a815030449bb903861f75512725886a70eece387bd8240ddd"
+
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.7.7.3



