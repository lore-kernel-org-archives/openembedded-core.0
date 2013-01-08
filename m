Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsWJd-0007Q9-7m
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:21:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jan 2013 02:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="271224104"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2013 02:06:40 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 12:09:54 +0200
Message-Id: <1357639794-23810-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lsof: updated to 4.87
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
X-List-Received-Date: Tue, 08 Jan 2013 10:21:55 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-extended/lsof/{lsof_4.86.bb => lsof_4.87.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.86.bb => lsof_4.87.bb} (91%)

diff --git a/meta/recipes-extended/lsof/lsof_4.86.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
similarity index 91%
rename from meta/recipes-extended/lsof/lsof_4.86.bb
rename to meta/recipes-extended/lsof/lsof_4.87.bb
index e3f5ef3..2f425aa 100644
--- a/meta/recipes-extended/lsof/lsof_4.86.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "9f1cda41f35add068c7b81f873fa56b5"
-SRC_URI[sha256sum] = "13e52b8e87dddf1b2e219004e315d755c659217ce6ffc6a5f1102969f1c4dd0c"
+SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
+SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
-- 
1.7.10.4



