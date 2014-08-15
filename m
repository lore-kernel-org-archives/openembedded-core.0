Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 908CC70D90
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 19:46:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2014 12:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,872,1400050800"; d="scan'208";a="585463587"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2014 12:45:33 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com
Date: Fri, 15 Aug 2014 12:49:00 -0700
Message-Id: <f7005d8cdc8350910287333d533876982d613836.1408131949.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1408131949.git.nitin.a.kamble@intel.com>
References: <cover.1408131949.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] grub_2.00: strip the sparc64 files from building
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
X-List-Received-Date: Fri, 15 Aug 2014 19:46:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Avoid building and packaging of sparc64 specific files in the x86 builds.

Fixes Bug:
[YOCTO #6427]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...rub2-remove-sparc64-setup-from-x86-builds.patch | 104 +++++++++++++++++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |   3 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch

diff --git a/meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch b/meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch
new file mode 100644
index 0000000..6259a1a
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-2.00/grub2-remove-sparc64-setup-from-x86-builds.patch
@@ -0,0 +1,104 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+remove the grub-sparc64-setup files from the x86 builds.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+--- a/Makefile.util.am	2014-08-15 11:41:02.441011278 -0700
++++ b/Makefile.util.am	2014-08-15 11:44:26.245021142 -0700
+@@ -4692,9 +4692,9 @@
+ endif
+ 
+ if COND_emu
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4715,9 +4715,9 @@
+ endif
+ 
+ if COND_i386_pc
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4738,9 +4738,9 @@
+ endif
+ 
+ if COND_i386_efi
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4761,9 +4761,9 @@
+ endif
+ 
+ if COND_i386_qemu
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4784,9 +4784,9 @@
+ endif
+ 
+ if COND_i386_coreboot
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4807,9 +4807,9 @@
+ endif
+ 
+ if COND_i386_multiboot
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4830,9 +4830,9 @@
+ endif
+ 
+ if COND_i386_ieee1275
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
+@@ -4853,9 +4853,9 @@
+ endif
+ 
+ if COND_x86_64_efi
+-sbin_PROGRAMS += grub-sparc64-setup
++sbin_PROGRAMS +=
+ if COND_MAN_PAGES
+-man_MANS += grub-sparc64-setup.8
++man_MANS +=
+ 
+ grub-sparc64-setup.8: grub-sparc64-setup
+ 	chmod a+x grub-sparc64-setup
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 3c1ec0b..ddc0722 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "autogen-native flex-native bison-native xz"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
@@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://fix-issue-with-flex-2.5.37.patch \
           file://grub-2.00-add-oe-kernel.patch \
           file://fix-endianness-problem.patch \
+          file://grub2-remove-sparc64-setup-from-x86-builds.patch \
           "
 
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
-- 
1.8.1.4


