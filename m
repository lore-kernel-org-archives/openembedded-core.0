Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062BDD5E37D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17184.1765872136819102044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=piRJfwrh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YZkrQy4H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262edab3-e3c9ef05-af27-4c67-b525-5774486090e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NXuybQviD/n2kkPjPT/AZT8SXo1CYRfNPZfzOLEh2cY=;
	b=piRJfwrhWAAUk+zpc2r/tNS56RP2f9ZqYySxuIw298nvQcdT4pzFwoh3absKnnUJ
	274d4KFksPEqxMhLZO+tkYhxd45Vlh0KyHIYaf8YOGZt27Sg46UFrcIsezwlBLJ6MN/
	AWzyjR1gQ+/powEYblUUh1KBmayyPNWElNbqm3+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NXuybQviD/n2kkPjPT/AZT8SXo1CYRfNPZfzOLEh2cY=;
	b=YZkrQy4HedcRPvr9Cb1iAfcLQ5NZ0cQHdhGOAp7tD91so1pV2drl36GzM+cXti+P
	1rP3rlxA2dszbtPLCrxdDvarPKdXwFZCr4O0zzp/1gWhY7Nxv2eNDF7jQ+GCfXVOO5Z
	Yr5w0K0Ru8pfMLBwic/7m/7uZeEc2WIlTdaymFRE=
Content-Type: multipart/mixed; boundary="===============4656905772421135881=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] kexec-tools: upgrading to 2.0.32 SUCCEEDED
Message-ID: <0101019b262edab3-e3c9ef05-af27-4c67-b525-5774486090e5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227886

--===============4656905772421135881==
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
From b1f419925f29c7894ea264fedc6bb1764505b871 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:37:17 +0000
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
index ee731cea4b..12c9fb83ef 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -1,4 +1,4 @@
-From 9e95f8933bded10fdd664fc95492825347ec59a7 Mon Sep 17 00:00:00 2001
+From 2f532aba262ccd7ed77d519ee334cb3a5e6dacda Mon Sep 17 00:00:00 2001
 From: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Date: Thu, 12 Nov 2020 12:56:46 -0800
 Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
index 5d994d9ffb..9b3a082b0e 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 0b176595ca1610037d1175e1786d1a8aff1fb43f Mon Sep 17 00:00:00 2001
+From 1a213922be0c09dffefee2ee6ce06b1599a58fdb Mon Sep 17 00:00:00 2001
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
index 029650f35c..b930b227b2 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
+From b0e07ceb0c77b56c549ff74a2ec8526712bcf50e Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
index 483e5195a9..33d5dc7cb9 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
@@ -1,4 +1,4 @@
-From 4a07e8f22b4f224dca79767e5cb86a0de91498dc Mon Sep 17 00:00:00 2001
+From 1bd18800d4751daae2886f471e110b70dc1d6847 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 May 2025 07:48:50 -0700
 Subject: [PATCH] ppc/fs2dt: Match function signatures
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index a537ac2f0b..130106c52e 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From e5bc9fbd6029057a4e3815a5326af5bd83a450e6 Mon Sep 17 00:00:00 2001
+From 16d5aa309e5034db7a2dd0771afe4c38ea404fed Mon Sep 17 00:00:00 2001
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
index 6a21744ac1..34b6fddbaa 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From 494888bcc3bbf070dfce1b2686ee34c8619aa33d Mon Sep 17 00:00:00 2001
+From 2459c1b5cf75ca26a1095d747812a4b3d07ffc8b Mon Sep 17 00:00:00 2001
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


--===============4656905772421135881==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kexec-tools-upgrade-2.0.31-2.0.32.patch"

