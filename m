Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1U0tvO-0006WG-Ae
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 14:11:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jan 2013 04:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,576,1355126400"; d="scan'208";a="197050276"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jan 2013 04:55:45 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 14:59:02 +0200
Message-Id: <1359637142-26041-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] git: updated to 1.8.1.2
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
X-List-Received-Date: Thu, 31 Jan 2013 13:11:35 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/git/{git_1.8.0.2.bb => git_1.8.1.2.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.0.2.bb => git_1.8.1.2.bb} (66%)

diff --git a/meta/recipes-devtools/git/git_1.8.0.2.bb b/meta/recipes-devtools/git/git_1.8.1.2.bb
similarity index 66%
rename from meta/recipes-devtools/git/git_1.8.0.2.bb
rename to meta/recipes-devtools/git/git_1.8.1.2.bb
index ae6fc41..200a79e 100644
--- a/meta/recipes-devtools/git/git_1.8.0.2.bb
+++ b/meta/recipes-devtools/git/git_1.8.1.2.bb
@@ -1,10 +1,10 @@
 require git.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "1aca109d4a719fe5bc43d25927fbc7d9"
-SRC_URI[sha256sum] = "c06d5d29389e90583d16ec41d5be931593196f6842f9b14e910a0b5781c10e07"
+SRC_URI[md5sum] = "9f912370a1831c851ff8df171e8a7218"
+SRC_URI[sha256sum] = "07d210a37deec465b4d00e4907c732dee5c5d23c7d90c1b582e7ab754bcf24c7"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.10.4



