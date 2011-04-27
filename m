Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEW-0005P8-Ga
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 00:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203343"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:52 -0700
Message-Id: <4a97343a0290cfe15439b96d9ee10ca37ce4507e.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Mon, 25 Apr 2011 13:00:29 -0700
Date: Wed, 27 Apr 2011  0:29:52 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 31/52] distro_tracking_fields.inc: add cdrtools recipe
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:24 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 767c05b..d9fe02c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5676,3 +5676,14 @@ RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "2.2.3"
 RECIPE_MAINTAINER_pn-createrepo = "Qing He <qing.he@intel.com>"
 RECIPE_LAST_UPDATE_pn-createrepo = "Apr 6, 2011"
+
+RECIPE_STATUS_pn-cdrtools = "green"
+RECIPE_DEPENDENCY_CHECK_pn-cdrtools = "not done"
+RECIPE_LATEST_VERSION_pn-cdrtools = "3.00"
+RECIPE_NO_UPDATE_REASON_pn-cdrtools = "v3.x uses incompatible CDDL license"
+RECIPE_NO_OF_PATCHES_pn-cdrtools = "2"
+RECIPE_LATEST_RELEASE_DATE_pn-cdrtools = "2010/06/02"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cdrtools = "6 years 2 months"
+RECIPE_COMMENTS_pn-cdrtools = "This is the last GPL licensed version of cdrtools"
+RECIPE_LAST_UPDATE_pn-cdrtools = "Apr 25, 2011"
+RECIPE_MAINTAINER_pn-cdrtools = "Scott Garman <scott.a.garman@intel.com>"
-- 
1.7.1.1



