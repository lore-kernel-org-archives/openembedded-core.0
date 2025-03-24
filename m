Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B666BC36010
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.44213.1742834025421368881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SSZ0roHF;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227914acd20so42906995ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834025; x=1743438825; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDxg1Vted7upm9MHaALWX3XE0s8qqEIP/QEHG7I/BxI=;
        b=SSZ0roHFwOTIoNMPWjw6yl5DvjWHM7dD25F3rwG5b9DRSVC3fRTv7oCmh6IzRR3bRK
         EcuF0LS1R4M6k0CTbMm8K/Lf/XjMUtX401J+4C/E0vDizfUSuCbP4DgyvE0ttnWp/Jk4
         B1UlKGiqeEo4+xR59okvE+RiW3u/7GuUPnnUfqmKpR4/qxjeuR25ESRxkx9v2l3oRAB9
         crD4sjg/y+wpcxzrWxtQJSnWTpke+hNaT3BplOqCWR6Puwgf7VIuJLjnsR1dSRspkJXf
         OnpzfjQ4V018M8YraU9V7NH38ZVmRHRjA3cd4tAqvwSXIK3rz+Mm0ny6dP8gaotWosUj
         q3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834025; x=1743438825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDxg1Vted7upm9MHaALWX3XE0s8qqEIP/QEHG7I/BxI=;
        b=DYSE1ZmvwZfSn9dz8nRHB26TxLKNa61VgbjW78tXhKReqg2OGDBLPXzFGmbmxjGuM2
         BfmL0/qLhxdw4lUCW1sWPu1llQbp/wtKxvYxnm8XMMEucchGD4Si4xoFc4FfL1WCGHIr
         bz7OC8LdaaaU1bg5FOlL9a6G+GtPksuDubI3P4eCbMUgAo8FvgooMzHJFxsbme1L9Jsy
         63MEH4vXVizM81VdabMV2M5XpTsrgh020gz4HQ3KoiTe/g/7vhkhcwiKgxtp8wJWTJ3E
         NbH53y7AddJV/tpWYLfeNRqr1sjqupK5XqHRUYLwVZIipmYB5RdRwrQJWzIiU4uoi9/c
         c7/w==
X-Gm-Message-State: AOJu0YwB+/22RTlkq0Nl3b9LEtUTOonqof52terWhhrrs3piOdW2jsTB
	Xw7sQ+koGQSR6sNDgUnSU+qY8fAPxR+Uv5H5mY52h7SjCPBfNSA8wuWBJq9z
X-Gm-Gg: ASbGnctLbzq4G6lxp/I8xcLOVqY3T2ije/awW/cRTJxZCaUa/f17QMj2ubjseHGH9Jn
	JEscQWb/Fdx30ROkqLdQI07ZitIea1Z+mfrfdj9p8OSRpazZguFxQWvA5xwxYJ/pYHTYTqbrtw4
	fAd17mU6iIwyWQhMdVPWS+cVd4gyT2qfGPmb14K3Ho1GOvGK60v2HV8e3IZha3X98Mh0DFjyFmT
	ps6jLQJ/t+rD4rOiVt3AD635WGS0YDIZK2OnZE86qllaFJ/059yHK64My1EJ6BRrUGlRe5okqjr
	p/vF7pMGhHZNB674p96ljrcou2mOHiHOtK8A
X-Google-Smtp-Source: AGHT+IHwrJ7BqqqcfarxcUFX42Njd1XQG2CB82GUnFWX7ssNAsR3x+4tBVGZyS+Ml/FKCewKg4cDSg==
X-Received: by 2002:a05:6a20:918d:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-1fd0904d946mr27096936637.10.1742834024571;
        Mon, 24 Mar 2025 09:33:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:25 -0700
Subject: [PATCH 04/21] make: Fix signatures for getenv() and getopt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-4-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213536

Fixes build with GCC 15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-signatures-for-getenv-getopt.patch    | 60 ++++++++++++++++++++++
 meta/recipes-devtools/make/make_4.4.1.bb           |  1 +
 2 files changed, 61 insertions(+)

diff --git a/meta/recipes-devtools/make/make/0001-Fix-signatures-for-getenv-getopt.patch b/meta/recipes-devtools/make/make/0001-Fix-signatures-for-getenv-getopt.patch
new file mode 100644
index 0000000000000000000000000000000000000000..707de7f2d0786762be3c5b82b9c5341de30c3c75
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0001-Fix-signatures-for-getenv-getopt.patch
@@ -0,0 +1,60 @@
+From f844b6588dbdb93d9ff0fe883bd801df62c965b7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 14:07:56 -0700
+Subject: [PATCH] Fix signatures for getenv/getopt
+
+GCC-15 complains about missing parameters, this gets found
+out when using non-glibc ( e.g. musl ) C library
+
+Fixes
+lib/fnmatch.c:124:14: error: conflicting types for 'getenv'; have 'char *(void)'
+|   124 | extern char *getenv ();
+|       |              ^~~~~~
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-make/2025-03/msg00032.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/fnmatch.c | 2 +-
+ src/getopt.c  | 2 +-
+ src/getopt.h  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/fnmatch.c b/lib/fnmatch.c
+index 01da376..cb1c856 100644
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@ USA.  */
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ # endif
+ 
+ # ifndef errno
+diff --git a/src/getopt.c b/src/getopt.c
+index 7a792de..76251cc 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ static char *
+diff --git a/src/getopt.h b/src/getopt.h
+index df18cee..d8bb226 100644
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -102,7 +102,7 @@ struct option
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int,  char * const*, const char *);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
diff --git a/meta/recipes-devtools/make/make_4.4.1.bb b/meta/recipes-devtools/make/make_4.4.1.bb
index c73751ddcbad5f5adeff6b35fab1464cbb64f45b..0879b3baa927a6ed11ae7faa9d99cc279a783ee4 100644
--- a/meta/recipes-devtools/make/make_4.4.1.bb
+++ b/meta/recipes-devtools/make/make_4.4.1.bb
@@ -4,6 +4,7 @@ require make.inc
 
 SRC_URI += " \
            file://0001-m4-getloadavg.m4-restrict-AIX-specific-test-on-AIX.patch \
+           file://0001-Fix-signatures-for-getenv-getopt.patch \
            "
 
 EXTRA_OECONF += "--without-guile"

-- 
2.49.0


