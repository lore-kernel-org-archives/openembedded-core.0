Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EB6CD4F20
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2377.1762384601560446370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lU4yuAgU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e6m8QdlS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564ee1da-80f310ee-948f-45e4-8ef4-a8fbe27c5635-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FpgGQO752PKUGNtWaqRna2hWHPF1NHDMAkX2Z96Xz9g=;
	b=lU4yuAgUsGePjEHxOBdQTxweJsn/qnQvGOuprqYzezLblXMQGJtj2wqWcRR8Th3e
	BUTgoWIrva8pSWNGwl58AhVfYgO4tTxTm1DReJzeTDeG3uyxlnp5fty9Acuix5NaFwY
	emlfa0fkryltf6IcKKOVnwhgDk9/fiz2t4q+21ow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FpgGQO752PKUGNtWaqRna2hWHPF1NHDMAkX2Z96Xz9g=;
	b=e6m8QdlSWblVEiYX6z+Tb0bue2D+QLLUTKpI9McGZKAdL6GP+Vz3UnuCOXKVMwNb
	xgc/Cb5QI/Ty/kTb8C2v9Nrr+Yfh6AN4GxG+vbtM2lx03gusHupOrvjUtzdFabjJG6f
	o74qpJ424cSRZXpSCo9V8JrQkxX6L2v8Zb22o524=
Content-Type: multipart/mixed; boundary="===============6940879168463985345=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kexec-tools: upgrading to 2.0.32 SUCCEEDED
Message-ID: <0101019a564ee1da-80f310ee-948f-45e4-8ef4-a8fbe27c5635-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225896

--===============6940879168463985345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kexec-tools* to *2.0.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kexec-tools-upgrade-2.0.31-2.0.32.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 5aa0eee68666c37381079efbc4339da1bc5c65a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 21:29:36 +0000
Subject: [PATCH] kexec-tools: upgrade 2.0.31 -> 2.0.32