RnJvbSBiMWY0MTk5MjVmMjljNzg5NGVhMjY0ZmVkYzZiYjE3NjQ1MDViODcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6Mzc6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
ZXhlYy10b29sczogdXBncmFkZSAyLjAuMzEgLT4gMi4wLjMyCgotLS0KIC4uLm50LWJhc2UtbWF0
Y2gtcGlubmVkLXNlY3Rpb24tYWRkcmVzcy5wYXRjaCB8IDYyIC0tLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLmJsZWQtY2hlY2staWYta2FzbHItc2VlZC1kdGItcHJvcGVydC5wYXRjaCB8ICAyICstCiAu
Li4tYWRkLU1GRF9OT0VYRUNfU0VBTC1mbGFnLWV4cGxpY2l0bHkucGF0Y2ggfCAgNCArLQogLi4u
cG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBhdGNoIHwgIDIgKy0KIC4uLi1w
cGMtZnMyZHQtTWF0Y2gtZnVuY3Rpb24tc2lnbmF0dXJlcy5wYXRjaCB8ICAyICstCiAuLi4tcHVy
Z2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1saW5rZXIucGF0Y2ggfCAgNyArLS0KIC4uLi8wMDA1
LURpc2FibGUtUElFLWR1cmluZy1saW5rLnBhdGNoICAgICAgICB8ICA3ICstLQogLi4uLXRvb2xz
XzIuMC4zMS5iYiA9PiBrZXhlYy10b29sc18yLjAuMzIuYmJ9IHwgNDggKysrKysrKysrKysrKy0K
IDggZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNzggZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAx
LU1ha2UtdGhlLXNlZ21lbnQtYmFzZS1tYXRjaC1waW5uZWQtc2VjdGlvbi1hZGRyZXNzLnBhdGNo
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy97a2V4ZWMtdG9vbHNfMi4wLjMxLmJi
ID0+IGtleGVjLXRvb2xzXzIuMC4zMi5iYn0gKDY0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtTWFrZS10aGUtc2VnbWVudC1iYXNlLW1h
dGNoLXBpbm5lZC1zZWN0aW9uLWFkZHJlc3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tl
eGVjL2tleGVjLXRvb2xzLzAwMDEtTWFrZS10aGUtc2VnbWVudC1iYXNlLW1hdGNoLXBpbm5lZC1z
ZWN0aW9uLWFkZHJlc3MucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDZiYWJm
MTZlNmUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10
b29scy8wMDAxLU1ha2UtdGhlLXNlZ21lbnQtYmFzZS1tYXRjaC1waW5uZWQtc2VjdGlvbi1hZGRy
ZXNzLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNjIgKzAsMCBAQAotRnJvbSAwZDhhOWUxMmI2
NTA5Y2IyYTc5ODE4ZjVmNDA2MmEwYmVlMzNlZGZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMyBTZXAgMjAy
NSAxMzoyODozMiAtMDcwMAotU3ViamVjdDogW1BBVENIXSBNYWtlIHRoZSBzZWdtZW50IGJhc2Ug
bWF0Y2ggcGlubmVkIHNlY3Rpb24gYWRkcmVzcwotCi1FVF9FWEVDIHVzZXMgaW1hZ2UgYmFzZSBv
ZiAweDQwMDAwMCwgYnV0IHRoZSBidWlsZCBmb3JjZXMKLXNlY3Rpb24gVk1BcyBsaWtlIC50ZXh0
ID0gMHgxMDAwMC4gTExEIG5vdyBlcnJvcnMgd2hlbiBhbnkKLXNlY3Rpb24gYWRkcmVzcyBpcyBi
ZWxvdyB0aGUgaW1hZ2UgYmFzZSB1bmxlc3MgeW91IGV4cGxpY2l0bHkKLXNldCB0aGUgYmFzZS4g
KE9sZGVyIExMRCB0b2xlcmF0ZWQgaXQuKQotCi1UbyBmaXggdGhpcywgc2V0IHRoZSBpbWFnZSBi
YXNlIHRvIG1hdGNoIGZvcmNlZCBzZWN0aW9uIGFkZHJlc3NlcwotCi1GaXhlcwotfCB4ODZfNjQt
eW9lLWxpbnV4LWxkLmxsZDogZXJyb3I6IHNlY3Rpb24gJy50ZXh0JyBhZGRyZXNzICgweDEwMDAw
KSBpcyBzbWFsbGVyIHRoYW4gaW1hZ2UgYmFzZSAoMHg0MDAwMDApOyBzcGVjaWZ5IC0taW1hZ2Ut
YmFzZQotfCB4ODZfNjQteW9lLWxpbnV4LWxkLmxsZDogZXJyb3I6IHNlY3Rpb24gJy5ic3MnIGFk
ZHJlc3MgKDB4MTIwMDApIGlzIHNtYWxsZXIgdGhhbiBpbWFnZSBiYXNlICgweDQwMDAwMCk7IHNw
ZWNpZnkgLS1pbWFnZS1iYXNlCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2tleGVjLzIwMjUtU2VwdGVtYmVyLzAzMzQ5
My5odG1sXQotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgot
LS0tCi0ga2V4ZWNfdGVzdC9NYWtlZmlsZSB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotLS0tIGEva2V4ZWNfdGVzdC9NYWtlZmlsZQotKysr
IGIva2V4ZWNfdGVzdC9NYWtlZmlsZQotQEAgLTUsNyArNSw3IEBAIFJFTE9DOj0weDEwMDAwCi0g
S0VYRUNfVEVTVF9TUkNTOj0ga2V4ZWNfdGVzdC9rZXhlY190ZXN0MTYuUyBrZXhlY190ZXN0L2tl
eGVjX3Rlc3QuUwotIAotIGRpc3QgKz0ga2V4ZWNfdGVzdC9NYWtlZmlsZSAkKEtFWEVDX1RFU1Rf
U1JDUykJCQkJXAotLQlrZXhlY190ZXN0L3g4Ni1zZXR1cC1sZWdhY3ktcGljLlMKLSsJa2V4ZWNf
dGVzdC94ODYtc2V0dXAtbGVnYWN5LXBpYy5TIGtleGVjX3Rlc3Qva2V4ZWNfdGVzdC5sZAotIAot
IEJVSUxEX0tFWEVDX1RFU1QgPSBubwotIGlmZXEgKCQoQVJDSCksaTM4NikKLUBAIC0zMSw3ICsz
MSw3IEBAICQoS0VYRUNfVEVTVCk6IENQUEZMQUdTKz0tRFJFTE9DPSQoUkVMT0MKLSAkKEtFWEVD
X1RFU1QpOiBBU0ZMQUdTKz0tbTMyCi0gIyQoS0VYRUNfVEVTVCk6IExERkxBR1M9LW0zMiAtV2ws
LWUgLVdsLF9zdGFydCAtV2wsLVR0ZXh0IC1XbCwkKFJFTE9DKSBcCi0gIwkJICAgICAgIC1ub3N0
YXJ0ZmlsZXMKLS0kKEtFWEVDX1RFU1QpOiBMREZMQUdTPS1tZWxmX2kzODYgLWUgX3N0YXJ0IC1U
dGV4dCAkKFJFTE9DKQotKyQoS0VYRUNfVEVTVCk6IExERkxBR1M9LW1lbGZfaTM4NiAtZSBfc3Rh
cnQgLVQgJChzcmNkaXIpL2tleGVjX3Rlc3Qva2V4ZWNfdGVzdC5sZAotIAotICQoS0VYRUNfVEVT
VCk6ICQoS0VYRUNfVEVTVF9PQkpTKQotIAlta2RpciAtcCAkKEBEKQotLS0tIC9kZXYvbnVsbAot
KysrIGIva2V4ZWNfdGVzdC9rZXhlY190ZXN0LmxkCi1AQCAtMCwwICsxLDE2IEBACi0rRU5UUlko
X3N0YXJ0KQotK1NFQ1RJT05TCi0rewotKyAgLiA9IDB4MTAwMDA7Ci0rICAudGV4dCA6IHsgKigu
dGV4dCAudGV4dC4qKSB9Ci0rCi0rICAvKiBQbGFjZSB0aGUgbm90ZSBhZnRlciAudGV4dCB0byBh
dm9pZCBvdmVybGFwICovCi0rICAuID0gQUxJR04oMTYpOwotKyAgLm5vdGUuZ251LnByb3BlcnR5
IDogeyAqKC5ub3RlLmdudS5wcm9wZXJ0eSkgfQotKwotKyAgLnJvZGF0YSA6IHsgKigucm9kYXRh
IC5yb2RhdGEuKikgfQotKwotKyAgLyogSWYgeW91IG5lZWQgYnNzIGZpeGVkOiAqLwotKyAgLiA9
IDB4MTIwMDA7Ci0rICAuYnNzIDogeyAqKC5ic3MgLmJzcy4qIENPTU1PTikgfQotK30KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1hcm02NC1r
ZXhlYy1kaXNhYmxlZC1jaGVjay1pZi1rYXNsci1zZWVkLWR0Yi1wcm9wZXJ0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWFybTY0LWtleGVjLWRpc2Fi
bGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3BlcnQucGF0Y2gKaW5kZXggZWU3MzFjZWE0
Yi4uMTJjOWZiODNlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhl
Yy10b29scy8wMDAxLWFybTY0LWtleGVjLWRpc2FibGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRi
LXByb3BlcnQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29s
cy8wMDAxLWFybTY0LWtleGVjLWRpc2FibGVkLWNoZWNrLWlmLWthc2xyLXNlZWQtZHRiLXByb3Bl
cnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDllOTVmODkzM2JkZWQxMGZkZDY2NGZjOTU0
OTI4MjUzNDdlYzU5YTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJmNTMyYWJhMjYy
Y2NkN2VkNzdkNTE5ZWUzMzRjYjNhNWU2ZGFjZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FtZW5za3kgPGFsZXhhbmRlci5rYW1lbnNreTQyQGdtYWlsLmNvbT4K
IERhdGU6IFRodSwgMTIgTm92IDIwMjAgMTI6NTY6NDYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
YXJtNjQ6IGtleGVjOiBkaXNhYmxlZCBjaGVjayBpZiBrYXNsci1zZWVkIGR0YiBwcm9wZXJ0eSB3
YXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAw
MS1rZXhlYy5jLWFkZC1NRkRfTk9FWEVDX1NFQUwtZmxhZy1leHBsaWNpdGx5LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWtleGVjLmMtYWRkLU1GRF9O
T0VYRUNfU0VBTC1mbGFnLWV4cGxpY2l0bHkucGF0Y2gKaW5kZXggNWQ5OTRkOWZmYi4uOWIzYTA4
MmIwZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8w
MDAxLWtleGVjLmMtYWRkLU1GRF9OT0VYRUNfU0VBTC1mbGFnLWV4cGxpY2l0bHkucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLWtleGVjLmMtYWRk
LU1GRF9OT0VYRUNfU0VBTC1mbGFnLWV4cGxpY2l0bHkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDBiMTc2NTk1Y2ExNjEwMDM3ZDExNzVlMTc4NmQxYThhZmYxZmI0M2YgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDFhMjEzOTIyYmUwYzA5ZGZmZWZlZTJlZTZjZTA2YjE1OTlhNThm
ZGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBUdWUsIDYgQXVnIDIwMjQgMjE6NDI6NDMgLTA3MDAKIFN1YmplY3Q6
IFtQQVRDSF0ga2V4ZWMuYzogYWRkIE1GRF9OT0VYRUNfU0VBTCBmbGFnIGV4cGxpY2l0bHkKQEAg
LTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2tleGVjL2tleGVjLmMgYi9rZXhlYy9rZXhlYy5jCi1pbmRleCA2YmYxMmQ3
Li4yZjhlN2NjIDEwMDY0NAoraW5kZXggYzllNGJjYi4uYTI1Y2I0OSAxMDA2NDQKIC0tLSBhL2tl
eGVjL2tleGVjLmMKICsrKyBiL2tleGVjL2tleGVjLmMKIEBAIC02MSw2ICs2MSwxMCBAQApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBvd2Vy
cGMtY2hhbmdlLXRoZS1tZW1vcnktc2l6ZS1saW1pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1wb3dlcnBjLWNoYW5nZS10aGUtbWVtb3J5LXNpemUt
bGltaXQucGF0Y2gKaW5kZXggMDI5NjUwZjM1Yy4uYjkzMGIyMjdiMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAxLXBvd2VycGMtY2hhbmdlLXRo
ZS1tZW1vcnktc2l6ZS1saW1pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVj
L2tleGVjLXRvb2xzLzAwMDEtcG93ZXJwYy1jaGFuZ2UtdGhlLW1lbW9yeS1zaXplLWxpbWl0LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMTFjYWU0YjZhMDJhNGQ5ZDM3YmZjZDc2ZjM3MDI2
OTZlMDk1ZmMzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMGUwN2NlYjBjNzdiNTZj
NTQ5ZmY3NGEyZWM4NTI2NzEyYmNmNTBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
UXVhbnlhbmcgV2FuZyA8cXVhbnlhbmcud2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAx
NiBKdW4gMjAxNSAxMjo1OTo1NyArMDgwMAogU3ViamVjdDogW1BBVENIXSBwb3dlcnBjOiBjaGFu
Z2UgdGhlIG1lbW9yeSBzaXplIGxpbWl0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVs
L2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcHBjLWZzMmR0LU1hdGNoLWZ1bmN0aW9uLXNpZ25hdHVy
ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDEtcHBj
LWZzMmR0LU1hdGNoLWZ1bmN0aW9uLXNpZ25hdHVyZXMucGF0Y2gKaW5kZXggNDgzZTUxOTVhOS4u
MzNkNWRjN2NiOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10
b29scy8wMDAxLXBwYy1mczJkdC1NYXRjaC1mdW5jdGlvbi1zaWduYXR1cmVzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4ZWMtdG9vbHMvMDAwMS1wcGMtZnMyZHQtTWF0
Y2gtZnVuY3Rpb24tc2lnbmF0dXJlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGEwN2U4
ZjIyYjRmMjI0ZGNhNzk3NjdlNWNiODZhMGRlOTE0OThkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMWJkMTg4MDBkNDc1MWRhYWUyODg2ZjQ3MWUxMTBiNzBkYzFkNjg0NyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDE3IE1heSAyMDI1IDA3OjQ4OjUwIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHBw
Yy9mczJkdDogTWF0Y2ggZnVuY3Rpb24gc2lnbmF0dXJlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDAyLXB1cmdhdG9yeS1QYXNzLXItZGlyZWN0
bHktdG8tbGlua2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29s
cy8wMDAyLXB1cmdhdG9yeS1QYXNzLXItZGlyZWN0bHktdG8tbGlua2VyLnBhdGNoCmluZGV4IGE1
MzdhYzJmMGIuLjEzMDEwNmM1MmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4
ZWMva2V4ZWMtdG9vbHMvMDAwMi1wdXJnYXRvcnktUGFzcy1yLWRpcmVjdGx5LXRvLWxpbmtlci5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDItcHVy
Z2F0b3J5LVBhc3Mtci1kaXJlY3RseS10by1saW5rZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGU1YmM5ZmJkNjAyOTA1N2E0ZTM4MTVhNTMyNmFmNWJkODNhNDUwZTYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDE2ZDVhYTMwOWU1MDM0ZGI3YTJkZDA3NzFhZmU0YzM4ZWE0MDRm
ZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogRGF0ZTogTW9uLCA3IFNlcCAyMDE1IDA3OjU5OjQ1ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHB1cmdhdG9yeTogUGFzcyAtciBkaXJlY3RseSB0byBsaW5rZXIKQEAgLTEwLDE2ICsx
MCwxNSBAQCB1bmZpbHRlcmVkCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLQogLS0tCiAgcHVyZ2F0b3J5L01h
a2VmaWxlIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvcHVyZ2F0b3J5L01ha2VmaWxlIGIvcHVyZ2F0b3J5L01ha2Vm
aWxlCi1pbmRleCA0ZDJkMDcxLi42NjczNDIzIDEwMDY0NAoraW5kZXggN2QxMTc1Zi4uNDUwMGE0
MSAxMDA2NDQKIC0tLSBhL3B1cmdhdG9yeS9NYWtlZmlsZQogKysrIGIvcHVyZ2F0b3J5L01ha2Vm
aWxlCi1AQCAtNjEsNyArNjEsNyBAQCAkKFBVUkdBVE9SWSk6IENQUEZMQUdTPSQoJChBUkNIKV9Q
VVJHQVRPUllfRVhUUkFfQ0ZMQUdTKSBcCitAQCAtNjIsNyArNjIsNyBAQCAkKFBVUkdBVE9SWSk6
IENQUEZMQUdTPSQoJChBUkNIKV9QVVJHQVRPUllfRVhUUkFfQ0ZMQUdTKSBcCiAgCQkJLUkkKHNo
ZWxsICQoQ0MpIC1wcmludC1maWxlLW5hbWU9aW5jbHVkZSkKICAkKFBVUkdBVE9SWSk6IExERkxB
R1M9JCgkKEFSQ0gpX1BVUkdBVE9SWV9FWFRSQV9DRkxBR1MpXAogIAkJCS1XbCwtLW5vLXVuZGVm
aW5lZCAtbm9zdGFydGZpbGVzIC1ub3N0ZGxpYiBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
a2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDUtRGlzYWJsZS1QSUUtZHVyaW5nLWxpbmsucGF0
Y2ggYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzLzAwMDUtRGlzYWJsZS1Q
SUUtZHVyaW5nLWxpbmsucGF0Y2gKaW5kZXggNmEyMTc0NGFjMS4uMzRiNmZkZGJhYSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29scy8wMDA1LURpc2FibGUt
UElFLWR1cmluZy1saW5rLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwva2V4ZWMva2V4
ZWMtdG9vbHMvMDAwNS1EaXNhYmxlLVBJRS1kdXJpbmctbGluay5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNDk0ODg4YmNjM2JiZjA3MGRmY2UxYjI2ODZlZTM0Yzg2MTlhYTMzZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjQ1OWMxYjVjZjc1Y2EyNmExMDk1ZDc0NzgxMmE0YjNk
MDdmZmM4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEwIEp1biAyMDE3IDExOjE4OjQ5IC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIERpc2FibGUgUElFIGR1cmluZyBsaW5rCkBAIC05LDE2ICs5LDE1IEBAIGp1
c3QgbmVlZCB0byBtYXRjaCBpdCB3aXRoIGxpbmtlciBmbGFncwogVXBzdHJlYW0tU3RhdHVzOiBQ
ZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0K
IC0tLQogIHB1cmdhdG9yeS9NYWtlZmlsZSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B1cmdhdG9yeS9NYWtlZmls
ZSBiL3B1cmdhdG9yeS9NYWtlZmlsZQotaW5kZXggNjY3MzQyMy4uYTc0MDVlYSAxMDA2NDQKK2lu
ZGV4IDQ1MDBhNDEuLmVmZmZjYTUgMTAwNjQ0CiAtLS0gYS9wdXJnYXRvcnkvTWFrZWZpbGUKICsr
KyBiL3B1cmdhdG9yeS9NYWtlZmlsZQotQEAgLTYwLDcgKzYwLDcgQEAgJChQVVJHQVRPUlkpOiBD
UFBGTEFHUz0kKCQoQVJDSClfUFVSR0FUT1JZX0VYVFJBX0NGTEFHUykgXAorQEAgLTYxLDcgKzYx
LDcgQEAgJChQVVJHQVRPUlkpOiBDUFBGTEFHUz0kKCQoQVJDSClfUFVSR0FUT1JZX0VYVFJBX0NG
TEFHUykgXAogIAkJCS1JaW5jbHVkZSBcCiAgCQkJLUkkKHNoZWxsICQoQ0MpIC1wcmludC1maWxl
LW5hbWU9aW5jbHVkZSkKICAkKFBVUkdBVE9SWSk6IExERkxBR1M9JCgkKEFSQ0gpX1BVUkdBVE9S
WV9FWFRSQV9DRkxBR1MpXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9r
ZXhlYy10b29sc18yLjAuMzEuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2tleGVjL2tleGVjLXRv
b2xzXzIuMC4zMi5iYgpzaW1pbGFyaXR5IGluZGV4IDY0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMta2VybmVsL2tleGVjL2tleGVjLXRvb2xzXzIuMC4zMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29sc18yLjAuMzIuYmIKaW5kZXggYjEyZjc2YTBiZi4u
MjRlNmQ1YmE0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10
b29sc18yLjAuMzEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rZXhlYy9rZXhlYy10b29s
c18yLjAuMzIuYmIKQEAgLTEsOSArMSw1MiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJ
TkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTIsNyArMiw3IEBACisjICAgICAgICAgICAgICAgICAg
ICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODks
IDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0
cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyA8aHR0cHM6
Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJp
YnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBj
aGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyBAQCAtMzA0LDggKzMwNCw3IEBACisj
ICAgICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAor
IyAgICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGFsb25nCisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwg
d3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBG
cmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgor
IyArICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9y
Zy9saWNlbnNlcy8+LgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29u
dGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyBAQCAtMzI5LDgg
KzMyOCw4IEBACisjICAgIFlveW9keW5lLCBJbmMuLCBoZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5
cmlnaHQgaW50ZXJlc3QgaW4gdGhlIHByb2dyYW0KKyMgICAgYEdub21vdmlzaW9uJyAod2hpY2gg
bWFrZXMgcGFzc2VzIGF0IGNvbXBpbGVycykgd3JpdHRlbiBieSBKYW1lcyBIYWNrZXIuCisjICAK
KyMgLSAgPHNpZ25hdHVyZSBvZiBUeSBDb29uPiwgMSBBcHJpbCAxOTg5CisjIC0gIFR5IENvb24s
IFByZXNpZGVudCBvZiBWaWNlCisjICsgIDxzaWduYXR1cmUgb2YgTW9lIEdob3VsPiwgMSBBcHJp
bCAxOTg5CisjICsgIE1vZSBHaG91bCwgUHJlc2lkZW50IG9mIFZpY2UKKyMgIAorIyAgVGhpcyBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGRvZXMgbm90IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlvdXIg
cHJvZ3JhbSBpbnRvCisjICBwcm9wcmlldGFyeSBwcm9ncmFtcy4gIElmIHlvdXIgcHJvZ3JhbSBp
cyBhIHN1YnJvdXRpbmUgbGlicmFyeSwgeW91IG1heQorIyAKKyMKKwogU1VNTUFSWSA9ICJLZXhl
YyBmYXN0IHJlYm9vdCB0b29scyIKIERFU0NSSVBUSU9OID0gIktleGVjIGlzIGEgZmFzdCByZWJv
b3QgZmVhdHVyZSB0aGF0IGxldHMgeW91IHJlYm9vdCB0byBhIG5ldyBMaW51eCBrZXJuZWwiCiBI
T01FUEFHRSA9ICJodHRwOi8va2VybmVsLm9yZy9wdWIvbGludXgvdXRpbHMva2VybmVsL2tleGVj
LyIKIFNFQ1RJT04gPSAia2VybmVsL3VzZXJsYW5kIgogTElDRU5TRSA9ICJHUEwtMi4wLW9ubHki
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0
NDg2YTgwZmRhZjRhNDI2MyBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT01NzBhOWIzNzQ5ZGQwNDYzYTE3Nzg4MDNiMTJhNmRjZSBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9rZXhlYy9rZXhlYy5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MjA7bWQ1PWFmMTBmNmFl
NGE4NzE1OTY1ZTY0OGFhNjg3YWQzZTA5IFwKICAgICAgICAgICAgICAgICAgICAgIgogREVQRU5E
UyA9ICJ6bGliIHh6IgpAQCAtMTksMTAgKzYyLDkgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19N
SVJST1J9L2xpbnV4L3V0aWxzL2tlcm5lbC9rZXhlYy9rZXhlYy10b29scy0ke1BWfS50YXIuZ3oK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtYXJtNjQta2V4ZWMtZGlzYWJsZWQtY2hlY2staWYta2Fz
bHItc2VlZC1kdGItcHJvcGVydC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWtleGVj
LmMtYWRkLU1GRF9OT0VYRUNfU0VBTC1mbGFnLWV4cGxpY2l0bHkucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1wcGMtZnMyZHQtTWF0Y2gtZnVuY3Rpb24tc2lnbmF0dXJlcy5wYXRjaCBc
Ci0gICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtdGhlLXNlZ21lbnQtYmFzZS1tYXRjaC1waW5u
ZWQtc2VjdGlvbi1hZGRyZXNzLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZGRhYWE2NWIwMmI0ZjhhYTkyMjI1ODZiMWYyNjU2NWI5M2E0YmFlZmZkMzViY2Jk
NTIzZjE1ZmFlN2FhNDg5NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MWM0Mjc2NTEyNjljYmE3
ZWNiMGEzYTUzNzQwMzA3NmM1Njk0OTQ5NzgzYjVjYzNhZTA0NjIyM2JjOTYyMDg3IgogCiBpbmhl
cml0IGF1dG90b29scyB1cGRhdGUtcmMuZCBzeXN0ZW1kCiAKLS0gCjIuNDcuMQoK

