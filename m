Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEQY-0000au-1i
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:01:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 16:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144370021"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 16:51:48 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:40 -0700
Message-Id: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/8] license.bbclass: Add spdx mapping to GPL-1.0
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
X-List-Received-Date: Sat, 24 Mar 2012 00:01:50 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Perl is GPL-1.0. For consistency sake, adding an spdx map for
GPLv1

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 9459b00..40dcbeb 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -18,12 +18,14 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 # We should really discuss standardizing this field, but that's a longer term goal.
 # For now, we can do this and it should grab the most common LICENSE naming variations.
 #
-# Changing GPL mapping to GPL-2 as it's not very likely to be GPL-1
 # We should NEVER have a GPL/LGPL without a version!!!!
 # Any mapping to MPL/LGPL/GPL should be fixed
 # see: https://wiki.yoctoproject.org/wiki/License_Audit
 
 # GPL variations
+SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
+SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
+SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
 SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
 SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
 SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
-- 
1.7.1



