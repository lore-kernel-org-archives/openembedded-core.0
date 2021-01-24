Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.21025.1611496593265167103
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 05:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l+PkiuWC;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j18so8307525wmi.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 05:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zSRKgvRDwkpzCtpp5X7cyCF7ELb0Yq95o/pqOaobjgU=;
        b=l+PkiuWCNlcpbl2421mmPd6GAXUQ4VQmqV7aCqollQfD4dOPdTm7O2Lyj/eTb71M+J
         6eITAQx7JNUdR7QUlYBE+AwaH9Mb3fM0T7pTpWGMhfejxCoxFkk1lOuKQiGbQJKsA5Qr
         WP+9GmlOoJMorsPjhKEui1tfxYVtoFMyp9aT0tHJlrhj1oQZ3EzTEMrLqdoAszFzZttN
         HOuRqib5rXZ5ieReiJF3exy3r1Nf04VNjrgiSA2JmE8r3NHogROvaKqxEuAA1SjKmzwg
         kqzcmapQwCMvSxx6Muz4bYbg9Y6ZcVaaJsS9dbJA7GJvDZIUJP05BrYn+NC1WaliSuC6
         /gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zSRKgvRDwkpzCtpp5X7cyCF7ELb0Yq95o/pqOaobjgU=;
        b=g3Bu+FgAOoyJQnJUzE5LRUcZT4etvUsBgmB7DC+UbSnT80GZdvvxeLSXvizl5lTZEY
         DVXrjYkp7rXSwZblutUU7exZB1t2R6dynDUl81Y/4m2fh8/6XiA2jciN5zJO9YQlNg6r
         ey+q+rcpi2FIhtSLj1N5X36ejD7lIxM6+aOqfCw2T0fBm+3ED7FAlNPkzLL0okuo8X2b
         aeKloF/5fqTzWT/HNf6dnpG44QoXiaFh2NCl02dNr8Lwda6JrIjEmrPNi66PUD9QA2qp
         Y2exyv2ke8pwopKSrk8evXtKjfCY+D9et6acTmGFgaLC9l2oyQwmBR+zSnh/ixb97x9F
         gdkQ==
X-Gm-Message-State: AOAM5324pB1xrs/Av/v7BBDMIzHWV/fWahatfKCWgmDwFcCajD4BY5uV
	7ZP6vgusj3+T1MKZvG44Wd8ti8h574Y/cg==
X-Google-Smtp-Source: ABdhPJzjq7hjyeOVU9HZjmKxwnaJBiGwN/L56UOhZ2SE1c0/sUC7uQVtgU51FbyDJAiAyarDDcNo+w==
X-Received: by 2002:a1c:e905:: with SMTP id q5mr122970wmc.84.1611496591559;
        Sun, 24 Jan 2021 05:56:31 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.64.211])
        by smtp.gmail.com with ESMTPSA id x11sm17650186wmi.4.2021.01.24.05.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:30 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 1/5] elfutils: split libdebuginfod into its own package
Date: Sun, 24 Jan 2021 14:55:55 +0100
Message-Id: <20210124135559.21894-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

add package options for libdebuginfod

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.182.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index f63208d72b..2666032d24 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
-LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
+LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
@@ -91,7 +91,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-PACKAGES =+ "${PN}-binutils libelf libasm libdw"
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 
 # shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
 # according to NEWS file:
@@ -103,6 +103,7 @@ LICENSE_${PN} = "GPLv3+"
 LICENSE_libelf = "GPLv2 | LGPLv3+"
 LICENSE_libasm = "GPLv2 | LGPLv3+"
 LICENSE_libdw = "GPLv2 | LGPLv3+"
+LICENSE_libdebuginfod = "GPLv2+ | LGPLv3+"
 
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
@@ -115,6 +116,7 @@ FILES_${PN}-binutils = "\
 FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
 FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
 FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
+FILES_libdebuginfod = "${libdir}/libdebuginfod-${PV}.so ${libdir}/libdebuginfod.so.*"
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
 #FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
-- 
2.17.1

