Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA3673D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:31:15 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id w204so903510qka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:organization;
	bh=ih9l8LMSCfyE4x+fVTM3+R0fZO25z/X98m5cwT/76hM=;
	b=o9dLcJp9YgB0G//RXdFljGSoxUGVvYKR2F/K3M9mZ1WlfNxlfh4H41mbTJBqElALHB
	x9uybsHIfA+FhNYhCZQ6XVLsSKpoPfPicZQYqqjLivF/QxZ6NfpYYZqHAAV8Rb99Dr3/
	aJ3ZwLDoFpH7IGVlFhuaNcnGSm6VS93gn4RdiSyBpJmGC5vVVSSmmpRPqocsJWLWDFol
	ElVH3gIqKVApzGlHk2KKXYk3ZTHQIg/gN/Y8Kj20pqB6yEKtLAKDqVj0htsmnsjuN6jH
	tJqg0cVsyf31c36MlHcH0XHitYx3nTkhPvHC8HIjvXI0H+EXSYU8wx7NyhouFuNuwqRY
	6sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:organization;
	bh=ih9l8LMSCfyE4x+fVTM3+R0fZO25z/X98m5cwT/76hM=;
	b=QNeLv8uwux4KbSWPxITfp2agROgDZwLFb/bsbpqXCzuGOvfMeVVMLwrobLzDMyCDKr
	UTWmtDzGVZLbG84YBVoiEuiEcFCMRu5cXbLVhwNfUbN5Cuyyee/EvPyQ99F3774gKTWH
	+dalqvpNQ5Q2D6DAb+FBcomEXIAOYCF1URg3p9YnvjKH/CXdfnlZ60JSlCCkSRcKyQw9
	j2iJK0wkbfFLNrDMWXsZ36cFLCHTv6AGyJpkwWQPdtWL92VigEb2SXpkmfma6yY4UOGd
	CNOVs9eE2GvPPa2z7wUSxh6nJuMbKWRfKTLOxmOn2PcKNH0rVgTEQ+oTU5X2y2h0LJVE
	7hSg==
X-Gm-Message-State: AE9vXwOZGdX3qACl4qAWij6VFRGpraA4Btl7RrS2vG7O1CYIA7BxsZqxN3QZv+s7O+ccsw==
X-Received: by 10.55.39.215 with SMTP id n206mr2687984qkn.249.1473856276220;
	Wed, 14 Sep 2016 05:31:16 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.227.233])
	by smtp.gmail.com with ESMTPSA id
	v193sm2085102qka.18.2016.09.14.05.31.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 05:31:15 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 09:30:29 -0300
