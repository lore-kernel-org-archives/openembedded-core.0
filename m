Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 71AF371B0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 22:43:09 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id CF5D5B81F9D; Wed, 30 Nov 2016 23:43:06 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 23:43:03 +0100
Message-Id: <1480545786-5069-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/6] keyutils: new recipe (version 1.5.9)
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
X-List-Received-Date: Wed, 30 Nov 2016 22:43:09 -0000

Used by nfs-utils for nfsidmap, if available.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../nfs-utils/keyutils_1.5.9.bb                    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/keyutils_1.5.9.bb

diff --git a/meta/recipes-connectivity/nfs-utils/keyutils_1.5.9.bb b/meta/recipes-connectivity/nfs-utils/keyutils_1.5.9.bb
new file mode 100644
index 0000000..8430bb2
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/keyutils_1.5.9.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Linux Key Management Utilities"
+HOMEPAGE = "https://people.redhat.com/~dhowells/keyutils/"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE_${PN} = "GPLv2+"
+LICENSE_lib${PN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
+                    file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
+
+SRC_URI = "https://people.redhat.com/~dhowells/keyutils/${BP}.tar.bz2"
+SRC_URI[md5sum] = "7f8ac985c45086b5fbcd12cecd23cf07"
+SRC_URI[sha256sum] = "4da2c5552c688b65ab14d4fd40fbdf720c8b396d8ece643e040cf6e707e083ae"
+
+EXTRA_OEMAKE = " \
+    DESTDIR=${D} \
+    ETCDIR=${sysconfdir} \
+    BINDIR=${bindir} \
+    SBINDIR=${sbindir} \
+    SHAREDIR=${datadir}/${BPN} \
+    MANDIR=${mandir} \
+    INCLUDEDIR=${includedir} \
+    LIBDIR=${base_libdir} \
+    USRLIBDIR=${libdir} \
+    BUILDFOR= \
+"
+
+do_install() {
+    oe_runmake install
+}
+
+PACKAGES =+ "lib${PN}"
+
+FILES_lib${PN} = "${base_libdir}/lib*${SOLIBS}"
-- 
2.7.4


