Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.2400.1609185890969597847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HthCmKgi;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g24so10735963edw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DLaO28PyIgEU5oP2n0GBRkR9+ORUgdyzGTf1xUCvkbM=;
        b=HthCmKgiuKaECq09Bw/EH2Evr/46F0/kjlBv4gub9M0KRPeIyqBWh2DdoOuCgcn/1O
         dpI645C79hhuivldqDdM3JSnCMWZFxULLn7Gjbs8QxOMhbufAMxVjAzBDgVEonBa6M4t
         s8i4V8j0g03Z3o8zo6pU/v5Oza8stQIGs5dJ4Uaq79yzECt6REsRpIejz1TkUVD9mdtD
         BLouOt7JTF8tkpLdiipdJi/Sg3/S0RRJfJl4PKqULxYKClCtp9yo7xe1DKQYfyL6LVdM
         egz60IH0k0KVTpB2XLtV4/VJZeyu+A6kP7oD8rn2Wc3p3Z+c+UpFXAp5ySpD9XCvxeNz
         1DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLaO28PyIgEU5oP2n0GBRkR9+ORUgdyzGTf1xUCvkbM=;
        b=dXy9MIM83HTHTS5Kntq+2uGoTj6jMGvvt+WFSAIXZpaChzfvCg0pnW2kVMU/mfoZLe
         BADTL54tLKK9fK6/gUy6wvhzeRDNexWs+0s8wwdmhSvxx4y1/PSfaFfCJYVkPxt2BEB6
         tL7mZBd9rg1PeSXBUx0FdaAW3IDGSmaie7Q1Z1mquLpsl9wRVLWMpXHO6dz/6oV3/9FY
         kcIiBz5c0CeeXaFIzO94OjbSxzGqexahFF4Lwsox3lyOKkVxcai1ZRV82UW406z9I+PH
         zojOtRNMvfeQKtQChGJkmJ+5Vj4nH9X+TVjz0X+NhIS+crdiGQo2UKmh+W/itXE7rrTZ
         bytw==
X-Gm-Message-State: AOAM533dM5gUWMcto4PuwO4JDxBJXWlOoNEP9BLnFm7eHdqxjywWB9AK
	zROk5JjstkPf02OoMK8wmOHWlx2mKsM=
X-Google-Smtp-Source: ABdhPJwcqqXYrqIE3yAYQgziPbMEinbA87P1m75ZbN2X/WxtFpiBt4KE7LZ//pmVlO1O+4T4zi8WHg==
X-Received: by 2002:a50:8b61:: with SMTP id l88mr44492022edl.250.1609185889495;
        Mon, 28 Dec 2020 12:04:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/22] kexec-tools: update 2.0.20 -> 2.0.21
