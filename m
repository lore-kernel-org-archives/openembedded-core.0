Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.12811.1614955711942824147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cEtIzNlH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id w34so456384pga.8
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5GqY34jayfRIU3WqwEmi2mawUCWWn/oFxjTucWyAAls=;
        b=cEtIzNlHjrMGLZUHerxHtJ9ziWuQ7YzO7NGjrzyIEcl2aX7rhQIpTWK0et8pn562XZ
         IYKzpmQZxKTLtvOIUUFfT5chdEnzfpWA00V7BJO2LY17OrJuHieUPzO1UiImN/CpOYfG
         KfqLE4UuJikj3GcsN+pPyajJ3QyR5yCJR5KJmGc9FaB/KIMxFoPpD7SMcZ67s3V1OQE1
         ZmoOOSaMbkdYr99dNoE7fkwm+tQx63ALSVVt4mCEIKXwqX0yiJrt3pWbPj7jsURD4EfU
         by+24VTRfaNhMDmqb0J4QtoiRcpKAP5ywfOJhzs3oGKQ51txOo78pyhNOh59YkRCsM5h
         vudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5GqY34jayfRIU3WqwEmi2mawUCWWn/oFxjTucWyAAls=;
        b=sNUuca/VUFvaR5shfz49+eN92o8+PJKyTUkXdfcs7h2UGeP65XYeYssbkp+SkzLEEj
         hEck4o17r9cLe7tZ/HWYc/THlS29mY6GcHPAP2X7ktRbPxZwSmrHRFjDYp5/H+1kyVMd
         v3+YezUbNgZw+VO18+txfuyH6uD5N1k0lB4qkh2fPaWX8prS9tlbXJHePCpd+FX/X3zG
         pBLfszy/Gb2ibLv1H9xiBnyZBCBYYBdAZrPALOmtao5DpJo489/L0Gn/yFve8bkjGTcc
         XTqxJvv5V8eJQO9qiSaThPHuJlvKZ/8w5nukVh/i7nEW40birri7v8b+coFZSJpDZZw4
         l8Rw==
X-Gm-Message-State: AOAM5338PXj9shsKznqy7SqmmQznN3QoyMIb0FU5R0AVVJuLgX4Hqw+e
	7gwHG2en/pczh/Qm75n8ySiACKNc3lw3J8lt
X-Google-Smtp-Source: ABdhPJxjelhi0YU8AKlA3pjY8Zfbm7HCFPo6AgUUV6Oswdb7FNN1MMvStHMhdKhHwdCrW/7CuZj5ng==
X-Received: by 2002:a63:4e09:: with SMTP id c9mr8980344pgb.107.1614955710988;
        Fri, 05 Mar 2021 06:48:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:30 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/27] libpcre: Drop old/stale patch
Date: Fri,  5 Mar 2021 04:46:26 -1000
Message-Id: <06d9fa9aa2935550f7967f84285b97e6c9a2cea1.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

According to my tests this incorrect symbols resolution at runtime no
longer happens. Ubuntu is still carrying the patch but also probably
doesn't need to, they are also on a much older version. It sounds
like there was once a linkage bug somewhere which has likely been
resolved since.

Drop the patch as it doesn't seem needed anymore. If it were a real
issue it should be submitted upstream too, the status is incorrect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02f36ed515afed550dfcd986977ce2106dee556a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcre/fix-pcre-name-collision.patch     | 41 -------------------
 meta/recipes-support/libpcre/libpcre_8.44.bb  |  1 -
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch

diff --git a/meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch b/meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch
deleted file mode 100644
index 89b44f6aa6..0000000000
--- a/meta/recipes-support/libpcre/libpcre/fix-pcre-name-collision.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [debian patch]
-
-This patch address a namespace collision with libc.
-
-Although there is no "#include <regex.h>" in the source file, at
-runtime, it's unintentionally linked to the libc version, the regcomp of
-libc is called instead the pcre one using pcre's data structure...
-that looks like a disaster.
-
-Can patch is from Debian (and Ubuntu 11.04alpha has it also).
-
-[sgw: added patch comment]
-Signed-off-by: Qing He <qing.he@intel.com>
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
---- a/pcreposix.h	2010-05-17 00:17:23.000000000 +0800
-+++ b/pcreposix.h	2009-01-15 04:32:17.000000000 +0800
-@@ -133,14 +130,19 @@
- 
- /* The functions */
- 
--PCREPOSIX_EXP_DECL int regcomp(regex_t *, const char *, int);
--PCREPOSIX_EXP_DECL int regexec(const regex_t *, const char *, size_t,
-+PCREPOSIX_EXP_DECL int pcreposix_regcomp(regex_t *, const char *, int);
-+PCREPOSIX_EXP_DECL int pcreposix_regexec(const regex_t *, const char *, size_t,
-                      regmatch_t *, int);
--PCREPOSIX_EXP_DECL size_t regerror(int, const regex_t *, char *, size_t);
--PCREPOSIX_EXP_DECL void regfree(regex_t *);
-+PCREPOSIX_EXP_DECL size_t pcreposix_regerror(int, const regex_t *, char *, size_t);
-+PCREPOSIX_EXP_DECL void pcreposix_regfree(regex_t *);
- 
- #ifdef __cplusplus
- }   /* extern "C" */
- #endif
- 
-+#define regcomp pcreposix_regcomp
-+#define regexec pcreposix_regexec
-+#define regerror pcreposix_regerror
-+#define regfree pcreposix_regfree
-+
- #endif /* End of pcreposix.h */
diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
index e5471e81da..cd80dc7345 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -8,7 +8,6 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
-           file://fix-pcre-name-collision.patch \
            file://run-ptest \
            file://Makefile \
            "
-- 
2.25.1

