Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RclP2-00015l-Ra
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 23:09:49 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 14:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89247824"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 14:02:25 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 13:50:25 -0800
Message-Id: <b680bbc0f8d2672fc03433c9e6911c0a04eb20c1.1324331298.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324331298.git.elizabeth.flanagan@intel.com>
References: <cover.1324331298.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] license: Fix manifest conditional
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
X-List-Received-Date: Mon, 19 Dec 2011 22:09:49 -0000

The manifest conditionals COPY_LIC_MANIFEST and COPY_LIC_DIRS
were returning true due to missing quotes in the bash test. This
made images larger than expected.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6e82bd9..d351b5a 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -110,10 +110,10 @@ license_create_manifest() {
     # if you are concerned about license compliance 
     # and delivery this should cover all your bases
 
-    if [ -n ${COPY_LIC_MANIFEST} ]; then
+    if [ -n "${COPY_LIC_MANIFEST}" ]; then
         mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
         cp ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
-        if [ -n ${COPY_LIC_DIRS} ]; then
+        if [ -n "${COPY_LIC_DIRS}" ]; then
             for pkg in ${INSTALLED_PKGS}; do
                 mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
                 for lic in `ls ${LICENSE_DIRECTORY}/${pkged_pn}`; do
-- 
1.7.1



