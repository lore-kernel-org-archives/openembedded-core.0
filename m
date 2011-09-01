Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QzGoZ-00060e-7z
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 01:36:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Sep 2011 16:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="44313353"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.3])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2011 16:31:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2011 16:31:53 -0700
Message-Id: <4a78e0ea729f6518bce3b2acfeb795834af6f038.1314919495.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314919495.git.sgw@linux.intel.com>
References: <cover.1314919495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314919495.git.sgw@linux.intel.com>
References: <cover.1314919495.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] tzcode: Update to 2011i
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
X-List-Received-Date: Thu, 01 Sep 2011 23:36:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...code-native_2011g.bb => tzcode-native_2011i.bb} |   10 +++++-----
 .../tzdata/{tzdata_2011h.bb => tzdata_2011i.bb}    |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2011g.bb => tzcode-native_2011i.bb} (56%)
 rename meta/recipes-extended/tzdata/{tzdata_2011h.bb => tzdata_2011i.bb} (97%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
similarity index 56%
rename from meta/recipes-extended/tzcode/tzcode-native_2011g.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2011i.bb
index c4ed0ec..0cdf400 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2011g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
@@ -5,12 +5,12 @@ PR = "r0"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
 
 SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://elsie.nci.nih.gov/pub/tzdata2011h.tar.gz;name=tzdata"
+           ftp://elsie.nci.nih.gov/pub/tzdata2011i.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "ecb564279b28c5b184421c525d997d6c"
-SRC_URI[tzcode.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
-SRC_URI[tzdata.md5sum] = "546d27b6c1e5e1097bd512651815017f"
-SRC_URI[tzdata.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
+SRC_URI[tzcode.md5sum] = "cf7f4335b7c8682899fa2814e711c1b2"
+SRC_URI[tzcode.sha256sum] = "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
+SRC_URI[tzdata.md5sum] = "c7a86ec34f30f8d6aa77ef94902a3047"
+SRC_URI[tzdata.sha256sum] = "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2011h.bb b/meta/recipes-extended/tzdata/tzdata_2011i.bb
similarity index 97%
rename from meta/recipes-extended/tzdata/tzdata_2011h.bb
rename to meta/recipes-extended/tzdata/tzdata_2011i.bb
index 284cc5c..f507b7e 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011h.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011i.bb
@@ -14,8 +14,8 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
 
 SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "546d27b6c1e5e1097bd512651815017f"
-SRC_URI[tzdata.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
+SRC_URI[tzdata.md5sum] = "c7a86ec34f30f8d6aa77ef94902a3047"
+SRC_URI[tzdata.sha256sum] = "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
 
 S = "${WORKDIR}"
 
-- 
1.7.6



