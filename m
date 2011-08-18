Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i5-0006pi-ET
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980382"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:47 -0700
Message-Id: <56a3410d3bed83d5ba672d6ecf417603a525c291.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/32] mailx: update license and distro tracking fileds
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
X-List-Received-Date: Thu, 18 Aug 2011 21:01:13 -0000

From: Kang Kai <kai.kang@windriver.com>

update mailx license and bump up PR, and update distro tracking fields.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    9 +++++++--
 meta/recipes-extended/mailx/mailx_12.5.bb          |    4 ++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 984e330..4f89ad7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5699,8 +5699,13 @@ RECIPE_MAINTAINER_pn-docbook-utils = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_LATEST_VERSION_pn-task-qte-toolchain-target = "1.0"
 RECIPE_MANUAL_CHECK_DATE_pn-task-qte-toolchain-target = "Feb 28, 2011"
 DISTRO_PN_ALIAS_pn-task-qte-toolchain-target = "Intel"
-RECIPE_LATEST_VERSION_pn-mailx = "12.4"
-RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Feb 28, 2011"
+
+RECIPE_STATUS_pn-mailx = "green"
+RECIPE_LATEST_VERSION_pn-mailx = "12.5"
+RECIPE_LAST_UPDATE_pn-mailx = "Jul 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
+
 RECIPE_LATEST_VERSION_pn-libgcc = "4.5.1"
 RECIPE_MANUAL_CHECK_DATE_pn-libgcc = "Feb 28, 2011"
 
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 1173b0a..52b906f 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -6,8 +6,8 @@ for MIME, IMAP, POP3, SMTP, and S/MIME."
 
 HOMEPAGE = "http://heirloom.sourceforge.net/mailx.html"
 SECTION = "console/network"
-PR = "r0"
-LICENSE = "GPL"
+PR = "r1"
+LICENSE = "BSD & MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4202a0a62910cf94f7af8a3436a2a2dd"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/h/heirloom-mailx/heirloom-mailx_${PV}.orig.tar.gz;name=archive \
-- 
1.7.6



