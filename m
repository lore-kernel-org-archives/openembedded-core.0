Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Swpbr-00007L-Ou
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 09:14:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2012 00:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176057323"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 02 Aug 2012 00:02:30 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:04:15 +0300
Message-Id: <1343891055-8558-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] tzdata: Upgrade tzdata to upstream 2012d
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
X-List-Received-Date: Thu, 02 Aug 2012 07:14:16 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../tzdata/{tzdata_2012c.bb => tzdata_2012d.bb}    |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2012c.bb => tzdata_2012d.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012c.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2012c.bb
rename to meta/recipes-extended/tzdata/tzdata_2012d.bb
index bce787f..605bf24 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012c.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Timezone data"
 HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
 SECTION = "base"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://asia;beginline=3;endline=4;md5=06468c0e84ef4d4c97045a4a29b08234"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r1"
+PR = "r0"
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
@@ -14,8 +14,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "cfdc2710bd05c26dbd624441d57028f6"
-SRC_URI[tzdata.sha256sum] = "33e19e1dd27bda5239812587d72971509a15b59baff7abd692b77ff66f168a82"
+SRC_URI[tzdata.md5sum] = "fc0f54b76054800394f8c366ea1eeea7"
+SRC_URI[tzdata.sha256sum] = "46c0e92a7aa89c3cfe571b585ceb6958bb444604aea3e09587f2cbe474c95575"
 
 S = "${WORKDIR}"
 
-- 
1.7.9.5



