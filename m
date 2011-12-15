Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rb0ZO-00035L-LG
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 02:57:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Dec 2011 17:50:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="87466946"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2011 17:50:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:50:10 -0800
Message-Id: <57daaca49c45e3e24219562126afad621b610981.1323911699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323911699.git.sgw@linux.intel.com>
References: <cover.1323911699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323911699.git.sgw@linux.intel.com>
References: <cover.1323911699.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] libtool-cross: Add libtool & libtoolize to SSTATE_SCAN_FILES
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
X-List-Received-Date: Thu, 15 Dec 2011 01:57:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libtool/libtool-cross_2.4.2.bb                 |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
index 5003c9b..97794a6 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PACKAGES = ""
 SRC_URI += "file://prefix.patch"
 SRC_URI += "file://fixinstall.patch"
@@ -34,3 +34,5 @@ libtoolcross_sysroot_preprocess () {
 	sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 	sysroot_stage_dir ${D}${target_datadir} ${SYSROOT_DESTDIR}${target_datadir}
 }
+
+SSTATE_SCAN_FILES += "libtoolize *-libtool"
-- 
1.7.6.4



