Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerm-000421-Jz
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203800"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:35 -0700
Message-Id: <a685157f1ea3c573cc03f164ae5cde2dec48728c.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/32] glew: update to 1.6.0
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:19 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/glew/files/autotools.patch   |    3 +++
 .../glew/{glew_1.5.7.bb => glew_1.6.0.bb}          |    4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glew/{glew_1.5.7.bb => glew_1.6.0.bb} (80%)

diff --git a/meta/recipes-graphics/glew/files/autotools.patch b/meta/recipes-graphics/glew/files/autotools.patch
index 7fe1d6e..e499594 100644
--- a/meta/recipes-graphics/glew/files/autotools.patch
+++ b/meta/recipes-graphics/glew/files/autotools.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: glew/Makefile.am
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-graphics/glew/glew_1.5.7.bb b/meta/recipes-graphics/glew/glew_1.6.0.bb
similarity index 80%
rename from meta/recipes-graphics/glew/glew_1.5.7.bb
rename to meta/recipes-graphics/glew/glew_1.6.0.bb
index e2e6b43..8824667 100644
--- a/meta/recipes-graphics/glew/glew_1.5.7.bb
+++ b/meta/recipes-graphics/glew/glew_1.6.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://autotools.patch \
           "
 
-SRC_URI[md5sum] = "f913ce9dbde4cd250b932731b3534ded"
-SRC_URI[sha256sum] = "86bd36a163640d6027ec6be5fdd8a6e3b90f02dcf55f95c3c2429ebb58be3107"
+SRC_URI[md5sum] = "7dfbb444b5a4e125bc5dba0aef403082"
+SRC_URI[sha256sum] = "bea2a7e9bb97a7a5054d4a65d16aaeedeaa091719359ad3fcd9bfdb0fe8eb7fa"
 
 inherit autotools lib_package
-- 
1.7.3.4



