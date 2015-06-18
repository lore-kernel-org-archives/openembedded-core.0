Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 601DA75A27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:36:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804171"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:36:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:50 +0300
Message-Id: <4249712b425aac884a3d8e01b462d9b21cdd92b2.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 12/21] p11-kit: add a recipe from meta-oe
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
X-List-Received-Date: Thu, 18 Jun 2015 12:36:03 -0000

p11-kit is a dependency of gcr (which is a dependency of epiphany)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
new file mode 100644
index 0000000..7ad9626e
--- /dev/null
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
+
+inherit autotools gettext pkgconfig
+
+DEPENDS = "libtasn1 libffi"
+
+SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "4e9bea1106628ffb820bdad24a819fac"
+SRC_URI[sha256sum] = "ef3a339fcf6aa0e32c8c23f79ba7191e57312be2bda8b24e6d121c2670539a5c"
+
+FILES_${PN}-dev += " \
+    ${libdir}/p11-kit-proxy.so \
+    ${libdir}/pkcs11/p11-kit-trust.so \
+"
+FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
+FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
-- 
2.1.4


