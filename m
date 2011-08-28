Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QxmDZ-0000vY-V9
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Aug 2011 22:44:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Aug 2011 13:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,294,1312182000"; d="scan'208";a="11892813"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.134])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Aug 2011 13:39:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Aug 2011 21:39:32 +0100
Message-Id: <38213ee7d596d7f68544e0513a13d08b7439aece.1314563914.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314563914.git.paul.eggleton@linux.intel.com>
References: <cover.1314563914.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314563914.git.paul.eggleton@linux.intel.com>
References: <cover.1314563914.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] binutils: update to 2.21.1a
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
X-List-Received-Date: Sun, 28 Aug 2011 20:44:34 -0000

2.21.1 has disappeared upstream. There is no ChangeLog information for
2.21.1a, however diff reports only the addition of some cpu/opc files in
cgen/ subdirectory; the source code is otherwise identical.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ....21.1.bb => binutils-cross-canadian_2.21.1a.bb} |    0
 ...s-cross_2.21.1.bb => binutils-cross_2.21.1a.bb} |    0
 ...ssdk_2.21.1.bb => binutils-crosssdk_2.21.1a.bb} |    0
 .../{binutils_2.21.1.bb => binutils_2.21.1a.bb}    |    9 ++++++---
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1.bb => binutils-cross-canadian_2.21.1a.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1.bb => binutils-cross_2.21.1a.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1.bb => binutils-crosssdk_2.21.1a.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.21.1.bb => binutils_2.21.1a.bb} (85%)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-cross_2.21.1a.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.21.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.21.1a.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1a.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1a.bb
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1.bb b/meta/recipes-devtools/binutils/binutils_2.21.1a.bb
similarity index 85%
rename from meta/recipes-devtools/binutils/binutils_2.21.1.bb
rename to meta/recipes-devtools/binutils/binutils_2.21.1a.bb
index 96f9d5f..2d4ed27 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.1a.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r4"
+PR = "r0"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -33,7 +33,10 @@ SRC_URI = "\
      file://binutils-powerpc-e5500.patch \
      "
 
-SRC_URI[md5sum] = "a22801a9cad45c85e9ff6afc10537d72"
-SRC_URI[sha256sum] = "f769b64350a02fbee009e1582cc12b6ed43b41985de65effb741e258e075dd05"
+SRC_URI[md5sum] = "bde820eac53fa3a8d8696667418557ad"
+SRC_URI[sha256sum] = "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"
+
+# 2.21.1a has a mismatched dir name within the tarball
+S = "${WORKDIR}/binutils-2.21.1"
 
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