--===============4656905772421135881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/kexec-tools/kdump: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kdump: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dbg: PKGSIZE changed from 624536 to 625760 (+0%)
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dbg: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dbg: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dev: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-dev: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-doc: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-doc: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-locale: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-locale: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: PKGSIZE changed from 738543 to 741051 (+0%)
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: FILELIST: directory renamed /usr/src/debug/kexec-tools/2.0.31/include/boot -> /usr/src/debug/kexec-tools/2.0.32/include/boot, directory renamed /usr/src/debug/kexec-tools/2.0.31/kexec/arch/x86_64 -> /usr/src/debug/kexec-tools/2.0.32/kexec/arch/x86_64, directory renamed /usr/src/debug/kexec-tools/2.0.31/util_lib -> /usr/src/debug/kexec-tools/2.0.32/util_lib, directory renamed /usr/src/debug/kexec-tools/2.0.31/include -> /usr/src/debug/kexec-tools/2.0.32/include, directory renamed /usr/src/debug/kexec-tools/2.0.31/include/x86 -> /usr/src/debug/kexec-tools/2.0.32/include/x86, directory renamed /usr/src/debug/kexec-tools/2.0.31/kexec -> /usr/src/debug/kexec-tools/2.0.32/kexec, directory renamed /usr/src/debug/kexec-tools/2.0.31/kexec/arch/i386 -> /usr/src/debug/kexec-tools/2.0.32/kexec/arch/i386, directory renamed /usr/src/debug/kexec-tools/2.0.31/vmcore-dmesg -> /usr/src/debug/kexec-tools/2.0.32/vmcore-dmesg, directory renamed /
 usr/src/debug/kexec-tools/2.0.31/util_lib/include -> /usr/src/debug/kexec-tools/2.0.32/util_lib/include
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-src: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-staticdev: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools-staticdev: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec-tools: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/kexec: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/kexec: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.31.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch file://0001-ppc-fs2dt-Match-function-signatures.patch file://0001-Make-the-segment-base-match-pinned-section-address.patch" to "https://cdn.kernel.org/pub/linux/utils/kernel/kexec/kexec-tools-2.0.32.tar.gz file://kdump file://kdump.conf file://kdump.service file://0001-powerpc-change-the-memory-size-limit.patch file://0002-purgatory-Pass-r-directly-to-linker.patch file://0005-Disable-PIE-during-link.patch file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch file://0001-kexec.c-add-MFD_NOEXEC_SEAL
 -flag-explicitly.patch file://0001-ppc-fs2dt-Match-function-signatures.patch"
packages/x86-64-v3-poky-linux/kexec-tools: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools: PV changed from "2.0.31" to "2.0.32"
packages/x86-64-v3-poky-linux/kexec-tools/vmcore-dmesg: PKGV changed from 2.0.31 [default] to 2.0.32 [default]
packages/x86-64-v3-poky-linux/kexec-tools/vmcore-dmesg: PV changed from "2.0.31" to "2.0.32"

--===============4656905772421135881==--

