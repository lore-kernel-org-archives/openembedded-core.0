Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 23A6A7C37F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 05:22:50 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a12so2764443wrn.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 22:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bJUaupj5t4O+ZkTHB5X8xmXVeFuzhl1+6/Z21p7pBPQ=;
	b=ROcrFddZvjNGvbWK+7gUfP2PXD0+99TWsitXnmB7Xm70xVHCbFAJeMKtHOsa1nh4/T
	3HOFu9x6oxAbr5ANzZkkqXFYHlMCy1ah5NqJhXm1CNBmSce9K+ywjmzqwJsNSFZNvhL+
	JjJKx/UnF/VUx+58VKaQ+NYkiYkgXjm9oySGU8AcGPmkCWeqErscNqEmlImnGLroEBRG
	cCHX+Z5Qq0qwwoMA/fkb2ulT1+sfPv4pxYwFnjtQp+T5wnDkmJ6AeGLx8J3J2Xz4GiB/
	PD/2Fq7nO/C/RqPzKL5UeHozuXOB5YHLc3vOHXpa7g9fNPqB0+7GJig3etfNvn/4JpWa
	DDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bJUaupj5t4O+ZkTHB5X8xmXVeFuzhl1+6/Z21p7pBPQ=;
	b=plhFCJ2NwBMiXd3v/SZsAsF3nhJnfS+S2ft7QGO0Zw6h9uxUQFsAXVeSMHFGR42EZk
	iYKqZJjV7nFlJs/Jk3pN92HyxH0NwrExarjZVQIrydtvUNZyR2l2qm8G5w3iGUAUTxVp
	Xt+p1Y46JuReDjJtCtQ+bFiJ7JrUTJ4FK1bx99uG+y7koFgn8wL8goOggUvg6U6Qnt+y
	wcptwXm3wU/v5qOMNBvuxjQYBw41BVWU6WCASiFEebvsxWtCuACtRdmxHgvyI9A5Sy4y
	9AuFRnYVmURC0wbpC6xxJ5bW/Tn6P/lD+50jl0sT/Pua+aVa4R8wfctxIWiWevN3YdYw
	B7aQ==
X-Gm-Message-State: APjAAAVGu2KVh+n63VWg1P37iv4ZRKpcGRvben2Y4h1RWrxrftBev+pc
	bUx5dgrobkPkc57Pici+nSZC2ngi
X-Google-Smtp-Source: APXvYqxNsDYoW/rJ6em84ifncJ6ndABObeGicohHrp7yk9lt22qs3Zs9SfrFefUKgLUtR8OM9U/hDw==
X-Received: by 2002:adf:fb11:: with SMTP id c17mr12991401wrr.237.1557033770241;
	Sat, 04 May 2019 22:22:50 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id u8sm6476387wmj.27.2019.05.04.22.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 22:22:48 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 06:22:44 +0100
