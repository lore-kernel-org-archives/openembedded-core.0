Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tqniz-0002Pi-8j
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 17:32:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2013 08:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,403,1355126400"; d="scan'208";a="239587172"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 03 Jan 2013 08:17:50 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 18:21:03 +0200
Message-Id: <1357230063-14105-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] git: updated to 1.8.0.2
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
X-List-Received-Date: Thu, 03 Jan 2013 16:32:58 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/git/{git_1.7.7.bb => git_1.8.0.2.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_1.7.7.bb => git_1.8.0.2.bb} (59%)

diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtools/git/git_1.8.0.2.bb
similarity index 59%
rename from meta/recipes-devtools/git/git_1.7.7.bb
rename to meta/recipes-devtools/git/git_1.8.0.2.bb
index 6b6e04b..5e5a23e 100644
--- a/meta/recipes-devtools/git/git_1.7.7.bb
+++ b/meta/recipes-devtools/git/git_1.8.0.2.bb
@@ -1,12 +1,12 @@
 require git.inc
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "5d645884e688921e773186783b65ce33"
-SRC_URI[sha256sum] = "5a977bc01e4989b9928345e99aab15ce896cf5897c6e32eb449538574df377f6"
+SRC_URI[md5sum] = "1aca109d4a719fe5bc43d25927fbc7d9"
+SRC_URI[sha256sum] = "c06d5d29389e90583d16ec41d5be931593196f6842f9b14e910a0b5781c10e07"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
                  "
-
+EXTRA_OEMAKE += "NO_GETTEXT=1"
-- 
1.7.10.4



