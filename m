Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvj-0008N1-6o
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Apr 2011 14:37:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="415676303"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by azsmga001.ch.intel.com with ESMTP; 07 Apr 2011 14:37:43 -0700
Message-Id: <e691f67e79d9bfcb868d724a61da094bdb50d292.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 10:41:24 -0700
Date: Thu, 07 Apr 2011 14:37:43 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 08/11] distro tracking update
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
X-List-Received-Date: Thu, 07 Apr 2011 21:39:55 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cadfac2..ebc835f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5489,7 +5489,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-lighttpd = "08/2010"
 RECIPE_COMMENTS_pn-lighttpd = ""
 
 RECIPE_LATEST_VERSION_pn-adt-installer = "1.0"
-RECIPE_MANUAL_CHECK_DATE_adt-installer = "Jan 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-adt-installer = "Jan 17, 2011"
 DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
 RECIPE_LATEST_VERSION_pn-glew = "1.5.7"
 RECIPE_MANUAL_CHECK_DATE_pn-glew = "Feb 28, 2011"
@@ -5497,7 +5497,7 @@ RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.4.1"
 RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "Jan 17, 2011"
 RECIPE_LATEST_VERSION_pn-lame = "3.98.4"
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Jan 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Apr 6, 2011"
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Jan 17, 2011"
@@ -5533,6 +5533,7 @@ RECIPE_LATEST_VERSION_pn-bind = "9.7.2-P3"
 RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, newer versions are Alpha/Beta"
 RECIPE_LATEST_VERSION_pn-man = "1.6f"
 RECIPE_LATEST_VERSION_pn-mc = "4.7.5-pre1"
+RECIPE_MAINTAINER_pn-mc = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, 4.7.5-pre1 is Alpha/Beta"
 
 RECIPE_STATUS_pn-sgml-common = "green"
@@ -5632,3 +5633,18 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-linuxdoc-tools = "unknown"
 RECIPE_COMMENTS_pn-linuxdoc-tools = ""
 RECIPE_LAST_UPDATE_pn-linuxdoc-tools = "Feb 25, 2011"
 RECIPE_MAINTAINER_pn-linuxdoc-tools = "Scott Garman <scott.a.garman@intel.com>"
+
+RECIPE_STATUS_pn-slang = "green"
+RECIPE_LATEST_VERSION_pn-slang = "2.2.3"
+RECIPE_LAST_UPDATE_pn-slang = "Feb 25, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-slang = "Apr 6, 2011"
+
+RECIPE_STATUS_pn-libnewt = "green"
+RECIPE_LATEST_VERSION_pn-libnewt = "2.2.3"
+RECIPE_LAST_UPDATE_pn-libnewt = "Feb 25, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Apr 6, 2011"
+
+RECIPE_STATUS_pn-createrepo = "green"
+RECIPE_LATEST_VERSION_pn-createrepo = "2.2.3"
+RECIPE_MAINTAINER_pn-createrepo = "Qing He <qing.he@intel.com>"
+RECIPE_LAST_UPDATE_pn-createrepo = "Apr 6, 2011"
-- 
1.7.1



