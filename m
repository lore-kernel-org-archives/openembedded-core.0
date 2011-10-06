Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgf-0008V7-RS
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495942"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:54 -0700
Message-Id: <47bfdab445bf8f942286298989395a7389c8163e.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 15/21] boost-jam-native: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/boost/boost-jam-native.inc    |    2 +-
 .../boost/boost-jam-native_3.1.18.bb               |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/boost/boost-jam-native.inc b/meta/recipes-support/boost/boost-jam-native.inc
index e6b2529..c5a9d99 100644
--- a/meta/recipes-support/boost/boost-jam-native.inc
+++ b/meta/recipes-support/boost/boost-jam-native.inc
@@ -7,7 +7,7 @@ DESCRIPTION = "Make system for boost (native)"
 HOMEPAGE = "http://www.boost.org/"
 SECTION = "devel"
 LICENSE = "Boost"
-PR = "r0"
+INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
diff --git a/meta/recipes-support/boost/boost-jam-native_3.1.18.bb b/meta/recipes-support/boost/boost-jam-native_3.1.18.bb
index 2e92146..7a0b1a8 100644
--- a/meta/recipes-support/boost/boost-jam-native_3.1.18.bb
+++ b/meta/recipes-support/boost/boost-jam-native_3.1.18.bb
@@ -1,4 +1,8 @@
 include boost-jam-native.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/boost-jam-${PV}.tgz"
 
+SRC_URI[md5sum] = "f790e022d658db38db5cc4aeeccad3f1"
+SRC_URI[sha256sum] = "85dbb72c29837ba89cb5408782c82459b34fdecaedea8b54ce1cb3cb9990121a"
-- 
1.7.6.2



