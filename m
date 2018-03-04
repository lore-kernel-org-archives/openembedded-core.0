Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 4088378A4F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:42:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 04:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,422,1515484800"; d="scan'208";a="179744478"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 04:42:22 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 04:41:50 -0800
Message-Id: <33ac1c7b856b09d1f12d7bbf13dd9343cf27a867.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/7] libtest-needs-perl: add 0.002005
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
X-List-Received-Date: Sun, 04 Mar 2018 12:42:20 -0000

Skip tests when modules not available

* Dependency for ptest of liburi-perl

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/libtest-needs-perl_0.002005.bb            | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb

diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb
new file mode 100644
index 0000000000..e5ab7a33c7
--- /dev/null
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Skip tests when modules not available"
+DESCRIPTION = "Skip test scripts if modules are not available. \
+The requested modules will be loaded, and optionally have their versions \
+checked. If the module is missing, the test script will be skipped. Modules \
+that are found but fail to compile will exit with an error rather than skip."
+
+HOMEPAGE = "https://metacpan.org/release/Test-Needs"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+CPAN_NAME = "Test-Needs"
+CPAN_AUTHOR = "HAARG"
+
+LIC_FILES_CHKSUM = "file://README;md5=3f3ccd21a0a48aa313db212cc3b1bc09;beginline=81;endline=82"
+
+DEPENDS += "perl"
+
+SRC_URI = "http://www.cpan.org/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_NAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "356634a56c99282e8059f290f5d534c8"
+SRC_URI[sha256sum] = "5a4f33983586edacdbe00a3b429a9834190140190dab28d0f873c394eb7df399"
+
+S = "${WORKDIR}/${CPAN_NAME}-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN}-ptest += "perl-module-test-more"
+
+BBCLASSEXTEND = "native"
-- 
2.14.3


