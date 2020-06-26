Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2821.1593155956446581045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dVcmjdYW;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l12so8328085ejn.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kkYOZiRPzFB/s5zvQlbUmCCQXOF39//5ch4r0M6RqhQ=;
        b=dVcmjdYWTTOqGSUMxquVEo9BRg+7/d+LjdCOPh8gmnEue4FOzs3Y5smL1/DdNmx1x6
         CWte5HG/SDp0AlntXL5UUZea089PdiHieF6TaDKyqwzvY4wjVtRApm2wYlkTH8joQ0R2
         3h+0VQb0zbPkYk3w+uwasb8qVtwq8letCDx735dcdjEXd2hnqrpYdMG6gjeUgL1Ax3Uf
         c2snA980x68pn32amK+EaG4MxYHfA1GZSeeX4zPB8CKsUJXMNYKzzRUG7iFWZDJ9jkD0
         78fP6qbIAbGOxM0Qtu0bQIj0t9eLDO+lIXKsXwFC9K3wpwrfGyya1wV2tXhlGOithYYl
         w1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkYOZiRPzFB/s5zvQlbUmCCQXOF39//5ch4r0M6RqhQ=;
        b=jdKhX+DFPM2MdEu4vt/1+RRSBXSiwjM1O1jK0+4a/N7VSJxHvrrQTvU0GiL1X9qklX
         yeXg1yxRc4Z2jZ8QN8qvVqMTriNel6AOaAA2TbBh/B/qAYVHnRkfSDoHeiSP++CZJVoS
         bmkE8aatd1jJfM15OpaGkH1bD3d0WaV3rX1+Ixf5qPj7qQtUrepIGcUShMam7cgp2gCS
         u+s5Vg2FnNeNsLpR13ohCXOoQ5nkZYfjsOkJFJWRlYbxbGQNuKMF2wA4iMRs3IhI65Gx
         TNPzgHrpNfNc7sZeF8wXjF15z6W98JjuF8OB6cq+3jDbHU5p6U4+AH224EuXs/nnQ9QL
         C32g==
X-Gm-Message-State: AOAM531V9lyMMY5ViCv8j+YFj2LwjO/xTnQ6IJeXGjtZ18DEFcqRu2/R
	0a/ZGmdwjmgcJUhwUGoP1jV0kBWCi+g=
X-Google-Smtp-Source: ABdhPJwl9kvbi9eWvlq5z9o+sUGSLb2bgg8spzNSczOz4rHP4x8VN1aM8ZJSGH2FapQc07T5CWazjQ==
X-Received: by 2002:a17:907:1051:: with SMTP id oy17mr1446351ejb.394.1593155954362;
        Fri, 26 Jun 2020 00:19:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/30] stress-ng: upgrade 0.11.12 -> 0.11.14
Date: Fri, 26 Jun 2020 09:18:27 +0200
Message-Id: <20200626071844.29134-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/stress-ng/no_daddr_t.patch         | 16 +++++++++++++---
 ...stress-ng_0.11.12.bb => stress-ng_0.11.14.bb} |  2 +-
 2 files changed, 14 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.12.bb => stress-ng_0.11.14.bb} (89%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch b/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
index 877f4f0624..dba4494b91 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
@@ -1,4 +1,7 @@
-Define daddr_t if __DADDR_T_TYPE is not defined
+From 55e11765af2bdc8adfac87dab1fb2682f7e6c236 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Jun 2020 22:10:28 -0700
+Subject: [PATCH] Define daddr_t if __DADDR_T_TYPE is not defined
 
 glibc defined daddr_t but musl does not, ideally it should not be used
 and simple int type is enough. However, its better to leave glibc behavior
@@ -7,9 +10,16 @@ as it is and only define it to int if daddr_t is not provided by libc
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ stress-ng.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/stress-ng.h b/stress-ng.h
+index 1a66293..802dc25 100644
 --- a/stress-ng.h
 +++ b/stress-ng.h
-@@ -3750,6 +3750,10 @@ struct shim_statx {
+@@ -3763,6 +3763,10 @@ struct shim_statx {
  	uint64_t __spare2[14];
  };
  
@@ -19,4 +29,4 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
  /* old ustat struct */
  struct shim_ustat {
- 	daddr_t	f_tfree;
+ #if defined(HAVE_DADDR_T)
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.14.bb
similarity index 89%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.14.bb
index c00086c095..f1d91da2b4 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.14.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "0ccf437ca1876a3e8a55986c6481697045203a17f5994cb2f5096cd461d18031"
+SRC_URI[sha256sum] = "b21436fdbd9dc482a3fd95ae27cccf0097d0f226361ea3785215f7a4ad50136b"
 
 DEPENDS = "coreutils-native"
 
-- 
2.27.0

