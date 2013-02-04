Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISY-0004wh-BD
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243110"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:39 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:16 +0200
Message-Id: <fd33d155adead3b0c13cdadbf0d3578588949ed7.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 02/10] sgml-common: use ${PN} instead of sgml-common
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2013 09:35:33 -0000

Fix the following warning:
WARNING: QA Issue: lib32-sgml-common: Files/directories were installed but not shipped
  /etc
  /etc/sgml
  /etc/sgml/sgml.conf
  /usr/bin
  /usr/bin/install-catalog
  /usr/bin/sgmlwhich

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
index 27b1a48..4355379 100644
--- a/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
+++ b/meta/recipes-devtools/sgml-common/sgml-common_0.6.3.bb
@@ -13,7 +13,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE-GPLv2;md5=ab8a50abe86dfc859e148baae043c89b"
 SECTION = "base"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/sgml-common-${PV}.tgz \
            file://autohell.patch \
@@ -29,7 +29,7 @@ do_compile_append() {
 	sed -i -e 's|\([ "]\+\)/etc/sgml|\1${sysconfdir}/sgml|g' bin/install-catalog
 }
 
-FILES_sgml-common_append = " ${datadir}/sgml"
+FILES_${PN} += "${datadir}/sgml"
 
 pkg_postinst_${PN}() {
 	install-catalog \
-- 
1.7.11.7



