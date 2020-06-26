Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.2793.1593155943831063230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QSt53Y7P;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dg28so6131284edb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nVSGkARXdpmBGKJYQDbGVfp8Zk6Ju0z0q7G3KaIic7w=;
        b=QSt53Y7PzwMvocvd9QhwZ9N/70HFDvQ0oi0z54JZVXhoKYX9TUaO7k+zDJpb55wohb
         if7jV6wTTFz+RJYNgek/Ww7ZZkAv0P49bRJYtjcHUwIqVRSzOIgmQXnbZ4V+H9+KONon
         8TPGSSzc5IA5MKSLWXWr2nNSkuMoqSE8Wor2iTJul51VlsIlQxIfvKzbW4FxsVHdiyej
         5bI3IcqzFL6GnWsB0/0NobTM1/Sd5gV+29gRFsYkx/DHb5sPJmW/NNs0rwvz44yVMIKg
         3CkJC+QMgp/V/hHONaRlpuWIezcVv5AfF5kmC/LYFDmVomc7MatvqnPcwuMVvD5FGwke
         HvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nVSGkARXdpmBGKJYQDbGVfp8Zk6Ju0z0q7G3KaIic7w=;
        b=INRa6vKjn+kmKWGDozUS9/tyYSdyCcKbJkNAJ0MM96H1rSnYBB73hiFSRK+NrJN4lh
         q2QURG5xK6Shm6+CwO8iUVL952hpxAYg6BkYoCZokeXuRauWQzMPO5/iiOn3vIgMChb7
         kAFGDXGLDg7QwtyVRArr82Aqj75BHkOCDuf/q1hxtvzR1Kd0eUtrr0v1i1UKSJO66paz
         hYjg7FHszb0PNpoSIHG+ZeLltMcpGA1+kfvyvSlGw8hJg14/Vt6orfnada2k2st/CxFz
         EgSBY9zZACgJY2s11PNb0ojleAEnGBOHj/mGQVEwFxxdkTBDS7YJsKf1dwHBwReaY/kt
         1IXQ==
X-Gm-Message-State: AOAM532z3/xEvvfSItGqGbhYZiNELKkh6swayNIZ/eS1/ARBQ8eYHwAf
	2OWXfLFmNZfXSW8nBhAd0mgru7BIxG0=
X-Google-Smtp-Source: ABdhPJxON0gewEN6yZst/EIxiOBqMXlTR3sTCva6G8sjLxCEAluv7XVo3hb1+TF8PsGNr7XWVLjDZA==
X-Received: by 2002:a05:6402:14c1:: with SMTP id f1mr2057225edx.342.1593155941895;
        Fri, 26 Jun 2020 00:19:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/30] libdnf: update 0.47.0 -> 0.48.0
Date: Fri, 26 Jun 2020 09:18:17 +0200
Message-Id: <20200626071844.29134-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/0001-Add-WITH_TESTS-option.patch   | 10 +++---
 ...s-around-string-literals-used-in-SQL.patch | 36 -------------------
 .../{libdnf_0.47.0.bb => libdnf_0.48.0.bb}    |  3 +-
 3 files changed, 6 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.47.0.bb => libdnf_0.48.0.bb} (91%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
index ac9400c48d..384add5e12 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
@@ -1,4 +1,4 @@
-From 56fa2bbdbd29377a6ef0d0b7aadbac8b5ea8c95b Mon Sep 17 00:00:00 2001
+From 7d60d62b5c5374156703ca7262fb2f85ec5db119 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:54:43 +0100
 Subject: [PATCH] Add WITH_TESTS option
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 881152a..965c992 100644
+index 9c6e1b2f..8599c540 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -33,6 +33,7 @@ option(WITH_MAN "Enables hawkey man page generation" ON)
@@ -24,8 +24,8 @@ index 881152a..965c992 100644
 +option(WITH_TESTS "Enables unit tests" ON)
  
  
- # load pkg-config first; it's required by other modules
-@@ -165,8 +166,10 @@ endif()
+ # build options - debugging
+@@ -179,8 +180,10 @@ endif()
  
  
  # build tests
@@ -37,7 +37,7 @@ index 881152a..965c992 100644
      add_subdirectory(python/hawkey)
  endif()
 diff --git a/python/hawkey/CMakeLists.txt b/python/hawkey/CMakeLists.txt
-index d964534..84d1720 100644
+index d9645346..84d17204 100644
 --- a/python/hawkey/CMakeLists.txt
 +++ b/python/hawkey/CMakeLists.txt
 @@ -50,4 +50,6 @@ target_link_libraries(_hawkeymodule ${PYTHON_LIBRARY})
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
deleted file mode 100644
index 6be484fea3..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 96ca7d0049461df2293dd0000edcbc69b64255e0 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sun, 3 May 2020 22:40:39 +0200
-Subject: [PATCH] Use single-quotes around string literals used in SQL
- statements
-
-If sqlite is built with -DSQLITE_DQS=0 in accordance with
-https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of the
-history database would fail with:
-
-  History database cannot be created: /var/lib/dnf/history.sqlite.
-  Error: SQLite error on ":memory:": Executing an SQL statement failed:
-  no such column: 1.2
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/951]
-Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
----
- libdnf/transaction/sql/migrate_tables_1_2.sql | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libdnf/transaction/sql/migrate_tables_1_2.sql b/libdnf/transaction/sql/migrate_tables_1_2.sql
-index 49b75315..f80ad1c4 100644
---- a/libdnf/transaction/sql/migrate_tables_1_2.sql
-+++ b/libdnf/transaction/sql/migrate_tables_1_2.sql
-@@ -1,9 +1,9 @@
- R"**(
- BEGIN TRANSACTION;
-     ALTER TABLE trans
--        ADD comment TEXT DEFAULT "";
-+        ADD comment TEXT DEFAULT '';
-     UPDATE config
--        SET value = "1.2"
-+        SET value = '1.2'
-         WHERE key = 'version';
- COMMIT;
- )**"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
similarity index 91%
rename from meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
index 1b06d66b19..947b2f2348 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
@@ -8,10 +8,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
-           file://0001-Use-single-quotes-around-string-literals-used-in-SQL.patch \
            "
 
-SRCREV = "8330eea6985c4e4b53796f858de5b6b38b1ddf5c"
+SRCREV = "46a28d0cf09277fffc11392e5e362a2eda0d53a8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.27.0

