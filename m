Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgc-0008V7-6k
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495899"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:43 -0700
Message-Id: <e617a8b7a7912fc3aeeaf79e747f23f2099d145f.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 04/21] guilt-native: Add SRC_URI Checksums
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/guilt/guilt-native_0.33.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_0.33.bb b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
index 7d0246e..54b1b90 100644
--- a/meta/recipes-devtools/guilt/guilt-native_0.33.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_0.33.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
 
-PR = r0
 PV = "0.33"
+PR = r1
 
 inherit native
 
@@ -22,6 +22,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/people/jsipek/guilt/guilt-${PV}.tar.
 	   file://guilt-bash.patch \
 	   file://optional_head_check.patch"
 
+SRC_URI[md5sum] = "d800c5e0743d90543ef51d797a626e09"
+SRC_URI[sha256sum] = "64dfe6af1e924030f71163f3aa12cd846c80901d6ff8ef267ea35bb0752b4ba9"
+
 # we don't compile, we just install
 do_compile() {
 	:
-- 
1.7.6.2



