Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i6-0006xs-2B
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980387"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:48 -0700
Message-Id: <6d8689b78711863b60a8c874e40e22e57f5ad11f.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/32] slang: add homepage and update distro tracking fields
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

Add slang homepage and bump up PR.
Update distro tracking fields.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    5 +++--
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 4f89ad7..f2b0701 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5731,8 +5731,9 @@ RECIPE_MAINTAINER_pn-linuxdoc-tools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-slang = "green"
 RECIPE_LATEST_VERSION_pn-slang = "2.2.4"
-RECIPE_LAST_UPDATE_pn-slang = "Apr 10, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 6, 2011"
+RECIPE_LAST_UPDATE_pn-slang = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 28, 2011"
+RECIPE_MAINTAINER_pn-slang = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-libnewt = "green"
 RECIPE_LATEST_VERSION_pn-libnewt = "0.52.12"
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 4bf5737..77e63da 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -7,9 +7,10 @@ The S-Lang library, provided in this package, provides the S-Lang \
 extension language.  S-Lang's syntax resembles C, which makes it easy \
 to recode S-Lang procedures in C if you need to."
 
+HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
 DEPENDS = "pcre"
-PR = "r5"
+PR = "r6"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
-- 
1.7.6



