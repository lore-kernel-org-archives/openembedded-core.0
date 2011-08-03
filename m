Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QojjY-0004U0-18
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912924"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:10:50 -0700
Message-Id: <3e920218de21d9005ea18c2919891872a0a16571.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 06/33] bison: Add dependency on flex-native
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:12 -0000

From: Noor, Ahsan <noor_ahsan@mentor.com>

* This is 0479b70418ef553859029911c57c63a7aaebe299 from OE. flex-native is needed to build bison. The dependency was being satisfied indirectly but we need to add it explicitly.

Signed-off-by: Noor, Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-devtools/bison/bison_2.3.bb |    4 ++--
 meta/recipes-devtools/bison/bison_2.5.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index 22f884b..388476b 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -7,9 +7,9 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 SECTION = "devel"
-DEPENDS = "bison-native"
+DEPENDS = "bison-native flex-native"
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
          file://bison-2.3_m4.patch"
diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
index 63f4e76..eb5d87c 100644
--- a/meta/recipes-devtools/bison/bison_2.5.bb
+++ b/meta/recipes-devtools/bison/bison_2.5.bb
@@ -7,9 +7,9 @@ HOMEPAGE = "http://www.gnu.org/software/bison/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
-DEPENDS = "bison-native"
+DEPENDS = "bison-native flex-native"
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
 	   file://m4.patch \
-- 
1.7.3.4



