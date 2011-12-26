Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfE72-00016p-Ek
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 18:13:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Dec 2011 09:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91638842"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2011 09:06:11 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 01:12:02 +0800
Message-Id: <19d83a0b3a40cdce88a518db0fddbe7d5b5548ec.1324918959.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <dab83815d71c52b28747493c70011a39a0004015.1324918959.git.shane.wang@intel.com>
References: <dab83815d71c52b28747493c70011a39a0004015.1324918959.git.shane.wang@intel.com>
In-Reply-To: <cover.1324918958.git.shane.wang@intel.com>
References: <cover.1324918958.git.shane.wang@intel.com>
Subject: [PATCH 5/5] distro_tracking_fields: update the info for recipe upgrade.
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
X-List-Received-Date: Mon, 26 Dec 2011 17:13:24 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ab18e12..e0df61f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -87,7 +87,7 @@ RECIPE_LATEST_VERSION_pn-minicom = "2.5"
 RECIPE_NO_OF_PATCHES_pn-minicom = "1"
 RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Dec 20, 2010"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom = "22 months"
-RECIPE_LAST_UPDATE_pn-minicom = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-minicom = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -2379,11 +2379,11 @@ RECIPE_LAST_UPDATE_pn-orinoco-conf = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-orinoco-conf = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libical="green"
-RECIPE_LATEST_VERSION_pn-libical = "0.47"
+RECIPE_LATEST_VERSION_pn-libical = "0.48"
 RECIPE_NO_OF_PATCHES_pn-libical = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libical = "Oct 12, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "11 months"
-RECIPE_LAST_UPDATE_pn-libical = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-libical = "Dec 26, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libical = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -2795,7 +2795,7 @@ DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
-RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Apr 26, 2011"
+RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -4632,7 +4632,7 @@ RECIPE_INTEL_SECTION_pn-freetype = "libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
 RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Jul 29, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
-RECIPE_LAST_UPDATE_pn-freetype = "Aug 16, 2011"
+RECIPE_LAST_UPDATE_pn-freetype = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
-- 
1.7.6



