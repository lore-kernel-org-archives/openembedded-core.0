Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdf-0003Yc-4D
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773824"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:33 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:03 +0200
Message-Id: <21cb8554fe94a484af046b522aba56321ebf90f5.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 04/17] tzdata: Upgrade to v2013a
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
X-List-Received-Date: Thu, 14 Mar 2013 18:12:29 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../tzdata/{tzdata_2012j.bb => tzdata_2013a.bb}    |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013a.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012j.bb b/meta/recipes-extended/tzdata/tzdata_2013a.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2012j.bb
rename to meta/recipes-extended/tzdata/tzdata_2013a.bb
index 25220cc..2543ca0 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012j.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013a.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r3"
+PR = "r0"
 
 inherit allarch
 
@@ -16,8 +16,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "ba2f92ae7ad099090e8f86cff2f2d799"
-SRC_URI[tzdata.sha256sum] = "4b6a3c2831bdbb68ab1a1bf906bcf11d18ab78009713a0339da6fe96b6afceaa"
+SRC_URI[tzdata.md5sum] = "2a9b3208ed91652dd554e4d104662e67"
+SRC_URI[tzdata.sha256sum] = "ed9f273f52d5df9ec09fdcf6684176bbdc86d0fbafcbc27b97e5a9c103024afc"
 
 S = "${WORKDIR}"
 
-- 
1.7.9.5



