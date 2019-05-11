Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBFD07DED0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 16:16:51 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w8so8412405wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5WnKEti/kBO4Lk2M557PV9Q3+pQncNf51Hs56qlpFRI=;
	b=O/Q+IWo3Boh1h901oMlLHsOZssl6EnRJp4xWCiniMzKmNDw+3mU/SdfLSuTqa2xpk+
	pryDACk/M4rWNzAl1X0CwEsHNg0oaPOnXwOo1YP/nXgedFDTrvwTFiUfzQfyhH92F728
	jj8Dx7CeF8NzQbKFU8611w1hFz6yAfHvwqY97tlNIS5sESGoeHXg3gxym4eXWzZXdrJv
	gTOTnhjyhBUCkAyfTwAAI215HW6e2McI07Q74pndkkRJAKMn2juG4QrlwlUf9uiJoO2k
	GMJ9dzeNTTiy/b47kpRvEa+s9ouYBM9izj/IGZ8hSjkqfMB4YeSGZOJYWhMlqNf+KsVP
	IYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5WnKEti/kBO4Lk2M557PV9Q3+pQncNf51Hs56qlpFRI=;
	b=Egr8xrzCry9m2ZMBfaj2tEf6o5ArJCEi+X9SStMmeISqxpAM7PwC2SH6cS/67zFVbj
	msNNFqanTBEYQA71ogRY9Dwd3zqOJ29Db1O0EhnOjjPDiFhkQQBhlZVAMh6MMHFhohP8
	kLorD1F5fwWvbZlFDeqePqZF4MzFlkO2ppcBuWlp41wS3RtzcGItjYSyD3WrTOIsFvFg
	OMaPaNLaTCvRLroBgZCk7tyvJZ04OIYssmYCCwZt3D5oC5pgZJySK2biqrWJXuLRjWlW
	1DuAnh1/jTDvQAhTwX7Rn8FVW3IaJ3+bXXWfNDfoxNLaX/qblejMGgSmwZPCL+UDylKS
	Eacw==
X-Gm-Message-State: APjAAAWhQYmiqQ+9Tj6k/a0UKp+lWLg+tOA6Yb3c8Ey3Vjl28AwyrgT2
	ijAmw1jQ0XOBlHGpp3yNiItYzqm2
X-Google-Smtp-Source: APXvYqzXJTxpOpSxda42jztvLGvhM74PVCBL4jjIsWNSwygbrxK4yXiVRfXZB/EUqWeiWtn1ILX6mg==
X-Received: by 2002:adf:b645:: with SMTP id i5mr12065158wre.272.1557591412235; 
	Sat, 11 May 2019 09:16:52 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b8sm7334437wrr.64.2019.05.11.09.16.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 May 2019 09:16:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 May 2019 16:16:56 +0000
