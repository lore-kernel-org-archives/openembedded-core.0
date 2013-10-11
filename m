Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6D06B6D057
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506440"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:18 -0700
Message-Id: <3a89a2c8d9cc9a29a529338f671928ce4d4e1133.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 12/18] tzdata: Update to 2013g
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 15:27:31 -0000

Add the README to LIC_FILES_CHKSUM and update LICESE since it now
mentions that some files are licensed under BSD

(From OE-Core rev: 1b9d54e446ba1e7f89d2cc19ba4ff4b008715fbc)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/tzdata/{tzdata_2013d.bb => tzdata_2013g.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2013d.bb => tzdata_2013g.bb} (96%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2013d.bb b/meta/recipes-extended/tzdata/tzdata_2013g.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2013d.bb
rename to meta/recipes-extended/tzdata/tzdata_2013g.bb
index c0f1506..a2f6c63 100644
--- a/meta/recipes-extended/tzdata/tzdata_2013d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013g.bb
@@ -1,8 +1,9 @@
 DESCRIPTION = "Timezone data"
 HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
 SECTION = "base"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
+LICENSE = "PD & BSD"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234 \
+                    file://README;md5=0b7570113550eb5d30aa4bd220964b8f"
 DEPENDS = "tzcode-native"
 
 inherit allarch
@@ -14,8 +15,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "65b6818162230fc02f86f293376c73df"
-SRC_URI[tzdata.sha256sum] = "cd1c96f0676e0edceebc6a418a2222ffb05becb41180dd9f847b9c7cef303b04"
+SRC_URI[tzdata.md5sum] = "76dbc3b5a81913fc0d824376c44a5d15"
+SRC_URI[tzdata.sha256sum] = "b6cdd3998dcc732a6ae5e101e1394f9d4d6dff68bd48a8fb78c44c2b997d3a4f"
 
 S = "${WORKDIR}"
 
-- 
1.8.3.1


