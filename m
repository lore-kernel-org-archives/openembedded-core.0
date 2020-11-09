Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.4523.1604880153126706224
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E6bLhQGy;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f27so1929606pgl.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W+FBPMDc1+uGXbetbIc/F0QKO0hoIAPTZIngeaVndDY=;
        b=E6bLhQGyJRYt/Q1WLfEHQTXysv2vBY+YYTLmvdlLf5ACWffwYPDLxMwSKfYMuPhI39
         3/vRt+HwVfOivnLbcTM+DcMa2rOccxmEHF/eu1cqw9C01NWiZa7iGxSyW4pBu75Wku4l
         CeBkKQbtHSKRS5rE/UPjLTGoGavafjD+7V6yTlQ7Te6tOIM8r+bM7wz0FzfnW+zOahK1
         vJYOz09sl75B3RB26ito1oj0SAM18raBJmI1TRjAvxv3NxoMZsD7Bbkq1ZMP841Khgog
         o0d02WwDGB3Yxv4Z2ivbVRHTHkZ5+TaVzhj7JmocGpNMTQxI/XJscR8SCFJIvIED9wjN
         YwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W+FBPMDc1+uGXbetbIc/F0QKO0hoIAPTZIngeaVndDY=;
        b=OPTO2cj/m6EJTp8rugoFEWts/0xsM5hG+sh9zT9jyIxPGAQGp6TQ8kUkTjLYimjCIG
         I/BKP9tYADHhleFQWReIOYj63JskZPGk3sJg9JUydnltGvOTKLpqd9/cIgnvgM/CsDQ+
         t8p+5FIvT2byaU//tCmfs8lXD5LvjFVPqtZi69cfZXxcWzcRCMeXjX9GkitEuQWs1x2O
         XMBLBfqmVQDuboT2kyTF/pqDy/sCBnHyR4jem4ZGlSuYnhc9+6BaTR4KzdowLfF3D8ID
         yeZHwyCdhCTGnlG2KRes+hycqMYxq1xIc03X9ecmKsID/muq1g3HOs4dueFcqNKyPALw
         0TVA==
X-Gm-Message-State: AOAM530eJgM4trZXBQNwCsXFoa5ZwURg/OTeIxzWxeDj4meVJnTKuQeK
	q6afmapmo5SlBeV4MBUFBurUp0BkYIV5sA==
X-Google-Smtp-Source: ABdhPJy2miMH51Tr+rNWV32cuV2ZUlSDdq4BkygyIhv6bxm0B1ZyWHX5OMzsMcN+Umj7FpCyl2/5mQ==
X-Received: by 2002:a17:90a:fa93:: with SMTP id cu19mr10713113pjb.117.1604880152435;
        Sun, 08 Nov 2020 16:02:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:32 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 11/11] gcc: Handle duplicate names for variables
Date: Sun,  8 Nov 2020 16:02:17 -0800
Message-Id: <20201109000217.3008448-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PREFIXVAR is defined in cppdefaults.c as well which shows up as error
when LTO is enabled to build gcc, therefore rename the one instance to PREFIXVAR1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...4-handle-sysroot-support-for-nativesdk-gcc.patch | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index 1a65ece7bf..dc3e6da65a 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From bb1f359e34649516e61305e9748534cce7e0ee70 Mon Sep 17 00:00:00 2001
+From 702daf2e9cb97337e0e594fcd435b1b61a917d14 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -321,7 +321,7 @@ index 9098ab044ab..bfad4ebe382 100644
  	      str = update_path (ostr, p->component);
  	      free (ostr);
 diff --git a/gcc/prefix.c b/gcc/prefix.c
-index 1a403e535bd..3257ed3cd3e 100644
+index 1a403e535bd..c26d07bde12 100644
 --- a/gcc/prefix.c
 +++ b/gcc/prefix.c
 @@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not see
@@ -329,9 +329,9 @@ index 1a403e535bd..3257ed3cd3e 100644
  #include "common/common-target.h"
  
 -static const char *std_prefix = PREFIX;
-+static const char PREFIXVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
++char PREFIXVAR1[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX;
 +
-+static const char *std_prefix = PREFIXVAR;
++static const char *std_prefix = PREFIXVAR1;
  
  static const char *get_key_value (char *);
  static char *translate_name (char *);
@@ -340,7 +340,10 @@ index 1a403e535bd..3257ed3cd3e 100644
  
        if (prefix == 0)
 -	prefix = PREFIX;
-+	prefix = PREFIXVAR;
++	prefix = PREFIXVAR1;
  
        /* We used to strip trailing DIR_SEPARATORs here, but that can
  	 sometimes yield a result with no separator when one was coded
+-- 
+2.29.2
+
-- 
2.29.2

