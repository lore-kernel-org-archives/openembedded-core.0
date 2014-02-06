Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6589B6E954
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:30:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785174"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:29 +0200
Message-Id: <ee2618a9ed08ea884dbd4618bd0ac63b9230f12d.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 10/13] presentproto_git.bb: add recipe
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:01 -0000

This is needed by xserver-xorg 1.15. Since presentproto has just been
created, use a git recipe because the initial version is missing some
fixes, license file, etc.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-proto/presentproto_git.bb                 |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/presentproto_git.bb

diff --git a/meta/recipes-graphics/xorg-proto/presentproto_git.bb b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
new file mode 100644
index 0000000..007824f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
@@ -0,0 +1,22 @@
+require xorg-proto-common.inc
+
+SUMMARY = "The Present extension provides a way for applications to update their \
+           window contents from a pixmap in a well defined fashion, synchronizing \
+           with the display refresh and potentially using a more efficient \
+           mechanism than copying the contents of the source pixmap.\
+          "
+
+DESCRIPTION = "This package provides the basic headers for the X Window \
+System."
+
+LICENSE = "GPLv2"
+
+SRCREV = "24f3a56e541b0a9e6c6ee76081f441221a120ef9"
+PV = "1.0+git${SRCPV}"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
+
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/presentproto"
+S = "${WORKDIR}/git"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


