Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TscJB-0004wA-Jy
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:45:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jan 2013 08:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,432,1355126400"; d="scan'208";a="241342882"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 08 Jan 2013 08:30:35 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 18:33:48 +0200
Message-Id: <1357662828-3148-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-smartpm: add dependency on python-pprint
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
X-List-Received-Date: Tue, 08 Jan 2013 16:45:58 -0000

smart's "config" command uses the Python pprint module. If it is not
present, "config" fails with this error:

 #############
 # smart config --help
 error: Invalid command 'config'
 #############

This patch adds a dependency on python-pprint which fixes the error.
Tested on qemux86/core-image-sato-sdk.

[YOCTO #3643]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/python/python-smartpm_1.4.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index f3dd399..4d0f96b 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r6"
+PR = "r7"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -113,7 +113,7 @@ RDEPENDS_smartpm = "${PN}"
 
 RDEPENDS_${PN} += "${PN}-backend-rpm python-codecs python-textutils python-xml python-fcntl \
                    python-pickle python-crypt python-compression python-shell \
-                   python-resource python-netclient python-threading python-unixadmin"
+                   python-resource python-netclient python-threading python-unixadmin python-pprint"
 RDEPENDS_${PN}_class-native = ""
 
 RDEPENDS_${PN}-backend-rpm = "python-rpm"
-- 
1.7.10.4



