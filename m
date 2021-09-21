Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3842.1632256299456606529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 13:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GTVIUN7M;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id il14-20020a17090b164e00b0019c7a7c362dso2594754pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e77QFfqUlzfGzwnQT6dEj9MqOBVc1o4NSqfUeyAs7h0=;
        b=GTVIUN7MsAcgDdMnvMWrNeADXeuFJg0Os/txcKRD8/IsxIyZGv1xFZAL0xgnyihNUf
         +qm4vDfNKkplczBbSylMmq3DDyhi+Fws+ZVw4zhZ2Qok31GXhND62jXBxjCddmNSuTAv
         uWd+Z0gCRnA31f4HAtbS5dF+7VT3K/d/BsbUzwf45blJ6Mhln0FSQBxtrO9ODdg2Ww6A
         gRJfPQGQxtPITKwP6JfF2cvYzLT+bdga9bh0ejSy/GMI5Q5zTkr+F1TpGTYdYyBPsBWJ
         OlvF+qvGe/sElqBZbpFso6RI0ivV25Qr+aiTXnODuVgcO5Jd19fjAUSewGonOLaDBsAJ
         37nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e77QFfqUlzfGzwnQT6dEj9MqOBVc1o4NSqfUeyAs7h0=;
        b=ASLGG/jJt2B6XFpmN6hmGVsV6WLPj0oFQe2IDMlrln0hK1lDeerSA0aIkT2mMyKTac
         PiKGosylEeaa3tvwFKbLMlqyVTIzaTNnTW38YFI9D7dM3dcpDJeZYoxY/mqOVfzWizHf
         ZCPxNAWRqjR4w8Dvbe0GwB2u24VKPx/DNsP40FGqSxyYWAoXl5Hw3xqp/EWNwEhMXdLK
         MC47KFZYsZKRVuiP3hJJbDqJP11A5z0FFxmaAZp0IstoOwnnYhnCaYk0NayrGZXQT6Tu
         3/EFVvPSADWBXIJCUmoW3Ftute5LrYJnTvoGxlbH0WKCxplwbDEh4zkgfs3Gzsub7N+n
         fLgw==
X-Gm-Message-State: AOAM532O80LesdSqJ+SBcYoSn0PxFmi966PR09RxkS2MYvUM+YNb7mos
	lwPpK1EPSCk9G3lhanQ3ft20Dg9kptbb0Q==
X-Google-Smtp-Source: ABdhPJw9RbBsj/XiYn0SVqHFn4lGxQALGRWt/7Kfyaxk3dTa+f79Aolv27tPiNMe4jVYXRCCM520zA==
X-Received: by 2002:a17:902:e144:b0:13b:96ee:ad48 with SMTP id d4-20020a170902e14400b0013b96eead48mr29021836pla.26.1632256298640;
        Tue, 21 Sep 2021 13:31:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id b13sm3451585pjk.35.2021.09.21.13.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:31:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] site: Drop caching libIDL_cv_long_long_format
Date: Tue, 21 Sep 2021 13:31:35 -0700
Message-Id: <20210921203136.2141025-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

recipe for libidl has long been deleted

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/arm-common          | 3 ---
 meta/site/ix86-common         | 3 ---
 meta/site/mips-linux          | 3 ---
 meta/site/mips64-linux        | 3 ---
 meta/site/mips64el-linux      | 3 ---
 meta/site/mipsel-linux        | 3 ---
 meta/site/mipsisa32r6-linux   | 3 ---
 meta/site/mipsisa32r6el-linux | 3 ---
 meta/site/mipsisa64r6-linux   | 3 ---
 meta/site/mipsisa64r6el-linux | 3 ---
 meta/site/nios2-linux         | 3 ---
 meta/site/powerpc32-linux     | 3 ---
 meta/site/sh-common           | 3 ---
 meta/site/x86_64-linux        | 3 ---
 14 files changed, 42 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 8c37f3fc24..4c25c82be9 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -73,9 +73,6 @@ lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
 # libesmtp
 acx_working_snprintf=${acx_working_snprintf=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # libnet 
 ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
 
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index a2384372db..b7218cc6fa 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -107,9 +107,6 @@ ac_cv_sizeof_wchar_t=4
 ac_cv_need_trio=${ac_cv_need_trio=no}
 lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # libnet 
 ac_cv_lbl_unaligned_fail=${ac_cv_lbl_unaligned_fail=no}
 ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 72a54f95e3..b2f15eee18 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -39,9 +39,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index ed0fbbe653..e7c16405eb 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -43,9 +43,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 680171d5e3..406ffd66c5 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -43,9 +43,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 696b1beeb4..e9cf193cec 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -39,9 +39,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
index 72a54f95e3..b2f15eee18 100644
--- a/meta/site/mipsisa32r6-linux
+++ b/meta/site/mipsisa32r6-linux
@@ -39,9 +39,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linux
index 696b1beeb4..e9cf193cec 100644
--- a/meta/site/mipsisa32r6el-linux
+++ b/meta/site/mipsisa32r6el-linux
@@ -39,9 +39,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
index ed0fbbe653..e7c16405eb 100644
--- a/meta/site/mipsisa64r6-linux
+++ b/meta/site/mipsisa64r6-linux
@@ -43,9 +43,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linux
index 680171d5e3..406ffd66c5 100644
--- a/meta/site/mipsisa64r6el-linux
+++ b/meta/site/mipsisa64r6el-linux
@@ -43,9 +43,6 @@ ac_cv_linux_vers=${ac_cv_linux_vers=2}
 # startup-notification
 lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ncftp
 wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
 wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 8ac198a0cd..21b2b7cca8 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -110,9 +110,6 @@ lftp_cv___va_copy=${lftp_cv___va_copy=yes}
 # libesmtp
 acx_working_snprintf=${acx_working_snprintf=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # libnet 
 ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
 
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 172a06cc46..5741ccf30f 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -151,9 +151,6 @@ compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 # slrn
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ORBit2
 ac_cv_alignof_CORBA_boolean=1
 ac_cv_alignof_CORBA_char=1
diff --git a/meta/site/sh-common b/meta/site/sh-common
index 6bda1c237c..c35cc06a02 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -169,9 +169,6 @@ slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 # startup-notification
 lf_cv_sane_realloc=yes
 
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
 # ORBit2
 ac_cv_alignof_CORBA_boolean=1
 ac_cv_alignof_CORBA_char=1
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index 778e2c53ee..f7ad70d25f 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -73,9 +73,6 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 #gcc
 ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
 
-#orbit
-libIDL_cv_long_long_format=ll
-
 # bash
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
 
-- 
2.33.0