Message-Id: <20190511161656.2005-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] kexec-tools: refresh patches with devtool
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
X-List-Received-Date: Sat, 11 May 2019 16:16:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* to make it easier to rebase

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...owerpc-change-the-memory-size-limit.patch} | 12 ++---
 ...purgatory-Pass-r-directly-to-linker.patch} | 13 ++---
 ...ix-add_buffer_phys_virt-align-issue.patch} |  7 +--
 ...t-to-build-kexec-tools-with-x32-ABI.patch} | 47 ++++++++++---------
 ...tch => 0005-Disable-PIE-during-link.patch} |  7 +--
 .../kexec/kexec-tools_2.0.19.bb               | 18 +++----
 6 files changed, 50 insertions(+), 54 deletions(-)
 rename meta/recipes-kernel/kexec/kexec-tools/{0002-powerpc-change-the-memory-size-limit.patch => 0001-powerpc-change-the-memory-size-limit.patch} (75%)
 rename meta/recipes-kernel/kexec/kexec-tools/{0001-purgatory-Pass-r-directly-to-linker.patch => 0002-purgatory-Pass-r-directly-to-linker.patch} (83%)
 rename meta/recipes-kernel/kexec/kexec-tools/{0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch => 0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch} (94%)
 rename meta/recipes-kernel/kexec/kexec-tools/{kexec-x32.patch => 0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch} (59%)
 rename meta/recipes-kernel/kexec/kexec-tools/{0001-Disable-PIE-during-link.patch => 0005-Disable-PIE-during-link.patch} (88%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
similarity index 75%
rename from meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
rename to meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
index dc97d930e9..029650f35c 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-powerpc-change-the-memory-size-limit.patch
@@ -1,4 +1,4 @@
-From b19b68eab567aa534cf8dec79fe18e3dc0e14043 Mon Sep 17 00:00:00 2001
+From 211cae4b6a02a4d9d37bfcd76f3702696e095fc3 Mon Sep 17 00:00:00 2001
 From: Quanyang Wang <quanyang.wang@windriver.com>
 Date: Tue, 16 Jun 2015 12:59:57 +0800
 Subject: [PATCH] powerpc: change the memory size limit
@@ -20,11 +20,11 @@ Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
  kexec/arch/ppc/kexec-ppc.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/arch/ppc/kexec-ppc.h
-+++ kexec-tools-2.0.10/kexec/arch/ppc/kexec-ppc.h
-@@ -42,7 +42,7 @@ void dol_ppc_usage(void);
+diff --git a/kexec/arch/ppc/kexec-ppc.h b/kexec/arch/ppc/kexec-ppc.h
+index 04e728e..6bae9ec 100644
+--- a/kexec/arch/ppc/kexec-ppc.h
++++ b/kexec/arch/ppc/kexec-ppc.h
+@@ -44,7 +44,7 @@ void dol_ppc_usage(void);
   * During inital setup the kernel does not map the whole memory but a part of
   * it. On Book-E that is 64MiB, 601 24MiB or 256MiB (if possible).
   */
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
similarity index 83%
rename from meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch
rename to meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
index bfd077daf0..363d5da4ae 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-Pass-r-directly-to-linker.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-purgatory-Pass-r-directly-to-linker.patch
@@ -1,4 +1,4 @@
-From a1135b3170963ba956f2364c1283864c35541295 Mon Sep 17 00:00:00 2001
+From a04bcf8f683c1a5a7d015920124457ad56fb7cf0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Sep 2015 07:59:45 +0000
 Subject: [PATCH] purgatory: Pass -r directly to linker
@@ -8,17 +8,17 @@ where as gcc knows how to deal with it and passes it down to linker
 unfiltered
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+Upstream-Status: Pending
+---
  purgatory/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 2b5c061..b251353 100644
+index 2dd6c47..416e6b9 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -61,7 +61,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -60,7 +60,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
  			-Wl,--no-undefined -nostartfiles -nostdlib \
@@ -27,6 +27,3 @@ index 2b5c061..b251353 100644
  			-Wl,-Map=$(PURGATORY_MAP)
  
  $(PURGATORY): $(PURGATORY_OBJS)
--- 
-2.5.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
similarity index 94%
rename from meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
rename to meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
index 6c6c66d885..832fe67716 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
@@ -1,4 +1,4 @@
-From 78e497fb69950665e639cfab8f4fb50cc404a1eb Mon Sep 17 00:00:00 2001
+From 55e583d20651e829afbbc8dba0f8ec3017cda2d5 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
 Date: Mon, 9 Jan 2017 15:26:29 +0800
 Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue
@@ -17,7 +17,7 @@ Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index 245c21a..12139c3 100644
+index daa4788..3f72b38 100644
 --- a/kexec/arch/arm/crashdump-arm.c
 +++ b/kexec/arch/arm/crashdump-arm.c
 @@ -240,6 +240,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
@@ -47,6 +47,3 @@ index 245c21a..12139c3 100644
  					  crash_kernel_mem.start,
  					  crash_kernel_mem.end, -1, 0);
  
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch b/meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch
similarity index 59%
rename from meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
rename to meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch
index 26d18eb6fe..a809d5ba8e 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch
@@ -1,4 +1,10 @@
-x86_64: Add support to build kexec-tools with x32 ABI
+From 8c9a5076543eb3d497e016b3d7707e93d6311883 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Mon, 15 Jul 2013 23:32:36 -0700
+Subject: [PATCH] x86_64: Add support to build kexec-tools with x32 ABI
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Summary of changes,
 