Date: Mon, 28 Dec 2020 21:04:23 +0100
Message-Id: <20201228200436.78130-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop patches that are either backports, or are obsolete
by upstream fixing the issues.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...0001-kexec-Fix-build-with-fno-common.patch | 78 ----------------
 ...exec-ppc.c-correct-double-definition.patch | 23 +++++
 ...rt-to-build-kexec-tools-with-x32-ABI.patch | 93 -------------------
 ...ndefine-__NR_kexec_file_load-for-arm.patch | 40 --------
 ...xec-un-break-the-build-on-32-bit-x86.patch | 13 +--
 ...-tools_2.0.20.bb => kexec-tools_2.0.21.bb} |  7 +-
 6 files changed, 32 insertions(+), 222 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.20.bb => kexec-tools_2.0.21.bb} (89%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
deleted file mode 100644
index 31f4d00b53..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-Fix-build-with-fno-common.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From c5fec6d6368b4103557deb710150119dca438544 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Aug 2020 10:46:39 -0700
-Subject: [PATCH] kexec: Fix build with -fno-common
-
-Ensure that my_debug is not doubly defined
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kexec/arch/ppc64/kexec-elf-ppc64.c | 2 --
- kexec/fs2dt.h                      | 2 +-
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
---- a/kexec/arch/ppc64/kexec-elf-ppc64.c
-+++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
-@@ -44,8 +44,6 @@
- uint64_t initrd_base, initrd_size;
- unsigned char reuse_initrd = 0;
- const char *ramdisk;
--/* Used for enabling printing message from purgatory code */
--int my_debug = 0;
- 
- int elf_ppc64_probe(const char *buf, off_t len)
- {
---- a/kexec/fs2dt.h
-+++ b/kexec/fs2dt.h
-@@ -30,7 +30,7 @@ extern struct bootblock bb[1];
- 
- /* Used for enabling printing message from purgatory code
-  * Only has implemented for PPC64 */
--int my_debug;
-+extern int my_debug;
- extern int dt_no_old_root;
- 
- void reserve(unsigned long long where, unsigned long long length);
---- a/kexec/arch/arm64/kexec-arm64.h
-+++ b/kexec/arch/arm64/kexec-arm64.h
-@@ -50,8 +50,8 @@ int zImage_arm64_load(int argc, char **a
- void zImage_arm64_usage(void);
- 
- 
--off_t initrd_base;
--off_t initrd_size;
-+extern off_t initrd_base;
-+extern off_t initrd_size;
- 
- /**
-  * struct arm64_mem - Memory layout info.
-@@ -65,7 +65,7 @@ struct arm64_mem {
- };
- 
- #define arm64_mem_ngv UINT64_MAX
--struct arm64_mem arm64_mem;
-+extern struct arm64_mem arm64_mem;
- 
- uint64_t get_phys_offset(void);
- uint64_t get_vp_offset(void);
---- a/kexec/arch/x86_64/kexec-bzImage64.c
-+++ b/kexec/arch/x86_64/kexec-bzImage64.c
-@@ -42,7 +42,6 @@
- #include <arch/options.h>
- 
- static const int probe_debug = 0;
--int bzImage_support_efi_boot;
- 
- int bzImage64_probe(const char *buf, off_t len)
- {
---- a/kexec/arch/ppc/kexec-elf-ppc.c
-+++ b/kexec/arch/ppc/kexec-elf-ppc.c
-@@ -33,7 +33,6 @@
- static const int probe_debug = 0;
- 
- unsigned char reuse_initrd;
--const char *ramdisk;
- int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
- 			char *);
- 
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch
new file mode 100644
index 0000000000..6aeebc3939
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch
@@ -0,0 +1,23 @@
+From ba2fb5baf6b0a8c882ac32301dd7a8d16de0dcf6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 27 Dec 2020 23:39:29 +0100
+Subject: [PATCH] kexec/arch/ppc/kexec-ppc.c: correct double definition error
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ kexec/arch/ppc/kexec-ppc.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/kexec/arch/ppc/kexec-ppc.c b/kexec/arch/ppc/kexec-ppc.c
+index 03bec36..5b3e244 100644
+--- a/kexec/arch/ppc/kexec-ppc.c
++++ b/kexec/arch/ppc/kexec-ppc.c
+@@ -35,7 +35,6 @@ unsigned long long initrd_base = 0, initrd_size = 0;
+ unsigned long long ramdisk_base = 0, ramdisk_size = 0;
+ unsigned int rtas_base, rtas_size;
+ int max_memory_ranges;
+-const char *ramdisk;
+ 
+ /*
+  * Reads the #address-cells and #size-cells on this platform.
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch b/meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch
deleted file mode 100644
index a809d5ba8e..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 8c9a5076543eb3d497e016b3d7707e93d6311883 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Mon, 15 Jul 2013 23:32:36 -0700
-Subject: [PATCH] x86_64: Add support to build kexec-tools with x32 ABI
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Summary of changes,
-
-configure.ac: Add test for detect x32 ABI.
-purgatory/arch/x86_64/Makefile: Not use mcmodel large when
-	x32 ABI is set.
-kexec/arch/x86_64/kexec-elf-rel-x86_64.c: When x32 ABI is set
-	use ELFCLASS32 instead of ELFCLASS64.
-kexec/kexec-syscall.h: Add correct syscall number for x32 ABI.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
----
- configure.ac                             | 9 +++++++++
- kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
- kexec/kexec-syscall.h                    | 4 ++++
- purgatory/arch/x86_64/Makefile           | 4 +++-
- 4 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c2b0c68..60882b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,6 +54,15 @@ case $target_cpu in
- 		;;
- 	ia64|x86_64|alpha|m68k )
- 		ARCH="$target_cpu"
-+
-+		dnl ---Test for x32 ABI in x86_64
-+		if test "x$ARCH" = "xx86_64" ; then
-+			AC_EGREP_CPP(x32_test,
-+			[#if defined(__x86_64__) && defined (__ILP32__)
-+				x32_test
-+			#endif
-+			], SUBARCH='x32', SUBARCH='64')
-+		fi
- 		;;
- 	* )
- 		AC_MSG_ERROR([unsupported architecture $target_cpu])
-diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-index db85b44..0ce1172 100644
---- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
- 	if (ehdr->ei_data != ELFDATA2LSB) {
- 		return 0;
- 	}
-+#ifdef __ILP32__
-+	if (ehdr->ei_class != ELFCLASS32) {
-+#else
- 	if (ehdr->ei_class != ELFCLASS64) {
-+#endif
- 		return 0;
- 	}
- 	if (ehdr->e_machine != EM_X86_64) {
-diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index dac1c1f..e9479b7 100644
---- a/kexec/kexec-syscall.h
-+++ b/kexec/kexec-syscall.h
-@@ -31,8 +31,12 @@
- #define __NR_kexec_load		268
- #endif
- #ifdef __x86_64__
-+#ifdef __ILP32__
-+#define __NR_kexec_load		528
-+#else
- #define __NR_kexec_load		246
- #endif
-+#endif
- #ifdef __s390x__
- #define __NR_kexec_load		277
- #endif
-diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
-index 7300937..4af11e4 100644
---- a/purgatory/arch/x86_64/Makefile
-+++ b/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
- 
--x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+ifeq ($(SUBARCH),64)
-+        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+endif
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch b/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
deleted file mode 100644
index 6811dfa597..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b54816eff272324320c490d62dc36b27d2838732 Mon Sep 17 00:00:00 2001
-From: Quanyang Wang <quanyang.wang@windriver.com>
-Date: Mon, 16 Sep 2019 10:49:05 +0800
-Subject: [PATCH] kexec/arm: undefine __NR_kexec_file_load for arm
-
-In the kernel upstream commit 4ab65ba7a5cb
-("ARM: add kexec_file_load system call number"),
-__NR_kexec_file_load for arm has been defined to be 401.
-This results that even if kexec_file_load isn't implemented
-for arm but the function is_kexec_file_load_implemented()
-will still return true. So undef __NR_kexec_file_load for
-arm architecture.
-
-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/kexec/kexec-syscall.h?id=b54816eff272324320c490d62dc36b27d2838732]
-
-Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
----
- kexec/kexec-syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
-index dac1c1f..92d51d3 100644
---- a/kexec/kexec-syscall.h
-+++ b/kexec/kexec-syscall.h
-@@ -56,6 +56,10 @@
- #endif
- #endif /*ifndef __NR_kexec_load*/
- 
-+#ifdef __arm__
-+#undef __NR_kexec_file_load
-+#endif
-+
- #ifndef __NR_kexec_file_load
- 
- #ifdef __x86_64__
--- 
-2.17.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch b/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
index b91608e52b..36b0845f4a 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0007-kexec-un-break-the-build-on-32-bit-x86.patch
@@ -1,20 +1,21 @@
-From d294c5039753a36506949ba5dc782a4c0b307b74 Mon Sep 17 00:00:00 2001
+From bb6a26371d15473b380459ac4404bf330634b585 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 17:21:08 +0100
 Subject: [PATCH] kexec: un-break the build on 32 bit x86
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  kexec/arch/i386/Makefile    | 1 +
  kexec/arch/i386/kexec-x86.h | 4 ++++
  2 files changed, 5 insertions(+)
 
 diff --git a/kexec/arch/i386/Makefile b/kexec/arch/i386/Makefile
-index 105cefd..25df57a 100644
+index f486103..5d560be 100644
 --- a/kexec/arch/i386/Makefile
 +++ b/kexec/arch/i386/Makefile
-@@ -11,6 +11,7 @@ i386_KEXEC_SRCS += kexec/arch/i386/kexec-beoboot-x86.c
+@@ -12,6 +12,7 @@ i386_KEXEC_SRCS += kexec/arch/i386/kexec-beoboot-x86.c
  i386_KEXEC_SRCS += kexec/arch/i386/kexec-nbi.c
  i386_KEXEC_SRCS += kexec/arch/i386/x86-linux-setup.c
  i386_KEXEC_SRCS += kexec/arch/i386/crashdump-x86.c
@@ -23,7 +24,7 @@ index 105cefd..25df57a 100644
  dist += kexec/arch/i386/Makefile $(i386_KEXEC_SRCS)			\
  	kexec/arch/i386/crashdump-x86.h					\
 diff --git a/kexec/arch/i386/kexec-x86.h b/kexec/arch/i386/kexec-x86.h
-index 1b58c3b..d6b10c0 100644
+index 0f941df..c423171 100644
 --- a/kexec/arch/i386/kexec-x86.h
 +++ b/kexec/arch/i386/kexec-x86.h
 @@ -56,9 +56,13 @@ struct arch_options_t {
@@ -38,5 +39,5 @@ index 1b58c3b..d6b10c0 100644
  void multiboot_x86_usage(void);
 +void multiboot2_x86_usage(void);
  
- int elf_x86_probe(const char *buf, off_t len);
- int elf_x86_load(int argc, char **argv, const char *buf, off_t len,
+ int multiboot2_x86_load(int argc, char **argv, const char *buf, off_t len,
+ 			struct kexec_info *info);
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.21.bb
similarity index 89%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.21.bb
index 69d2e9bfba..069e8f4d05 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.21.bb
@@ -16,16 +16,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-powerpc-change-the-memory-size-limit.patch \
            file://0002-purgatory-Pass-r-directly-to-linker.patch \
            file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
-           file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch \
            file://0005-Disable-PIE-during-link.patch \
-           file://0006-kexec-arm-undefine-__NR_kexec_file_load-for-arm.patch \
            file://0007-kexec-un-break-the-build-on-32-bit-x86.patch \
-           file://0001-kexec-Fix-build-with-fno-common.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
+           file://0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch \
            "
 
-SRC_URI[md5sum] = "46724b67f32501c5d3e778161347cad9"
-SRC_URI[sha256sum] = "cb16d79818e0c9de3bb3e33ede5677c34a1d28c646379c7ab44e0faa3eb57a16"
+SRC_URI[sha256sum] = "b3d4cfd2ba10d68ce341ea3b8ca414d00a0b6183b95686172154f94bce834f94"
 
 inherit autotools update-rc.d systemd
 
-- 
2.29.2

