Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8Ceu-0002cA-LO
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:32:08 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 49F702FEA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 11:23:03 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 08:22:58 -0700
Message-Id: <1501d7f1acd5bddfa4cb3a84f22e8ac7fd1acec7.1331824888.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331824888.git.scott.a.garman@intel.com>
References: <cover.1331824888.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 49F702FEA2.913A2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/4] distro_tracking: update sudo, at, base-passwd
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
X-List-Received-Date: Thu, 15 Mar 2012 15:32:08 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   24 ++++++++++----------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8ad924b..45d9e08 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -864,12 +864,12 @@ RECIPE_MAINTAINER_pn-pax-utils = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-sudo = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sudo = "not done"
-RECIPE_LATEST_VERSION_pn-sudo = "1.8.3"
+RECIPE_LATEST_VERSION_pn-sudo = "1.8.4p4"
 RECIPE_INTEL_SECTION_pn-sudo = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-sudo = "Oct 21, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-sudo = "Mar 12, 2012"
 RECIPE_COMMENTS_pn-sudo = ""
-RECIPE_LAST_UPDATE_pn-sudo = "Oct 25, 2011"
+RECIPE_LAST_UPDATE_pn-sudo = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-sudo = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-blktool = "green"
@@ -952,14 +952,14 @@ RECIPE_MAINTAINER_pn-base-files = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-base-passwd = "green"
 RECIPE_DEPENDENCY_CHECK_pn-base-passwd = "not done"
-RECIPE_LATEST_VERSION_pn-base-passwd = "3.5.22"
+RECIPE_LATEST_VERSION_pn-base-passwd = "3.5.24"
 RECIPE_PATCH_pn-base-passwd+nobash = "change /bin/bash to /bin/sh in passwd.master; another specific poky tweak"
 RECIPE_PATCH_pn-base-passwd+root-home = "change home for root user in passwd.master; perhaps a poky specific tweak; oe even has other root-home patch for different configurations"
 RECIPE_INTEL_SECTION_pn-base-passwd = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-base-passwd = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-base-passwd = "Sep 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-base-passwd = "unknown"
+RECIPE_LATEST_RELEASE_DATE_pn-base-passwd = "unknown"
 RECIPE_COMMENTS_pn-base-passwd = ""
-RECIPE_LAST_UPDATE_pn-base-passwd = "Jul 6, 2010"
+RECIPE_LAST_UPDATE_pn-base-passwd = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-base-passwd = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-apmd = "green" 
@@ -2102,13 +2102,13 @@ RECIPE_MAINTAINER_pn-qemu-helper-nativesdk = "Scott Garman <scott.a.garman@intel
 
 RECIPE_STATUS_pn-at = "green"
 RECIPE_DEPENDENCY_CHECK_pn-at = "not done" 
-RECIPE_LATEST_VERSION_pn-at = "3.1.12"
+RECIPE_LATEST_VERSION_pn-at = "3.1.13"
 RECIPE_INTEL_SECTION_pn-at = "base"
 RECIPE_NO_OF_PATCHES_pn-at = "3"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-at = "13 months"
-RECIPE_LATEST_RELEASE_DATE_pn-at = "Nov 01, 2009"
-RECIPE_LAST_UPDATE_pn-at = "Jun 4, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-at = "Jul 12, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-at = "unknown"
+RECIPE_LAST_UPDATE_pn-at = "Mar 15, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-at = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-at = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-cpio = "green"
-- 
1.7.5.4



