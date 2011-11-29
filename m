Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8I-0005pP-4A
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419472"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:47 -0800
Message-Id: <53d3eb6c12353b8c501de19f395ee112df6b5934.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/23] tzdata/tzcode: Update tzdata to 2011n
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/tzcode/tzcode-native_2011i.bb |   11 ++++++-----
 .../tzdata/{tzdata_2011l.bb => tzdata_2011n.bb}    |    6 +++---
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011l.bb => tzdata_2011n.bb} (96%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011i.bb b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
index b8ccff0..a23a5d5 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
@@ -1,16 +1,17 @@
 DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 LICENSE = "PD"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
 
-SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2011n.tar.gz;name=tzdata"
 
 SRC_URI[tzcode.md5sum] = "cf7f4335b7c8682899fa2814e711c1b2"
 SRC_URI[tzcode.sha256sum] = "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
-SRC_URI[tzdata.md5sum] = "c7a86ec34f30f8d6aa77ef94902a3047"
-SRC_URI[tzdata.sha256sum] = "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
+SRC_URI[tzdata.md5sum] = "20dbfb28efa008ddbf6dd34601ea40fa"
+SRC_URI[tzdata.sha256sum] = "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bdea1d2385e38cd"
+
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2011l.bb b/meta/recipes-extended/tzdata/tzdata_2011n.bb
similarity index 96%
rename from meta/recipes-extended/tzdata/tzdata_2011l.bb
rename to meta/recipes-extended/tzdata/tzdata_2011n.bb
index 140f8ed..de9281a 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011l.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
@@ -12,10 +12,10 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-australia timezone-europe timezone-indian \
              timezone-iso3166.tab timezone-pacific timezone-zone.tab"
 
-SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "bae1b93673e1aef80186c90dfd493f1c"
-SRC_URI[tzdata.sha256sum] = "cb9fec68a19c9c3b900bb71f3ca20d0051a863f765387b52fc2d144a5bbb0c7d"
+SRC_URI[tzdata.md5sum] = "20dbfb28efa008ddbf6dd34601ea40fa"
+SRC_URI[tzdata.sha256sum] = "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bdea1d2385e38cd"
 
 S = "${WORKDIR}"
 
-- 
1.7.6.4



