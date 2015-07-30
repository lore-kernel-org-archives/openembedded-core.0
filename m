Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 25DD0764A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:27:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 07:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="616054497"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 30 Jul 2015 07:27:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:27:30 +0300
Message-Id: <21ede853e46b113f6a93bc48e376d239ccce35c6.1438265949.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/21] libyaml: add a recipe from meta-oe
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
X-List-Received-Date: Thu, 30 Jul 2015 14:27:19 -0000

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


