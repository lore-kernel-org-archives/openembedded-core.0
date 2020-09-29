Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.4687.1601410474471803689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 13:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s2cUSKcU;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d9so5780952pfd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 13:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=49cDTMKLgIUJRYPCkdH+ekSmEke3C1hVbqUcT6kLtvc=;
        b=s2cUSKcUtC//LQhKKOM3yhI4fXkJTEOJSU9kLvLPhE6AOcP9mkp4SwmuAPKqGUwSsX
         wabYY5HYpDzJlwYkwlKKsC8q4dMggDjM9YB26KgnWDo8jpcHli5Rib8xPQ4lwLX0Y4MZ
         yl+aSARRNPjfzHNi1Gfh+dlK2PILxj1RR2foDtMtc3fcPtwuj4GJzEZtXETy6Og4j4lZ
         IqEJOwUHDZCZWWZu44JVTNgeCi9BsvrPwzYI1xRtiphMOzM5rbmASAawxTtEvT4awOoy
         5vuzgPHXKwl4JxFADQY7oWp19cbxtRuDl+HIfm++PrKaoWAv4QD84QaJ2P9HRz+/fIeW
         5dPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=49cDTMKLgIUJRYPCkdH+ekSmEke3C1hVbqUcT6kLtvc=;
        b=eNn2nud163hUoRrbhwfr2+nf3ENuN374A8wn0eUhK0MtfQ+u0uUU589Mb5cjlbYk/C
         zpZBR7AsPwaB8nIzHJnaFWw+Fn0rBWd56BQKRBecu7r11WXH/CS44UvgB1SYk1H8UJac
         RcTi6btFRQbroUP0bxlnHUZm0tS7z3Zdi6BTojlt3h14hhtOip7aEXYp/rJOrqOpe51K
         lGv+a3BZLxOfUFJG8ypg8R7fo0CiIDhVl4fuOVMbNtOBCsEo3BGeVVHrzOgB20goMVEC
         9Z1/2zPGHBU39fdVOeDbJVabRbcM+s+LfJLrCOguYj0kn1sN7UmQCitKrE0kKD2imlIs
         58ww==
X-Gm-Message-State: AOAM531499d4k49Q0IRXJF/AUWRCLZgw1XZfcUlRC1OLq8HQ3LY4NwnR
	TxxwfKhjnXDhrqYcmHMc5Mk98hAjZRlZ0g==
X-Google-Smtp-Source: ABdhPJzqVfePYGCRoZ8e3vz9zvAwjyqdFl8It0Eo6dGdMJjcOsDwfPKVNkdyi5fiN4RBfrJqTshphw==
X-Received: by 2002:a65:5786:: with SMTP id b6mr4541129pgr.114.1601410473440;
        Tue, 29 Sep 2020 13:14:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id m13sm5905864pfk.103.2020.09.29.13.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 13:14:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Drop 0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch
Date: Tue, 29 Sep 2020 13:14:30 -0700
Message-Id: <20200929201430.370552-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is no longer needed as upstream has added including part of
this include list, perhaps thats all is what was needed to make it
portable

Refresh 0001-Handle-missing-gshadow.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/0001-Handle-missing-gshadow.patch | 20 +++++-------
 ...ader_entry_one_shot_stat-has-incompl.patch | 31 -------------------
 meta/recipes-core/systemd/systemd_246.6.bb    |  1 -
 3 files changed, 7 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
index 723cd2e52e..c5960a0d60 100644
--- a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
@@ -14,10 +14,8 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/shared/userdb.c           |  6 ++++++
  3 files changed, 30 insertions(+)
 
-Index: systemd-stable/src/shared/group-record-nss.c
-===================================================================
---- systemd-stable.orig/src/shared/group-record-nss.c
-+++ systemd-stable/src/shared/group-record-nss.c
+--- a/src/shared/group-record-nss.c
++++ b/src/shared/group-record-nss.c
 @@ -19,8 +19,10 @@ int nss_group_to_group_record(
          if (isempty(grp->gr_name))
                  return -EINVAL;
@@ -35,7 +33,7 @@ Index: systemd-stable/src/shared/group-record-nss.c
  
 +#if ENABLE_GSHADOW
          if (sgrp) {
-                 if (hashed_password_valid(sgrp->sg_passwd)) {
+                 if (looks_like_hashed_password(sgrp->sg_passwd)) {
                          g->hashed_password = strv_new(sgrp->sg_passwd);
 @@ -51,6 +54,7 @@ int nss_group_to_group_record(
                  if (!g->administrators)
@@ -119,10 +117,8 @@ Index: systemd-stable/src/shared/group-record-nss.c
          if (r < 0)
                  return r;
  
-Index: systemd-stable/src/shared/group-record-nss.h
-===================================================================
---- systemd-stable.orig/src/shared/group-record-nss.h
-+++ systemd-stable/src/shared/group-record-nss.h
+--- a/src/shared/group-record-nss.h
++++ b/src/shared/group-record-nss.h
 @@ -2,7 +2,11 @@
  #pragma once
  
@@ -135,10 +131,8 @@ Index: systemd-stable/src/shared/group-record-nss.h
  
  #include "group-record.h"
  
-Index: systemd-stable/src/shared/userdb.c
-===================================================================
---- systemd-stable.orig/src/shared/userdb.c
-+++ systemd-stable/src/shared/userdb.c
+--- a/src/shared/userdb.c
++++ b/src/shared/userdb.c
 @@ -930,13 +930,16 @@ int groupdb_iterator_get(UserDBIterator
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
diff --git a/meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch b/meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch
deleted file mode 100644
index 78660691d3..0000000000
--- a/meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f939d3e07e1175caac5cf4cbf54bd8a58c2f198a Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Fri, 7 Aug 2020 15:30:52 +0000
-Subject: [PATCH] Fix field 'efi_loader_entry_one_shot_stat' has incomplete
- type
-
-| In file included from ../../../../../../workspace/sources/systemd/src/login/logind-gperf.gperf:7:
-| ../../../../../../workspace/sources/systemd/src/login/logind.h:131:21: error: field 'efi_loader_entry_one_shot_stat' has incomplete type
-|   131 |         struct stat efi_loader_entry_one_shot_stat;
-|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/login/logind.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/login/logind.h b/src/login/logind.h
-index e64ecce8e2..2d4007d84b 100644
---- a/src/login/logind.h
-+++ b/src/login/logind.h
-@@ -2,6 +2,9 @@
- #pragma once
- 
- #include <stdbool.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <unistd.h>
- 
- #include "sd-bus.h"
- #include "sd-device.h"
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
index b50ea0e4ad..c1424a1474 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -44,7 +44,6 @@ SRC_URI_MUSL = "\
                file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
                file://0021-Handle-missing-LOCK_EX.patch \
                file://0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
-               file://0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch \
                file://0024-test-json.c-define-M_PIl.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
-- 
2.28.0

