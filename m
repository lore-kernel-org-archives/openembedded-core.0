Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QTRoG-0003nm-GF
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 06:53:04 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id ADC3F2FF75;
	Mon,  6 Jun 2011 00:49:44 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 21:49:33 -0700
Message-Id: <693d3ec93350db4d99dd043e049874557cde9c8d.1307331820.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1307331820.git.scott.a.garman@intel.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1307331820.git.scott.a.garman@intel.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: ADC3F2FF75.21614
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 4/4] distro-tracking: update openssh, tar, and grep
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
X-List-Received-Date: Mon, 06 Jun 2011 04:53:04 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 73e6782..71d3c73 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1975,32 +1975,32 @@ RECIPE_MAINTAINER_pn-cronie = "Dexuan Cui <dexuan.cui@intel.com>"
 
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
1.7.1



