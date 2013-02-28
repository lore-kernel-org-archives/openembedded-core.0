Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UB2iI-00058s-Dy
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 13:35:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2013 04:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="293012331"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2013 04:19:30 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 14:22:53 +0200
Message-Id: <1362054173-21832-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] git: updated to 1.8.1.4
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
X-List-Received-Date: Thu, 28 Feb 2013 12:35:58 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/git/{git_1.8.1.2.bb => git_1.8.1.4.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.1.2.bb => git_1.8.1.4.bb} (68%)

diff --git a/meta/recipes-devtools/git/git_1.8.1.2.bb b/meta/recipes-devtools/git/git_1.8.1.4.bb
similarity index 68%
rename from meta/recipes-devtools/git/git_1.8.1.2.bb
rename to meta/recipes-devtools/git/git_1.8.1.4.bb
index 200a79e..487a333 100644
--- a/meta/recipes-devtools/git/git_1.8.1.2.bb
+++ b/meta/recipes-devtools/git/git_1.8.1.4.bb
@@ -3,8 +3,8 @@ require git.inc
 PR = "r0"
 
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "9f912370a1831c851ff8df171e8a7218"
-SRC_URI[sha256sum] = "07d210a37deec465b4d00e4907c732dee5c5d23c7d90c1b582e7ab754bcf24c7"
+SRC_URI[md5sum] = "60f32ef4a6b3fa2143b81a28704333ed"
+SRC_URI[sha256sum] = "cbb88cfab66c88189ac93a9cfdeebdd2b2fdf833848fbec0c566278889c17de1"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.10.4



