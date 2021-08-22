Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.9764.1629636676090842825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gGkyn+8R;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id f13-20020a1c6a0d000000b002e6fd0b0b3fso10514311wmc.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=76/m0ETqVasmgooERB3OjWVRp5oRZVtAVzC7h0T6CYw=;
        b=gGkyn+8RR7aC1sOthhQfsDNP8kTM6F/VGU0zpAFPhQE5Xvp/utZsOAs/UOIrrzy/rr
         n06HPMayNc/9OyN6Eqv69JM+Ub6Uuy6MoyqD6o7c867shtCBP/yGQgYF4hC+Gjg7tAqR
         KkKiscmruEU9IqG0qAm6s+nLCxZTmh8JiXEjWKWuSIzgZUlrNDVECvZMRRbLcFpQGdeb
         G+zXRnmRToCFqBhjd3hHOp2GY2GVOH7AEnA95T0s9lcpI4cHPzsbLZEkEaEowXAQcejc
         Ft5CbnT3Z+FXbFw+2xM3hL4Or4f3gRC5p2Hvwx0QGyVMWxnV34hAWgy84/S9vTTLo+nC
         +Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=76/m0ETqVasmgooERB3OjWVRp5oRZVtAVzC7h0T6CYw=;
        b=F0eTvJcXxwD6T6EhQxxhRYOiobPt+/CZfXEC8UaokUJsS68BEHgq+6O1RH8o9uhhPn
         yqDfEbvc3lol0Mfo0S94N35orYuqJerl6/7ZSKQPYjLgGgbcX5wPZXRmwES/KdGMix1o
         MEr/IQAhExVHCoIFC1hTnzvsZ7Jf5bB9OOD1ygZupAYJ3NOMxnjfnPy4OSLvzFhaxBIl
         RlNsnb9Sk0IJNtfZ+yW+iNd0XdNG6f/69HOjUE2wH4Ake7WjzAM9zUpijQuJph7x8yVL
         cZkCNhJmE1y5efhm0ONIDGrY+DscnS1meqWhW7w7vY9OSdgH3TCqQ9MWouZGzOYKeZx/
         Ze4w==
X-Gm-Message-State: AOAM533YC+BuUf0L67tYq0lSk7xW5f1ncjIE15fItEaFLNdnj/cvxAj/
	8MJUB4ZFvqUQW60/NWLv4r972ia3R/hc8A==
X-Google-Smtp-Source: ABdhPJxQ7HP2dk3eOetBlKGrecRSXoCOhyls2IO73fsmDHqmZFjoM3K10ZqCwlpFqGRWQ3HM52VtpQ==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr9768809wmq.21.1629636673802;
        Sun, 22 Aug 2021 05:51:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/55] systemd: upgrade 249.1 -> 249.3
Date: Sun, 22 Aug 2021 14:50:13 +0200
Message-Id: <20210822125103.310416-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch changes are all git rearranging chunks on rebase; there are no functional changes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...md-boot_249.1.bb => systemd-boot_249.3.bb} |   1 +
 meta/recipes-core/systemd/systemd.inc         |   2 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch | 104 ++++----
 ...dd-__compare_fn_t-and-comparison_fn_.patch |   4 +-
 ...k-parse_printf_format-implementation.patch |  16 +-
 ...missing.h-check-for-missing-strndupa.patch | 247 ++++++++++++------
 .../0006-Include-netinet-if_ether.h.patch     | 246 ++++++++++-------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  12 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   2 +-
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  12 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   2 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
 ...patible-basename-for-non-glibc-syste.patch |   4 +-
 ...uffering-when-writing-to-oom_score_a.patch |   6 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   6 +-
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |   4 +-
 ...ype.h-add-__compar_d_fn_t-definition.patch |   2 +-
 ...definition-of-prctl_mm_map-structure.patch |   2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch |   2 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |   6 +-
 .../0021-test-json.c-define-M_PIl.patch       |   2 +-
 ...-not-disable-buffer-in-writing-files.patch | 136 ++++++----
 .../0025-Handle-__cpu_mask-usage.patch        |   2 +-
 .../systemd/0026-Handle-missing-gshadow.patch |  20 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   4 +-
 .../{systemd_249.1.bb => systemd_249.3.bb}    |   0
 27 files changed, 532 insertions(+), 332 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.1.bb => systemd-boot_249.3.bb} (99%)
 rename meta/recipes-core/systemd/{systemd_249.1.bb => systemd_249.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb b/meta/recipes-core/systemd/systemd-boot_249.3.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd-boot_249.1.bb
rename to meta/recipes-core/systemd/systemd-boot_249.3.bb
index c93bc3160b..af2be162a3 100644
--- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot_249.3.bb
@@ -71,3 +71,4 @@ do_deploy () {
 }
 
 addtask deploy before do_build after do_compile
+
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 0e92a72bb7..05341724f4 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "764b74113e36ac5219a4b82a05f311b5a92136ce"
+SRCREV = "090378dcb1de5ca66900503210e85d63075fa70a"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 9db22cd9d2..15fa0c4546 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 159c53612444ec1df492bae528a5a88a275b93bf Mon Sep 17 00:00:00 2001
+From 40acdb90031cfeb7140cee5205bce24f8c91d857 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
@@ -14,14 +14,16 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 
 ---
- src/basic/sort-util.h              | 14 ------------
- src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
- src/shared/format-table.c          | 36 ++++++++++++++++++++----------
+ src/basic/sort-util.h     | 14 --------------
+ src/shared/format-table.c | 36 ++++++++++++++++++++++++------------
+ src/shared/hwdb-util.c    | 19 ++++++++++++++-----
  3 files changed, 38 insertions(+), 31 deletions(-)
 
+diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
+index 49586a4a24..d92a5ab0ed 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
-@@ -56,18 +56,4 @@ static inline void _qsort_safe(void *bas
+@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
                  _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
  
@@ -40,51 +42,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 -        })
 -
  int cmp_int(const int *a, const int *b);
