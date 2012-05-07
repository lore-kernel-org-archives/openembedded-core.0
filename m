Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRWte-0007DC-EI
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 00:59:14 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 668572FF66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 18:49:19 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 15:49:15 -0700
Message-Id: <73aa16590183f8d8e960902a2e2227c9340eb64a.1336430865.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336430865.git.scott.a.garman@intel.com>
References: <cover.1336430865.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1336430865.git.scott.a.garman@intel.com>
References: <cover.1336430865.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 668572FF66.DF5B2
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/3] distro_tracking: updates for upgraded recipes
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
X-List-Received-Date: Mon, 07 May 2012 22:59:14 -0000

libpng, openssl, openssh, and opensp

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   25 +++++++++----------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f74c8d3..8b8eeaa 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -308,8 +308,8 @@ RECIPE_INTEL_SECTION_pn-libpng = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
 RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Mar 29, 2012"
 RECIPE_COMMENTS_pn-libpng = ""
-RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Apr 20, 2012"
+RECIPE_LAST_UPDATE_pn-libpng = "Apr 25, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libpng = "May 7, 2012"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
@@ -520,12 +520,12 @@ RECIPE_COMMENTS_pn-libtasn1 = ""
 RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Nov 29, 2011"
 
 RECIPE_STATUS_pn-openssl = "green"
-RECIPE_LATEST_VERSION_pn-openssl = "1.0.1"
-RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Mar 14, 2012"
-RECIPE_LAST_UPDATE_pn-openssl = "Mar 20, 2012"
+RECIPE_LATEST_VERSION_pn-openssl = "1.0.1b"
+RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Apr 26, 2012"
+RECIPE_LAST_UPDATE_pn-openssl = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-openssl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-openssl = "base libs"
-RECIPE_NO_UPDATE_REASON_pn-openssl = "1.0.1 is beta 1.0.0h is latest"
+RECIPE_NO_UPDATE_REASON_pn-openssl = "1.0.1 is beta 1.0.0i is latest"
 
 RECIPE_STATUS_pn-libnss-mdns = "green"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
@@ -2177,12 +2177,12 @@ RECIPE_MAINTAINER_pn-grep = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-openssh = "green"
 RECIPE_DEPENDENCY_CHECK_pn-openssh = "not done"
-RECIPE_LATEST_VERSION_pn-openssh = "5.9p1"
+RECIPE_LATEST_VERSION_pn-openssh = "6.0p1"
 RECIPE_INTEL_SECTION_pn-openssh = "base"
 RECIPE_NO_OF_PATCHES_pn-openssh = "1"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-openssh = "Sep 01, 2011"
-RECIPE_LAST_UPDATE_pn-openssh = "Oct 25, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-openssh = "8 months"
+RECIPE_LATEST_RELEASE_DATE_pn-openssh = "Apr 22, 2012"
+RECIPE_LAST_UPDATE_pn-openssh = "May 7, 2012"
 RECIPE_MAINTAINER_pn-openssh = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-tar = "green"
@@ -6224,12 +6224,11 @@ DISTRO_PN_ALIAS_pn-sgmlspl = "Debian=sgmlspl Ubuntu=sgmlspl"
 RECIPE_STATUS_pn-opensp = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opensp = "not done"
 RECIPE_LATEST_VERSION_pn-opensp = "1.5.2"
-RECIPE_NO_OF_PATCHES_pn-opensp = "4"
 RECIPE_LATEST_RELEASE_DATE_pn-opensp = "Dec 23, 2005"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opensp = "2 years"
 RECIPE_COMMENTS_pn-opensp = ""
-RECIPE_LAST_UPDATE_pn-opensp = "Jan 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-opensp = "Apr 20, 2012"
+RECIPE_LAST_UPDATE_pn-opensp = "May 7, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-opensp = "May 7, 2012"
 RECIPE_MAINTAINER_pn-opensp = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-openjade = "green"
-- 
1.7.5.4



