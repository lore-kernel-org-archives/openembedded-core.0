Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGRbO-0000or-ES
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 10:34:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 01:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64658116"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 01:28:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 01:28:14 -0700
Message-Id: <38734c7e4f8e5107de61bc550ca93de5cc4cc826.1319012721.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319012721.git.sgw@linux.intel.com>
References: <cover.1319012721.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/16] python-scons: upgrade from 2.0.1 to 2.1.0
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
X-List-Received-Date: Wed, 19 Oct 2011 08:34:18 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

the LICENSE.txt has added 2011 year to the copyright line he nce the MD5 sum is different.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...ative_2.0.1.bb => python-scons-native_2.1.0.bb} |    3 +--
 ...python-scons_2.0.1.bb => python-scons_2.1.0.bb} |    6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb => python-scons-native_2.1.0.bb} (89%)
 rename meta/recipes-devtools/python/{python-scons_2.0.1.bb => python-scons_2.1.0.bb} (51%)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.0.1.bb b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python-scons-native_2.0.1.bb
rename to meta/recipes-devtools/python/python-scons-native_2.1.0.bb
index f7646a2..083ad15 100644
--- a/meta/recipes-devtools/python/python-scons-native_2.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
@@ -2,5 +2,4 @@ require python-scons_${PV}.bb
 inherit native
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
-PR = "r1"
-
+PR = "r0"
diff --git a/meta/recipes-devtools/python/python-scons_2.0.1.bb b/meta/recipes-devtools/python/python-scons_2.1.0.bb
similarity index 51%
rename from meta/recipes-devtools/python/python-scons_2.0.1.bb
rename to meta/recipes-devtools/python/python-scons_2.1.0.bb
index 1c7939e..22df333 100644
--- a/meta/recipes-devtools/python/python-scons_2.0.1.bb
+++ b/meta/recipes-devtools/python/python-scons_2.1.0.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "A Software Construction Tool"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8481211ebbeaed9cdc7ad5a3b0c98aaf"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ab8b65435c2e520ed18e67459f1f9bb9"
 SRCNAME = "scons"
 
 PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "beca648b894cdbf85383fffc79516d18"
-SRC_URI[sha256sum] = "0a8151da41c4a26c776c84f44f747ce03e093d43be3e83b38c14a76ab3256762"
+SRC_URI[md5sum] = "47daf989e303a045b76c11236df719df"
+SRC_URI[sha256sum] = "4139ed14f60dd2ebcd47c59984d14705636180eb27b3d1b2949489e514b1921d"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
-- 
1.7.6.2



