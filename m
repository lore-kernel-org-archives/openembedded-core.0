Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QeKWw-0001pI-Nq
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 07:20:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2011 22:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,484,1304319600"; d="scan'208";a="21962915"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2011 22:15:17 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 13:20:20 +0800
Message-Id: <910d03906a0a64e61123350803292930029a08e3.1309928392.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
In-Reply-To: <cover.1309928392.git.lei.mei@intel.com>
References: <cover.1309928392.git.lei.mei@intel.com>
Subject: [PATCH 3/3] distro_tracking_fields.inc: Update recipes upgrade and manual check information
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
X-List-Received-Date: Wed, 06 Jul 2011 05:20:11 -0000

upgrade: gawk, gupnp
manual check: diffutils

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1808603..1c251b9 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1,7 +1,8 @@
 RECIPE_STATUS_pn-diffutils = "green"
 RECIPE_LATEST_VERSION_pn-diffutils = "3.0"
-
 RECIPE_LAST_UPDATE_pn-diffutils = "Dec 10, 2010"
+RECIPE_NO_UPDATE_REASON_pn-diffutils = "3.0 is the latest version"
+RECIPE_MANUAL_CHECK_DATE_pn-diffutils = "Jul 4, 2011"
 RECIPE_MAINTAINER_pn-diffutils = "Mei Lei <lei.mei@intel.com>"
 
 RECIPE_STATUS_pn-epdfview = "red"
@@ -1792,9 +1793,9 @@ RECIPE_MAINTAINER_pn-sysklogd = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-sysklogd = "1.5"
 
 RECIPE_STATUS_pn-gawk = "red"    # need upgrade
-RECIPE_LAST_UPDATE_pn-gawk = "Aug 27, 2010"
+RECIPE_LAST_UPDATE_pn-gawk = "Jul 5, 2011"
 RECIPE_MAINTAINER_pn-gawk = "Mei Lei <lei.mei@intel.com>"
-RECIPE_LATEST_VERSION_pn-gawk = "3.1.7"
+RECIPE_LATEST_VERSION_pn-gawk = "4.0.0"
 
 RECIPE_STATUS_pn-mktemp="red"
 RECIPE_LAST_UPDATE_pn-mktemp = "Jul 29, 2010"
@@ -2112,12 +2113,12 @@ RECIPE_LAST_UPDATE_pn-empathy = "Aug 19, 2009"
 RECIPE_MAINTAINER_pn-empathy = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gupnp = "green"
-RECIPE_LATEST_VERSION_pn-gupnp = "0.16.0"
+RECIPE_LATEST_VERSION_pn-gupnp = "0.16.1"
 RECIPE_NO_OF_PATCHES_pn-gupnp= "1"
-RECIPE_LATEST_RELEASE_DATE_pn-gupnp= "2011/04/08"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gupnp= "3 month"
-RECIPE_LAST_UPDATE_pn-gupnp = "Apr 15, 2011"
-RECIPE_MAINTAINER_pn-gupnp= "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_LATEST_RELEASE_DATE_pn-gupnp= "2011/04/30"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gupnp= "1 month"
+RECIPE_LAST_UPDATE_pn-gupnp = "Jul 4, 2011"
+RECIPE_MAINTAINER_pn-gupnp= "Mei Lei <lei.mei@intel.com>"
 
 RECIPE_STATUS_pn-gupnp-av = "green"
 RECIPE_LATEST_VERSION_pn-gupnp-av = "0.8.0"
-- 
1.6.3.3



