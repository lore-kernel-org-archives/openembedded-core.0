Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA7E71FE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989746"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:27 -0800
Message-Id: <a64dae89f6a5064e437efb2e79d8bde33294a07e.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 02/19] btrfs: Update to 3.17 version
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 0eed13b..ef85057 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,13 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
-SRCREV = "24cf4d8c3ee924b474f68514e0167cc2e602a48d"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git \
-           file://nodocs.patch"
+SRCREV = "44cdb62d3478c834f41c87ea79d261b9c8982dce"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 S = "${WORKDIR}/git"
 
 PV = "3.14.2+git${SRCPV}"
 
+EXTRA_OEMAKE += "DISABLE_DOCUMENTATION=1"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.8.3.1


