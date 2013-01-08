Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsW4W-0005XM-G4
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:06:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2013 01:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="243361680"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2013 01:51:03 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 11:54:17 +0200
Message-Id: <1357638857-4888-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] byacc: updated to 20121003
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
X-List-Received-Date: Tue, 08 Jan 2013 10:06:21 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../byacc/{byacc_20120526.bb => byacc_20121003.bb}              |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20120526.bb => byacc_20121003.bb} (73%)

diff --git a/meta/recipes-extended/byacc/byacc_20120526.bb b/meta/recipes-extended/byacc/byacc_20121003.bb
similarity index 73%
rename from meta/recipes-extended/byacc/byacc_20120526.bb
rename to meta/recipes-extended/byacc/byacc_20121003.bb
index 3e83813..c3c8744 100644
--- a/meta/recipes-extended/byacc/byacc_20120526.bb
+++ b/meta/recipes-extended/byacc/byacc_20121003.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r0"
 
 # Sigh. This is one of those places where everyone licenses it differently. Someone
 # even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
@@ -9,5 +9,6 @@ LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "d8a9959f784205092762eb29426bdf23"
-SRC_URI[sha256sum] = "be05856b039bc9eb95a93cf89ac381de4fc6bb91d236c6b130e8b1daeb6075d6"
+SRC_URI[md5sum] = "26ba97e33a3bfaa311e2e5e1e078de55"
+SRC_URI[sha256sum] = "5afa4863550a7fc528e976cc33cc383bc0a9637ab95a6a594d2d5f6bf08dd1c5"
+
-- 
1.7.10.4



