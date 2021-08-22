Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.9615.1629636689432661660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V3Yp9uBh;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id g138so8776773wmg.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2G+i9ldqHbn5c5SedLBptK7DtbuYYwfdRgTah52P4xw=;
        b=V3Yp9uBhtb2iaM7zFopufEosbu3Y5dN2/2dQCNspOohDCQSuDiGpEHCLazgu/vk2Rd
         UXYEpa+TObiMnTyspW83zw189fMuKl8iw4/4XXmoKED7tNlL7lYdwKiPF6bDEtnBoc78
         piP4zk5WX+7P0IV6OUbAlZE0/+raPwokBLDy2vpOWzaBl7kOB7zA3XQhO2YcFWzGX4pt
         p/xzM+kb3pyA8nBrO5kFeF17opT+grt4VeQtVHaETatYlaEP+bs9VYWF2ukAQRFb5/qx
         dA04BcEBKV0XhTKyKIoO3Yt/gZS0Y47TkB37tBZ5a/sS/785aFSYssGvCa+sMogjq6po
         NEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2G+i9ldqHbn5c5SedLBptK7DtbuYYwfdRgTah52P4xw=;
        b=LnugqiF6mEfMAXKVINVtT9GqVYVjHS7QX9X6devgqO01CsWjWrOu6jrhUsCuT8w42C
         cpq3fK02zjIe7NDpcmvE9UxY+PhzBapSqabxtnf9v+eO2UMhJn2uOvJr9lnGTzSUF52W
         thhXjU8XDNaPzgx8yM98flpCgi0Gvny7GMZvyvwTnXyO8yC8NP7gx2htAwgt0TyLBVcB
         e78VaK/gW9PqaJhFHohP0BhzDwhQs4iWz1SRoLAWc/VPDivoMLxhKZj3jx7j/Wil3vVu
         Rgj/vbmRGMVzv2s06pdh7hoE0bBArj3RzYpZUjD9/yyuATWUM8+LYp0lbg43sbBsD1wX
         gS4w==
X-Gm-Message-State: AOAM531DawAzCGkLgG43Tv7Ff0FTDE/15+F5EdogmC+rRPx9xjLDOgNe
	vFu6au0LO2tV02+eVW0HzPV8gobdB+BJ7Q==
X-Google-Smtp-Source: ABdhPJwG1z6QMouU8Hpi171tTKYa9EW7EnFPS9NXwJq48C6z0PNBus83AcZLqIu0N3SfKBbQ1y9vDw==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr8541164wmh.167.1629636688052;
        Sun, 22 Aug 2021 05:51:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/55] patchelf: upgrade 0.12 -> 0.13
Date: Sun, 22 Aug 2021 14:50:33 +0200
Message-Id: <20210822125103.310416-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...c83653ce1b5fc201ff6db93b966394766814.patch | 44 -------------------
 .../patchelf/patchelf/alignmentfix.patch      | 44 -------------------
 .../patchelf/handle-read-only-files.patch     | 16 +++----
 .../{patchelf_0.12.bb => patchelf_0.13.bb}    |  4 +-
 4 files changed, 9 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
 delete mode 100644 meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
 rename meta/recipes-devtools/patchelf/{patchelf_0.12.bb => patchelf_0.13.bb} (76%)

