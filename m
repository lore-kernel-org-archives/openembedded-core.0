Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.50090.1624294987854477472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QGn8Eyha;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id q192so7569294pfc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8vqxayWWna7B/wigH6xf3PyTd/3a83q50lzuD+bExyg=;
        b=QGn8Eyhajz7ronAUHz4U8GZduWd7LLYCjaVs2XDqEhTUhl8ucr4GJIU1ao6XslP0GQ
         WfcUN5NID/0DiIuS8bNBJsSneIO+S5fUSVWgxpYNPqD00R41vE0E8ash0zb2vNipiAJj
         0tPsmsNjTxT1fC9rdlm4kYvm5cUAcfeLuSyeQc6OpTOkH4+m+QGyeCaRu/K2Q2Ypj0bQ
         UAyEVtptwS2KAY5p8PNBQ4XK4gotSZzm5KfSx1kv05P2ZYfa9OOuk59DN/d61saVDnzx
         yTay5xuQmjkTzoFPDBtSG411C6cMbOP15lR5fRT8AVGndUM5cyxvoMVMOtlsXRj1Ni+n
         BS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vqxayWWna7B/wigH6xf3PyTd/3a83q50lzuD+bExyg=;
        b=N1rnTnyGzmt1bh2Zi69z3BsmnbkWrvk1C/rCR/iJr2sE+LULO2vS5jf50i1Toop4Hx
         R/2rH9EtlwlzYbJWTDt2b3Aj9ju7obGETrnmBCYXI19u9Bq5hiC0is2kIKeZjxejdS7Y
         6KpFtJWUoPt0CskAu5z7KTL8od7Fvfs9kKImIRUeY3SFq4JPYNlo0JxV4Kq7VwpJQhjg
         akrXp0+CFya+L0EzZnkVoh1CRGxVprXwpJwiVrp/MAuQ4v5H0XBIXE7A0reDIiJGNAIZ
         02byssR6QjUkCD6h2LOYKBvMXrC5SAUq93owM4fLsrbR3seyQV8F+k6oEsoxKmaVaVkL
         ZD0g==
X-Gm-Message-State: AOAM530JqasNkwJCb65/Q//1A69AV5lZfMaYhfjyrVGPW3qu7c/gIDtV
	fnZjVgHgrF6p0VMH69sSm9Q/Z3WqGDOyfg==
X-Google-Smtp-Source: ABdhPJzk0A9E6R9J42mZ2sA7LrDxmB7zZfizUaULorRq6GyhGPfSeBFR77uMeB+oO5MOHm/NJlyNXQ==
X-Received: by 2002:aa7:8702:0:b029:303:6c92:dc8e with SMTP id b2-20020aa787020000b02903036c92dc8emr6207810pfo.63.1624294987166;
        Mon, 21 Jun 2021 10:03:07 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:06 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 05/10][dunfell] python3: upgrade 3.8.6 -> 3.8.7
Date: Mon, 21 Jun 2021 10:02:52 -0700
Message-Id: <606416841dd2a59b8e429e8dbd4e873b0d305a3f.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release Date: Dec. 21, 2020

Note: The release you're looking at is Python 3.8.7, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

* Drop patch for CVE-2020-27619 fixed in 3.8.7

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-27619
https://www.python.org/downloads/release/python-387/
https://docs.python.org/release/3.8.7/whatsnew/changelog.html

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/python3/CVE-2020-27619.patch       | 70 -------------------
 .../{python3_3.8.6.bb => python3_3.8.7.bb}    |  5 +-
 2 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 rename meta/recipes-devtools/python/{python3_3.8.6.bb => python3_3.8.7.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch b/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
deleted file mode 100644
index bafa1cb9991..00000000000
--- a/meta/recipes-devtools/python/python3/CVE-2020-27619.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 6c6c256df3636ff6f6136820afaefa5a10a3ac33 Mon Sep 17 00:00:00 2001
-From: "Miss Skeleton (bot)" <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 6 Oct 2020 05:38:54 -0700
-Subject: [PATCH] bpo-41944: No longer call eval() on content received via HTTP
- in the CJK codec tests (GH-22566) (GH-22577)
-
-(cherry picked from commit 2ef5caa58febc8968e670e39e3d37cf8eef3cab8)
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/6c6c256df3636ff6f6136820afaefa5a10a3ac33]
-CVE: CVE-2020-27619
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
diff --git a/meta/recipes-devtools/python/python3_3.8.6.bb b/meta/recipes-devtools/python/python3_3.8.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.6.bb
rename to meta/recipes-devtools/python/python3_3.8.7.bb
index bf33fce891b..11a69ea808a 100644
--- a/meta/recipes-devtools/python/python3_3.8.6.bb
+++ b/meta/recipes-devtools/python/python3_3.8.7.bb
@@ -33,7 +33,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://CVE-2020-27619.patch \
            file://CVE-2021-3177.patch \
            "
 
@@ -43,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "69e73c49eeb1a853cefd26d18c9d069d"
-SRC_URI[sha256sum] = "a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a"
+SRC_URI[md5sum] = "60fe018fffc7f33818e6c340d29e2db9"
+SRC_URI[sha256sum] = "ddcc1df16bb5b87aa42ec5d20a5b902f2d088caa269b28e01590f97a798ec50a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2

