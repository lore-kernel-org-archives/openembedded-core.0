Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S266A-00027t-Is
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056434"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:22 -0800
Message-Id: <3e603331a3810e74dc6dfac59558660273dd963a.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 04/13] file: Update to version 5.11
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../file/{file_5.10.bb => file_5.11.bb}            |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/file/{file_5.10.bb => file_5.11.bb} (85%)

diff --git a/meta/recipes-devtools/file/file_5.10.bb b/meta/recipes-devtools/file/file_5.11.bb
similarity index 85%
rename from meta/recipes-devtools/file/file_5.10.bb
rename to meta/recipes-devtools/file/file_5.11.bb
index db247a7..540c2b2 100644
--- a/meta/recipes-devtools/file/file_5.10.bb
+++ b/meta/recipes-devtools/file/file_5.11.bb
@@ -10,15 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=6a7382872edb68d33e1a9398b6e03
 
 DEPENDS = "zlib file-native"
 DEPENDS_virtclass-native = "zlib-native"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://fix_version_check.patch \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "4cea34b087b060772511e066e2038196"
-SRC_URI[sha256sum] = "73ae51889006b1ddb95db729237d411eb8d353884dfb149f0b4427d314aff68a"
+SRC_URI[md5sum] = "16a407bd66d6c7a832f3a5c0d609c27b"
+SRC_URI[sha256sum] = "c70ae29a28c0585f541d5916fc3248c3e91baa481f63d7ccec53d1534cbcc9b7"
 
 inherit autotools
 
-- 
1.7.7.6



