Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 16FFB6B5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:40 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808025"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:30 +0100
Message-Id: <dd5b55f4d3f2ef9218001d44fbb3d848dbc91c1a.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] yasm: add from meta-oe and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 08:59:40 -0000

This is needed for x264. Enabling it for libav also improves performance
on x86 and x86-64. Two minor changes from the meta-oe recipe:

* Set SUMMARY instead of DESCRIPTION
* Drop setting of S - it was setting it to the same as the default

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/yasm/yasm_1.2.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/yasm/yasm_1.2.0.bb

diff --git a/meta/recipes-devtools/yasm/yasm_1.2.0.bb b/meta/recipes-devtools/yasm/yasm_1.2.0.bb
new file mode 100644
index 0000000..cc7459b
--- /dev/null
+++ b/meta/recipes-devtools/yasm/yasm_1.2.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
+LICENSE = "BSD"
+HOMEPAGE = "http://www.tortall.net/projects/yasm/"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=26c9f3d11f88911950f9ff62189d3d4f"
+
+SRC_URI = "http://www.tortall.net/projects/yasm/releases/yasm-${PV}.tar.gz"
+SRC_URI[md5sum] = "4cfc0686cf5350dd1305c4d905eb55a6"
+SRC_URI[sha256sum] = "768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.2


