Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.3702.1632256300182647937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 13:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lr6S8+eW;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id c4so229127pls.6
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pLxQBqao5SFpd4Jk1YrLHmdcqoFpn2XbOnZediCQfcU=;
        b=Lr6S8+eWNJkQk33jI4trozWy0WAAND379wJjZUYvBQiHe7v104muR7vnUDc0rb/z2j
         H+bEAO9EBvTwjqbcVYRkF3+8eMfmIYtm95lxC0ErDkr1jfoyAdhBhjvoeD0YB7N7WWVI
         zCqhI70r51ty29wyjIT/q5WYjzM3rrkG1NI2IOzkxqMtJg20eBNBe215WtR518x3RaMf
         XZg116mdTIFXrQJN3qvSr+waytOfwuFczs5UWKqylRixHTyXkCdLvxZ1I+BZIL6zSs6W
         p2BR/21KJBZ2b9aym+wyd0aqa6olFDxfTYF6v2oPvD8CdeVyyaVqsI7puE3D/JPn74n/
         eQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pLxQBqao5SFpd4Jk1YrLHmdcqoFpn2XbOnZediCQfcU=;
        b=1CeGCLlaP8OW3VVvEw8+5/oGrzVTLL44E6mvrqTjYy6gGq8i9CkZU+ohSKfeQO4tYY
         AGn4Tza3DN8FMmy4vy9Q6lYaZdGc/aviPs7TSGMsj21nm0uV2tAtd9ooFCQv/VGH/8T/
         CAxkaWD+o1qZyeR1a9SnAshisxqB19XSpwsS+QKmre3pY6v3Q38x+fQjrPKZcztr/Q2/
         XddUqgBKJMVlRjoG5XInu1nuauFQMrihK5C39TmCVFBhnRyZ+4Vl0ExQD1hebKbxQBWr
         3zTX9IPaAB1U7+7CY2UzYz3gvrTkdSHf6pqB9mzrAlR7hCK1Th1Zcm79Tn3kaBkANucE
         dDAQ==
X-Gm-Message-State: AOAM532WU5fao7rDw/T6AfxoG1h4fzcMDN0hu1ZMu0p69uK9pWYWPkrX
	mH8Gp6RyxUYEwYLC9qnPfOqj8yZzoMWkgw==
X-Google-Smtp-Source: ABdhPJzgxWrB9MG1D08kAxENUztgwoyFCZvtL4J3vGs/sxO/ofQGTHTcOS/j6NtowT810JW5NX1fUw==
X-Received: by 2002:a17:903:2282:b0:13b:8631:cf8c with SMTP id b2-20020a170903228200b0013b8631cf8cmr29265313plh.8.1632256299567;
        Tue, 21 Sep 2021 13:31:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id b13sm3451585pjk.35.2021.09.21.13.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:31:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] site: Drop ORBit2 relared cached variables
Date: Tue, 21 Sep 2021 13:31:36 -0700
Message-Id: <20210921203136.2141025-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921203136.2141025-1-raj.khem@gmail.com>
References: <20210921203136.2141025-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ORBit2 is long gone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/arm-32          | 14 --------------
 meta/site/arm-64          | 14 --------------
 meta/site/ix86-common     | 14 --------------
 meta/site/mips-common     | 14 --------------
 meta/site/nios2-linux     | 15 ---------------
 meta/site/powerpc32-linux | 14 --------------
 meta/site/sh-common       | 14 --------------
 meta/site/x86_64-linux    | 14 --------------
 8 files changed, 113 deletions(-)

diff --git a/meta/site/arm-32 b/meta/site/arm-32
index 81fd8d3103..60ada2e974 100644
--- a/meta/site/arm-32
+++ b/meta/site/arm-32
@@ -22,20 +22,6 @@ ac_cv_alignof_unsigned_long=4
 # jikes
 ac_cv_sizeof_wchar_t=4
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
-
 # at-spi2-core
 ac_cv_alignof_char=1
 ac_cv_alignof_dbind_pointer=4
diff --git a/meta/site/arm-64 b/meta/site/arm-64
index 90c09b2d54..40763fb059 100644
--- a/meta/site/arm-64
+++ b/meta/site/arm-64
@@ -22,20 +22,6 @@ ac_cv_alignof_guint32=4
 ac_cv_alignof_guint64=8
 ac_cv_alignof_unsigned_long=8
 
-# ORBit2 (should be in meta-gnome/site/arm-64)
-#ac_cv_alignof_CORBA_boolean=1
-#ac_cv_alignof_CORBA_char=1
-#ac_cv_alignof_CORBA_double=8
-#ac_cv_alignof_CORBA_float=4
-#ac_cv_alignof_CORBA_long=4
-#ac_cv_alignof_CORBA_long_double=8
-#ac_cv_alignof_CORBA_long_long=8
-#ac_cv_alignof_CORBA_octet=1
-#ac_cv_alignof_CORBA_pointer=4
-#ac_cv_alignof_CORBA_short=2
-#ac_cv_alignof_CORBA_struct=1
-#ac_cv_alignof_CORBA_wchar=2
-
 # at-spi2-core
 ac_cv_alignof_dbind_pointer=8
 ac_cv_alignof_dbind_struct=1
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index b7218cc6fa..d98ae5265b 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -118,20 +118,6 @@ with_broken_putenv=${with_broken_putenv=no}
 mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=yes}
 mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=yes}
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=4
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=4
-ac_cv_alignof_CORBA_long_long=4
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=4
-ac_cv_alignof_CORBA_wchar=2
-
 # php
 ac_cv_pread=${ac_cv_pread=no}
 ac_cv_pwrite=${ac_cv_pwrite=no}
diff --git a/meta/site/mips-common b/meta/site/mips-common
index 5858dfb15b..892817b108 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -15,20 +15,6 @@ screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
 screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
 screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 
-# ORBit2
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_wchar=2
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_struct=1
-
 # apache
 ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
 
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 21b2b7cca8..656da9fde4 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -134,21 +134,6 @@ mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
 ac_cv_regexec_segfault_emptystr=${ac_cv_regexec_segfault_emptystr=no}
 nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
-
 # php
 ac_cv_pread=${ac_cv_pread=no}
 ac_cv_pwrite=${ac_cv_pwrite=no}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index 5741ccf30f..accd048a6a 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -151,20 +151,6 @@ compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
 # slrn
 slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=4
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=4
-ac_cv_alignof_CORBA_long_long=4
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=4
-ac_cv_alignof_CORBA_wchar=2
-
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
diff --git a/meta/site/sh-common b/meta/site/sh-common
index c35cc06a02..d269a17db9 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -169,20 +169,6 @@ slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
 # startup-notification
 lf_cv_sane_realloc=yes
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=4
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=4
-ac_cv_alignof_CORBA_long_long=4
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=4
-ac_cv_alignof_CORBA_wchar=2
-
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index f7ad70d25f..ea3176da93 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -76,20 +76,6 @@ ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
 # bash
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
 
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=8
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=1
-ac_cv_alignof_CORBA_wchar=2
-
 lf_cv_sane_realloc=yes
 as_cv_unaligned_access=${as_cv_unaligned_access=yes}
 
-- 
2.33.0

