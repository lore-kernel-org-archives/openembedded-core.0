Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qgjam-0008Ab-Sc
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 22:30:05 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 639AD2FF37;
	Tue, 12 Jul 2011 16:26:04 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 13:25:58 -0700
Message-Id: <3ad102cf0e83ca891c8d5926ec2264d547f09d99.1310502258.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310502258.git.scott.a.garman@intel.com>
References: <cover.1310502258.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1310502258.git.scott.a.garman@intel.com>
References: <cover.1310502258.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 639AD2FF37.9535A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/1] distro-tracking: add RECIPE_MANUAL_CHECK_DATE for various recipes
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
X-List-Received-Date: Tue, 12 Jul 2011 20:30:05 -0000

The upstream package tracking webapp needs this additional distro
tracking field to work properly for the following recipes I
maintain:

* icu
* blktool
* apmd
* gperf
* dosfstools
* insserv
* at

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a97a408..efb4c0b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -140,6 +140,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-icu = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-icu = "08/2006"
 RECIPE_COMMENTS_pn-icu = "arm optimizations; license similar to MIT, however sub-license is not allowed; autoreconf is not used and current style is not clean. need enhancement in the future"
 RECIPE_LAST_UPDATE_pn-icu = "Dec 6, 2007"
+RECIPE_MANUAL_CHECK_DATE_pn-icu = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-icu = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eggdbus = "yellow" # patch comment
@@ -818,6 +819,7 @@ RECIPE_INTEL_SECTION_pn-blktool = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-blktool = "02/2010"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-blktool = "3 years"
 RECIPE_LAST_UPDATE_pn-blktool = "Jun 4, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-blktool = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-blktool = "Scott Garman <scott.a.garman@intel.com>"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 
@@ -911,6 +913,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-apmd = "07/2009"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-apmd = "1 year"
 RECIPE_COMMENTS_pn-apmd = ""
 RECIPE_LAST_UPDATE_pn-apmd = "Jun 4, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-apmd = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-apmd = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-gperf = "green"
@@ -922,6 +925,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gperf = "2 years"
 RECIPE_LATEST_RELEASE_DATE_pn-gperf = "02/2009"
 RECIPE_COMMENTS_pn-gperf = "3.0.4 is GPLv3, however we only require native version so far"
 RECIPE_LAST_UPDATE_pn-gperf = "Jul 19, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gperf = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-gperf = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-valgrind = "green"
@@ -1171,6 +1175,7 @@ RECIPE_LATEST_VERSION_pn-dosfstools = "2.11"
 RECIPE_LATEST_RELEASE_DATE_pn-dosfstools = "Mar 12, 2005"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dosfstools = "15 months"
 RECIPE_LAST_UPDATE_pn-dosfstools = "Jun 4, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-dosfstools = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
@@ -1194,6 +1199,7 @@ RECIPE_INTEL_SECTION_pn-insserv = "base"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-insserv = "unknown"
 RECIPE_LATEST_RELEASE_DATE_pn-insserv = "unknown"
 RECIPE_LAST_UPDATE_pn-insserv = "Nov 28, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-insserv = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-insserv = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-modutils-collateral = "red"
@@ -1958,6 +1964,7 @@ RECIPE_NO_OF_PATCHES_pn-at = "3"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-at = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-at = "11/2009"
 RECIPE_LAST_UPDATE_pn-at = "Jun 4, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-at = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-at = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-cpio = "green"
-- 
1.7.1



