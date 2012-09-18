Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TDuCU-0003Nk-3l
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:34:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2012 02:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,441,1344236400"; d="scan'208";a="223464685"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2012 02:21:56 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 12:21:46 +0300
Message-Id: <79d771f0a1c751d310b5e744b748c00c60a4cf9b.1347959838.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347959838.git.laurentiu.palcu@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1347959838.git.laurentiu.palcu@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/4] SDK: remove references to Poky distro from tarball installer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 09:34:38 -0000

The installer should be generic.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 78669cf..f20a6ac 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -118,7 +118,7 @@ fakeroot create_shar() {
 
 DEFAULT_INSTALL_DIR="${SDKPATH}"
 
-echo -n "Enter target directory for Poky SDK (default: $DEFAULT_INSTALL_DIR): "
+echo -n "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
 read target_sdk_dir
 
 if [ "$target_sdk_dir" = "" ]; then
@@ -132,7 +132,7 @@ else
 	target_sdk_dir=$(readlink -m $target_sdk_dir)
 fi
 
-echo -n "You are about to install Poky SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+echo -n "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
 read answer
 
 if [ "$answer" = "" ]; then
-- 
1.7.9.5



