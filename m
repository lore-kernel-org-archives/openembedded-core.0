Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RLeFc-0004Jj-1f
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 18:05:20 +0100
Received: from localhost (c-67-170-181-205.hsd1.or.comcast.net
	[67.170.181.205])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 57CA330466
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2011 12:58:56 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 09:58:42 -0700
Message-Id: <c89ad3cee827cfa5de5c5cb37a3b947a401ff96d.1320252973.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320252973.git.scott.a.garman@intel.com>
References: <cover.1320252973.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320252973.git.scott.a.garman@intel.com>
References: <cover.1320252973.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 57CA330466.C2079
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] distro_tracking_fields: updates for sudo, mtools, grep, and openssh
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
X-List-Received-Date: Wed, 02 Nov 2011 17:05:20 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 998eabf..b2808a5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -813,12 +813,12 @@ RECIPE_MAINTAINER_pn-pax-utils = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-sudo = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sudo = "not done"
-RECIPE_LATEST_VERSION_pn-sudo = "1.8.1p2"
+RECIPE_LATEST_VERSION_pn-sudo = "1.8.3"
 RECIPE_INTEL_SECTION_pn-sudo = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-sudo = "May 16, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-sudo = "Oct 21, 2011"
 RECIPE_COMMENTS_pn-sudo = ""
-RECIPE_LAST_UPDATE_pn-sudo = "Jun 14, 2011"
+RECIPE_LAST_UPDATE_pn-sudo = "Oct 25, 2011"
 RECIPE_MAINTAINER_pn-sudo = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-blktool = "green"
@@ -1290,12 +1290,12 @@ DISTRO_PN_ALIAS_pn-msynctool = "OpenSuse=msynctool Mandriva=msynctool"
 
 RECIPE_STATUS_pn-mtools = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mtools = "not done"
-RECIPE_LATEST_VERSION_pn-mtools = "4.0.16"
+RECIPE_LATEST_VERSION_pn-mtools = "4.0.17"
 RECIPE_INTEL_SECTION_pn-mtools = "optional"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtools = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-mtools = "Apr 16, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtools = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-mtools = "Jun 28, 2011"
 RECIPE_COMMENTS_pn-mtools = ""
-RECIPE_LAST_UPDATE_pn-mtools = "Jun 15, 2011"
+RECIPE_LAST_UPDATE_pn-mtools = "Oct 25, 2011"
 RECIPE_MAINTAINER_pn-mtools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-pm-utils = "green"
@@ -2016,22 +2016,22 @@ RECIPE_MAINTAINER_pn-cronie = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-grep = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-grep = "not done"
-RECIPE_LATEST_VERSION_pn-grep = "2.8"
+RECIPE_LATEST_VERSION_pn-grep = "2.9"
 RECIPE_INTEL_SECTION_pn-grep = "base"
 RECIPE_NO_OF_PATCHES_pn-grep = "0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-grep = "8 months"
-RECIPE_LATEST_RELEASE_DATE_pn-grep = "May 01, 2011"
-RECIPE_LAST_UPDATE_pn-grep = "Jun 5, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-grep = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-grep = "Jun 01, 2011"
+RECIPE_LAST_UPDATE_pn-grep = "Oct 25, 2011"
 RECIPE_MAINTAINER_pn-grep = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-openssh = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-openssh = "not done"
-RECIPE_LATEST_VERSION_pn-openssh = "5.8p2"
+RECIPE_LATEST_VERSION_pn-openssh = "5.9p1"
 RECIPE_INTEL_SECTION_pn-openssh = "base"
 RECIPE_NO_OF_PATCHES_pn-openssh = "1"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-openssh = "May 01, 2011"
-RECIPE_LAST_UPDATE_pn-openssh = "Jun 5, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-openssh = "Sep 01, 2011"
+RECIPE_LAST_UPDATE_pn-openssh = "Oct 25, 2011"
 RECIPE_MAINTAINER_pn-openssh = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-tar = "green" 
-- 
1.7.5.4