diff --git a/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch b/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
deleted file mode 100644
index ba35ec6ffc..0000000000
--- a/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 6edec83653ce1b5fc201ff6db93b966394766814 Mon Sep 17 00:00:00 2001
-From: rmnull <rmnull@users.noreply.github.com>
-Date: Tue, 18 Aug 2020 20:22:52 +0530
-Subject: [PATCH] mark phdrs synced with sections, avoid rechecking it when
- syncing note sections to segments.
-
-This also serves as a bug fix when a previously synced note segment
-overlaps with another section and creates a false alarm.
-
-Upstream-Status: Backport
----
- src/patchelf.cc | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 05ec793..622f0b6 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -669,6 +669,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
-             memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
-     }
- 
-+    std::set<unsigned int> noted_phdrs = {};
-     for (auto & i : replacedSections) {
-         std::string sectionName = i.first;
-         auto & shdr = findSection(sectionName);
-@@ -721,7 +722,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
-                 shdr.sh_addralign = orig_shdr.sh_addralign;
- 
-             for (unsigned int j = 0; j < phdrs.size(); ++j)
--                if (rdi(phdrs[j].p_type) == PT_NOTE) {
-+                if (rdi(phdrs[j].p_type) == PT_NOTE && noted_phdrs.find(j) == noted_phdrs.end()) {
-                     Elf_Off p_start = rdi(phdrs[j].p_offset);
-                     Elf_Off p_end = p_start + rdi(phdrs[j].p_filesz);
-                     Elf_Off s_start = rdi(orig_shdr.sh_offset);
-@@ -739,6 +740,8 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
-                     phdrs[j].p_offset = shdr.sh_offset;
-                     phdrs[j].p_vaddr = phdrs[j].p_paddr = shdr.sh_addr;
-                     phdrs[j].p_filesz = phdrs[j].p_memsz = shdr.sh_size;
-+
-+                    noted_phdrs.insert(j);
-                 }
-         }
- 
diff --git a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
deleted file mode 100644
index a06876e50a..0000000000
--- a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-If a binary has multiple SHT_NOTE sections and corresponding PT_NOTE
-headers, we can see the error:
-
-patchelf: cannot normalize PT_NOTE segment: non-contiguous SHT_NOTE sections
-
-if the SHT_NOTE sections aren't sized to end on aligned boundaries. An example
-would be a binary with:
-
-  [ 2] .note.ABI-tag     NOTE             00000000000002f4  000002f4
-       0000000000000020  0000000000000000   A       0     0     4
-  [ 3] .note.gnu.propert NOTE             0000000000000318  00000318
-       0000000000000030  0000000000000000   A       0     0     8
-  [ 4] .note.gnu.build-i NOTE             0000000000000348  00000348
-       0000000000000024  0000000000000000   A       0     0     4
-
-  NOTE           0x0000000000000318 0x0000000000000318 0x0000000000000318
-                 0x0000000000000030 0x0000000000000030  R      0x8
-  NOTE           0x00000000000002f4 0x00000000000002f4 0x00000000000002f4
-                 0x0000000000000078 0x0000000000000074  R      0x4
-
-since the PT_NOTE section at 2f4 covers [2] and [3] but the code
-calclates curr_off should be 314, not the 318 in the binary. This
-is an alignment issue.
-
-To fix this, we need to round curr_off to the next section alignment.
-
-Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/274]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: git/src/patchelf.cc
-===================================================================
---- git.orig/src/patchelf.cc
-+++ git/src/patchelf.cc
-@@ -1010,8 +1010,9 @@ void ElfFile<ElfFileParamNames>::normali
-             size_t size = 0;
-             for (const auto & shdr : shdrs) {
-                 if (rdi(shdr.sh_type) != SHT_NOTE) continue;
--                if (rdi(shdr.sh_offset) != curr_off) continue;
-+                if (rdi(shdr.sh_offset) != roundUp(curr_off, rdi(shdr.sh_addralign))) continue;
-                 size = rdi(shdr.sh_size);
-+                curr_off = roundUp(curr_off, rdi(shdr.sh_addralign));
-                 break;
-             }
-             if (size == 0)
diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
index bf721c1af8..63080a42d4 100644
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -1,4 +1,4 @@
-From 7f1fd10cfebd5ea2f3e1938abe1bd1c4828164a7 Mon Sep 17 00:00:00 2001
+From 682fb48c137b687477008b68863c2a0b73ed47d1 Mon Sep 17 00:00:00 2001
 From: Fabio Berton <fabio.berton@ossystems.com.br>
 Date: Fri, 9 Sep 2016 16:00:42 -0300
 Subject: [PATCH] handle read-only files
@@ -14,13 +14,13 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  src/patchelf.cc | 16 +++++++++++++++-
  1 file changed, 15 insertions(+), 1 deletion(-)
 
-Index: git/src/patchelf.cc
-===================================================================
---- git.orig/src/patchelf.cc
-+++ git/src/patchelf.cc
-@@ -499,9 +499,19 @@ void ElfFile<ElfFileParamNames>::sortShd
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index fd1e7b7..a941da1 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -527,9 +527,19 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
  
- static void writeFile(std::string fileName, FileContents contents)
+ static void writeFile(const std::string & fileName, const FileContents & contents)
  {
 +    struct stat st;
 +    int fd;
@@ -39,7 +39,7 @@ Index: git/src/patchelf.cc
      if (fd == -1)
          error("open");
  
-@@ -515,6 +525,10 @@ static void writeFile(std::string fileNa
+@@ -543,6 +553,10 @@ static void writeFile(const std::string & fileName, const FileContents & content
  
      if (close(fd) != 0)
          error("close");
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.13.bb
similarity index 76%
rename from meta/recipes-devtools/patchelf/patchelf_0.12.bb
rename to meta/recipes-devtools/patchelf/patchelf_0.13.bb
index 7c97ea0789..1b0561b8ba 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.13.bb
@@ -6,10 +6,8 @@ LICENSE = "GPLv3"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
-           file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
-           file://alignmentfix.patch \
            "
-SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
+SRCREV = "a949ff23315bbb5863627c4655fe216ecbf341a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

