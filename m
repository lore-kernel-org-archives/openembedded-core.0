Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1S7kGB-00069D-Mk
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 10:12:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2E93wLO011849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 02:03:58 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.241) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 14 Mar 2012 02:03:58 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 17:03:43 +0800
Message-ID: <1a97c9113a784a8fbefcea2056b82476ef2e639c.1331713107.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331713107.git.kai.kang@windriver.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.241]
Subject: [PATCH 8/8] distro_tracking_fields: udpate package status
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
X-List-Received-Date: Wed, 14 Mar 2012 09:12:44 -0000
Content-Type: text/plain

Update packages' status, includes libsdl, gobject-introspection, newt,
alsa and ghostscript.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   48 ++++++++++----------
 1 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d8cb150..e378120 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2723,20 +2723,20 @@ RECIPE_LAST_UPDATE_pn-gst-plugins-bad = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-gst-plugins-bad = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-alsa-utils="green"
-RECIPE_LATEST_VERSION_pn-alsa-utils="1.0.24.2"
+RECIPE_LATEST_VERSION_pn-alsa-utils="1.0.25"
 RECIPE_NO_OF_PATCHES_pn-alsa-utils="1"
-RECIPE_LATEST_RELEASE_DATE_pn-alsa-utils="Jan 31, 2011"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-alsa-utils="9 months"
-RECIPE_LAST_UPDATE_pn-alsa-utils = "Apr 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-alsa-utils = "Nov 22, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-alsa-utils="Jan 25, 2012"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-alsa-utils="12 months"
+RECIPE_LAST_UPDATE_pn-alsa-utils = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-utils = "Mar 14, 2012"
 RECIPE_MAINTAINER_pn-alsa-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-alsa-lib="green"
-RECIPE_LATEST_VERSION_pn-alsa-lib="1.0.24.1"
+RECIPE_LATEST_VERSION_pn-alsa-lib="1.0.25"
 RECIPE_NO_OF_PATCHES_pn-alsa-lib="1"
-RECIPE_LATEST_RELEASE_DATE_pn-alsa-lib="Jan 31, 2011"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-alsa-lib="9 months"
-RECIPE_LAST_UPDATE_pn-alsa-lib = "Apr 15, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-alsa-lib="Jan 25, 2012"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-alsa-lib="12 months"
+RECIPE_LAST_UPDATE_pn-alsa-lib = "Mar 14, 2012"
 RECIPE_MAINTAINER_pn-alsa-lib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-tremor="green"
@@ -5269,11 +5269,11 @@ DISTRO_PN_ALIAS_pn-gdk-pixbuf-csource-native = "Debian=libgdk-pixbuf2.0-0 Fedora
 
 RECIPE_STATUS_pn-gobject-introspection = "red" # update needed
 RECIPE_DEPENDENCY_CHECK_pn-gobject-introspection = "not done"
-RECIPE_LATEST_VERSION_pn-gobject-introspection = "0.9.5"
+RECIPE_LATEST_VERSION_pn-gobject-introspection = "1.31.20"
 RECIPE_NO_OF_PATCHES_pn-gobject-introspection = "3"
 RECIPE_INTEL_SECTION_pn-gobject-introspection = "graphic UX"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gobject-introspection = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gobject-introspection = "Sep 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gobject-introspection = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-gobject-introspection = "Mar 05, 2012"
 RECIPE_COMMENTS_pn-gobject-introspection = "m4 files are used but upstream source is not cross-compile-able"
 RECIPE_NO_UPDATE_REASON_pn-gobject_introspection = "Does not cross-compile"
 RECIPE_MAINTAINER_pn-gobject-introspection = "Kai Kang <kai.kang@windriver.org>"
@@ -6092,10 +6092,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-cups = "Sep 28, 2011"
 
 RECIPE_STATUS_pn-libnewt = "green"
 DISTRO_PN_ALIAS_pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
-RECIPE_LATEST_VERSION_pn-libnewt = "0.52.13"
+RECIPE_LATEST_VERSION_pn-libnewt = "0.52.14"
 RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
-RECIPE_LAST_UPDATE_pn-libnewt = "Jul 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jul 27, 2011"
+RECIPE_LAST_UPDATE_pn-libnewt = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Mar 14, 2012"
 
 RECIPE_STATUS_pn-libxml-sax-perl = "green"
 RECIPE_LATEST_VERSION_pn-libxml-sax-perl = "0.99"
@@ -6110,10 +6110,10 @@ RECIPE_LAST_UPDATE_pn-liburi-perl = "Oct 19, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-liburi-perl = "Oct 19, 2011"
 
 RECIPE_STATUS_pn-ghostscript = "red"
-RECIPE_LATEST_VERSION_pn-ghostscript = "9.04"
+RECIPE_LATEST_VERSION_pn-ghostscript = "9.05"
 RECIPE_MAINTAINER_pn-ghostscript = "Kai Kang <kai.kang@windriver.com>"
-RECIPE_LAST_UPDATE_pn-ghostscript = "Oct 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-ghostscript = "Oct 19, 2011"
+RECIPE_LAST_UPDATE_pn-ghostscript = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-ghostscript = "Mar 14, 2012"
 
 RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
@@ -6146,9 +6146,9 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-alsa-tools = "green"
-RECIPE_LATEST_VERIONS_pn-alsa-tools = "1.0.24.1
-RECIPE_LAST_UPDATE_pn-alsa-tools = "Jul 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jul 28, 2011"
+RECIPE_LATEST_VERIONS_pn-alsa-tools = "1.0.25"
+RECIPE_LAST_UPDATE_pn-alsa-tools = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Mar 14, 2012"
 RECIPE_MAINTAINER_pn-alsa-tools = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-mesa-demos = "red"
@@ -6189,9 +6189,9 @@ DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
 RECIPE_MAINTAINER_pn-linux-yocto-rt = "Darren Hart <dvhart@linux.intel.com>"
 
 RECIPE_STATUS_pn-libsdl = "green"
-RECIPE_LATEST_VERSION_pn-libsdl = "1.2.14"
-RECIPE_LAST_UPDATE_pn-libsdl = "Oct 19, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Jul 28, 2011"
+RECIPE_LATEST_VERSION_pn-libsdl = "1.2.15"
+RECIPE_LAST_UPDATE_pn-libsdl = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Mar 14, 2012"
 RECIPE_MAINTAINER_pn-libsdl = "Kai Kang <kai.kang@windriver.com>"
 DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 
-- 
1.7.5.4