@@ -13,7 +19,6 @@ Upstream-Status: Submitted
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
-
 ---
  configure.ac                             | 9 +++++++++
  kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
@@ -21,11 +26,11 @@ Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
  purgatory/arch/x86_64/Makefile           | 4 +++-
  4 files changed, 20 insertions(+), 1 deletion(-)
 
-Index: kexec-tools-2.0.10/configure.ac
-===================================================================
---- kexec-tools-2.0.10.orig/configure.ac
-+++ kexec-tools-2.0.10/configure.ac
-@@ -56,6 +56,15 @@ case $target_cpu in
+diff --git a/configure.ac b/configure.ac
+index c2b0c68..60882b8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,15 @@ case $target_cpu in
  		;;
  	ia64|x86_64|alpha|m68k )
  		ARCH="$target_cpu"
@@ -41,11 +46,11 @@ Index: kexec-tools-2.0.10/configure.ac
  		;;
  	* )
  		AC_MSG_ERROR([unsupported architecture $target_cpu])
-Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
+diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+index db85b44..0ce1172 100644
+--- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_ehdr *ehdr)
  	if (ehdr->ei_data != ELFDATA2LSB) {
  		return 0;
  	}
@@ -57,10 +62,10 @@ Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
  		return 0;
  	}
  	if (ehdr->e_machine != EM_X86_64) {
-Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
-+++ kexec-tools-2.0.10/kexec/kexec-syscall.h
+diff --git a/kexec/kexec-syscall.h b/kexec/kexec-syscall.h
+index dac1c1f..e9479b7 100644
+--- a/kexec/kexec-syscall.h
++++ b/kexec/kexec-syscall.h
 @@ -31,8 +31,12 @@
  #define __NR_kexec_load		268
  #endif
@@ -74,11 +79,11 @@ Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
  #ifdef __s390x__
  #define __NR_kexec_load		277
  #endif
-Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
-===================================================================
---- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
-+++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/
+diff --git a/purgatory/arch/x86_64/Makefile b/purgatory/arch/x86_64/Makefile
+index 7300937..4af11e4 100644
+--- a/purgatory/arch/x86_64/Makefile
++++ b/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/i386/console-x86.c
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
  x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
  
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
similarity index 88%
rename from meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
rename to meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
index 3f2f85e337..7a4b8548ca 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-Disable-PIE-during-link.patch
@@ -1,4 +1,4 @@
-From ea7be6d71b85880e8e8a2c8a4f49a696c5f31ae4 Mon Sep 17 00:00:00 2001
+From c54488ad5fd657e0f154d76d7456d9080be24836 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 11:18:49 -0700
 Subject: [PATCH] Disable PIE during link
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 564bdb7..a08e41f 100644
+index 416e6b9..f00edb4 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
 @@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
@@ -26,6 +26,3 @@ index 564bdb7..a08e41f 100644
  			-nodefaultlibs -e purgatory_start -Wl,-r \
  			-Wl,-Map=$(PURGATORY_MAP)
  
--- 
-2.13.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
index f65cd9f106..3439899070 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
@@ -10,15 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
 DEPENDS = "zlib xz"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
-           file://kdump \
-           file://kdump.conf \
-           file://kdump.service \
-           file://0002-powerpc-change-the-memory-size-limit.patch \
-           file://0001-purgatory-Pass-r-directly-to-linker.patch \
-           file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
-           file://kexec-x32.patch \
-           file://0001-Disable-PIE-during-link.patch \
-           "
+    file://kdump \
+    file://kdump.conf \
+    file://kdump.service \
+    file://0001-powerpc-change-the-memory-size-limit.patch \
+    file://0002-purgatory-Pass-r-directly-to-linker.patch \
+    file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
+    file://0004-x86_64-Add-support-to-build-kexec-tools-with-x32-ABI.patch \
+    file://0005-Disable-PIE-during-link.patch \
+"
 
 SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
 SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
-- 
2.17.1


