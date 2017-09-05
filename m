Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E8DEE7780A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 20:22:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 05 Sep 2017 13:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,481,1498546800"; d="scan'208";a="1169383835"
Received: from swold-mobl2.jf.intel.com ([10.24.9.251])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2017 13:22:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  5 Sep 2017 13:22:54 -0700
Message-Id: <20170905202254.31830-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] systemtap: Bump SRCREV for 4.12 Linux kernel support
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
X-List-Received-Date: Tue, 05 Sep 2017 20:22:54 -0000

This SRCREV bump brings in support for the 4.12 Linux Kernel, this kernel
also has some newer CONFIG settings. The newer DEBUG_INFO and DEBUG_INFO_DWARF4
settings can be used with systemtap to get the full information.  We do not
normally enabled these for a 'production' (standard) kernel, but can be
enabled via menuconfig.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index a6aedd38a6..ea2d2c0d1d 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,6 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "b8ea350dc13adb6190d9044a5b80110a4c441270"
+SRCREV = "45d0e7a09a15a21078d0ebf2db5175ed9e87014e"
 PV = "3.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-- 
2.11.0