Message-Id: <1473856229-907-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2] patchelf: Update to version 0.9
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
X-List-Received-Date: Wed, 14 Sep 2016 12:31:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * Remove patch maxsize.patch already applied upstream.

 * Add patch Skip-empty-section-fixes-66.patch to prevent errors like:

  /
  |ERROR: go-cross-1.6.2-r0 do_populate_sysroot_setscene: '('patchelf-uninative',
  |'--set-interpreter', '/home/user/src/prj/build/tmp/sysroots-uninative/
  |x86_64-linux/lib/ld-linux-x86-64.so.2', '/home/user/src/prj/build/tmp/
  |work/x86_64-linux/go-cross/1.6.2-r0/sstate-install-populate_sysroot/x86_64-
  |linux/usr/bin/aarch64-prj-linux/go')'
  |failed with exit code 1 and the following output:
  |cannot find section .rela.dyn
  \

  * Add patch handle-read-only-files.patch to fix error when building
    eSKD, the following error appears on task do_testsdkext

  /
  |ERROR: db-native-6.0.30-r1 do_populate_sysroot_setscene: '('patchelf-uninative',
  |'--set-interpreter', 'src/fsl-community-bsp/build/tmp/work/qemuarm-poky-linux-
  |gnueabi/core-image-minimal/1.0-r0/testsdkext/tc/tmp/sysroots-uninative/
  |x86_64-linux/lib/ld-linux-x86-64.so.2', 'src/fsl-community-bsp/build/tmp/work/
  |qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/testsdkext/tc/tmp/work/
  |x86_64-linux/db-native/6.0.30-r1/sstate-install-populate_sysroot/x86_64-linux/
  |usr/bin/db_tuner')' failed with exit code 1 and the following output:
  |b'open: Permission denied\n
  \

  * Add patch Increase-maxSize-to-64MB.patch to fix error described
  bellow, the same issue is discussed here:
    - https://github.com/NixOS/patchelf/issues/47

  /
  |ERROR: qemu-native-2.5.0-r1 do_populate_sysroot_setscene: '('patchelf-uninative',
  |'--set-interpreter', '../build/tmp/sysroots-uninative/x86_64-linux/lib/
  |ld-linux-x86-64.so.2', '../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
  |sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64')'
  |failed with exit code 1 and the following output:
  |warning: working around a Linux kernel bug by creating a hole of 36032512
  |bytes in ‘../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
  |sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64’
  |maximum file size exceeded
  \

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../patchelf/Increase-maxSize-to-64MB.patch        | 46 +++++++++++++++++++
 .../patchelf/Skip-empty-section-fixes-66.patch     | 30 ++++++++++++
 .../patchelf/patchelf/handle-read-only-files.patch | 53 ++++++++++++++++++++++
 .../patchelf/patchelf/maxsize.patch                | 30 ------------
 .../patchelf/{patchelf_0.8.bb => patchelf_0.9.bb}  | 10 ++--
 5 files changed, 136 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/maxsize.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.8.bb => patchelf_0.9.bb} (50%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch b/meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch
new file mode 100644
index 0000000..49050a1
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/Increase-maxSize-to-64MB.patch
@@ -0,0 +1,46 @@
+From e3658740ec100e4c8cf83295460b032979e1a99a Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Fri, 9 Sep 2016 18:21:32 -0300
+Subject: [PATCH] Increase maxSize to 64MB
+Organization: O.S. Systems Software LTDA.
+
+Fix error:
+
+/
+|ERROR: qemu-native-2.5.0-r1 do_populate_sysroot_setscene: '('patchelf-uninative',
+|'--set-interpreter', '../build/tmp/sysroots-uninative/x86_64-linux/lib/
+|ld-linux-x86-64.so.2', '../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
+|sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64')'
+|failed with exit code 1 and the following output:
+|warning: working around a Linux kernel bug by creating a hole of 36032512
+|bytes in ‘../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
+|sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64’
+|maximum file size exceeded
+\
+
+Similar issue is discussed here:
+https://github.com/NixOS/patchelf/issues/47
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ src/patchelf.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index a59c12d..0fd7355 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -279,7 +279,7 @@ static void readFile(string fileName)
+     struct stat st;
+     if (stat(fileName.c_str(), &st) != 0) error("stat");
+     fileSize = st.st_size;
+-    maxSize = fileSize + 32 * 1024 * 1024;
++    maxSize = fileSize + 64 * 1024 * 1024;
+ 
+     contents = (unsigned char *) malloc(fileSize + maxSize);
+     if (!contents) abort();
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch b/meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
new file mode 100644
index 0000000..9ee8a55
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
@@ -0,0 +1,30 @@
+From 73526cb546ae6b00ea6169e40b01fb7b5f0dbb50 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 28 Jul 2016 11:05:06 -0300
+Subject: [PATCH] Skip empty section (fixes #66)
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ src/patchelf.cc | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 136098f..2677a26 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -684,6 +684,9 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsExecutable()
+     for (unsigned int i = 1; i <= lastReplaced; ++i) {
+         Elf_Shdr & shdr(shdrs[i]);
+         string sectionName = getSectionName(shdr);
++        if (sectionName == "") {
++            continue;
++        }
+         debug("looking at section `%s'\n", sectionName.c_str());
+         /* !!! Why do we stop after a .dynstr section? I can't
+            remember! */
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
new file mode 100644
index 0000000..9fafec4
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -0,0 +1,53 @@
+From 2a603acb65993698c21f1c6eb7664f93ad830d52 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Fri, 9 Sep 2016 16:00:42 -0300
+Subject: [PATCH] handle read-only files
+Organization: O.S. Systems Software LTDA.
+
+Patch from:
+https://github.com/darealshinji/patchelf/commit/40e66392bc4b96e9b4eda496827d26348a503509
+
+Upstream-Status: Pending
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ src/patchelf.cc | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 136098f..aea360e 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -388,7 +388,17 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
+ 
+ static void writeFile(string fileName)
+ {
+-    int fd = open(fileName.c_str(), O_TRUNC | O_WRONLY);
++    struct stat st;
++    int fd;
++
++    if (stat(fileName.c_str(), &st) != 0)
++        error("stat");
++
++    if (chmod(fileName.c_str(), 0600) != 0)
++        error("chmod");
++
++    fd = open(fileName.c_str(), O_TRUNC | O_WRONLY);
++
+     if (fd == -1)
+         error("open");
+ 
+@@ -397,6 +407,10 @@ static void writeFile(string fileName)
+ 
+     if (close(fd) != 0)
+         error("close");
++
++    if (chmod(fileName.c_str(), st.st_mode) != 0)
++        error("chmod");
++
+ }
+ 
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/patchelf/patchelf/maxsize.patch b/meta/recipes-devtools/patchelf/patchelf/maxsize.patch
deleted file mode 100644
index cc04a89..0000000
--- a/meta/recipes-devtools/patchelf/patchelf/maxsize.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f6886c2c33a1cf8771163919f3d20f6340c0ce38 Mon Sep 17 00:00:00 2001
-From: Eelco Dolstra <eelco.dolstra@logicblox.com>
-Date: Fri, 10 Jul 2015 18:12:37 +0200
-Subject: [PATCH] Quick fix for #47
-
-https://github.com/NixOS/patchelf/issues/47
-
-Avoid issues with holes in binaries such as qemu-pcc from qemu-native.
-
-Upstream-Status: Submitted
-RP
-2016/2/3
-
----
- src/patchelf.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 8566ed9..df75593 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -248,7 +248,7 @@ static void readFile(string fileName, mode_t * fileMode)
-     if (stat(fileName.c_str(), &st) != 0) error("stat");
-     fileSize = st.st_size;
-     *fileMode = st.st_mode;
--    maxSize = fileSize + 8 * 1024 * 1024;
-+    maxSize = fileSize + 64 * 1024 * 1024;
- 
-     contents = (unsigned char *) malloc(fileSize + maxSize);
-     if (!contents) abort();
\ No newline at end of file
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.8.bb b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
similarity index 50%
rename from meta/recipes-devtools/patchelf/patchelf_0.8.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.9.bb
index 8484a7e..54e654b 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.8.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
@@ -1,10 +1,14 @@
 SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
-           file://maxsize.patch"
+           file://Skip-empty-section-fixes-66.patch \
+           file://handle-read-only-files.patch \
+           file://Increase-maxSize-to-64MB.patch \
+"
+
 LICENSE = "GPLv3"
 SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 
-SRC_URI[md5sum] = "5b151e3c83b31f5931b4a9fc01635bfd"
-SRC_URI[sha256sum] = "c99f84d124347340c36707089ec8f70530abd56e7827c54d506eb4cc097a17e7"
+SRC_URI[md5sum] = "d02687629c7e1698a486a93a0d607947"
+SRC_URI[sha256sum] = "a0f65c1ba148890e9f2f7823f4bedf7ecad5417772f64f994004f59a39014f83"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.1.4


