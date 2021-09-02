Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.3527.1630565120351194080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 23:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqE55/2v;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a25so1887728ejv.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fqp58g+XBO3W+avf1IqCRiBnV+AXJ5Mbf4TRxa//djw=;
        b=pqE55/2vCT1cjkUfzjPagy3Hnw/kRvL0yiX/orblThnP46RTQBDD6XNk/9DPkHvBjN
         WwX2KwuuqmAPlQ1gF4uv3dr+v+5aiwj6EP2z5yduH6hrP1yWt52hvRr+q4S3qVqyfBIk
         tJWPihvmKuUXL73VdGzlguYhpkCpz+0fc7hYhRYKs4h4Zs9HecKFkgFIq5E9HUw8iM7s
         HpktRhR6pVAsmoiqhsFAcJrkHrR0/X6e7NxnUrcPKWoRtOLcKR9jDFuPjPQeUK8+aT2M
         Oes9XTcaQJXdYi0zy/0tHs6oZjXTe7l+Yff5DNpo8BmDjWwqa/GvzCkh0Okk3WzMyz1C
         KHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fqp58g+XBO3W+avf1IqCRiBnV+AXJ5Mbf4TRxa//djw=;
        b=dqjQ/5HfWvZhfOX5iBpnSADbxJpAnslh5aOFZJ+7O1uLR+KauBhf1Y5gz+QteAPNZD
         8LAz7uWO/rcZHjekYwy2bsfZdTY0kuxkAA7TGzuHd6acb52PJPS29SgTmgUfW87qfXPR
         PPsT1Gp4vChtNlvI0QKu1WjJjUs4QBldFZHrp83TlyHZO9kdNStM9djfIGoou0oCPiNz
         XO+D5ubSxKmBEGP2CHSFNCXqQkfUdHpwEg1+SczhAtT+517djEYPyivqtODKC0dry2eO
         d0YvEjjAvhD3bVXUd1hExT03ZGl4j4E+eiwtg3fSExvsboypWH+eUuhxp6ScXpAyaiaB
         HEbw==
X-Gm-Message-State: AOAM530EchxB+Gyfv+KCJQT3gQp8W0paJ9ycK9e7H8oSRccSgx4IvnHH
	7T29Kf4p/MU2Vz6LBpygI/lyuJQS6Nc=
X-Google-Smtp-Source: ABdhPJxeh6HQPLxZMGNYvANQksHekY9PhbekC/1tD53Rr6+sCYOUCY7zLIlm1UnIGw9CcdFvRK91xQ==
X-Received: by 2002:a17:906:a14b:: with SMTP id bu11mr2106191ejb.260.1630565118771;
        Wed, 01 Sep 2021 23:45:18 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d19sm385243ejj.122.2021.09.01.23.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 23:45:18 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] rust: remove unused patches
Date: Thu,  2 Sep 2021 08:45:16 +0200
Message-Id: <20210902064516.9482-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* 0001-nfc-Fix-missing-include.patch was only used in 1.51.0 version recently removed
* 0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch was only used in 1.49.0 version in meta-rust

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-nfc-Fix-missing-include.patch        | 26 -------
 ...-dash-vs-underscore-mismatches-in-op.patch | 75 -------------------
 2 files changed, 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-nfc-Fix-missing-include.patch
 delete mode 100644 meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-nfc-Fix-missing-include.patch b/meta/recipes-devtools/rust/rust-llvm/0001-nfc-Fix-missing-include.patch
