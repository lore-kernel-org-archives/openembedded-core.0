Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZAY6-0007zv-2C
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:12:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 16:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94558745"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.199])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 16:05:25 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 16:05:22 -0800
Message-Id: <e335966f9acb0586d498f9c390bd797de2987db5.1323475141.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1323475141.git.elizabeth.flanagan@intel.com>
References: <cover.1323475141.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/3] license.bbclass: remove bashism.
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
X-List-Received-Date: Sat, 10 Dec 2011 00:12:18 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

bashism in create_license_manifest removed.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 8c64e4c..e520a4c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -88,7 +88,7 @@ license_create_manifest() {
                 # check to see if the package name exists in the manifest. if so, bail.
                 if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
                     # exclude local recipes
-                    if [ ! ${pkged_pn} == "*locale*" ]; then
+                    if [ ! "${pkged_pn}" = "*locale*" ]; then
                         echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
                         echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
                         echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-- 
1.7.1