Message-Id: <20190505052244.21608-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] patchelf: Upgrade 0.9 -> 0.10
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
X-List-Received-Date: Sun, 05 May 2019 05:22:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop patches merged (or redone differently) upstream

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../patchelf/Increase-maxSize-to-64MB.patch   |  46 -----
 .../Skip-empty-section-fixes-66.patch         |  30 ----
 .../patchelf/patchelf/avoidholes.patch        | 163 ------------------
 .../patchelf/fix-adjusting-startPage.patch    |  15 +-
 .../patchelf/handle-read-only-files.patch     |  17 +-
 .../{patchelf_0.9.bb => patchelf_0.10.bb}     |   9 +-
 6 files changed, 21 insertions(+), 259 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.9.bb => patchelf_0.10.bb} (58%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch b/meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch
deleted file mode 100644
index 49050a18d278..000000000000
--- a/meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e3658740ec100e4c8cf83295460b032979e1a99a Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Fri, 9 Sep 2016 18:21:32 -0300
-Subject: [PATCH] Increase maxSize to 64MB
-Organization: O.S. Systems Software LTDA.
-
-Fix error:
-
-/
-|ERROR: qemu-native-2.5.0-r1 do_populate_sysroot_setscene: '('patchelf-uninative',
-|'--set-interpreter', '../build/tmp/sysroots-uninative/x86_64-linux/lib/
-|ld-linux-x86-64.so.2', '../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
-|sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64')'
-|failed with exit code 1 and the following output:
-|warning: working around a Linux kernel bug by creating a hole of 36032512
-|bytes in ‘../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
-|sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64’
-|maximum file size exceeded
-\
-
-Similar issue is discussed here:
-https://github.com/NixOS/patchelf/issues/47
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- src/patchelf.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index a59c12d..0fd7355 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -279,7 +279,7 @@ static void readFile(string fileName)
-     struct stat st;
-     if (stat(fileName.c_str(), &st) != 0) error("stat");
-     fileSize = st.st_size;
--    maxSize = fileSize + 32 * 1024 * 1024;
-+    maxSize = fileSize + 64 * 1024 * 1024;
- 
-     contents = (unsigned char *) malloc(fileSize + maxSize);
-     if (!contents) abort();
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch b/meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
deleted file mode 100644
index 9ee8a554a7ff..000000000000
--- a/meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 73526cb546ae6b00ea6169e40b01fb7b5f0dbb50 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 28 Jul 2016 11:05:06 -0300
-Subject: [PATCH] Skip empty section (fixes #66)
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Pending
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- src/patchelf.cc | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 136098f..2677a26 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -684,6 +684,9 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsExecutable()
-     for (unsigned int i = 1; i <= lastReplaced; ++i) {
-         Elf_Shdr & shdr(shdrs[i]);
-         string sectionName = getSectionName(shdr);
-+        if (sectionName == "") {
-+            continue;
-+        }
-         debug("looking at section `%s'\n", sectionName.c_str());
-         /* !!! Why do we stop after a .dynstr section? I can't
-            remember! */
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch b/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
deleted file mode 100644
index 0b45c39bda3d..000000000000
--- a/meta/recipes-devtools/patchelf/patchelf/avoidholes.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-Different types of binaries create challenges for patchelf. In order to extend 
-sections they need to be moved within the binary. The current approach to 
-handling ET_DYN binaries is to move the INTERP section to the end of the file.
-This means changing PT_PHDR to add an extra PT_LOAD section so that the new section
-is mmaped into memory by the elf loader in the kernel. In order to extend PHDR,
-this means moving it to the end of the file.
-
-Its documented in patchelf there is a kernel 'bug' which means that if you have holes
-in memory between the base load address and the PT_LOAD segment that contains PHDR,
-it will pass an incorrect PHDR address to ld.so and fail to load the binary, segfaulting.
-
-To avoid this, the code currently inserts space into the binary to ensure that when 
-loaded into memory there are no holes between the PT_LOAD sections. This inflates the 
-binaries by many MBs in some cases. Whilst we could make them sparse, there is a second
-issue which is that strip can fail to process these binaries:
-
-$ strip fixincl
-Not enough room for program headers, try linking with -N
-[.note.ABI-tag]: Bad value
-
-This turns out to be due to libbfd not liking the relocated PHDR section either 
-(https://github.com/NixOS/patchelf/issues/10).
-
-Instead this patch implements a different approach, leaving PHDR where it is but extending
-it in place to allow addition of a new PT_LOAD section. This overwrites sections in the 
-binary but those get moved to the end of the file in the new PT_LOAD section.
-
-This is based on patches linked from the above github issue, however whilst the idea
-was good, the implementation wasn't correct and they've been rewritten here.
-
-RP
-2017/3/7
-
-Upstream-Status: Accepted
-
-Index: patchelf-0.9/src/patchelf.cc
-===================================================================
---- patchelf-0.9.orig/src/patchelf.cc
-+++ patchelf-0.9/src/patchelf.cc
-@@ -146,6 +146,8 @@ private:
-     string & replaceSection(const SectionName & sectionName,
-         unsigned int size);
- 
-+    bool haveReplacedSection(const SectionName & sectionName);
-+
-     void writeReplacedSections(Elf_Off & curOff,
-         Elf_Addr startAddr, Elf_Off startOffset);
- 
-@@ -497,6 +499,16 @@ unsigned int ElfFile<ElfFileParamNames>:
-     return 0;
- }
- 
-+template<ElfFileParams>
-+bool ElfFile<ElfFileParamNames>::haveReplacedSection(const SectionName & sectionName)
-+{
-+    ReplacedSections::iterator i = replacedSections.find(sectionName);
-+
-+    if (i != replacedSections.end())
-+        return true;
-+    return false;
-+}
-+
- 
- template<ElfFileParams>
- string & ElfFile<ElfFileParamNames>::replaceSection(const SectionName & sectionName,
-@@ -595,52 +607,52 @@ void ElfFile<ElfFileParamNames>::rewrite
- 
-     debug("last page is 0x%llx\n", (unsigned long long) startPage);
- 
-+    /* Because we're adding a new section header, we're necessarily increasing
-+       the size of the program header table.  This can cause the first section
-+       to overlap the program header table in memory; we need to shift the first
-+       few segments to someplace else. */
-+    /* Some sections may already be replaced so account for that */
-+    unsigned int i = 1;
-+    Elf_Addr pht_size = sizeof(Elf_Ehdr) + (phdrs.size() + 1)*sizeof(Elf_Phdr);
-+    while( shdrs[i].sh_addr <= pht_size && i < rdi(hdr->e_shnum) ) {
-+        if (not haveReplacedSection(getSectionName(shdrs[i])))
-+            replaceSection(getSectionName(shdrs[i]), shdrs[i].sh_size);
-+        i++;
-+    }
- 
--    /* Compute the total space needed for the replaced sections and
--       the program headers. */
--    off_t neededSpace = (phdrs.size() + 1) * sizeof(Elf_Phdr);
-+    /* Compute the total space needed for the replaced sections */
-+    off_t neededSpace = 0;
-     for (ReplacedSections::iterator i = replacedSections.begin();
-          i != replacedSections.end(); ++i)
-         neededSpace += roundUp(i->second.size(), sectionAlignment);
-     debug("needed space is %d\n", neededSpace);
- 
--
-     size_t startOffset = roundUp(fileSize, getPageSize());
- 
-     growFile(startOffset + neededSpace);
- 
--
-     /* Even though this file is of type ET_DYN, it could actually be
-        an executable.  For instance, Gold produces executables marked
--       ET_DYN.  In that case we can still hit the kernel bug that
--       necessitated rewriteSectionsExecutable().  However, such
--       executables also tend to start at virtual address 0, so
-+       ET_DYN as does LD when linking with pie. If we move PT_PHDR, it
-+       has to stay in the first PT_LOAD segment or any subsequent ones
-+       if they're continuous in memory due to linux kernel constraints
-+       (see BUGS). Since the end of the file would be after bss, we can't 
-+       move PHDR there, we therefore choose to leave PT_PHDR where it is but
-+       move enough following sections such that we can add the extra PT_LOAD
-+       section to it. This PT_LOAD segment ensures the sections at the end of
-+       the file are mapped into memory for ld.so to process.
-+       We can't use the approach in rewriteSectionsExecutable()
-+       since DYN executables tend to start at virtual address 0, so
-        rewriteSectionsExecutable() won't work because it doesn't have
--       any virtual address space to grow downwards into.  As a
--       workaround, make sure that the virtual address of our new
--       PT_LOAD segment relative to the first PT_LOAD segment is equal
--       to its offset; otherwise we hit the kernel bug.  This may
--       require creating a hole in the executable.  The bigger the size
--       of the uninitialised data segment, the bigger the hole. */
-+       any virtual address space to grow downwards into. */
-     if (isExecutable) {
-         if (startOffset >= startPage) {
-             debug("shifting new PT_LOAD segment by %d bytes to work around a Linux kernel bug\n", startOffset - startPage);
--        } else {
--            size_t hole = startPage - startOffset;
--            /* Print a warning, because the hole could be very big. */
--            fprintf(stderr, "warning: working around a Linux kernel bug by creating a hole of %zu bytes in ‘%s’\n", hole, fileName.c_str());
--            assert(hole % getPageSize() == 0);
--            /* !!! We could create an actual hole in the file here,
--               but it's probably not worth the effort. */
--            growFile(fileSize + hole);
--            startOffset += hole;
-         }
-         startPage = startOffset;
-     }
- 
--
--    /* Add a segment that maps the replaced sections and program
--       headers into memory. */
-+    /* Add a segment that maps the replaced sections into memory. */
-     phdrs.resize(rdi(hdr->e_phnum) + 1);
-     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
-     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
-@@ -653,15 +665,12 @@ void ElfFile<ElfFileParamNames>::rewrite
- 
- 
-     /* Write out the replaced sections. */
--    Elf_Off curOff = startOffset + phdrs.size() * sizeof(Elf_Phdr);
-+    Elf_Off curOff = startOffset;
-     writeReplacedSections(curOff, startPage, startOffset);
-     assert(curOff == startOffset + neededSpace);
- 
--
--    /* Move the program header to the start of the new area. */
--    wri(hdr->e_phoff, startOffset);
--
--    rewriteHeaders(startPage);
-+    /* Write out the updated program and section headers */
-+    rewriteHeaders(hdr->e_phoff);
- }
- 
- 
diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch b/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
index f64cbed5cb19..a0988423feea 100644
--- a/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/fix-adjusting-startPage.patch
@@ -1,6 +1,9 @@
+From 1630d3f846c7721b1e7cd3b005bb2b34816e1d0f Mon Sep 17 00:00:00 2001
+From: Ed Bartosh <ed.bartosh@linux.intel.com>
+Date: Fri, 21 Jul 2017 12:33:53 +0300
+Subject: [PATCH] patchelf: fix segfault for binaries linked by gold
+
 commit 1cc234fea5600190d872329aca60e2365cefc39e
-Author: Ed Bartosh <ed.bartosh@linux.intel.com>
-Date:   Fri Jul 21 12:33:53 2017 +0300
 
 fix adjusting startPage
 
@@ -19,11 +22,15 @@ Github PR: https://github.com/NixOS/patchelf/pull/127
 
 Upstream-Status: Submitted
 
+---
+ src/patchelf.cc | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
 diff --git a/src/patchelf.cc b/src/patchelf.cc
-index cbd36c0..e9d7ea5 100644
+index a63e3a11c61f..2483d25d78f1 100644
 --- a/src/patchelf.cc
 +++ b/src/patchelf.cc
-@@ -720,10 +720,8 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+@@ -756,10 +756,8 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
         since DYN executables tend to start at virtual address 0, so
         rewriteSectionsExecutable() won't work because it doesn't have
         any virtual address space to grow downwards into. */
diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
index 9fafec4b592a..5069bd4b0d7d 100644
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -1,26 +1,26 @@
-From 2a603acb65993698c21f1c6eb7664f93ad830d52 Mon Sep 17 00:00:00 2001
+From 7f1fd10cfebd5ea2f3e1938abe1bd1c4828164a7 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Fri, 9 Sep 2016 16:00:42 -0300
 Subject: [PATCH] handle read-only files
-Organization: O.S. Systems Software LTDA.
 
 Patch from:
 https://github.com/darealshinji/patchelf/commit/40e66392bc4b96e9b4eda496827d26348a503509
 
-Upstream-Status: Pending
+Upstream-Status: Rejected [https://github.com/NixOS/patchelf/pull/89]
 
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+
 ---
  src/patchelf.cc | 16 +++++++++++++++-
  1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 136098f..aea360e 100644
+index 0b4965adff83..b5db2aef0e8a 100644
 --- a/src/patchelf.cc
 +++ b/src/patchelf.cc
-@@ -388,7 +388,17 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
+@@ -497,7 +497,17 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
  
- static void writeFile(string fileName)
+ static void writeFile(std::string fileName, FileContents contents)
  {
 -    int fd = open(fileName.c_str(), O_TRUNC | O_WRONLY);
 +    struct stat st;
@@ -37,7 +37,7 @@ index 136098f..aea360e 100644
      if (fd == -1)
          error("open");
  
-@@ -397,6 +407,10 @@ static void writeFile(string fileName)
+@@ -511,6 +521,10 @@ static void writeFile(std::string fileName, FileContents contents)
  
      if (close(fd) != 0)
          error("close");
@@ -48,6 +48,3 @@ index 136098f..aea360e 100644
  }
  
  
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.9.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
similarity index 58%
rename from meta/recipes-devtools/patchelf/patchelf_0.9.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.10.bb
index d70303963c42..580108e8b8ad 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.9.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,16 +1,13 @@
 SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
-           file://Skip-empty-section-fixes-66.patch \
            file://handle-read-only-files.patch \
-           file://Increase-maxSize-to-64MB.patch \
-           file://avoidholes.patch \
            file://fix-adjusting-startPage.patch \
-"
+           "
 
 LICENSE = "GPLv3"
 SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 
-SRC_URI[md5sum] = "d02687629c7e1698a486a93a0d607947"
-SRC_URI[sha256sum] = "a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83"
+SRC_URI[md5sum] = "6c3f3a06a95705870d129494a6880106"
+SRC_URI[sha256sum] = "f670cd462ac7161588c28f45349bc20fb9bd842805e3f71387a320e7a9ddfcf3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.17.1


