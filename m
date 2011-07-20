Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDT-0001aO-FH
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753323"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:24 -0700
Message-Id: <5a6625fe8d65912f9b8752b708390201a61deea7.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 37/50] tzcode,tzdata: Update tzdata to 2011h
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:17 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/tzcode/tzcode-native_2011g.bb |    7 +++----
 .../tzdata/{tzdata_2011g.bb => tzdata_2011h.bb}    |    8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011g.bb => tzdata_2011h.bb} (96%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb b/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
index 95ba7ef..c4ed0ec 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
@@ -5,13 +5,12 @@ PR = "r0"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
 
 SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://elsie.nci.nih.gov/pub/tzdata2011g.tar.gz;name=tzdata"
+           ftp://elsie.nci.nih.gov/pub/tzdata2011h.tar.gz;name=tzdata"
 
 SRC_URI[tzcode.md5sum] = "ecb564279b28c5b184421c525d997d6c"
 SRC_URI[tzcode.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
-SRC_URI[tzdata.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[tzdata.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
-
+SRC_URI[tzdata.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2011g.bb b/meta/recipes-extended/tzdata/tzdata_2011h.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2011g.bb
rename to meta/recipes-extended/tzdata/tzdata_2011h.bb
index 1437e43..284cc5c 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011h.bb
@@ -5,17 +5,17 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r1"
+PR = "r0"
 
 RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz"
+SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
+SRC_URI[tzdata.md5sum] = "546d27b6c1e5e1097bd512651815017f"
+SRC_URI[tzdata.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
 
 S = "${WORKDIR}"
 
-- 
1.7.3.4



