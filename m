Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVSyL-0000e8-QC
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 20:04:06 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2011 10:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,592,1315206000"; d="scan'208";a="42203114"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2011 10:56:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 10:56:17 -0800
Message-Id: <6095ba4320f528d6dbebbbe7ff1ec8c6cbf86f12.1322592782.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322592782.git.sgw@linux.intel.com>
References: <cover.1322592782.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322592782.git.sgw@linux.intel.com>
References: <cover.1322592782.git.sgw@linux.intel.com>
Subject: [RFC PATCH 2/4] openssl-0.9.8: move parallel-make fix to 0.9.8
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
X-List-Received-Date: Tue, 29 Nov 2011 19:04:06 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |    1 -
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index f3ada13..f1c1961 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 DEPENDS = "perl-native-runtime"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
-           file://parallel-make-fix.patch \
           "
 S = "${WORKDIR}/openssl-${PV}"
 
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index 555bacf..4c6cad3 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -25,6 +25,7 @@ SRC_URI[md5sum] = "0352932ea863bc02b056cda7c9ac5b79"
 SRC_URI[sha256sum] = "42b2368f786b05ed3be846838dce126b4e8e3dba8fb2e0ce83102df28c102fad"
 
 SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch"
+            file://shared-libs.patch \
+            file://parallel-make-fix.patch"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.4



