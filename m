Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.37505.1628865072945895254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TdV0JsQ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so20896889pjr.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bYDOHywEkOBL/mKVXFOR8vKfaQW6d4b30jlu/7sL3YE=;
        b=TdV0JsQ1ZYWeY2qnxQjueytqVM0EtZj1cJ3fWFW5AQhBveZxHjZ3Dv4k+3vjLAIoun
         Ol//Z8x31r0EWN6MywpbxFD80KK3CHnsRAUuYAT9YDizAiQv3N5Lx8oevGm85WO6aKH6
         QB1q3jrCsH8LhpOGBDcgLgSC/RqpU4PaSxoL44rl4OSqsZymmsRF39g2Qpaseb4KDvCu
         lVex0I+tsfw8kFBwcADtxp8H8fCS9GngGmfsGaYS3NEEwqjdaJAuXanEXS2lMF2ExmgL
         bL+vcgfHUizRkuk3HYiZoMaj9YTFPM3yCFLK/DX/MYEgrQFHAyNNHjXSvaERZuL2RYxo
         iKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYDOHywEkOBL/mKVXFOR8vKfaQW6d4b30jlu/7sL3YE=;
        b=C5mMdsO1f9CdPlLAG1LCmlsWckLE4S79Grh56mCWfZHHa+KMoF2+4OYwSrtMEEuJky
         dcdgJp4SI8lDvzjMt8svinchAQ3kHDUw27R4Yz0NohB7ryYQIBleEM0B+K9DAT8JH0hj
         fNryP1AHYt1rbAwOtjftH3QFxpKMVq3zIUc/XYaXoK5UbQpFoOWnq6EHOKsnjTn4cMIB
         RWSBPIl3qHaCtt9KhWIL7+qVXH5ty8LGSmjAun+YPvVs9HeYyUyLU9UVnCADm5o5TOyk
         v4W09txtSVsXdysrB2xl2yPArlW7k/SosX/lwxvQ025sEX3IDXjH+srRGEid7HVa90DR
         jLLg==
X-Gm-Message-State: AOAM533zetSvUBp9q9/gvzA69P3Cpjo/0pkRvAR5dUOJzUQ58ZRLhHa+
	wxuC5cP7te57dab1SIX4nssxtNb+HmGf9LPI
X-Google-Smtp-Source: ABdhPJxgh2lLCV8g0NwXlNXGVb/YnjMTF65FsfGAiY1hXD1tYO/CWwDGzQflNL3lrnuqiQoEdZzGMw==
X-Received: by 2002:a63:f62:: with SMTP id 34mr2613718pgp.159.1628865071796;
        Fri, 13 Aug 2021 07:31:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/17] aspell: fix CVE-2019-25051
Date: Fri, 13 Aug 2021 04:29:43 -1000
Message-Id: <6c93507e92e55f1171ff2efd5a61bcf85265f790.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 297f8c4eb4ff209b5ea69910902d216d86dbe2bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/aspell/aspell_0.60.8.bb  |   4 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.bb
index 6548c54b64..9147c820e7 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
@@ -13,7 +13,9 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://CVE-2019-25051.patch \
+"
 SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
 SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
 
diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
new file mode 100644
index 0000000000..8513f6de79
--- /dev/null
+++ b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
@@ -0,0 +1,101 @@
+From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
+From: Kevin Atkinson <kevina@gnu.org>
+Date: Sat, 21 Dec 2019 20:32:47 +0000
+Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
+ to prevent a buffer overflow
+
+Bug found using OSS-Fuze.
+
+Upstream-Status: Backport
+[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
+CVE: CVE-2019-25051
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ common/objstack.hpp | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/common/objstack.hpp b/common/objstack.hpp
+index 3997bf7..bd97ccd 100644
+--- a/common/objstack.hpp
++++ b/common/objstack.hpp
+@@ -5,6 +5,7 @@
+ #include "parm_string.hpp"
+ #include <stdlib.h>
+ #include <assert.h>
++#include <stddef.h>
+ 
+ namespace acommon {
+ 
+@@ -26,6 +27,12 @@ class ObjStack
+   byte * temp_end;
+   void setup_chunk();
+   void new_chunk();
++  bool will_overflow(size_t sz) const {
++    return offsetof(Node,data) + sz > chunk_size;
++  }
++  void check_size(size_t sz) {
++    assert(!will_overflow(sz));
++  }
+ 
+   ObjStack(const ObjStack &);
+   void operator=(const ObjStack &);
+@@ -56,7 +63,7 @@ class ObjStack
+   void * alloc_bottom(size_t size)  {
+     byte * tmp = bottom;
+     bottom += size;
+-    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
++    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
+     return tmp;
+   }
+   // This alloc_bottom will insure that the object is aligned based on the
+@@ -66,7 +73,7 @@ class ObjStack
+     align_bottom(align);
+     byte * tmp = bottom;
+     bottom += size;
+-    if (bottom > top) {new_chunk(); goto loop;}
++    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
+     return tmp;
+   }
+   char * dup_bottom(ParmString str) {
+@@ -79,7 +86,7 @@ class ObjStack
+   // always be aligned as such.
+   void * alloc_top(size_t size) {
+     top -= size;
+-    if (top < bottom) {new_chunk(); top -= size;}
++    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
+     return top;
+   }
+   // This alloc_top will insure that the object is aligned based on
+@@ -88,7 +95,7 @@ class ObjStack
+   {loop:
+     top -= size;
+     align_top(align);
+-    if (top < bottom) {new_chunk(); goto loop;}
++    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
+     return top;
+   }
+   char * dup_top(ParmString str) {
+@@ -117,6 +124,7 @@ class ObjStack
+   void * alloc_temp(size_t size) {
+     temp_end = bottom + size;
+     if (temp_end > top) {
++      check_size(size);
+       new_chunk();
+       temp_end = bottom + size;
+     }
+@@ -131,6 +139,7 @@ class ObjStack
+     } else {
+       size_t s = temp_end - bottom;
+       byte * p = bottom;
++      check_size(size);
+       new_chunk();
+       memcpy(bottom, p, s);
+       temp_end = bottom + size;
+@@ -150,6 +159,7 @@ class ObjStack
+     } else {
+       size_t s = temp_end - bottom;
+       byte * p = bottom;
++      check_size(size);
+       new_chunk();
+       memcpy(bottom, p, s);
+       temp_end = bottom + size;
-- 
2.25.1

