Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLl-0003im-56
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299033"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:49 -0700
Message-Id: <30101d4153aa8e116892063933b868d325bdd79c.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/13] distro tracking: Manual Updates
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 19bb1d5..38e0c4d 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -369,10 +369,11 @@ RECIPE_MAINTAINER_pn-libusb-compat = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libusb-compat = "done"
 RECIPE_LATEST_VERSION_pn-libusb-compat = "0.1.3"
 RECIPE_INTEL_SECTION_pn-libusb-compat = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libusb-compat = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libusb-compat = "07/2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libusb-compat = "stable"
+RECIPE_LATEST_RELEASE_DATE_pn-libusb-compat = "Jul 08, 2009"
 RECIPE_COMMENTS_pn-libusb-compat = "replaces libusb, but doesn't provides libusbpp"
 DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
+RECIPE_MANUAL_CHECK_DATE_pn-libusb-compat = "Jun 06, 2011"
 
 RECIPE_STATUS_pn-libnl = "green"
 RECIPE_LAST_UPDATE_pn-libnl = "Nov 15, 2010"
@@ -397,12 +398,13 @@ RECIPE_STATUS_pn-libxml2 = "yellow"
 RECIPE_LAST_UPDATE_pn-libxml2 = "Jun 18, 2010"
 RECIPE_MAINTAINER_pn-libxml2 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libxml2 = "done"
-RECIPE_LATEST_VERSION_pn-libxml2 = "2.7.7"
+RECIPE_LATEST_VERSION_pn-libxml2 = "2.7.8"
 RECIPE_PATCH_pn-libxml2+install = "use poky environment variables"
 RECIPE_INTEL_SECTION_pn-libxml2 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxml2 = "5 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libxml2 = "03/2010"
 RECIPE_COMMENTS_pn-libxml2 = ""
+RECIPE_MANUAL_CHECK_DATE_pn-libxml2 = "Jun 06, 2011"
 
 RECIPE_STATUS_pn-readline = "green"
 RECIPE_LAST_UPDATE_pn-readline = "Jun 17, 2010"
@@ -451,11 +453,12 @@ RECIPE_STATUS_pn-libtasn1 = "green"
 RECIPE_LAST_UPDATE_pn-libtasn1 = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-libtasn1 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libtasn1 = "not done"
-RECIPE_LATEST_VERSION_pn-libtasn1 = "2.7"
+RECIPE_LATEST_VERSION_pn-libtasn1 = "2.9"
 RECIPE_INTEL_SECTION_pn-libtasn1 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtasn1 = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "05/2010"
 RECIPE_COMMENTS_pn-libtasn1 = ""
+RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Jun 06, 2011"
 
 RECIPE_STATUS_pn-openssl = "green"
 RECIPE_LAST_UPDATE_pn-openssl = "Nov 17, 2010"
@@ -564,6 +567,8 @@ RECIPE_STATUS_pn-libaio = "green"
 RECIPE_LAST_UPDATE_pn-libaio = "Aug 27, 2010"
 RECIPE_MAINTAINER_pn-libaio = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-libaio = "0.3.107"
+RECIPE_MANUAL_CHECK_DATE_pn-libaio = "Jun 6, 2011"
+RECIPE_COMMENTS_pn-libaio = "1.0.9 is current unstable"
 
 RECIPE_STATUS_pn-libcheck = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
@@ -1844,6 +1849,8 @@ RECIPE_STATUS_pn-resolvconf = "green"
 RECIPE_LATEST_VERSION_pn-resolvconf = "1.48"
 RECIPE_LAST_UPDATE_pn-resolvconf = "Jan 20, 2011"
 RECIPE_MAINTAINER_pn-resolvconf = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Jun 06, 2011"
+RECIPE_COMMENTS_pn-resolvconf = "Lastest Unstable version is 1.56"
 
 RECIPE_STATUS_pn-openswan = "red"
 RECIPE_LATEST_VERSION_pn-openswan = "2.6.26"
-- 
1.7.3.4



