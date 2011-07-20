Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSD6-0001ZJ-SV
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:32:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753249"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:27:53 -0700
Message-Id: <0e0c5c3f2b909a61af102999bb4c27f035c8fab6.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 06/50] distro-tracking: update libpng
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
X-List-Received-Date: Wed, 20 Jul 2011 08:32:55 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 48b4cf3..5369f75 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -255,14 +255,14 @@ RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpng = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpng = "not done"
-RECIPE_LATEST_VERSION_pn-libpng = "1.4.5"
-RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 has API compatibility issue, e.g. break libmatchbox. choose 1.2.44 instead"
+RECIPE_LATEST_VERSION_pn-libpng = "1.5.4"
+RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
 RECIPE_PATCH_pn-libpng+makefile = "by RP; 2008; to define ECHO explicitly for lbitool 2.2.2. need check whether it's still valide for new libtool. candidate for upstream"
 RECIPE_INTEL_SECTION_pn-libpng = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libpng = "06/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
+RECIPE_LATEST_RELEASE_DATE_pn-libpng = "07/2011"
 RECIPE_COMMENTS_pn-libpng = ""
-RECIPE_LAST_UPDATE_pn-libpng = "Jul 20, 2010"
+RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
-- 
1.7.3.4



