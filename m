Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sd0fO-0001vf-3G
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:59:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 07:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153552637"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2012 07:48:22 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2012 17:48:16 +0300
Message-Id: <1339166898-11667-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339166898-11667-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/4] tzdata: upgrade to 2012c
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
X-List-Received-Date: Fri, 08 Jun 2012 14:59:58 -0000

Other changes:
	- the licence header shifted one line down, hence the start/end lines
	  used to compute the MD5 sum were incremented by 1;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../tzdata/{tzdata_2012b.bb => tzdata_2012c.bb}    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2012b.bb => tzdata_2012c.bb} (97%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012b.bb b/meta/recipes-extended/tzdata/tzdata_2012c.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2012b.bb
rename to meta/recipes-extended/tzdata/tzdata_2012c.bb
index 7cb1c23..fab8e01 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012b.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012c.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Timezone data"
 HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
 SECTION = "base"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
+LIC_FILES_CHKSUM = "file://asia;beginline=3;endline=4;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
 PR = "r0"
@@ -14,8 +14,8 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "0615fd29def380a917e528433c820368"
-SRC_URI[tzdata.sha256sum] = "2f9f8e2d1ae087be5917f60c3946e8dc3fe1068d7738c3395f2125135309e745"
+SRC_URI[tzdata.md5sum] = "cfdc2710bd05c26dbd624441d57028f6"
+SRC_URI[tzdata.sha256sum] = "33e19e1dd27bda5239812587d72971509a15b59baff7abd692b77ff66f168a82"
 
 S = "${WORKDIR}"
 
-- 
1.7.9.5



