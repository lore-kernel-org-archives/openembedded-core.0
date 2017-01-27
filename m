Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4F67F774C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 27 Jan 2017 12:43:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="36469941"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 12:43:16 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 64E316A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:18 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:47 +0200
Message-Id: <6e126dab238cea495384d8b458c84c12796e714d.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 10/11] wic-tools: add dependency to systemd-boot
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:16 -0000

Added systemd-boot to the list of dependencies of wic-tools
as wic bootimg-efi plugin depends on it.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-core/meta/wic-tools.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index aa09c82..1d9ea9c 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -3,8 +3,8 @@ SUMMARY = "A meta recipe to build native tools used by wic."
 LICENSE = "MIT"
 
 DEPENDS = "parted-native syslinux-native gptfdisk-native dosfstools-native mtools-native bmap-tools-native grub-efi-native cdrtools-native"
-DEPENDS_append_x86 = " syslinux grub-efi"
-DEPENDS_append_x86-64 = " syslinux grub-efi"
+DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
+DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
 
 INHIBIT_DEFAULT_DEPS = "1"
 inherit nopackages
-- 
2.1.4


