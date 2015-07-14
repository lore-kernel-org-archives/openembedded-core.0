Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39D0575877
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 04:12:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jul 2015 21:12:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,477,1432623600"; d="scan'208";a="762725450"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2015 21:12:16 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 20:07:10 +0000
Message-Id: <7f18159f085ddebd9b4dd58912b83c83f092b10e.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: leonardo.sandoval.gonzalez@intel.com
Subject: [PATCH V3 1/3] iasl: Recipe taken from the luv-yocto repository
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
X-List-Received-Date: Wed, 15 Jul 2015 04:12:22 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Taken from [1]. ACPICA is licensed under two main licenses:
1) An Intel license (Intel-ACPI) and 2) a dual GPL/BSP license. This
recipe uses the latter.

[1] https://github.com/01org/luv-yocto/tree/master/meta-luv/recipes-extended/iasl

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-extended/iasl/iasl_20150515.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb

diff --git a/meta/recipes-extended/iasl/iasl_20150515.bb b/meta/recipes-extended/iasl/iasl_20150515.bb
new file mode 100644
index 0000000..b6b9050
--- /dev/null
+++ b/meta/recipes-extended/iasl/iasl_20150515.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
+HOMEPAGE = "http://www.acpica.org/"
+LICENSE = "GPLv2 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://source/include/acapps.h;beginline=7;endline=114;md5=9204ca6fc24d2e54f659ec512ea51f01"
+SECTION = "console/tools"
+PR="r1"
+
+DEPENDS="flex-native bison-native"
+
+SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c8c128b2d4859b52bc9c802faba2e908"
+SRC_URI[sha256sum] = "bfa1f296a3cc13421331dbaad3b62e0184678cc312104c3e8ac799ead0742c45"
+
+S="${WORKDIR}/acpica-unix-${PV}"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
+
+do_compile() {
+	make iasl
+}
+
+do_install() {
+	mkdir -p ${D}${prefix}/bin
+	cp ${S}/generate/unix/bin/iasl ${D}${prefix}/bin
+}
-- 
1.8.4.5


