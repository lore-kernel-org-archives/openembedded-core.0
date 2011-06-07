Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLh-0003im-IS
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299014"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:41 -0700
Message-Id: <26436ccbe2608c09ae9dfa2fd802b8bad6b27246.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 05/13] distro-tracking: update openssh, tar, and grep
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:14 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cd1ee9d..0d47f52 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1981,32 +1981,32 @@ RECIPE_MAINTAINER_pn-cronie = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-grep = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-grep = "not done"
-RECIPE_LATEST_VERSION_pn-grep = "2.7"
+RECIPE_LATEST_VERSION_pn-grep = "2.8"
 RECIPE_INTEL_SECTION_pn-grep = "base"
 RECIPE_NO_OF_PATCHES_pn-grep = "0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-grep = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-grep = "09/2010"
-RECIPE_LAST_UPDATE_pn-grep = "Sep 24, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-grep = "8 months"
+RECIPE_LATEST_RELEASE_DATE_pn-grep = "05/2011"
+RECIPE_LAST_UPDATE_pn-grep = "Jun 5, 2011"
 RECIPE_MAINTAINER_pn-grep = "Scott Garman <scott.a.garman@intel.com>"
 
-RECIPE_STATUS_pn-openssh = "red" 
+RECIPE_STATUS_pn-openssh = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-openssh = "not done"
-RECIPE_LATEST_VERSION_pn-openssh = "5.6p1"
+RECIPE_LATEST_VERSION_pn-openssh = "5.8p2"
 RECIPE_INTEL_SECTION_pn-openssh = "base"
 RECIPE_NO_OF_PATCHES_pn-openssh = "1"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-openssh = "08/2010"
-RECIPE_LAST_UPDATE_pn-openssh = "Aug 31, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-openssh = "05/2011"
+RECIPE_LAST_UPDATE_pn-openssh = "Jun 5, 2011"
 RECIPE_MAINTAINER_pn-openssh = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-tar = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-tar = "not done"
-RECIPE_LATEST_VERSION_pn-tar = "1.25"
+RECIPE_LATEST_VERSION_pn-tar = "1.26"
 RECIPE_INTEL_SECTION_pn-tar = "base"
 RECIPE_NO_OF_PATCHES_pn-tar = "2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tar = "2 weeks"
-RECIPE_LATEST_RELEASE_DATE_pn-tar = "11/2010"
-RECIPE_LAST_UPDATE_pn-tar = "Nov 17, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tar = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-tar = "03/2011"
+RECIPE_LAST_UPDATE_pn-tar = "Jun 5, 2011"
 RECIPE_MAINTAINER_pn-tar = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-lrzsz="yellow" # patch investigation needed.
-- 
1.7.3.4



