Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8H-0005pY-9k
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419461"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:43 -0800
Message-Id: <39ea81166cdcd7cf5f44398815ac1c35eedbd3b8.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/23] distro_tracking: Update manual check dates (readline, gcrypt)
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d84b1b3..84a986e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -425,7 +425,7 @@ RECIPE_INTEL_SECTION_pn-readline = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-readline = "11 months"
 RECIPE_LATEST_RELEASE_DATE_pn-readline = "Feb 13, 2011"
 RECIPE_COMMENTS_pn-readline = ""
-RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-readline = "Nov 23, 2011"
 
 RECIPE_STATUS_pn-libgcrypt = "green"
 RECIPE_LATEST_VERSION_pn-libgcrypt = "1.5.0"
@@ -437,6 +437,7 @@ RECIPE_PATCH_pn-libgcrypt+add-pkgconfig-support = "add .pc file"
 RECIPE_INTEL_SECTION_pn-libgcrypt = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgcrypt = "11 months"
 RECIPE_COMMENTS_pn-libgcrypt = ""
+RECIPE_MANUAL_CHECK_DATE_pn-libgcrypt = "Nov 23, 2011"
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
 RECIPE_LATEST_VERSION_pn-gnutls = "2.12.11"
-- 
1.7.6.4



