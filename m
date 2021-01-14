Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.3694.1610640576828357862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xtvhfIWpEEKwvHWa7cZmKHkspeqiOqz5dTwQiKZ0mW/3QfWLBDsffcfaWj5sC5cC3l7ztATA/g
 gjMNEGvu3pgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="178482771"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="178482771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:09:30 -0800
IronPort-SDR: yk2mdSTJuneHyZAQkXp4f4tVTA3OrpKXauf6vVEjULJ9O2mE88NV5MEAZcJiNfe8zKgAJPAy0C
 be9jqoqjBSxw==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986347"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:09:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][gatesgarth] systemd: upgrade 246.6 -> 246.9
Date: Fri, 15 Jan 2021 00:09:22 +0800
Message-Id: <20210114160922.21382-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade to latest released version for v246-stable.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...md-boot_246.2.bb => systemd-boot_246.9.bb} |  0
 ...md-conf_246.1.bb => systemd-conf_246.9.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...tall-dependency-links-at-install-tim.patch | 36 ++++++------
 ...002-don-t-use-glibc-specific-qsort_r.patch | 55 +++++++++----------
 .../{systemd_246.6.bb => systemd_246.9.bb}    |  0
 6 files changed, 47 insertions(+), 46 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_246.2.bb => systemd-boot_246.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_246.1.bb => systemd-conf_246.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_246.6.bb => systemd_246.9.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.2.bb b/meta/recipes-core/systemd/systemd-boot_246.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_246.2.bb
rename to meta/recipes-core/systemd/systemd-boot_246.9.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_246.1.bb b/meta/recipes-core/systemd/systemd-conf_246.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_246.1.bb
rename to meta/recipes-core/systemd/systemd-conf_246.9.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 1733565fc0..b0f8a72bbe 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2ee1c57c4ff4fd3349cf03c2e89fbd18ca0b3a4a"
+SRCREV = "90f7f6c5777e9e2a4990f299474f730459054bf4"
 SRCBRANCH = "v246-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 2676c144f2..643b9547b7 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001
+From ad5b89a366785d8a19ba970f5b0c97b4de848fa3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
@@ -18,17 +18,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [rebased for systemd 243]
 Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
 ---
  units/meson.build                       | 6 ++----
  units/proc-sys-fs-binfmt_misc.automount | 3 +++
  units/systemd-binfmt.service.in         | 4 ++++
  3 files changed, 9 insertions(+), 4 deletions(-)
 
