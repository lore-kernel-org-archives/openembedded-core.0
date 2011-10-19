Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGKAT-0005yv-Aw
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 02:38:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Oct 2011 17:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64550986"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2011 17:31:02 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 17:30:57 -0700
Message-Id: <5340834e4b7b013e678b4d34bae53a82bfdd18c1.1318984111.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <66cdd5054e220fcce980222ed68a2afc37f614af.1318984111.git.nitin.a.kamble@intel.com>
References: <66cdd5054e220fcce980222ed68a2afc37f614af.1318984111.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1318984111.git.nitin.a.kamble@intel.com>
References: <cover.1318984111.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/6] python-scons: upgrade from 2.0.1 to 2.1.0
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
X-List-Received-Date: Wed, 19 Oct 2011 00:38:01 -0000

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
1.7.4.4



