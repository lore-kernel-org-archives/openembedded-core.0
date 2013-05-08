Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Ua2At-0003im-Gb
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 13:04:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2013 03:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="334341448"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2013 03:46:39 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:50:17 +0300
Message-Id: <1368010217-6988-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] byacc: upgraded to 20130304
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
X-List-Received-Date: Wed, 08 May 2013 11:04:46 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../byacc/{byacc_20121003.bb => byacc_20130304.bb}              |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20121003.bb => byacc_20130304.bb} (73%)

diff --git a/meta/recipes-extended/byacc/byacc_20121003.bb b/meta/recipes-extended/byacc/byacc_20130304.bb
similarity index 73%
rename from meta/recipes-extended/byacc/byacc_20121003.bb
rename to meta/recipes-extended/byacc/byacc_20130304.bb
index c3c8744..da79833 100644
--- a/meta/recipes-extended/byacc/byacc_20121003.bb
+++ b/meta/recipes-extended/byacc/byacc_20130304.bb
@@ -1,5 +1,3 @@
-PR = "r0"
-
 # Sigh. This is one of those places where everyone licenses it differently. Someone
 # even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
 # "I've found no reliable source which states that byacc must bear a UCB copyright."
@@ -9,6 +7,5 @@ LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "26ba97e33a3bfaa311e2e5e1e078de55"
-SRC_URI[sha256sum] = "5afa4863550a7fc528e976cc33cc383bc0a9637ab95a6a594d2d5f6bf08dd1c5"
-
+SRC_URI[md5sum] = "e5eef96a33f55b724f2a957f0fa3b019"
+SRC_URI[sha256sum] = "dd8397174e088baf57cf4d344023a34b0758b7bbb8a1dfcdafdc234b8eb57924"
-- 
1.7.10.4



