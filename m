Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61C6B607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 19:36:22 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q62so7706915qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ZeV2IYjAYl9cjhcHJqdz8hP1p/K762544DKEzEjXEy8=;
	b=w2pU67RPKFpULznZvrPOM72S6Uf5HlJPweVM7y84oRx8O21AJSRSfIxf2zW/g7qWwi
	YTacKwr8iyMnd2J9W/M+OdF2uMwlZZDXAAWnwyj6FGQZ1p6t9jaxh3JeAurshIjJI1xB
	ZwEeOmE5BFzzaHmtTNU/N4EMXK2DvlQeUQrmRM4LhEp0xPXV3bBjoxx0r78n1eQz0qsA
	kO3bs2Nd4jxkEI+sTlaXeWeo3O7jJFxgA9hvVrYwMdWzvqmBw6I0a/UL7omiGpePs3K+
	qYtAJDxS3DD+E68icUrLuGtBshyAMstOSwRQJT3JBWHrMQL6bzw1aJd+S9wqlQFfTLaY
	7tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ZeV2IYjAYl9cjhcHJqdz8hP1p/K762544DKEzEjXEy8=;
	b=GzUfKsWE5Gl7fHjETb97NQYgPe5C8mIEBDerik7b4+GfL7Tr2XtBKYXxWkkVy9c2Bd
	t5iPqUdnIFCMXdxtAfvp0xfxQtI8C5iDC8tcXJ/JwYd0bKDIW2ZU4udY69kaVir4qIC8
	m9sg5sqRqPGnE2qPfiH3yQu3mTn3HvA3w6ApCfeshqMeDXj0YQkR1K9E5siJit3mo8ME
	1+Qj9kYd8726tbFeh6JCt7p9xL/IgibGpNO/IY+6vZsuDA9NxAIHKSzpNrlbb6mitNvs
	y9ndAQqwrYS/VJjmlAK4QDhRWWNOtwU04rLKDu8G8NPXG5PrgPLq9mzq9H57mfk4le1s
	N1ZQ==
X-Gm-Message-State: AEkoouvA5lFwoNwMAs7nFPg2weB9yLIjk3tgCLO2+TMJRsmqatN19QJ4MCNkTHJreu2Jpg==
X-Received: by 10.55.154.11 with SMTP id c11mr55524879qke.117.1469820983246;
	Fri, 29 Jul 2016 12:36:23 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	l89sm10784730qte.41.2016.07.29.12.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 12:36:22 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 16:36:03 -0300
Message-Id: <1469820963-6667-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] patchelf: Update to version 0.9
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
X-List-Received-Date: Fri, 29 Jul 2016 19:36:23 -0000

Remove patch maxsize.patch already applied upstream.

Add patch Skip-empty-section-fixes-66.patch to prevent errors like:

ERROR: go-cross-1.6.2-r0 do_populate_sysroot_setscene: '('patchelf-uninative',
'--set-interpreter', '/home/user/src/prj/build/tmp/sysroots-uninative/
x86_64-linux/lib/ld-linux-x86-64.so.2', '/home/user/src/prj/build/tmp/
work/x86_64-linux/go-cross/1.6.2-r0/sstate-install-populate_sysroot/x86_64-
linux/usr/bin/aarch64-prj-linux/go')'
failed with exit code 1 and the following output:
cannot find section .rela.dyn

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../patchelf/Skip-empty-section-fixes-66.patch     | 30 ++++++++++++++++++++++
 .../patchelf/patchelf/maxsize.patch                | 30 ----------------------
 .../patchelf/{patchelf_0.8.bb => patchelf_0.9.bb}  |  8 +++---
 3 files changed, 35 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/Skip-empty-section-fixes-66.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/maxsize.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.8.bb => patchelf_0.9.bb} (61%)

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
similarity index 61%
rename from meta/recipes-devtools/patchelf/patchelf_0.8.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.9.bb
index 8484a7e..86afd48 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.8.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.9.bb
@@ -1,10 +1,12 @@
 SRC_URI = "http://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
-           file://maxsize.patch"
+           file://Skip-empty-section-fixes-66.patch \
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


