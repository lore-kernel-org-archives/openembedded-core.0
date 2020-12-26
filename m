Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.19295.1608974897682958448
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o8G+0p7H;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g24so5546342edw.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vJhKXARQ7DPGNBuHthPwrtTJTaIT0QuaFkTF48uuoA=;
        b=o8G+0p7HaV/zpfVwVxPL3E9exLLn3fWmO7o3BWAser3qFo35manLVjPwCgjKj4C75x
         WGFX3UH4NnXtC77z8s3JrjAe0lar2fAhnqt5mdm0y3x/LfmoAFMKKNlPY4ha/yHTYxtL
         kYx2xtz2bDBMLURmIr5HOUAHt1RKtc6DCwp7Ifdcw6Mgp2/zb/tb9fJ+N4wGwrbj+iPR
         2iS8HPHgPMK7uDHxlKArq8qBczF1KQvFCikjQlR7TRhE/YULxy48RVTxCBSbNgF0kTxe
         rkhO5VG4l1xcXwZLOOD/HpTOoajJYIQ4fatjLb5tb8a1Xt5ENMhmh0bkUE5qeQj5AM9X
         2gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vJhKXARQ7DPGNBuHthPwrtTJTaIT0QuaFkTF48uuoA=;
        b=bzNsvuE4fUJ3kJTbm2aenk+B78fx9vNDr9h2eXv8YL/xNWokzHW0OR4Q+50JCdFe4T
         BDtStIYlj2hP/5oaE3ThN4H2isLr2D35Rdw9OUsqQ34EA6JkEDwrrPNYAVj8V0cUsX7V
         TIiV6jrRWiL9AisZlGQ2CTIaCMhwBBAWRYBXpOTal4AM5qYe25XHQpbsVMxBmYMBLJLX
         K87nq1Wu9ccRG+d+7Gjp8Zia6syhGzlX5AeQ9vvIYd5+6dPXZ03Yj+MrRiFyJkyF5FCn
         PGFqG/Z+zAwqOu6Y+OYZ9q7YgCtmBskD4YH4nV4B1N3OfFsPUzNRKnruCbaZCVtcm6Ff
         Vmwg==
X-Gm-Message-State: AOAM533YPUELJJhIB7Zy+PJFXmacZBf5YCdBvpqyQ5iblSxeMzWSwkxv
	eCnNEwP2uz3UgW6SSMF/g18QBQryMmU=
X-Google-Smtp-Source: ABdhPJz22o2mntLPbbdwpoT67eCEnhLzbJdpa3uQw8mn9ucWbyuR46K/0zE8Gh6ht3+FK5JV/iBZSA==
X-Received: by 2002:a05:6402:2041:: with SMTP id bc1mr34419421edb.369.1608974896313;
        Sat, 26 Dec 2020 01:28:16 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:15 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 43/48] python3: update 3.9.0 -> 3.9.1
Date: Sat, 26 Dec 2020 10:27:27 +0100
Message-Id: <20201226092732.52323-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/python3/CVE-2020-27619.patch       | 69 -------------------
 .../{python3_3.9.0.bb => python3_3.9.1.bb}    |  4 +-
 2 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 rename meta/recipes-devtools/python/{python3_3.9.0.bb => python3_3.9.1.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
deleted file mode 100644
index b2053e7a47..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b664a1df4ee71d3760ab937653b10997081b1794 Mon Sep 17 00:00:00 2001
-From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 6 Oct 2020 05:37:36 -0700
-Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
- in the CJK codec tests (GH-22566)
-
-(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/b664a1df4ee71d3760ab937653b10997081b1794]
-CVE: CVE-2020-27619
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- Lib/test/multibytecodec_support.py            | 22 +++++++------------
- .../2020-10-05-17-43-46.bpo-41944.rf1dYb.rst  |  1 +
- 2 files changed, 9 insertions(+), 14 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
-
-diff --git a/Lib/test/multibytecodec_support.py b/Lib/test/multibytecodec_support.py
-index cca8af67d6d1d..f76c0153f5ecf 100644
---- a/Lib/test/multibytecodec_support.py
-+++ b/Lib/test/multibytecodec_support.py
-@@ -305,29 +305,23 @@ def test_mapping_file(self):
-             self._test_mapping_file_plain()
- 
-     def _test_mapping_file_plain(self):
--        unichrs = lambda s: ''.join(map(chr, map(eval, s.split('+'))))
-+        def unichrs(s):
-+            return ''.join(chr(int(x, 16)) for x in s.split('+'))
-+
-         urt_wa = {}
- 
-         with self.open_mapping_file() as f:
-             for line in f:
-                 if not line:
-                     break
--                data = line.split('#')[0].strip().split()
-+                data = line.split('#')[0].split()
-                 if len(data) != 2:
-                     continue
- 
--                csetval = eval(data[0])
--                if csetval <= 0x7F:
--                    csetch = bytes([csetval & 0xff])
--                elif csetval >= 0x1000000:
--                    csetch = bytes([(csetval >> 24), ((csetval >> 16) & 0xff),
--                                    ((csetval >> 8) & 0xff), (csetval & 0xff)])
--                elif csetval >= 0x10000:
--                    csetch = bytes([(csetval >> 16), ((csetval >> 8) & 0xff),
--                                    (csetval & 0xff)])
--                elif csetval >= 0x100:
--                    csetch = bytes([(csetval >> 8), (csetval & 0xff)])
--                else:
-+                if data[0][:2] != '0x':
-+                    self.fail(f"Invalid line: {line!r}")
-+                csetch = bytes.fromhex(data[0][2:])
-+                if len(csetch) == 1 and 0x80 <= csetch[0]:
-                     continue
- 
-                 unich = unichrs(data[1])
-diff --git a/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
-new file mode 100644
-index 0000000000000..4f9782f1c85af
---- /dev/null
-+++ b/Misc/NEWS.d/next/Tests/2020-10-05-17-43-46.bpo-41944.rf1dYb.rst
-@@ -0,0 +1 @@
-+Tests for CJK codecs no longer call ``eval()`` on content received via HTTP.
diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.1.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.0.bb
rename to meta/recipes-devtools/python/python3_3.9.1.bb
index 19a8950f15..17d0c032f7 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.1.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
-           file://CVE-2020-27619.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -37,8 +36,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-
-SRC_URI[sha256sum] = "9c73e63c99855709b9be0b3cc9e5b072cb60f37311e8c4e50f15576a0bf82854"
+SRC_URI[sha256sum] = "991c3f8ac97992f3d308fefeb03a64db462574eadbff34ce8bc5bb583d9903ff"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.29.2

