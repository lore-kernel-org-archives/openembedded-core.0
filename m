Return-Path: <todd.e.brandt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D4B2970F28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 22:44:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2014 15:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,557,1406617200"; d="scan'208";a="602443839"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO linux.intel.com)
	([10.255.13.38])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2014 15:44:01 -0700
Date: Fri, 19 Sep 2014 15:44:01 -0700
From: Todd E Brandt <todd.e.brandt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140919224401.GA24684@linux.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] Phoronix Test Suite package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: todd.e.brandt@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Sep 2014 22:44:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is the package recipe for the phoronix test suite v5.2.1. The
tool is for benchmarking and testing of the system. 

Signed-off-by: Todd Brandt <todd.e.brandt@linux.intel.com>
----
 meta-oe/recipes-devtools/phoronix-test-suite/phoronix-test-suite_5.2.1.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta-oe/recipes-devtools/phoronix-test-suite/phoronix-test-suite_5.2.1.bb b/meta-oe/recipes-devtools/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
new file mode 100644
index 0000000..f9f5d65
--- /dev/null
+++ b/meta-oe/recipes-devtools/phoronix-test-suite/phoronix-test-suite_5.2.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Phoronix Test Suite"
+DESCRIPTION = "The Phoronix Test Suite is designed to carry out both qualitative \
+and quantitative benchmarks in a clean, reproducible, and easy-to-use manner."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://../phoronix-test-suite/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+RDEPENDS_${PN} = "php-cli"
+SECTION = "tests"
+
+SRC_URI = "http://www.phoronix-test-suite.com/releases/phoronix-test-suite-5.2.1.tar.gz"
+SRC_URI[md5sum] = "51e52d883710dc516c5494bd1c377219"
+SRC_URI[sha256sum] = "1186f460691e2fe7a07df5edb8d8ed1ac0c65327512e646da2b2e3a60dda6cd9"
+S = "${WORKDIR}/phoronix-test-suite"
+
+do_install() {
+	DESTDIR=${D} ./install-sh /usr
+}
+
+FILES_${PN} += " \
+	${datadir}/phoronix-test-suite \
+	${datadir}/appdata/phoronix-test-suite.appdata.xml \
+	${datadir}/icons/hicolor/48x48/apps/phoronix-test-suite.png \
+	${datadir}/icons/hicolor/64x64/mimetypes/application-x-openbenchmarking.png \
+	${datadir}/mime/packages/openbenchmarking-mime.xml \
+"