-Index: systemd-stable/units/meson.build
-===================================================================
---- systemd-stable.orig/units/meson.build
-+++ systemd-stable/units/meson.build
+diff --git a/units/meson.build b/units/meson.build
+index 031237c..0d43bdb 100644
+--- a/units/meson.build
++++ b/units/meson.build
 @@ -54,8 +54,7 @@ units = [
          ['poweroff.target',                     '',
           (with_runlevels ? 'runlevel0.target' : '')],
@@ -38,8 +37,8 @@ Index: systemd-stable/units/meson.build
 +        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT'],
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
-          (with_runlevels ? 'runlevel6.target ctrl-alt-del.target' : 'ctrl-alt-del.target')],
-@@ -162,8 +161,7 @@ in_units = [
+          'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
+@@ -164,8 +163,7 @@ in_units = [
          ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
          ['rescue.service',                       ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
@@ -49,10 +48,10 @@ Index: systemd-stable/units/meson.build
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
          ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
-Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
-===================================================================
---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
-+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 30a6bc9..4231f3b 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
@@ -60,11 +59,11 @@ Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
 +
 +[Install]
 +WantedBy=sysinit.target
-Index: systemd-stable/units/systemd-binfmt.service.in
-===================================================================
---- systemd-stable.orig/units/systemd-binfmt.service.in
-+++ systemd-stable/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index e54e95e..372a598 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
+@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
@@ -79,3 +78,6 @@ Index: systemd-stable/units/systemd-binfmt.service.in
 +
 +[Install]
 +WantedBy=sysinit.target
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 30fe9a14df..3be5095f07 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 3eb12a6ba0bce149717eaabeb1505d379b3d705a Mon Sep 17 00:00:00 2001
+From 263e4100a849f28f62fcfcc1456e9e6de8ee836b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
@@ -12,16 +12,16 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 
 ---
- src/basic/sort-util.h              | 14 ------------
- src/libsystemd/sd-hwdb/hwdb-util.c | 19 +++++++++++-----
- src/shared/format-table.c          | 36 ++++++++++++++++++++----------
+ src/basic/sort-util.h              | 14 --------------
+ src/libsystemd/sd-hwdb/hwdb-util.c | 19 ++++++++++++++-----
+ src/shared/format-table.c          | 36 ++++++++++++++++++++++++------------
  3 files changed, 38 insertions(+), 31 deletions(-)
 
-Index: systemd-stable/src/basic/sort-util.h
-===================================================================
---- systemd-stable.orig/src/basic/sort-util.h
-+++ systemd-stable/src/basic/sort-util.h
-@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *bas
+diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
+index a8dc3bb..9541061 100644
+--- a/src/basic/sort-util.h
++++ b/src/basic/sort-util.h
+@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
                  int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
                  _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
@@ -39,11 +39,11 @@ Index: systemd-stable/src/basic/sort-util.h
 -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
-Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
-===================================================================
---- systemd-stable.orig/src/libsystemd/sd-hwdb/hwdb-util.c
-+++ systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
-@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie)
+diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
+index 5c75216..3986fc8 100644
+--- a/src/libsystemd/sd-hwdb/hwdb-util.c
++++ b/src/libsystemd/sd-hwdb/hwdb-util.c
+@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie) {
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -60,7 +60,7 @@ Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -158,7 +162,10 @@ static int trie_node_add_value(struct tr
+@@ -158,7 +162,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                          .value_off = v,
                  };
  
@@ -72,7 +72,7 @@ Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value. */
-@@ -184,7 +191,9 @@ static int trie_node_add_value(struct tr
+@@ -184,7 +191,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
                  .line_number = line_number,
          };
          node->values_count++;
@@ -83,11 +83,11 @@ Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
          return 0;
  }
  
-Index: systemd-stable/src/shared/format-table.c
-===================================================================
---- systemd-stable.orig/src/shared/format-table.c
-+++ systemd-stable/src/shared/format-table.c
-@@ -1246,31 +1246,33 @@ static int cell_data_compare(TableData *
+diff --git a/src/shared/format-table.c b/src/shared/format-table.c
+index 612402c..04638b2 100644
+--- a/src/shared/format-table.c
++++ b/src/shared/format-table.c
+@@ -1243,30 +1243,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -95,7 +95,6 @@ Index: systemd-stable/src/shared/format-table.c
 +static Table *user_table;
 +static int table_data_compare(const void *x, const void *y) {
 +        const size_t *a = x, *b=y;
-         size_t i;
          int r;
  
 -        assert(t);
@@ -115,8 +114,8 @@ Index: systemd-stable/src/shared/format-table.c
                  return 1;
  
          /* Order other lines by the sorting map */
--        for (i = 0; i < t->n_sort_map; i++) {
-+        for (i = 0; i < user_table->n_sort_map; i++) {
+-        for (size_t i = 0; i < t->n_sort_map; i++) {
++        for (size_t i = 0; i < user_table->n_sort_map; i++) {
                  TableData *d, *dd;
  
 -                d = t->data[*a + t->sort_map[i]];
@@ -131,8 +130,8 @@ Index: systemd-stable/src/shared/format-table.c
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1798,7 +1800,12 @@ int table_print(Table *t, FILE *f) {
-                 for (i = 0; i < n_rows; i++)
+@@ -1844,7 +1846,12 @@ int table_print(Table *t, FILE *f) {
+                 for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
 -                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
@@ -145,8 +144,8 @@ Index: systemd-stable/src/shared/format-table.c
          }
  
          if (t->display_map)
-@@ -2375,7 +2382,12 @@ int table_to_json(Table *t, JsonVariant
-                 for (i = 0; i < n_rows; i++)
+@@ -2440,7 +2447,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+                 for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
 -                typesafe_qsort_r(sorted, n_rows, table_data_compare, t);
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.9.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_246.6.bb
rename to meta/recipes-core/systemd/systemd_246.9.bb
-- 
2.29.2

