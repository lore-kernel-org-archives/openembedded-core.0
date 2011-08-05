Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO9-0000dS-KW
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:41 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926395"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:28:02 -0700
Message-Id: <de238eda0c3634557299a91b6718cde92b38f326.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/14] dpkg: Update to use perlnative
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:42 -0000

[YOCTO #1298]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc         |    4 +++-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index c8ff182..041eda9 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -2,6 +2,8 @@ DESCRIPTION = "Package maintenance system for Debian."
 LICENSE = "GPL"
 SECTION = "base"
 
+INC_PR = "r4"
+
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch;patch=1"
 
@@ -14,7 +16,7 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 PARALLEL_MAKE = ""
 
-inherit autotools gettext
+inherit autotools gettext perlnative
 
 DPKG_INIT_POSITION = "98"
 
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index 22edab8..48b6278 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://noman.patch;patch=1 \
 SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
 SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
 
-PR = "r3"
+PR = "${INC_PR}.0"
 
 EXTRA_OECONF = "--without-static-progs \
 		--without-dselect \
-- 
1.7.3.4



