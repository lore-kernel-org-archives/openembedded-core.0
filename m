Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1YxK-00034E-Q8
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 09:23:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Sep 2011 00:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="46180762"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by orsmga002.jf.intel.com with ESMTP; 08 Sep 2011 00:18:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2011 00:18:20 -0700
Message-Id: <fc7bc3e00722ddc9c5ae1b4c7866cf5cd313538c.1315466194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315466194.git.sgw@linux.intel.com>
References: <cover.1315466194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315466194.git.sgw@linux.intel.com>
References: <cover.1315466194.git.sgw@linux.intel.com>
Subject: [PULL v2 1/1] python-native: add link for python2
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
X-List-Received-Date: Thu, 08 Sep 2011 07:23:27 -0000

Add link for python2 as some configuration tools search from a python2
and could find the host python instead of the python-native.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-devtools/python/python-native_2.6.6.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
index 2b00d32..e0a4fb3 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
@@ -42,4 +42,7 @@ do_install() {
 	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
 	done
+
+	ln -sf python ${D}${bindir}/python2
+
 }
-- 
1.7.6



