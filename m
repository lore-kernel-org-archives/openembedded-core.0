Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2F0C3600D
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:43 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.44208.1742834021800061992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoBYsjea;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2254e0b4b79so77678315ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834021; x=1743438821; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxC0Y2EoqS6QtSVsvLaxlbk60578KcLJiJN8qtA93Dw=;
        b=FoBYsjeauSVYzMsFLChPkVBN6gC1GalCqWSWrzbjlh06dCV2kxAP7UBkjfo+zzDe2f
         HINjQClvIflAOYprIsPXaiR7IydmHRj+9qx5yKuX91ZMbfnTRqJBGp1rPXaqNC9psA1A
         kEsdz2rxAIbVtHqwYl+8y4SjRSoayTOuTDs15YDaQ/TjrjSHLUYYwcPlJpIyBupipzjI
         q9cqjGfihYuqgqAgt4UoZFJ/s8Kuuaqd+nzFKpn+fbvRX/kgP0l/uFtX+SgciG0BiU4C
         vYA99+HMuqk7XENu+vBeX9aIhodUrIVOs6dQhI33IJX2f/+RFw5cOBDQai1r5tSoCbEQ
         +cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834021; x=1743438821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxC0Y2EoqS6QtSVsvLaxlbk60578KcLJiJN8qtA93Dw=;
        b=IKt9civ6QiPosDfgW3D9atYqf6qKPdOsxtPSJPhL8B8KY0WXTm9c+v6+/8/m+JMq51
         bQYnmqHwx0VLBy+RICya4HxgIiTsyFUj8Cye/8/PfWM7I6xT8OwVcjL85iVfcsmv2ChG
         eTfxc5D8X0sFLqV5CP+zgazZr1/2jpv+zLBpzJlQHWG0fHujMhfnlHmReCTmVYwF/CWy
         ff3vMN4yS2hidcmuvSNJmqnt8y8Tt3UxyjGeFJrf1H6sgW869QHcQfWfv5N2DIbXNeDC
         B7vY8pRVhJBRhbQjniUu3ky/ysKmVqXyuyGTRBnOuTLFrldkNm5WvoTua6ZUHaXfy+/M
         NL4Q==
X-Gm-Message-State: AOJu0YzIo13SP1F2bphkWO0C/Q1fRnxsKEkTI+jDhdngQbw5113+MMyP
	ajyl4Ox3VHW9/sLSkZdBM/kFSKt3a3GngJ4C9nPfyF5BmfiJiUD0IVryT79j
X-Gm-Gg: ASbGncs1Gik7i+JRVV8z+iIkIYSWZGd+WU6ncwcdh42dL0XCBI06S2NH6ZAKAUdjjly
	uo35ewBCauKLw9sTeYWBTI7AYuzgkTnLpJ3nYGItDFVQa+3bb0815YgEISM34rPlEgYsO6XI0Nl
	JA5hZOnkT599cbE2Je+rn3aBissJySZpmdXN4jb8ZptHwRU8H68OVSYsNTZ4ciOqODV+o+JcG4F
	EZHyLuaeUfZxCP5X0QWCM2ub737jSLvbF2+Iqj3j+URTFRwcA3f7yJaN5kaE++U920O79l94EsJ
	syfCfZQpZ90yTBUhfXOxTKZZr9Ojc/fVT1s4
X-Google-Smtp-Source: AGHT+IE8QX/oWVfcsJMzq4mVz8krVxmrkGVFGyyEHvz70wclbqUOsUOeyWFNVgLpXeS2Q+BJ6WBG/A==
X-Received: by 2002:a05:6a00:1885:b0:736:520a:58f9 with SMTP id d2e1a72fcca58-73905a140a5mr16470784b3a.17.1742834020916;
        Mon, 24 Mar 2025 09:33:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:22 -0700
Subject: [PATCH 01/21] unifdef: Don't use C23 constexpr keyword
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-1-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213533

Fixes build with GCC-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Don-t-use-C23-constexpr-keyword.patch     | 57 ++++++++++++++++++++++
 meta/recipes-devtools/unifdef/unifdef_2.12.bb      |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch b/meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch
new file mode 100644
index 0000000000000000000000000000000000000000..9d0218393059be8674f67232757fe59c2ebd0082
--- /dev/null
+++ b/meta/recipes-devtools/unifdef/unifdef/0001-Don-t-use-C23-constexpr-keyword.patch
@@ -0,0 +1,57 @@
+From ca1ac9c8bde84dbdea972299b1a6e30e78c2d785 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 17 Nov 2024 01:26:27 +0000
+Subject: [PATCH] Don't use C23 constexpr keyword
+
+This fixes building with upcoming GCC 15 which defaults to -std=gnu23.
+
+Upstream-Status: Submitted [https://github.com/fanf2/unifdef/pull/19]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unifdef.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/unifdef.c b/unifdef.c
+index dc145a2..4bd3bda 100644
+--- a/unifdef.c
++++ b/unifdef.c
+@@ -202,7 +202,7 @@ static int              depth;			/* current #if nesting */
+ static int              delcount;		/* count of deleted lines */
+ static unsigned         blankcount;		/* count of blank lines */
+ static unsigned         blankmax;		/* maximum recent blankcount */
+-static bool             constexpr;		/* constant #if expression */
++static bool             is_constexpr;		/* constant #if expression */
+ static bool             zerosyms;		/* to format symdepth output */
+ static bool             firstsym;		/* ditto */
+ 
+@@ -1086,7 +1086,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			*valp = (value[sym] != NULL);
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else if (!endsym(*cp)) {
+ 		debug("eval%d symbol", prec(ops));
+ 		sym = findsym(&cp);
+@@ -1103,7 +1103,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 			cp = skipargs(cp);
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else {
+ 		debug("eval%d bad expr", prec(ops));
+ 		return (LT_ERROR);
+@@ -1170,10 +1170,10 @@ ifeval(const char **cpp)
+ 	long val = 0;
+ 
+ 	debug("eval %s", *cpp);
+-	constexpr = killconsts ? false : true;
++	is_constexpr = killconsts ? false : true;
+ 	ret = eval_table(eval_ops, &val, cpp);
+ 	debug("eval = %d", val);
+-	return (constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
++	return (is_constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
+ }
+ 
+ /*
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index 3e08b3a0a45174746c7664ca7b691bf8717100d7..bf0f3e1b17b8b6fe8b265e07c33dcc3faff57709 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
                     file://unifdef.c;endline=32;md5=6f4ee8085d6e6ab0f7cb4390e1a9c497 \
                     "
 
-SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://dotat.at/prog/${BPN}/${BP}.tar.xz \
+           file://0001-Don-t-use-C23-constexpr-keyword.patch"
 SRC_URI[md5sum] = "ae8c0b3b4c43c1f6bc5f32412a820818"
 SRC_URI[sha256sum] = "43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400"
 

-- 
2.49.0


