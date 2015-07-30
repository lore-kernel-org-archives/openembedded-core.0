Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09B607648C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:27:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 07:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="616054555"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 30 Jul 2015 07:27:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:27:35 +0300
Message-Id: <a96fcfa970dbb33d83ae169b81879e80007d2ac5.1438265949.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/21] p11-kit: add a recipe from meta-oe
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
X-List-Received-Date: Thu, 30 Jul 2015 14:27:21 -0000

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