deleted file mode 100644
index f6dee77ab2..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0001-nfc-Fix-missing-include.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 3b7e611bd58ba842470d17374c550e14bceca5c7 Mon Sep 17 00:00:00 2001
-From: serge-sans-paille <sguelton@redhat.com>
-Date: Tue, 10 Nov 2020 14:55:25 +0100
-Subject: [PATCH] [nfc] Fix missing include
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/utils/benchmark/src/benchmark_register.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/llvm/utils/benchmark/src/benchmark_register.h b/llvm/utils/benchmark/src/benchmark_register.h
-index 0705e219f2fa..4caa5ad4da07 100644
---- a/llvm/utils/benchmark/src/benchmark_register.h
-+++ b/llvm/utils/benchmark/src/benchmark_register.h
-@@ -1,6 +1,7 @@
- #ifndef BENCHMARK_REGISTER_H
- #define BENCHMARK_REGISTER_H
- 
-+#include <limits>
- #include <vector>
- 
- #include "check.h"
--- 
-2.30.1
-
diff --git a/meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch b/meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch
deleted file mode 100644
index 13d81eaa37..0000000000
--- a/meta/recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From dd682cb48c8b667859dded98a4bbfbd891a1eca4 Mon Sep 17 00:00:00 2001
-From: Vadim Petrochenkov <vadim.petrochenkov@gmail.com>
-Date: Thu, 12 Nov 2020 19:16:59 +0300
-Subject: [PATCH] rustc_target: Fix dash vs underscore mismatches in option
- names
-
----
- compiler/rustc_target/src/spec/mod.rs | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/compiler/rustc_target/src/spec/mod.rs b/compiler/rustc_target/src/spec/mod.rs
-index f949bf95a50..f837114ee74 100644
---- a/compiler/rustc_target/src/spec/mod.rs
-+++ b/compiler/rustc_target/src/spec/mod.rs
-@@ -1428,8 +1428,8 @@ pub fn from_json(obj: Json) -> Result<Target, String> {
-         }
- 
-         key!(is_builtin, bool);
--        key!(endian = "target_endian");
--        key!(c_int_width = "target_c_int_width");
-+        key!(endian = "target-endian");
-+        key!(c_int_width = "target-c-int-width");
-         key!(os);
-         key!(env);
-         key!(vendor);
-@@ -1466,7 +1466,7 @@ pub fn from_json(obj: Json) -> Result<Target, String> {
-         key!(exe_suffix);
-         key!(staticlib_prefix);
-         key!(staticlib_suffix);
--        key!(os_family = "target_family", optional);
-+        key!(os_family = "target-family", optional);
-         key!(abi_return_struct_as_int, bool);
-         key!(is_like_osx, bool);
-         key!(is_like_solaris, bool);
-@@ -1511,7 +1511,7 @@ pub fn from_json(obj: Json) -> Result<Target, String> {
-         key!(limit_rdylib_exports, bool);
-         key!(override_export_symbols, opt_list);
-         key!(merge_functions, MergeFunctions)?;
--        key!(mcount = "target_mcount");
-+        key!(mcount = "target-mcount");
-         key!(llvm_abiname);
-         key!(relax_elf_relocations, bool);
-         key!(llvm_args, list);
-@@ -1663,8 +1663,8 @@ fn to_json(&self) -> Json {
-         target_val!(data_layout);
- 
-         target_option_val!(is_builtin);
--        target_option_val!(endian, "target_endian");
--        target_option_val!(c_int_width, "target_c_int_width");
-+        target_option_val!(endian, "target-endian");
-+        target_option_val!(c_int_width, "target-c-int-width");
-         target_option_val!(os);
-         target_option_val!(env);
-         target_option_val!(vendor);
-@@ -1701,7 +1701,7 @@ fn to_json(&self) -> Json {
-         target_option_val!(exe_suffix);
-         target_option_val!(staticlib_prefix);
-         target_option_val!(staticlib_suffix);
--        target_option_val!(os_family, "target_family");
-+        target_option_val!(os_family, "target-family");
-         target_option_val!(abi_return_struct_as_int);
-         target_option_val!(is_like_osx);
-         target_option_val!(is_like_solaris);
-@@ -1746,7 +1746,7 @@ fn to_json(&self) -> Json {
-         target_option_val!(limit_rdylib_exports);
-         target_option_val!(override_export_symbols);
-         target_option_val!(merge_functions);
--        target_option_val!(mcount, "target_mcount");
-+        target_option_val!(mcount, "target-mcount");
-         target_option_val!(llvm_abiname);
-         target_option_val!(relax_elf_relocations);
-         target_option_val!(llvm_args);
--- 
-2.28.0
-
-- 
2.32.0

