Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B219E759D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:35:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:35:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804092"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:35:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:45 +0300
Message-Id: <eae033269851d7ec7bc19dcaa538025b6c8cc346.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 07/21] libyaml: add a recipe from meta-oe
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
X-List-Received-Date: Thu, 18 Jun 2015 12:35:57 -0000

libyaml is a dependency of ruby

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libyaml/libyaml_0.1.6.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/libyaml/libyaml_0.1.6.bb

diff --git a/meta/recipes-support/libyaml/libyaml_0.1.6.bb b/meta/recipes-support/libyaml/libyaml_0.1.6.bb
new file mode 100644
index 0000000..8a624f7
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml_0.1.6.bb
@@ -0,0 +1,20 @@
+SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
+DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
+a human-readable data serialization format. "
+HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+SECTION = "libs/devel"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+          "
+
+SRC_URI[md5sum] = "5fe00cda18ca5daeb43762b80c38e06e"
+SRC_URI[sha256sum] = "7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749"
+
+S = "${WORKDIR}/yaml-${PV}"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


