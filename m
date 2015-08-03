Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7BFF073D29
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 08:38:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2015 01:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,600,1432623600"; d="scan'208";a="741002526"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2015 01:38:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 800246A4005;
	Mon,  3 Aug 2015 01:37:24 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 11:37:54 +0300
Message-Id: <1438591074-14488-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bmap-tools: v3.2 (initial commit)
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
X-List-Received-Date: Mon, 03 Aug 2015 08:38:14 -0000

Bmap-tools - tools to generate block map (AKA bmap) and flash images
using bmap. Bmaptool is a generic tool for creating the block map
(bmap) for a file and copying files using the block map.

The idea is that large file containing unused blocks, like raw system
image files, can be copied or flashed a lot faster with bmaptool than
with traditional tools like "dd" or "cp".

This package provides Python API, which can be used to generate
bmaps for Yocto images produced by bitbake and wic.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-extended/bmap-tools/bmap-tools_3.2.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-extended/bmap-tools/bmap-tools_3.2.bb

diff --git a/meta/recipes-extended/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-extended/bmap-tools/bmap-tools_3.2.bb
new file mode 100644
index 0000000..79a2aa9
--- /dev/null
+++ b/meta/recipes-extended/bmap-tools/bmap-tools_3.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Tools to generate block map (AKA bmap) and flash images using bmap."
+HOMEPAGE = "http://source.tizen.org/documentation/reference/bmaptool/bmap-tools-project"
+SECTION = "console/tools"
+LICENSE = "GPLv2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tgz"
+SRC_URI[md5sum] = "92cdad1cb4dfa0cca7176c8e22752616"
+SRC_URI[sha256sum] = "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02bf2d434"
+
+RDEPENDS_${PN} = "bzip2 gzip lzop pigz python tar xz"
+
+inherit setuptools
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