---- a/src/shared/hwdb-util.c
-+++ b/src/shared/hwdb-util.c
-@@ -127,9 +127,13 @@ static struct trie* trie_free(struct tri
- 
- DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
- 
--static int trie_values_cmp(const struct trie_value_entry *a, const struct trie_value_entry *b, struct trie *trie) {
--        return strcmp(trie->strings->buf + a->key_off,
--                      trie->strings->buf + b->key_off);
-+static struct trie *trie_node_add_value_trie;
-+static int trie_values_cmp(const void *v1, const void *v2) {
-+        const struct trie_value_entry *a = v1;
-+        const struct trie_value_entry *b = v2;
-+
-+        return strcmp(trie_node_add_value_trie->strings->buf + a->key_off,
-+                      trie_node_add_value_trie->strings->buf + b->key_off);
- }
- 
- static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -157,7 +161,10 @@ static int trie_node_add_value(struct tr
-                         .value_off = v,
-                 };
- 
--                val = typesafe_bsearch_r(&search, node->values, node->values_count, trie_values_cmp, trie);
-+                trie_node_add_value_trie = trie;
-+                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+                trie_node_add_value_trie = NULL;
-+
-                 if (val) {
-                         /* At this point we have 2 identical properties on the same match-string.
-                          * Since we process files in order, we just replace the previous value. */
-@@ -183,7 +190,9 @@ static int trie_node_add_value(struct tr
-                 .line_number = line_number,
-         };
-         node->values_count++;
--        typesafe_qsort_r(node->values, node->values_count, trie_values_cmp, trie);
-+        trie_node_add_value_trie = trie;
-+        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
-+        trie_node_add_value_trie = NULL;
-         return 0;
- }
- 
+diff --git a/src/shared/format-table.c b/src/shared/format-table.c
+index 4c4e4593d8..17b329f315 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -1282,30 +1282,32 @@ static int cell_data_compare(TableData *
+@@ -1282,30 +1282,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -141,7 +103,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          }
  
          if (t->display_map)
-@@ -2572,7 +2579,12 @@ int table_to_json(Table *t, JsonVariant
+@@ -2572,7 +2579,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -155,3 +117,47 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          }
  
          if (t->display_map)
+diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
+index d7626aed95..2003fac7c3 100644
+--- a/src/shared/hwdb-util.c
++++ b/src/shared/hwdb-util.c
+@@ -127,9 +127,13 @@ static struct trie* trie_free(struct trie *trie) {
+ 
+ DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
+ 
+-static int trie_values_cmp(const struct trie_value_entry *a, const struct trie_value_entry *b, struct trie *trie) {
+-        return strcmp(trie->strings->buf + a->key_off,
+-                      trie->strings->buf + b->key_off);
++static struct trie *trie_node_add_value_trie;
++static int trie_values_cmp(const void *v1, const void *v2) {
++        const struct trie_value_entry *a = v1;
++        const struct trie_value_entry *b = v2;
++
++        return strcmp(trie_node_add_value_trie->strings->buf + a->key_off,
++                      trie_node_add_value_trie->strings->buf + b->key_off);
+ }
+ 
+ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -157,7 +161,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+                         .value_off = v,
+                 };
+ 
+-                val = typesafe_bsearch_r(&search, node->values, node->values_count, trie_values_cmp, trie);
++                trie_node_add_value_trie = trie;
++                val = bsearch(&search, node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++                trie_node_add_value_trie = NULL;
++
+                 if (val) {
+                         /* At this point we have 2 identical properties on the same match-string.
+                          * Since we process files in order, we just replace the previous value. */
+@@ -183,7 +190,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+                 .line_number = line_number,
+         };
+         node->values_count++;
+-        typesafe_qsort_r(node->values, node->values_count, trie_values_cmp, trie);
++        trie_node_add_value_trie = trie;
++        qsort(node->values, node->values_count, sizeof(struct trie_value_entry), trie_values_cmp);
++        trie_node_add_value_trie = NULL;
+         return 0;
+ }
+ 
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 9b1768d9ca..d0110a2388 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,4 +1,4 @@
-From 4afb8adc83348bf75964fc10af7902e04dd62637 Mon Sep 17 00:00:00 2001
+From 2a2f95b6dc16d2ea7a8e9349c6b19cc50c34777b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
@@ -63,7 +63,7 @@ index 8a7f82812a..a56f12f47f 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
-index aea3241d18..75e6c56a28 100644
+index ce8d47ccc3..00845f9776 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
 @@ -28,6 +28,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index dc40a2fe8d..1d61367da4 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,7 +1,7 @@
-From 6c18e5f9373da3e3b38f2c5727e2aefe07fcbbd9 Mon Sep 17 00:00:00 2001
+From b19f800e178516d4f4d344457647e4a018bd6855 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
-Subject: [PATCH] [PATCH] add fallback parse_printf_format implementation
+Subject: [PATCH] add fallback parse_printf_format implementation
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -10,6 +10,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
 ---
  meson.build                              |   1 +
  src/basic/meson.build                    |   5 +
@@ -22,10 +23,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 27186d63a3..2abb7b3188 100644
+index 738879eb21..1aa20b8246 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -675,6 +675,7 @@ endif
+@@ -656,6 +656,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,10 +35,10 @@ index 27186d63a3..2abb7b3188 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 60ef801a25..aba2172edd 100644
+index 9b016ce5e8..a9ce21b02e 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -341,6 +341,11 @@ endforeach
+@@ -322,6 +322,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
@@ -430,6 +431,3 @@ index fd3fd7ef9c..e8e6ad555b 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
--- 
-2.24.0
-
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index c863fc995c..0462d52d5e 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 6b0732ac7164914ce16e231e35980b849bdfc4c8 Mon Sep 17 00:00:00 2001
+From db6551741a3654d8e75aff93ea00fbff579f7b02 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -29,9 +29,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/basic/mountpoint-util.c                |  1 +
  src/basic/parse-util.c                     |  1 +
  src/basic/path-lookup.c                    |  1 +
+ src/basic/percent-util.c                   |  1 +
  src/basic/proc-cmdline.c                   |  1 +
  src/basic/procfs-util.c                    |  1 +
- src/basic/selinux-util.c                   |  1 +
  src/basic/time-util.c                      |  1 +
  src/boot/bless-boot.c                      |  1 +
  src/core/dbus-cgroup.c                     |  1 +
@@ -72,16 +72,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-rules.c                      |  1 +
  51 files changed, 62 insertions(+)
 
+diff --git a/meson.build b/meson.build
+index 1aa20b8246..aafee71eb4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -480,6 +480,7 @@ foreach ident : ['secure_getenv', '__sec
+@@ -480,6 +480,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
-
+ 
  foreach ident : [
 +        ['strndupa' ,         '''#include <string.h>'''],
          ['memfd_create',      '''#include <sys/mman.h>'''],
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
+diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
+index 7c0970a60c..c129ff0f4f 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -89,9 +93,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "util.h"
 +#include "missing_stdlib.h"
-
+ 
  static int help(void) {
          _cleanup_free_ char *link = NULL;
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index 1ff6160dc8..c9efd862a2 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -38,6 +38,7 @@
@@ -99,9 +105,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "xattr-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
+diff --git a/src/basic/env-util.c b/src/basic/env-util.c
+index 81b1e3f10e..8fedcfd1cd 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -18,6 +18,7 @@
@@ -109,9 +117,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
+diff --git a/src/basic/log.c b/src/basic/log.c
+index fb183ea9e7..82e7bdff60 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -119,9 +129,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  #define SNDBUF_SIZE (8*1024*1024)
-
+ 
+diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
+index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -140,6 +152,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index f91f8f7a08..fb31596216 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -14,6 +14,7 @@
@@ -147,9 +161,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "stdio-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  int mkdir_safe_internal(
                  const char *path,
+diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
+index 8c836a1b74..2eb7e5a634 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -11,6 +11,7 @@
@@ -160,6 +176,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "mountpoint-util.h"
  #include "parse-util.h"
  #include "path-util.h"
+diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
+index b79c885dfd..6dabda5691 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -19,6 +19,7 @@
@@ -167,9 +185,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
-
+ 
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
+index 05eb17d66c..b6026aab28 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -15,6 +15,7 @@
@@ -177,9 +197,23 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "tmpfile-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
+diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
+index 06f20fd61e..8159d721bb 100644
+--- a/src/basic/percent-util.c
++++ b/src/basic/percent-util.c
+@@ -3,6 +3,7 @@
+ #include "percent-util.h"
+ #include "string-util.h"
+ #include "parse-util.h"
++#include "missing_stdlib.h"
+ 
+ static int parse_parts_value_whole(const char *p, const char *symbol) {
+         const char *pc, *n;
+diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
+index 410b8a3eb5..f2c4355609 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -187,9 +221,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "util.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
-
+ 
  int proc_cmdline(char **ret) {
          const char *e;
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 9234ccaf85..8c57094225 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -197,9 +233,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "stdio-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
-
+ 
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index 5d162e8ffe..1cde8e4262 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -207,9 +245,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "time-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static clockid_t map_clock_id(clockid_t c) {
-
+ 
+diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
+index 3fc319ca27..90064c90f3 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -217,9 +257,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "verbs.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
-
+ 
  static char **arg_path = NULL;
-
+ 
+diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
+index 84c3caf3a5..0fa84eaa38 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -20,6 +20,7 @@
@@ -227,9 +269,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "path-util.h"
  #include "percent-util.h"
 +#include "missing_stdlib.h"
-
+ 
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
-
+ 
+diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
+index 50daef6702..1cc6d91e64 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -42,6 +42,7 @@
@@ -237,9 +281,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
+diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
+index ca9b399d8c..b864480a8c 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -247,9 +293,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "unit.h"
 +#include "missing_stdlib.h"
-
+ 
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
+diff --git a/src/core/execute.c b/src/core/execute.c
+index 2a337b55a2..2a64675c5f 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -98,6 +98,7 @@
@@ -257,9 +305,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "utmp-wtmp.h"
 +#include "missing_stdlib.h"
-
+ 
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
+diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
+index a56f12f47f..6b8729ef67 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -267,9 +317,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "missing_type.h"
 +#include "missing_stdlib.h"
-
+ 
  #if HAVE_KMOD
  #include "module-util.h"
+diff --git a/src/core/service.c b/src/core/service.c
+index cb0a528f0d..740d305710 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -277,9 +329,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "utf8.h"
  #include "util.h"
 +#include "missing_stdlib.h"
-
+ 
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
+diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
+index 95c3fca661..d4a9f27b08 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -287,9 +341,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
+diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
+index ae1d43756a..24de98c9f3 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -24,6 +24,7 @@
@@ -297,9 +353,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-table.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
-
+ 
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
+diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
+index c8fb726d42..858a425d12 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -72,6 +72,7 @@
@@ -307,9 +365,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "varlink.h"
 +#include "missing_stdlib.h"
-
+ 
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
+diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
+index 20f7396c74..3471311ef5 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -20,6 +20,7 @@
@@ -317,9 +377,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
-
+ 
+diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
+index bfd42aea7d..daefc56e3e 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -12,6 +12,7 @@
@@ -327,9 +389,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
-
+ 
  static int node_vtable_get_userdata(
                  sd_bus *bus,
+diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
+index 378774fe8b..2694c177d5 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -27,6 +27,7 @@
@@ -337,9 +401,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  #define SNDBUF_SIZE (8*1024*1024)
-
+ 
+diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
+index a32e2f5e20..97fd3aec82 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -42,6 +42,7 @@
@@ -347,9 +413,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
+diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
+index 13c08fe295..9aae83486e 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -357,9 +425,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "time-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
-
+ 
  #define MAX_SIZE (2*1024*1024)
-
+ 
+diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
+index 5728c537bc..94885b0bf6 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -40,6 +40,7 @@
@@ -367,9 +437,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "syslog-util.h"
 +#include "missing_stdlib.h"
-
+ 
  #define JOURNAL_FILES_MAX 7168
-
+ 
+diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
+index d2f0566dbc..3b7746557e 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -24,6 +24,7 @@
@@ -377,9 +449,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "tmpfile-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
+diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
+index f8bd17eefe..9633fbc152 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -390,6 +464,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
+diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
+index 60e074e99b..a728e3b7a1 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -397,9 +473,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
-
+ 
  /*
    # .network
+diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
+index 3847fe4ec4..3696b57baa 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -17,6 +17,7 @@
@@ -407,9 +485,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
-
+ 
  Settings *settings_new(void) {
          Settings *s;
+diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
+index 44715bb3e5..bc1e688b5e 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -21,6 +21,7 @@
@@ -417,9 +497,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "signal-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static void setup_logging(void) {
          /* We need a dummy function because log_parse_environment is a macro. */
+diff --git a/src/portable/portable.c b/src/portable/portable.c
+index 4cf5fb4f0a..577dc5c8d7 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -34,6 +34,7 @@
@@ -427,9 +509,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "tmpfile-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
-
+ 
+diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
+index 7d13ed3905..ddc37115b8 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
 @@ -41,6 +41,7 @@
@@ -437,9 +521,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "utf8.h"
  #include "verbs.h"
 +#include "missing_stdlib.h"
-
+ 
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
+diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
+index feb6d3807f..eb11d29e50 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -447,9 +533,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "stdio-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
-
+ 
  int bus_property_get_bool(
                  sd_bus *bus,
+diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
+index 6f4a71138c..4a46de2c1b 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -457,9 +545,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "terminal-util.h"
 +#include "missing_stdlib.h"
-
+ 
  struct CGroupInfo {
          char *cgroup_path;
+diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
+index d3a5b25d18..003594e2d7 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -47,6 +47,7 @@
@@ -467,9 +557,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
+diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
+index 64ca67993c..31e3d148ea 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -477,9 +569,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "socket-util.h"
  #include "stdio-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
+diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
+index 787bb8fec9..009589a16f 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -487,9 +581,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "strv.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
-
+ 
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
+diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
+index 9e11dc09c1..f9954c1520 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -15,6 +15,7 @@
@@ -497,9 +593,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "unaligned.h"
 +#include "missing_stdlib.h"
-
+ 
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
+diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
+index e63c59bd94..dd9773c009 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -41,6 +41,7 @@
@@ -507,9 +605,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "util.h"
  #include "web-util.h"
 +#include "missing_stdlib.h"
-
+ 
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
+diff --git a/src/shared/pager.c b/src/shared/pager.c
+index 4bbad7e37b..eefcdd068c 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -517,9 +617,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "terminal-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
-
+ 
  static pid_t pager_pid = 0;
-
+ 
+diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
+index 5d5bf7f21d..f1002ffa6c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -527,9 +629,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "uid-range.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
+diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
+index 6e3ee0d76b..7727e33d95 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -537,9 +641,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "string-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
-
+ 
  #define BUFFER_SIZE (256 * 1024)
-
+ 
+diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
+index c9d318b8d1..fcb8d40805 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -547,9 +653,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "macro.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
-
+ 
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
+diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
+index 65c40de4c8..4ef9a0c6c8 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -557,9 +665,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "udev-builtin.h"
  #include "udev-util.h"
 +#include "missing_stdlib.h"
-
+ 
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
+diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
+index b28089be71..a7e2232299 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
@@ -567,9 +677,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "udev-watch.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
-
+ 
  typedef struct Spawn {
          sd_device *device;
+diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
+index bf997fc0ed..e3f5f1f2e2 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -33,6 +33,7 @@
@@ -577,17 +689,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "user-util.h"
  #include "virt.h"
 +#include "missing_stdlib.h"
-
+ 
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
-
---- a/src/basic/percent-util.c
-+++ b/src/basic/percent-util.c
-@@ -3,6 +3,7 @@
- #include "percent-util.h"
- #include "string-util.h"
- #include "parse-util.h"
-+#include "missing_stdlib.h"
-
- static int parse_parts_value_whole(const char *p, const char *symbol) {
-         const char *pc, *n;
-
+ 
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 2dfc7a3cfb..855607e6a8 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,4 @@
-From 2069f0b0d5ab8f869aeba635a347e0b11d362b30 Mon Sep 17 00:00:00 2001
+From d7ae3aadc70555932e03349907f8be04d03a50ee Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
 Subject: [PATCH] Include netinet/if_ether.h
@@ -33,29 +33,77 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 
 ---
- src/libsystemd-network/sd-dhcp6-client.c  | 1 -
- src/libsystemd/sd-netlink/netlink-types.c | 1 +
- src/machine/machine-dbus.c                | 1 +
- src/network/netdev/bond.c                 | 1 +
- src/network/netdev/bridge.c               | 1 +
- src/network/netdev/macsec.c               | 1 +
- src/network/netdev/netdev-gperf.gperf     | 1 +
- src/network/netdev/netdev.c               | 1 +
- src/network/networkd-brvlan.c             | 1 +
- src/network/networkd-dhcp-common.c        | 4 +++-
- src/network/networkd-dhcp-server.c        | 4 ++--
- src/network/networkd-dhcp4.c              | 2 +-
- src/network/networkd-dhcp6.c              | 2 +-
- src/network/networkd-link.c               | 2 +-
- src/network/networkd-network.c            | 1 +
- src/network/networkd-route.c              | 5 ++++-
- src/network/test-network-tables.c         | 1 +
- src/shared/ethtool-util.c                 | 1 +
- src/shared/ethtool-util.h                 | 1 +
- src/udev/net/link-config.c                | 1 +
- src/udev/udev-builtin-net_setup_link.c    | 1 +
- 21 files changed, 26 insertions(+), 8 deletions(-)
+ src/basic/linux/in6.h                     | 14 +++++++-------
+ src/libsystemd-network/sd-dhcp6-client.c  |  1 -
+ src/libsystemd/sd-netlink/netlink-types.c |  1 +
+ src/machine/machine-dbus.c                |  1 +
+ src/network/netdev/bond.c                 |  1 +
+ src/network/netdev/bridge.c               |  1 +
+ src/network/netdev/macsec.c               |  1 +
+ src/network/netdev/netdev-gperf.gperf     |  1 +
+ src/network/netdev/netdev.c               |  1 +
+ src/network/networkd-bridge-vlan.c        |  1 +
+ src/network/networkd-dhcp-common.c        |  4 +++-
+ src/network/networkd-dhcp-server.c        |  4 ++--
+ src/network/networkd-dhcp4.c              |  2 +-
+ src/network/networkd-dhcp6.c              |  2 +-
+ src/network/networkd-link.c               |  2 +-
+ src/network/networkd-network.c            |  1 +
+ src/network/networkd-route.c              |  1 +
+ src/network/networkd-setlink.c            |  2 +-
+ src/network/test-network-tables.c         |  1 +
+ src/shared/ethtool-util.c                 |  1 +
+ src/shared/ethtool-util.h                 |  1 +
+ src/udev/net/link-config.c                |  1 +
+ src/udev/udev-builtin-net_setup_link.c    |  1 +
+ 23 files changed, 31 insertions(+), 15 deletions(-)
 
+diff --git a/src/basic/linux/in6.h b/src/basic/linux/in6.h
+index 5ad396a57e..1dc007fe13 100644
+--- a/src/basic/linux/in6.h
++++ b/src/basic/linux/in6.h
+@@ -1,10 +1,10 @@
+ /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+ /*
+- *	Types and definitions for AF_INET6 
+- *	Linux INET6 implementation 
++ *	Types and definitions for AF_INET6
++ *	Linux INET6 implementation
+  *
+  *	Authors:
+- *	Pedro Roque		<roque@di.fc.ul.pt>	
++ *	Pedro Roque		<roque@di.fc.ul.pt>
+  *
+  *	Sources:
+  *	IPv6 Program Interfaces for BSD Systems
+@@ -19,8 +19,8 @@
+  *      2 of the License, or (at your option) any later version.
+  */
+ 
+-#ifndef _UAPI_LINUX_IN6_H
+-#define _UAPI_LINUX_IN6_H
++#ifndef _LINUX_IN6_H
++#define _LINUX_IN6_H
+ 
+ #include <linux/types.h>
+ #include <linux/libc-compat.h>
+@@ -97,7 +97,7 @@ struct in6_flowlabel_req {
+ 
+ 
+ /*
+- *	Bitmask constant declarations to help applications select out the 
++ *	Bitmask constant declarations to help applications select out the
+  *	flow label and priority fields.
+  *
+  *	Note that this are in host byte order while the flowinfo field of
+@@ -298,4 +298,4 @@ struct in6_flowlabel_req {
+  * ...
+  * MRT6_MAX
+  */
+-#endif /* _UAPI_LINUX_IN6_H */
++#endif /* _LINUX_IN6_H */
+diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
+index e8c47f429a..359922c1b3 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -66,6 +114,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <linux/if_infiniband.h>
  
  #include "sd-dhcp6-client.h"
+diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
+index beb926d40b..41de212242 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -76,6 +126,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <linux/can/vxcan.h>
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
+diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
+index 0022a980c5..fc22e51409 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -3,6 +3,7 @@
@@ -86,6 +138,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  /* When we include libgen.h because we need dirname() we immediately
   * undefine basename() since libgen.h defines it as a macro to the POSIX
+diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
+index a7a4adce45..eb111a6c48 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,5 +1,6 @@
@@ -95,6 +149,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "alloc-util.h"
  #include "bond.h"
  #include "bond-util.h"
+diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
+index 99fb9e1c3c..ecc6ca91bf 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -1,5 +1,6 @@
@@ -104,6 +160,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <net/if.h>
  
  #include "bridge.h"
+diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
+index 77c5f8c4e7..04be1b4ab2 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,5 +1,6 @@
@@ -113,6 +171,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <netinet/in.h>
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
+diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
+index 9dd081425e..130e5b3d3c 100644
 --- a/src/network/netdev/netdev-gperf.gperf
 +++ b/src/network/netdev/netdev-gperf.gperf
 @@ -3,6 +3,7 @@
@@ -123,6 +183,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <stddef.h>
  #include "bareudp.h"
  #include "batadv.h"
+diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
+index 53534d4873..1cfda9469f 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -1,5 +1,6 @@
@@ -132,6 +194,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <net/if.h>
  #include <netinet/in.h>
  #include <unistd.h>
+diff --git a/src/network/networkd-bridge-vlan.c b/src/network/networkd-bridge-vlan.c
+index 3153bf6984..687a26b057 100644
+--- a/src/network/networkd-bridge-vlan.c
++++ b/src/network/networkd-bridge-vlan.c
+@@ -4,6 +4,7 @@
+ ***/
+ 
+ #include <netinet/in.h>
++#include <netinet/if_ether.h>
+ #include <linux/if_bridge.h>
+ #include <stdbool.h>
+ 
+diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
+index 249d780887..edd2e9adf8 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -152,6 +228,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "networkd-network.h"
  #include "parse-util.h"
  #include "socket-util.h"
+diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
+index 9e2faa5675..fd8d817569 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,8 +1,8 @@
@@ -165,6 +243,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #include "sd-dhcp-server.h"
  
+diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
+index f80adcdbcf..3311e2a718 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -1,9 +1,9 @@
@@ -178,6 +258,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #include "escape.h"
  #include "alloc-util.h"
+diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
+index 2b72b618fc..d0d4cfb384 100644
 --- a/src/network/networkd-dhcp6.c
 +++ b/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
@@ -191,9 +273,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
  #include "sd-dhcp6-client.h"
  
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index 9421ce1aa6..3e37cbcc39 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
-@@ -1,9 +1,10 @@
+@@ -1,8 +1,8 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  
 +#include <netinet/if_ether.h>
@@ -201,10 +285,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <linux/if.h>
 -#include <linux/if_arp.h>
  #include <linux/if_link.h>
-+#include <linux/netdevice.h>
+ #include <linux/netdevice.h>
  #include <sys/socket.h>
- #include <unistd.h>
- 
+diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
+index 850b4f449e..6f85d41328 100644
 --- a/src/network/networkd-network.c
 +++ b/src/network/networkd-network.c
 @@ -1,5 +1,6 @@
@@ -214,6 +298,33 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <net/if.h>
  #include <netinet/in.h>
  #include <linux/netdevice.h>
+diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
+index 77a93beca9..3bf9ae8837 100644
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -1,5 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
++#include <netinet/in.h>
+ #include <linux/icmpv6.h>
+ #include <linux/ipv6_route.h>
+ #include <linux/nexthop.h>
+diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
+index 10c312c480..e44fbb5c35 100644
+--- a/src/network/networkd-setlink.c
++++ b/src/network/networkd-setlink.c
+@@ -1,8 +1,8 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <netinet/in.h>
++#include <net/if_arp.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
+ 
+ #include "missing_network.h"
+ #include "netlink-util.h"
+diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
+index f55e524ae9..83d5c7cef3 100644
 --- a/src/network/test-network-tables.c
 +++ b/src/network/test-network-tables.c
 @@ -1,5 +1,6 @@
@@ -223,6 +334,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "bond.h"
  #include "dhcp6-internal.h"
  #include "dhcp6-protocol.h"
+diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
+index f77f6943ca..0e1506e04b 100644
 --- a/src/shared/ethtool-util.c
 +++ b/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
@@ -232,6 +345,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <net/if.h>
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
+diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
+index 7d28766624..e98a25418b 100644
 --- a/src/shared/ethtool-util.h
 +++ b/src/shared/ethtool-util.h
 @@ -3,6 +3,7 @@
@@ -242,6 +357,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <linux/ethtool.h>
  
  #include "conf-parser.h"
+diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
+index 8dfe23691b..e269856337 100644
 --- a/src/udev/net/link-config.c
 +++ b/src/udev/net/link-config.c
 @@ -1,5 +1,6 @@
@@ -251,6 +368,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <linux/netdevice.h>
  #include <netinet/ether.h>
  #include <unistd.h>
+diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
+index d40251331c..89566c05f5 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
@@ -260,76 +379,3 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include "alloc-util.h"
  #include "device-util.h"
  #include "errno-util.h"
---- a/src/network/networkd-bridge-vlan.c
-+++ b/src/network/networkd-bridge-vlan.c
-@@ -4,6 +4,7 @@
- ***/
- 
- #include <netinet/in.h>
-+#include <netinet/if_ether.h>
- #include <linux/if_bridge.h>
- #include <stdbool.h>
- 
---- a/src/basic/linux/in6.h
-+++ b/src/basic/linux/in6.h
-@@ -1,10 +1,10 @@
- /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
- /*
-- *	Types and definitions for AF_INET6 
-- *	Linux INET6 implementation 
-+ *	Types and definitions for AF_INET6
-+ *	Linux INET6 implementation
-  *
-  *	Authors:
-- *	Pedro Roque		<roque@di.fc.ul.pt>	
-+ *	Pedro Roque		<roque@di.fc.ul.pt>
-  *
-  *	Sources:
-  *	IPv6 Program Interfaces for BSD Systems
-@@ -19,8 +19,8 @@
-  *      2 of the License, or (at your option) any later version.
-  */
- 
--#ifndef _UAPI_LINUX_IN6_H
--#define _UAPI_LINUX_IN6_H
-+#ifndef _LINUX_IN6_H
-+#define _LINUX_IN6_H
- 
- #include <linux/types.h>
- #include <linux/libc-compat.h>
-@@ -97,7 +97,7 @@ struct in6_flowlabel_req {
- 
- 
- /*
-- *	Bitmask constant declarations to help applications select out the 
-+ *	Bitmask constant declarations to help applications select out the
-  *	flow label and priority fields.
-  *
-  *	Note that this are in host byte order while the flowinfo field of
-@@ -298,4 +298,4 @@ struct in6_flowlabel_req {
-  * ...
-  * MRT6_MAX
-  */
--#endif /* _UAPI_LINUX_IN6_H */
-+#endif /* _LINUX_IN6_H */
---- a/src/network/networkd-route.c
-+++ b/src/network/networkd-route.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/in.h>
- #include <linux/icmpv6.h>
- #include <linux/ipv6_route.h>
- #include <linux/nexthop.h>
---- a/src/network/networkd-setlink.c
-+++ b/src/network/networkd-setlink.c
-@@ -1,8 +1,8 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <netinet/in.h>
-+#include <net/if_arp.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
- 
- #include "missing_network.h"
- #include "netlink-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 4a60ee32ef..28846935e0 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From bca73ff2fbff2dc311040a87a4f536f89af07ad6 Mon Sep 17 00:00:00 2001
+From e2d70a1735fc6b9d3c079814831ab0b1b2a9d1e0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
@@ -23,6 +23,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/tmpfiles/tmpfiles.c   | 10 ++++++++++
  3 files changed, 38 insertions(+)
 
+diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
+index e026b29478..815e56ef68 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
@@ -46,7 +48,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
+@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -61,6 +63,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
+diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
+index 50b4924679..09c0a20aee 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
 @@ -12,6 +12,12 @@
@@ -110,6 +114,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          assert_se(r == GLOB_NOMATCH);
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
+diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
+index 7e85c50634..145c48a685 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
 @@ -66,6 +66,12 @@
@@ -135,7 +141,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          };
          int r = 0, k;
          char **fn;
-@@ -2010,7 +2018,9 @@ static int glob_item(Item *i, action_t a
+@@ -2010,7 +2018,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 142ca01345..1de7ccf150 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From e0d1912f0246c97e5e7b4177691363d2d077e11d Mon Sep 17 00:00:00 2001
+From 3410d82c9d07aee3e951fc6ae0b41fc1a594e00d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 53f0a1ba62..4670c232a5 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From bb41fe773881a8f1d9615d388320b9c6fc47bfe5 Mon Sep 17 00:00:00 2001
+From 1e3bc870ded807cff0d3771dd89a850d020df032 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
@@ -12,7 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 7d4301eadb..caa9dfe3a3 100644
+index 14259ea8df..18681838ef 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -18,6 +18,9 @@
@@ -25,7 +25,7 @@ index 7d4301eadb..caa9dfe3a3 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1121,11 +1124,15 @@ void reset_cached_pid(void) {
+@@ -1202,11 +1205,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index 940db4c5c6..e6bb37a65e 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From dc40487e0ac26e3ca317429b9c3e8f01772de60a Mon Sep 17 00:00:00 2001
+From eeacb75025d8f537d54c35256c5730c9aab15cde Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -23,9 +23,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
  src/basic/format-util.h |  8 +-------
- src/basic/rlimit-util.c | 10 +++++-----
+ src/basic/rlimit-util.c | 12 ++++++------
  src/core/execute.c      |  4 ++--
- 3 files changed, 8 insertions(+), 14 deletions(-)
+ 3 files changed, 9 insertions(+), 15 deletions(-)
 
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
 index b7e18768e3..3195ab205d 100644
@@ -47,7 +47,7 @@ index b7e18768e3..3195ab205d 100644
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
 diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 23d108d5df..b037734ee3 100644
+index 23d108d5df..3e6fb438d7 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
 @@ -43,7 +43,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
@@ -87,10 +87,10 @@ index 23d108d5df..b037734ee3 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index f82fc294c0..4696d055a8 100644
+index 2a64675c5f..dca1e0e3b6 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5370,9 +5370,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -5391,9 +5391,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index b1d782719c..897e332f33 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From f8be7b283309e4332eedc088774daac637afef7b Mon Sep 17 00:00:00 2001
+From fa29a572faaeb6fb9ed0bc6802d17139773e1908 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index cf06572b82..3bf706fc55 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From 06915b70735caa66987af758ebdc4207757ae758 Mon Sep 17 00:00:00 2001
+From 88c8922f9e4d221402d9cb2e04b9c82e89125827 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
@@ -31,9 +31,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 24 insertions(+), 5 deletions(-)
 
+diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
+index 7f15b558ca..4263298cad 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct
+@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
  int fd_warn_permissions(const char *path, int fd);
  int stat_warn_permissions(const char *path, const struct stat *st);
  
@@ -63,9 +65,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
+diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
+index 016eb7b82a..b1967f9f2f 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -53,7 +53,7 @@ int base_filesystem_create(const char *r
+@@ -53,7 +53,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (size_t i = 0; i < ELEMENTSOF(table); i++) {
@@ -74,7 +78,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
                          continue;
  
                  if (table[i].target) {
-@@ -61,7 +61,7 @@ int base_filesystem_create(const char *r
+@@ -61,7 +61,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -83,7 +87,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -72,7 +72,7 @@ int base_filesystem_create(const char *r
+@@ -72,7 +72,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 51b145729d..74008714c1 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From 0c44af262cfa07c57db4b32de1f7610af47797f4 Mon Sep 17 00:00:00 2001
+From e07e9b998ad61b09555bc809aa15de9d2516787a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 3a1e4f9072..ab87b9882c 100644
+index fc22e51409..1fed07b941 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -11,6 +11,11 @@
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 7444d4375f..c5e20cbb80 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 0f4b60e34a806055c678eb97a7ec7e21291bcf48 Mon Sep 17 00:00:00 2001
+From 2f048d13e100158320bda248635b3c533ac9717b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index caa9dfe3a3..6101f43db5 100644
+index 18681838ef..0fa71ccce0 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1523,7 +1523,7 @@ int set_oom_score_adjust(int value) {
+@@ -1606,7 +1606,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 90cc70d216..39804bd364 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From c30ab62d18ce88187f5eb6c236e0977c9337f68d Mon Sep 17 00:00:00 2001
+From 45148529792c0cda32fdd61610c8d5a700d541fa Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
@@ -25,10 +25,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 8da2024a50..9605a9b869 100644
+index 7483b46a11..c49be29e46 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -392,7 +392,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
+@@ -404,7 +404,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
                          return;
  
                  errno = 0;
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index de7f9ecfa2..365e2a36f1 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,4 +1,4 @@
-From fa86e5578256dddb296fd30128929ea7c4b792a4 Mon Sep 17 00:00:00 2001
+From 02a2772889d6cb08c9ca0561b52e7a9a80e50497 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
 Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
@@ -17,7 +17,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 9605a9b869..38b6cf90c3 100644
+index c49be29e46..90731bd7e7 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
 @@ -55,8 +55,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index d9ef2b8a47..8a6c03f312 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,4 +1,4 @@
-From 11e730694706fa354a0e43c588ef66677a777d9a Mon Sep 17 00:00:00 2001
+From 47c4ac80689077b1eb86cf05b4326b1ac345aedf Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
 Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 3b60854233..e75935a280 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 45bae28d3da6607d33d54f4b30a500f5249aadde Mon Sep 17 00:00:00 2001
+From 2cb33d8896a4ad2d3b489fed51f17d5e45dfb4fc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 7d6433f317..629c103627 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,4 +1,4 @@
-From 6e593ff2afbe4bfe15eee2ec34e51490a38462f5 Mon Sep 17 00:00:00 2001
+From 200a2a2e4f04a7b7078dd455fafbd6774240e30b Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
 Subject: [PATCH] Handle missing LOCK_EX
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index 1faee1c055..ea6e82f466 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,4 +1,4 @@
-From ac579b296aa29c2f1dad9425c6d795e154ec8f7c Mon Sep 17 00:00:00 2001
+From 6445b7737a89256f35adc56701a5c47b48618ced Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
 Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
@@ -24,10 +24,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index a4ac8ed2bb..0c41a48d4b 100644
+index 04685fecba..90b12bb5bd 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -5125,7 +5125,7 @@ static int cant_be_in_netns(void) {
+@@ -5354,7 +5354,7 @@ static int cant_be_in_netns(void) {
          if (fd < 0)
                  return log_error_errno(errno, "Failed to allocate udev control socket: %m");
  
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index 14c8ff73a0..60c12b0740 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From 6bc78df50adb48d24a2abfdf65b44b932cc5a571 Mon Sep 17 00:00:00 2001
+From ae71bf2b97dc9d4760defd83463c1d305f332f22 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 44c3ff0532..6998bf0dd0 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 7cb6579572b50ef44bc0a321a4c73cce55b0c2f2 Mon Sep 17 00:00:00 2001
+From 3198690c2dbb4b457a04ef21914dc4d531540273 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -22,7 +22,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
 ---
  src/basic/cgroup-util.c                 | 10 +++++-----
  src/basic/procfs-util.c                 |  4 ++--
- src/basic/smack-util.c                  |  2 +-
  src/basic/sysctl-util.c                 |  2 +-
  src/basic/util.c                        |  2 +-
  src/binfmt/binfmt.c                     |  6 +++---
@@ -30,17 +29,20 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/core/smack-setup.c                  |  8 ++++----
  src/hibernate-resume/hibernate-resume.c |  2 +-
  src/libsystemd/sd-device/sd-device.c    |  2 +-
- src/login/logind-dbus.c                 |  2 +-
  src/nspawn/nspawn-cgroup.c              |  2 +-
  src/nspawn/nspawn.c                     |  6 +++---
  src/shared/cgroup-setup.c               |  4 ++--
+ src/shared/mount-util.c                 |  4 ++--
+ src/shared/smack-util.c                 |  2 +-
  src/sleep/sleep.c                       |  8 ++++----
  src/vconsole/vconsole-setup.c           |  2 +-
- 16 files changed, 33 insertions(+), 33 deletions(-)
+ 16 files changed, 34 insertions(+), 34 deletions(-)
 
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index c9efd862a2..b3708ea925 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -766,7 +766,7 @@ int cg_install_release_agent(const char
+@@ -766,7 +766,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -49,7 +51,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -784,7 +784,7 @@ int cg_install_release_agent(const char
+@@ -784,7 +784,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -58,7 +60,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (r < 0)
                          return r;
  
-@@ -811,7 +811,7 @@ int cg_uninstall_release_agent(const cha
+@@ -811,7 +811,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -67,7 +69,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -821,7 +821,7 @@ int cg_uninstall_release_agent(const cha
+@@ -821,7 +821,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -76,7 +78,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return r;
  
-@@ -1651,7 +1651,7 @@ int cg_set_attribute(const char *control
+@@ -1651,7 +1651,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -85,9 +87,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
+diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
+index 8c57094225..0cf6ec752b 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -103,9 +107,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  uint64_t threads_max;
  
+diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
+index 8913e6ff85..29e6ec0755 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, con
+@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -114,6 +120,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  int sysctl_read(const char *property, char **ret) {
+diff --git a/src/basic/util.c b/src/basic/util.c
+index 955b18bd2a..6d89c90176 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -234,7 +234,7 @@ void disable_coredumps(void) {
@@ -125,9 +133,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
+diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
+index 29530bb691..3ecf6a45a2 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
+@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
          if (!fn)
                  return log_oom();
  
@@ -136,7 +146,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  }
  
  static int apply_rule(const char *rule) {
-@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
+@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
  
          (void) delete_rule(rule);
  
@@ -154,9 +164,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
+diff --git a/src/core/main.c b/src/core/main.c
+index b32a19a1d8..4e1238853e 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1402,7 +1402,7 @@ static int bump_unix_max_dgram_qlen(void
+@@ -1402,7 +1402,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -165,7 +177,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1679,7 +1679,7 @@ static void initialize_core_pattern(bool
+@@ -1679,7 +1679,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -174,9 +186,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
+diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
+index 79c4808473..b111ce0a11 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -323,17 +323,17 @@ int mac_smack_setup(bool *loaded_policy)
+@@ -323,17 +323,17 @@ int mac_smack_setup(bool *loaded_policy) {
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -198,6 +212,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
+diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
+index 58e35e403e..1d0beb4008 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -209,9 +225,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
+diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
+index 388128bf33..695f535ff4 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2096,7 +2096,7 @@ _public_ int sd_device_set_sysattr_value
+@@ -2096,7 +2096,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -220,9 +238,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
+diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
+index cb01b25bc6..e92051268b 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -231,6 +251,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 90b12bb5bd..6a1dafa094 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
 @@ -2751,7 +2751,7 @@ static int reset_audit_loginuid(void) {
@@ -260,9 +282,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
+diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
+index f197f715c7..077f893177 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -267,7 +267,7 @@ int cg_attach(const char *controller, co
+@@ -267,7 +267,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -280,9 +304,44 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
+diff --git a/src/shared/mount-util.c b/src/shared/mount-util.c
+index 594efea989..d243b45bc4 100644
+--- a/src/shared/mount-util.c
++++ b/src/shared/mount-util.c
+@@ -1019,13 +1019,13 @@ static int make_userns(uid_t uid_shift, uid_t uid_range) {
+         xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shift, uid_range);
+ 
+         xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
+-        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, line, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write UID map: %m");
+ 
+         /* We always assign the same UID and GID ranges */
+         xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
+-        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(uid_map, line, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write GID map: %m");
+ 
+diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
+index 3362ee3924..80c0f2a52e 100644
+--- a/src/shared/smack-util.c
++++ b/src/shared/smack-util.c
+@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+                 return 0;
+ 
+         p = procfs_file_alloca(pid, "attr/current");
+-        r = write_string_file(p, label, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(p, label, 0);
+         if (r < 0)
+                 return r;
+ 
+diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
+index a3aeb24633..d3e68e1b94 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -46,7 +46,7 @@ static int write_hibernate_location_info
+@@ -46,7 +46,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -291,7 +350,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -73,7 +73,7 @@ static int write_hibernate_location_info
+@@ -73,7 +73,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -309,7 +368,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (k >= 0)
                          return 0;
  
-@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **
+@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -318,9 +377,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index d1c3febdd5..1cc68694d1 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *na
+@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -329,32 +390,3 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
---- a/src/shared/mount-util.c
-+++ b/src/shared/mount-util.c
-@@ -1019,13 +1019,13 @@ static int make_userns(uid_t uid_shift,
-         xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shift, uid_range);
- 
-         xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
--        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(uid_map, line, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write UID map: %m");
- 
-         /* We always assign the same UID and GID ranges */
-         xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
--        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(uid_map, line, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write GID map: %m");
- 
---- a/src/shared/smack-util.c
-+++ b/src/shared/smack-util.c
-@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const
-                 return 0;
- 
-         p = procfs_file_alloca(pid, "attr/current");
--        r = write_string_file(p, label, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(p, label, 0);
-         if (r < 0)
-                 return r;
- 
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 7d1bd60255..06702765ee 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From d73755cc60f401f0f20f357752e45aeeeef8e83f Mon Sep 17 00:00:00 2001
+From b04518c464b526f8b9adc9ce3c08b1881db47989 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 9394eeb450..dc63305825 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 04e94f9a15101daa8f65a9af269d26cda2a24056 Mon Sep 17 00:00:00 2001
+From 0c8935128b39864b07dfee39cfa9d35d48f056aa Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
@@ -14,9 +14,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
 ---
  src/shared/user-record-nss.c | 20 ++++++++++++++++++++
  src/shared/user-record-nss.h |  4 ++++
- src/shared/userdb.c          |  6 ++++++
- 3 files changed, 30 insertions(+)
+ src/shared/userdb.c          |  7 ++++++-
+ 3 files changed, 30 insertions(+), 1 deletion(-)
 
+diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
+index 88b8fc2f8f..a819d41bac 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -331,8 +331,10 @@ int nss_group_to_group_record(
@@ -46,7 +48,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  
          r = json_build(&g->json, JSON_BUILD_OBJECT(
                                         JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
-@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct grou
+@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
          assert(ret_sgrp);
          assert(ret_buffer);
  
@@ -54,7 +56,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          for (;;) {
                  _cleanup_free_ char *buf = NULL;
                  struct sgrp sgrp, *result;
-@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct grou
+@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
                  buflen *= 2;
                  buf = mfree(buf);
          }
@@ -120,6 +122,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
          if (r < 0)
                  return r;
  
+diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
+index 22ab04d6ee..4e52e7a911 100644
 --- a/src/shared/user-record-nss.h
 +++ b/src/shared/user-record-nss.h
 @@ -2,7 +2,11 @@
@@ -134,9 +138,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  #include <pwd.h>
  #include <shadow.h>
  
+diff --git a/src/shared/userdb.c b/src/shared/userdb.c
+index 91ac7c3832..20881ece84 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1047,13 +1047,15 @@ int groupdb_iterator_get(UserDBIterator
+@@ -1047,13 +1047,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -153,7 +159,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1066,6 +1068,9 @@ int groupdb_iterator_get(UserDBIterator
+@@ -1066,6 +1068,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 2289404d8d..ff96a720c5 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 366cd28f5f93ba7c861cd32a718251770d74830e Mon Sep 17 00:00:00 2001
+From f5d7fee9620cbcf52be8f8ba477890d28cadfbc8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 1384324804..0202d00372 100644
+index 9e3a165857..4d59b3e7b0 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
diff --git a/meta/recipes-core/systemd/systemd_249.1.bb b/meta/recipes-core/systemd/systemd_249.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_249.1.bb
rename to meta/recipes-core/systemd/systemd_249.3.bb
-- 
2.31.1