---
 ...nt-base-match-pinned-section-address.patch | 62 -------------------
 ...bled-check-if-kaslr-seed-dtb-propert.patch |  2 +-
 ...-add-MFD_NOEXEC_SEAL-flag-explicitly.patch |  4 +-
 ...powerpc-change-the-memory-size-limit.patch |  2 +-
 ...-ppc-fs2dt-Match-function-signatures.patch |  2 +-
 ...-purgatory-Pass-r-directly-to-linker.patch |  7 +--
 .../0005-Disable-PIE-during-link.patch        |  7 +--
 ...-tools_2.0.31.bb => kexec-tools_2.0.32.bb} | 48 +++++++++++++-
 8 files changed, 56 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.31.bb => kexec-tools_2.0.32.bb} (64%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
deleted file mode 100644
index 6babf16e6e..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0d8a9e12b6509cb2a79818f5f4062a0bee33edfc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Sep 2025 13:28:32 -0700
-Subject: [PATCH] Make the segment base match pinned section address
-
-ET_EXEC uses image base of 0x400000, but the build forces
-section VMAs like .text = 0x10000. LLD now errors when any
-section address is below the image base unless you explicitly
-set the base. (Older LLD tolerated it.)
-
-To fix this, set the image base to match forced section addresses
-
-Fixes
-| x86_64-yoe-linux-ld.lld: error: section '.text' address (0x10000) is smaller than image base (0x400000); specify --image-base
-| x86_64-yoe-linux-ld.lld: error: section '.bss' address (0x12000) is smaller than image base (0x400000); specify --image-base
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2025-September/033493.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kexec_test/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/kexec_test/Makefile
-+++ b/kexec_test/Makefile
-@@ -5,7 +5,7 @@ RELOC:=0x10000
- KEXEC_TEST_SRCS:= kexec_test/kexec_test16.S kexec_test/kexec_test.S
- 
- dist += kexec_test/Makefile $(KEXEC_TEST_SRCS)				\
--	kexec_test/x86-setup-legacy-pic.S
-+	kexec_test/x86-setup-legacy-pic.S kexec_test/kexec_test.ld
- 
- BUILD_KEXEC_TEST = no
- ifeq ($(ARCH),i386)
-@@ -31,7 +31,7 @@ $(KEXEC_TEST): CPPFLAGS+=-DRELOC=$(RELOC
- $(KEXEC_TEST): ASFLAGS+=-m32
- #$(KEXEC_TEST): LDFLAGS=-m32 -Wl,-e -Wl,_start -Wl,-Ttext -Wl,$(RELOC) \
- #		       -nostartfiles
--$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -Ttext $(RELOC)
-+$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -T $(srcdir)/kexec_test/kexec_test.ld
- 
- $(KEXEC_TEST): $(KEXEC_TEST_OBJS)
- 	mkdir -p $(@D)
---- /dev/null
-+++ b/kexec_test/kexec_test.ld
-@@ -0,0 +1,16 @@
-+ENTRY(_start)
-+SECTIONS
-+{
-+  . = 0x10000;
-+  .text : { *(.text .text.*) }
-+
-+  /* Place the note after .text to avoid overlap */
-+  . = ALIGN(16);
-+  .note.gnu.property : { *(.note.gnu.property) }
-+
-+  .rodata : { *(.rodata .rodata.*) }
-+
-+  /* If you need bss fixed: */
-+  . = 0x12000;
-+  .bss : { *(.bss .bss.* COMMON) }
-+}
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
index ee731cea4b..5ff4d7bbd2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -1,4 +1,4 @@
-From 9e95f8933bded10fdd664fc95492825347ec59a7 Mon Sep 17 00:00:00 2001
+From 79e216845720573605960c2591d8a75b8f37c433 Mon Sep 17 00:00:00 2001
 From: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Date: Thu, 12 Nov 2020 12:56:46 -0800
 Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
index 5d994d9ffb..2655e3540d 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 0b176595ca1610037d1175e1786d1a8aff1fb43f Mon Sep 17 00:00:00 2001
+From 6e621015eea35f3a95ac87140fa042fd74125f0d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 6 Aug 2024 21:42:43 -0700
 Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
@@ -18,7 +18,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 6bf12d7..2f8e7cc 100644
+index c9e4bcb..a25cb49 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
 @@ -61,6 +61,10 @@
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
index 029650f35c..dcac49fc43 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
+From 47fe83ed2711b96eca1a01e3bd17819ea19180cc Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
index 483e5195a9..4f2334c00a 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
@@ -1,4 +1,4 @@
-From 4a07e8f22b4f224dca79767e5cb86a0de91498dc Mon Sep 17 00:00:00 2001
+From 9e76385c435283e84edc863c5138dd46e0f4a07b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 May 2025 07:48:50 -0700
 Subject: [PATCH] ppc/fs2dt: Match function signatures
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index a537ac2f0b..ad0adee0b6 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From e5bc9fbd6029057a4e3815a5326af5bd83a450e6 Mon Sep 17 00:00:00 2001
+From b3f880338e046782ad7aabba75b5460e187feb9a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Sep 2015 07:59:45 +0000
 Subject: [PATCH] purgatory: Pass -r directly to linker
@@ -10,16 +10,15 @@ unfiltered
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 4d2d071..6673423 100644
+index 7d1175f..4500a41 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -62,7 +62,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
  			-Wl,--no-undefined -nostartfiles -nostdlib \
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
index 6a21744ac1..dd668904ac 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From 494888bcc3bbf070dfce1b2686ee34c8619aa33d Mon Sep 17 00:00:00 2001
+From 2ce68906e9076db822031535bce7caca07a0edef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 11:18:49 -0700
 Subject: [PATCH] Disable PIE during link
@@ -9,16 +9,15 @@ just need to match it with linker flags
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 6673423..a7405ea 100644
+index 4500a41..efffca5 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-Iinclude \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
similarity index 64%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
index b12f76a0bf..24e6d5ba41 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
@@ -1,9 +1,52 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#                         Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -304,8 +304,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -329,8 +328,8 @@
+#    Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+#    `Gnomovision' (which makes passes at compilers) written by James Hacker.
+#  
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# +  <signature of Moe Ghoul>, 1 April 1989
+# +  Moe Ghoul, President of Vice
+#  
+#  This General Public License does not permit incorporating your program into
+#  proprietary programs.  If your program is a subroutine library, you may
+# 
+#
+
 SUMMARY = "Kexec fast reboot tools"
 DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09 \
                     "
 DEPENDS = "zlib xz"
@@ -19,10 +62,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            file://0001-ppc-fs2dt-Match-function-signatures.patch \
-           file://0001-Make-the-segment-base-match-pinned-section-address.patch \
            "
 
-SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"
+SRC_URI[sha256sum] = "41c427651269cba7ecb0a3a537403076c5694949783b5cc3ae046223bc962087"
 
 inherit autotools update-rc.d systemd
 
-- 
2.47.1


--===============6940879168463985345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kexec-tools/kdump: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 624192 to 625416 (+0%)
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 212109 to 213886 (+1%)
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.31.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch file://0001-ppc-fs2dt-Match-function-signatures.patch file://0001-Make-the-segment-base-match-pinned-section-address.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.32.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://0001-kexec.c-add-MFD_NOEXEC_SEAL
 -flag-explicitly.patch file://0001-ppc-fs2dt-Match-function-signatures.patch"
packages/x86-64-v3-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.31 [default] to 2.0.32 [default]

--===============6940879168463985345==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.31-2.0.32.patch"

RnJvbSA1YWEwZWVlNjg2NjZjMzczODEwNzllZmJjNDMzOWRhMWJjNWM2NWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMToyOTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtl
eGVjLXRvb2xzOiB1cGdyYWRlIDIuMC4zMSAtPiAyLjAuMzIKCi0tLQogLi4ubnQtYmFzZS1tYXRj
aC1waW5uZWQtc2VjdGlvbi1hZGRyZXNzLnBhdGNoIHwgNjIgLS0tLS0tLS0tLS0tLS0tLS0tLQog
Li4uYmxlZC1jaGVjay1pZi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIHwgIDIgKy0KIC4u
Li1hZGQtTUZEX05PRVhFQ19TRUFMLWZsYWctZXhwbGljaXRseS5wYXRjaCB8ICA0ICstCiAuLi5w
b3dlcnBjLWNoYW5nZS10aGUtbWVtb3J5LXNpemUtbGltaXQucGF0Y2ggfCAgMiArLQogLi4uLXBw
Yy1mczJkdC1NYXRjaC1mdW5jdGlvbi1zaWduYXR1cmVzLnBhdGNoIHwgIDIgKy0KIC4uLi1wdXJn
YXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5wYXRjaCB8ICA3ICstLQogLi4uLzAwMDUt
RGlzYWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0Y2ggICAgICAgIHwgIDcgKy0tCiAuLi4tdG9vbHNf
Mi4wLjMxLmJiID0+IGtleGVjLXRvb2xzXzIuMC4zMi5iYn0gfCA0OCArKysrKysrKysrKysrLQog
OCBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCA3OCBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEt
TWFrZS10aGUtc2VnbWVudC1iYXNlLW1hdGNoLXBpbm5lZC1zZWN0aW9uLWFkZHJlc3MucGF0Y2gK
IHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL3trZXhlYy10b29sc18yLjAuMzEuYmIg
PT4ga2V4ZWMtdG9vbHNfMi4wLjMyLmJifSAoNjQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1NYWtlLXRoZS1zZWdtZW50LWJhc2UtbWF0
Y2gtcGlubmVkLXNlY3Rpb24tYWRkcmVzcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4
ZWMva2V4ZWMtdG9vbHMvMDAwMS1NYWtlLXRoZS1zZWdtZW50LWJhc2UtbWF0Y2gtcGlubmVkLXNl
Y3Rpb24tYWRkcmVzcy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNmJhYmYx
NmU2ZS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRv
b2xzLzAwMDEtTWFrZS10aGUtc2VnbWVudC1iYXNlLW1hdGNoLXBpbm5lZC1zZWN0aW9uLWFkZHJl
c3MucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw2MiArMCwwIEBACi1Gcm9tIDBkOGE5ZTEyYjY1
MDljYjJhNzk4MThmNWY0MDYyYTBiZWUzM2VkZmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogV2VkLCAzIFNlcCAyMDI1
IDEzOjI4OjMyIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIE1ha2UgdGhlIHNlZ21lbnQgYmFzZSBt
YXRjaCBwaW5uZWQgc2VjdGlvbiBhZGRyZXNzCi0KLUVUX0VYRUMgdXNlcyBpbWFnZSBiYXNlIG9m
IDB4NDAwMDAwLCBidXQgdGhlIGJ1aWxkIGZvcmNlcwotc2VjdGlvbiBWTUFzIGxpa2UgLnRleHQg
PSAweDEwMDAwLiBMTEQgbm93IGVycm9ycyB3aGVuIGFueQotc2VjdGlvbiBhZGRyZXNzIGlzIGJl
bG93IHRoZSBpbWFnZSBiYXNlIHVubGVzcyB5b3UgZXhwbGljaXRseQotc2V0IHRoZSBiYXNlLiAo
T2xkZXIgTExEIHRvbGVyYXRlZCBpdC4pCi0KLVRvIGZpeCB0aGlzLCBzZXQgdGhlIGltYWdlIGJh
c2UgdG8gbWF0Y2ggZm9yY2VkIHNlY3Rpb24gYWRkcmVzc2VzCi0KLUZpeGVzCi18IHg4Nl82NC15
b2UtbGludXgtbGQubGxkOiBlcnJvcjogc2VjdGlvbiAnLnRleHQnIGFkZHJlc3MgKDB4MTAwMDAp
IGlzIHNtYWxsZXIgdGhhbiBpbWFnZSBiYXNlICgweDQwMDAwMCk7IHNwZWNpZnkgLS1pbWFnZS1i
YXNlCi18IHg4Nl82NC15b2UtbGludXgtbGQubGxkOiBlcnJvcjogc2VjdGlvbiAnLmJzcycgYWRk
cmVzcyAoMHgxMjAwMCkgaXMgc21hbGxlciB0aGFuIGltYWdlIGJhc2UgKDB4NDAwMDAwKTsgc3Bl
Y2lmeSAtLWltYWdlLWJhc2UKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwva2V4ZWMvMjAyNS1TZXB0ZW1iZXIvMDMzNDkz
Lmh0bWxdCi0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0t
LS0KLSBrZXhlY190ZXN0L01ha2VmaWxlIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQotCi0tLS0gYS9rZXhlY190ZXN0L01ha2VmaWxlCi0rKysg
Yi9rZXhlY190ZXN0L01ha2VmaWxlCi1AQCAtNSw3ICs1LDcgQEAgUkVMT0M6PTB4MTAwMDAKLSBL
RVhFQ19URVNUX1NSQ1M6PSBrZXhlY190ZXN0L2tleGVjX3Rlc3QxNi5TIGtleGVjX3Rlc3Qva2V4
ZWNfdGVzdC5TCi0gCi0gZGlzdCArPSBrZXhlY190ZXN0L01ha2VmaWxlICQoS0VYRUNfVEVTVF9T
UkNTKQkJCQlcCi0tCWtleGVjX3Rlc3QveDg2LXNldHVwLWxlZ2FjeS1waWMuUwotKwlrZXhlY190
ZXN0L3g4Ni1zZXR1cC1sZWdhY3ktcGljLlMga2V4ZWNfdGVzdC9rZXhlY190ZXN0LmxkCi0gCi0g
QlVJTERfS0VYRUNfVEVTVCA9IG5vCi0gaWZlcSAoJChBUkNIKSxpMzg2KQotQEAgLTMxLDcgKzMx
LDcgQEAgJChLRVhFQ19URVNUKTogQ1BQRkxBR1MrPS1EUkVMT0M9JChSRUxPQwotICQoS0VYRUNf
VEVTVCk6IEFTRkxBR1MrPS1tMzIKLSAjJChLRVhFQ19URVNUKTogTERGTEFHUz0tbTMyIC1XbCwt
ZSAtV2wsX3N0YXJ0IC1XbCwtVHRleHQgLVdsLCQoUkVMT0MpIFwKLSAjCQkgICAgICAgLW5vc3Rh
cnRmaWxlcwotLSQoS0VYRUNfVEVTVCk6IExERkxBR1M9LW1lbGZfaTM4NiAtZSBfc3RhcnQgLVR0
ZXh0ICQoUkVMT0MpCi0rJChLRVhFQ19URVNUKTogTERGTEFHUz0tbWVsZl9pMzg2IC1lIF9zdGFy
dCAtVCAkKHNyY2Rpcikva2V4ZWNfdGVzdC9rZXhlY190ZXN0LmxkCi0gCi0gJChLRVhFQ19URVNU
KTogJChLRVhFQ19URVNUX09CSlMpCi0gCW1rZGlyIC1wICQoQEQpCi0tLS0gL2Rldi9udWxsCi0r
KysgYi9rZXhlY190ZXN0L2tleGVjX3Rlc3QubGQKLUBAIC0wLDAgKzEsMTYgQEAKLStFTlRSWShf
c3RhcnQpCi0rU0VDVElPTlMKLSt7Ci0rICAuID0gMHgxMDAwMDsKLSsgIC50ZXh0IDogeyAqKC50
ZXh0IC50ZXh0LiopIH0KLSsKLSsgIC8qIFBsYWNlIHRoZSBub3RlIGFmdGVyIC50ZXh0IHRvIGF2
b2lkIG92ZXJsYXAgKi8KLSsgIC4gPSBBTElHTigxNik7Ci0rICAubm90ZS5nbnUucHJvcGVydHkg
OiB7ICooLm5vdGUuZ251LnByb3BlcnR5KSB9Ci0rCi0rICAucm9kYXRhIDogeyAqKC5yb2RhdGEg
LnJvZGF0YS4qKSB9Ci0rCi0rICAvKiBJZiB5b3UgbmVlZCBic3MgZml4ZWQ6ICovCi0rICAuID0g
MHgxMjAwMDsKLSsgIC5ic3MgOiB7ICooLmJzcyAuYnNzLiogQ09NTU9OKSB9Ci0rfQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtl
eGVjLWRpc2FibGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3BlcnQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtYXJtNjQta2V4ZWMtZGlzYWJs
ZWQtY2hlY2staWYta2FzbHItc2VlZC1kdGItcHJvcGVydC5wYXRjaAppbmRleCBlZTczMWNlYTRi
Li41ZmY0ZDdiYmQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVj
LXRvb2xzLzAwMDEtYXJtNjQta2V4ZWMtZGlzYWJsZWQtY2hlY2staWYta2FzbHItc2VlZC1kdGIt
cHJvcGVydC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xz
LzAwMDEtYXJtNjQta2V4ZWMtZGlzYWJsZWQtY2hlY2staWYta2FzbHItc2VlZC1kdGItcHJvcGVy
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWU5NWY4OTMzYmRlZDEwZmRkNjY0ZmM5NTQ5
MjgyNTM0N2VjNTlhNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzllMjE2ODQ1NzIw
NTczNjA1OTYwYzI1OTFkOGE3NWI4ZjM3YzQzMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW1lbnNreSA8YWxleGFuZGVyLmthbWVuc2t5NDJAZ21haWwuY29tPgog
RGF0ZTogVGh1LCAxMiBOb3YgMjAyMCAxMjo1Njo0NiAtMDgwMAogU3ViamVjdDogW1BBVENIXSBh
cm02NDoga2V4ZWM6IGRpc2FibGVkIGNoZWNrIGlmIGthc2xyLXNlZWQgZHRiIHByb3BlcnR5IHdh
cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAx
LWtleGVjLmMtYWRkLU1GRF9OT0VYRUNfU0VBTC1mbGFnLWV4cGxpY2l0bHkucGF0Y2ggYi9tZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEta2V4ZWMuYy1hZGQtTUZEX05P
RVhFQ19TRUFMLWZsYWctZXhwbGljaXRseS5wYXRjaAppbmRleCA1ZDk5NGQ5ZmZiLi4yNjU1ZTM1
NDBkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAw
MDEta2V4ZWMuYy1hZGQtTUZEX05PRVhFQ19TRUFMLWZsYWctZXhwbGljaXRseS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEta2V4ZWMuYy1hZGQt
TUZEX05PRVhFQ19TRUFMLWZsYWctZXhwbGljaXRseS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMGIxNzY1OTVjYTE2MTAwMzdkMTE3NWUxNzg2ZDFhOGFmZjFmYjQzZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNmU2MjEwMTVlZWEzNWYzYTk1YWM4NzE0MGZhMDQyZmQ3NDEyNWYw
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJp
dmVyLmNvbT4KIERhdGU6IFR1ZSwgNiBBdWcgMjAyNCAyMTo0Mjo0MyAtMDcwMAogU3ViamVjdDog
W1BBVENIXSBrZXhlYy5jOiBhZGQgTUZEX05PRVhFQ19TRUFMIGZsYWcgZXhwbGljaXRseQpAQCAt
MTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEva2V4ZWMva2V4ZWMuYyBiL2tleGVjL2tleGVjLmMKLWluZGV4IDZiZjEyZDcu
LjJmOGU3Y2MgMTAwNjQ0CitpbmRleCBjOWU0YmNiLi5hMjVjYjQ5IDEwMDY0NAogLS0tIGEva2V4
ZWMva2V4ZWMuYwogKysrIGIva2V4ZWMva2V4ZWMuYwogQEAgLTYxLDYgKzYxLDEwIEBACmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcG93ZXJw
Yy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5l
bC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBvd2VycGMtY2hhbmdlLXRoZS1tZW1vcnktc2l6ZS1s
aW1pdC5wYXRjaAppbmRleCAwMjk2NTBmMzVjLi5kY2FjNDlmYzQzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcG93ZXJwYy1jaGFuZ2UtdGhl
LW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMv
a2V4ZWMtdG9vbHMvMDAwMS1wb3dlcnBjLWNoYW5nZS10aGUtbWVtb3J5LXNpemUtbGltaXQucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDIxMWNhZTRiNmEwMmE0ZDlkMzdiZmNkNzZmMzcwMjY5
NmUwOTVmYzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ3ZmU4M2VkMjcxMWI5NmVj
YTFhMDFlM2JkMTc4MTllYTE5MTgwY2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBR
dWFueWFuZyBXYW5nIDxxdWFueWFuZy53YW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE2
IEp1biAyMDE1IDEyOjU5OjU3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBvd2VycGM6IGNoYW5n
ZSB0aGUgbWVtb3J5IHNpemUgbGltaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwv
a2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1wcGMtZnMyZHQtTWF0Y2gtZnVuY3Rpb24tc2lnbmF0dXJl
cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1wcGMt
ZnMyZHQtTWF0Y2gtZnVuY3Rpb24tc2lnbmF0dXJlcy5wYXRjaAppbmRleCA0ODNlNTE5NWE5Li40
ZjIzMzRjMDBhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRv
b2xzLzAwMDEtcHBjLWZzMmR0LU1hdGNoLWZ1bmN0aW9uLXNpZ25hdHVyZXMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBwYy1mczJkdC1NYXRj
aC1mdW5jdGlvbi1zaWduYXR1cmVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YTA3ZThm
MjJiNGYyMjRkY2E3OTc2N2U1Y2I4NmEwZGU5MTQ5OGRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA5ZTc2Mzg1YzQzNTI4M2U4NGVkYzg2M2M1MTM4ZGQ0NmUwZjRhMDdiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IFNhdCwgMTcgTWF5IDIwMjUgMDc6NDg6NTAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHBj
L2ZzMmR0OiBNYXRjaCBmdW5jdGlvbiBzaWduYXR1cmVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDItcHVyZ2F0b3J5LVBhc3Mtci1kaXJlY3Rs
eS10by1saW5rZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xz
LzAwMDItcHVyZ2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1saW5rZXIucGF0Y2gKaW5kZXggYTUz
N2FjMmYwYi4uYWQwYWRlZTBiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhl
Yy9rZXhlYy10b29scy8wMDAyLXB1cmdhdG9yeS1QYXNzLXItZGlyZWN0bHktdG8tbGlua2VyLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMi1wdXJn
YXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gZTViYzlmYmQ2MDI5MDU3YTRlMzgxNWE1MzI2YWY1YmQ4M2E0NTBlNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYjNmODgwMzM4ZTA0Njc4MmFkN2FhYmJhNzViNTQ2MGUxODdmZWI5
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBNb24sIDcgU2VwIDIwMTUgMDc6NTk6NDUgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gcHVyZ2F0b3J5OiBQYXNzIC1yIGRpcmVjdGx5IHRvIGxpbmtlcgpAQCAtMTAsMTYgKzEw
LDE1IEBAIHVuZmlsdGVyZWQKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwotCiAtLS0KICBwdXJnYXRvcnkvTWFr
ZWZpbGUgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9wdXJnYXRvcnkvTWFrZWZpbGUgYi9wdXJnYXRvcnkvTWFrZWZp
bGUKLWluZGV4IDRkMmQwNzEuLjY2NzM0MjMgMTAwNjQ0CitpbmRleCA3ZDExNzVmLi40NTAwYTQx
IDEwMDY0NAogLS0tIGEvcHVyZ2F0b3J5L01ha2VmaWxlCiArKysgYi9wdXJnYXRvcnkvTWFrZWZp
bGUKLUBAIC02MSw3ICs2MSw3IEBAICQoUFVSR0FUT1JZKTogQ1BQRkxBR1M9JCgkKEFSQ0gpX1BV
UkdBVE9SWV9FWFRSQV9DRkxBR1MpIFwKK0BAIC02Miw3ICs2Miw3IEBAICQoUFVSR0FUT1JZKTog
Q1BQRkxBR1M9JCgkKEFSQ0gpX1BVUkdBVE9SWV9FWFRSQV9DRkxBR1MpIFwKICAJCQktSSQoc2hl
bGwgJChDQykgLXByaW50LWZpbGUtbmFtZT1pbmNsdWRlKQogICQoUFVSR0FUT1JZKTogTERGTEFH
Uz0kKCQoQVJDSClfUFVSR0FUT1JZX0VYVFJBX0NGTEFHUylcCiAgCQkJLVdsLC0tbm8tdW5kZWZp
bmVkIC1ub3N0YXJ0ZmlsZXMgLW5vc3RkbGliIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwNS1EaXNhYmxlLVBJRS1kdXJpbmctbGluay5wYXRj
aCBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwNS1EaXNhYmxlLVBJ
RS1kdXJpbmctbGluay5wYXRjaAppbmRleCA2YTIxNzQ0YWMxLi5kZDY2ODkwNGFjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDUtRGlzYWJsZS1Q
SUUtZHVyaW5nLWxpbmsucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhl
Yy10b29scy8wMDA1LURpc2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0OTQ4ODhiY2MzYmJmMDcwZGZjZTFiMjY4NmVlMzRjODYxOWFhMzNkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyY2U2ODkwNmU5MDc2ZGI4MjIwMzE1MzViY2U3Y2FjYTA3
YTBlZGVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTAgSnVuIDIwMTcgMTE6MTg6NDkgLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRGlzYWJsZSBQSUUgZHVyaW5nIGxpbmsKQEAgLTksMTYgKzksMTUgQEAganVz
dCBuZWVkIHRvIG1hdGNoIGl0IHdpdGggbGlua2VyIGZsYWdzCiBVcHN0cmVhbS1TdGF0dXM6IFBl
bmRpbmcKIAogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLQog
LS0tCiAgcHVyZ2F0b3J5L01ha2VmaWxlIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvcHVyZ2F0b3J5L01ha2VmaWxl
IGIvcHVyZ2F0b3J5L01ha2VmaWxlCi1pbmRleCA2NjczNDIzLi5hNzQwNWVhIDEwMDY0NAoraW5k
ZXggNDUwMGE0MS4uZWZmZmNhNSAxMDA2NDQKIC0tLSBhL3B1cmdhdG9yeS9NYWtlZmlsZQogKysr
IGIvcHVyZ2F0b3J5L01ha2VmaWxlCi1AQCAtNjAsNyArNjAsNyBAQCAkKFBVUkdBVE9SWSk6IENQ
UEZMQUdTPSQoJChBUkNIKV9QVVJHQVRPUllfRVhUUkFfQ0ZMQUdTKSBcCitAQCAtNjEsNyArNjEs
NyBAQCAkKFBVUkdBVE9SWSk6IENQUEZMQUdTPSQoJChBUkNIKV9QVVJHQVRPUllfRVhUUkFfQ0ZM
QUdTKSBcCiAgCQkJLUlpbmNsdWRlIFwKICAJCQktSSQoc2hlbGwgJChDQykgLXByaW50LWZpbGUt
bmFtZT1pbmNsdWRlKQogICQoUFVSR0FUT1JZKTogTERGTEFHUz0kKCQoQVJDSClfUFVSR0FUT1JZ
X0VYVFJBX0NGTEFHUylcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tl
eGVjLXRvb2xzXzIuMC4zMS5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9v
bHNfMi4wLjMyLmJiCnNpbWlsYXJpdHkgaW5kZXggNjQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHNfMi4wLjMxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4zMi5iYgppbmRleCBiMTJmNzZhMGJmLi4y
NGU2ZDViYTQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRv
b2xzXzIuMC4zMS5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xz
XzIuMC4zMi5iYgpAQCAtMSw5ICsxLDUyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlO
RworIyArKysgQ09QWUlORworIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAgICAgICAgICAgICAgICAg
ICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5OTEKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk4OSwg
MTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gNTEgRnJhbmtsaW4gU3Ry
ZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQorIyArIDxodHRwczov
L2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmli
dXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNo
YW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC0zMDQsOCArMzA0LDcgQEAKKyMg
ICAgICBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisj
ICAgICAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgYWxvbmcKKyMgLSAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3
cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtICAgIDUxIEZy
YW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCisj
ICsgICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwczovL3d3dy5nbnUub3Jn
L2xpY2Vuc2VzLz4uCisjICAKKyMgIEFsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250
YWN0IHlvdSBieSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyAgCisjIEBAIC0zMjksOCAr
MzI4LDggQEAKKyMgICAgWW95b2R5bmUsIEluYy4sIGhlcmVieSBkaXNjbGFpbXMgYWxsIGNvcHly
aWdodCBpbnRlcmVzdCBpbiB0aGUgcHJvZ3JhbQorIyAgICBgR25vbW92aXNpb24nICh3aGljaCBt
YWtlcyBwYXNzZXMgYXQgY29tcGlsZXJzKSB3cml0dGVuIGJ5IEphbWVzIEhhY2tlci4KKyMgIAor
IyAtICA8c2lnbmF0dXJlIG9mIFR5IENvb24+LCAxIEFwcmlsIDE5ODkKKyMgLSAgVHkgQ29vbiwg
UHJlc2lkZW50IG9mIFZpY2UKKyMgKyAgPHNpZ25hdHVyZSBvZiBNb2UgR2hvdWw+LCAxIEFwcmls
IDE5ODkKKyMgKyAgTW9lIEdob3VsLCBQcmVzaWRlbnQgb2YgVmljZQorIyAgCisjICBUaGlzIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRpbmcgeW91ciBw
cm9ncmFtIGludG8KKyMgIHByb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBwcm9ncmFtIGlz
IGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjIAorIworCiBTVU1NQVJZID0gIktleGVj
IGZhc3QgcmVib290IHRvb2xzIgogREVTQ1JJUFRJT04gPSAiS2V4ZWMgaXMgYSBmYXN0IHJlYm9v
dCBmZWF0dXJlIHRoYXQgbGV0cyB5b3UgcmVib290IHRvIGEgbmV3IExpbnV4IGtlcm5lbCIKIEhP
TUVQQUdFID0gImh0dHA6Ly9rZXJuZWwub3JnL3B1Yi9saW51eC91dGlscy9rZXJuZWwva2V4ZWMv
IgogU0VDVElPTiA9ICJrZXJuZWwvdXNlcmxhbmQiCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0
ODZhODBmZGFmNGE0MjYzIFwKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTU3MGE5YjM3NDlkZDA0NjNhMTc3ODgwM2IxMmE2ZGNlIFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL2tleGVjL2tleGVjLmM7YmVnaW5saW5lPTE7ZW5kbGluZT0yMDttZDU9YWYxMGY2YWU0
YTg3MTU5NjVlNjQ4YWE2ODdhZDNlMDkgXAogICAgICAgICAgICAgICAgICAgICAiCiBERVBFTkRT
ID0gInpsaWIgeHoiCkBAIC0xOSwxMCArNjIsOSBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01J
UlJPUn0vbGludXgvdXRpbHMva2VybmVsL2tleGVjL2tleGVjLXRvb2xzLSR7UFZ9LnRhci5negog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1hcm02NC1rZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1rYXNs
ci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEta2V4ZWMu
Yy1hZGQtTUZEX05PRVhFQ19TRUFMLWZsYWctZXhwbGljaXRseS5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXBwYy1mczJkdC1NYXRjaC1mdW5jdGlvbi1zaWduYXR1cmVzLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDEtTWFrZS10aGUtc2VnbWVudC1iYXNlLW1hdGNoLXBpbm5l
ZC1zZWN0aW9uLWFkZHJlc3MucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZGFhYTY1YjAyYjRmOGFhOTIyMjU4NmIxZjI2NTY1YjkzYTRiYWVmZmQzNWJjYmQ1
MjNmMTVmYWU3YWE0ODk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQxYzQyNzY1MTI2OWNiYTdl
Y2IwYTNhNTM3NDAzMDc2YzU2OTQ5NDk3ODNiNWNjM2FlMDQ2MjIzYmM5NjIwODciCiAKIGluaGVy
aXQgYXV0b3Rvb2xzIHVwZGF0ZS1yYy5kIHN5c3RlbWQKIAotLSAKMi40Ny4xCgo=

--===============6940879168463985345==--

