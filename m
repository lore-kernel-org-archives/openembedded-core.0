Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZdJy-0001ZK-Pv
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 10:32:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 May 2013 01:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="333733667"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by fmsmga002.fm.intel.com with ESMTP; 07 May 2013 01:13:19 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 11:16:57 +0300
Message-Id: <1367914617-16915-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] git: upgrated to 1.8.2.2
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
X-List-Received-Date: Tue, 07 May 2013 08:32:31 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/git/{git_1.8.1.4.bb => git_1.8.2.2.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_1.8.1.4.bb => git_1.8.2.2.bb} (65%)

diff --git a/meta/recipes-devtools/git/git_1.8.1.4.bb b/meta/recipes-devtools/git/git_1.8.2.2.bb
similarity index 65%
rename from meta/recipes-devtools/git/git_1.8.1.4.bb
rename to meta/recipes-devtools/git/git_1.8.2.2.bb
index 487a333..7fc2b29 100644
--- a/meta/recipes-devtools/git/git_1.8.1.4.bb
+++ b/meta/recipes-devtools/git/git_1.8.2.2.bb
@@ -1,10 +1,8 @@
 require git.inc
 
-PR = "r0"
-
 SRC_URI = "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
-SRC_URI[md5sum] = "60f32ef4a6b3fa2143b81a28704333ed"
-SRC_URI[sha256sum] = "cbb88cfab66c88189ac93a9cfdeebdd2b2fdf833848fbec0c566278889c17de1"
+SRC_URI[md5sum] = "f7407df37facf579dcaa979266cc3c59"
+SRC_URI[sha256sum] = "020de38eda302bb6e1be460f7499211948193b306beab4e1a520ffc6f7294794"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.10.4



