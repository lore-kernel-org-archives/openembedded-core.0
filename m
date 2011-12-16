Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Rbb16-0003xu-9B
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:52:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2011 08:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103013860"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.176])
	by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2011 08:44:10 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 08:44:07 -0800
Message-Id: <568afc1a01d9a6674e5109abce6dd5996b6c59e9.1324053729.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324053729.git.elizabeth.flanagan@intel.com>
References: <cover.1324053729.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] license.bbclass: remove bashism
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
X-List-Received-Date: Fri, 16 Dec 2011 16:52:16 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Removing a bashism that was dumping errors into rootfs log.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dd5d1bc..6e82bd9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -120,7 +120,7 @@ license_create_manifest() {
                     # Really don't need to copy the generics as they're 
                     # represented in the manifest and in the actual pkg licenses
                     # Doing so would make your image quite a bit larger
-                    if [ ! ${lic} == "generic_*" ]; then
+                    if [ ! ${lic} = "generic_*" ]; then
                         cp ${LICENSE_DIRECTORY}/${pkged_pn}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
                     fi
                 done
-- 
1.7.1



