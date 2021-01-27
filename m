Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.974.1611706268008396201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 16:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mxumuHz0;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id u14so67107wml.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 16:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Nmrs7enxDr6X7zieEfrrhcPNI931G2oaqCgX/yV6zl8=;
        b=mxumuHz0MpFZ7YS+aqU0AjHZEHMsYE3y7rotYdAalM/tjuC/EYF5eIuxrVIk0QuBAw
         rhNLwhlRprANTMhKprpCWXf1zAM+lV23utuPV4Y9lzzIxh+oyLDYwjnMsAkOwMf9U0Ta
         u0tniMIjZhLSGuJjiJ5t6LjFN2LzEinbhXAfLZte5jnAo0m6wGH7ZEi0pouzplY3esOl
         GNRdEtjPC9FQNZUvlbsY68yGIHyEWm+oqHLaSyfvzIQZrrpFkYhxPefg+73qMQ7V9W9f
         LOf7VOahu8MOa7i+rZXIUty5ZMWkfTL0iuXn+f8DGGJkkpX7oHu0eoCdXqpbID28Tqck
         Ny4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Nmrs7enxDr6X7zieEfrrhcPNI931G2oaqCgX/yV6zl8=;
        b=TDTu+0CHkATLpiox3Xsvv7hpI1kD5Yyg2pIhpK9LGPbmzQ/0pb4wKKFrWzPqLsCa3p
         +k0GVTJAM7mPvDLuH6UAEm32CSN8SBTMe7GofgYXhJTCoB495n8SMKvlAa9IejuNX5UB
         hYBga1diBdLBANnrnguREyqOeBv/4WKhlEb+IpRIpxpS8Lo8Th7kxoBcCrFacZ2tD+6x
         vk9/0GWLTAGBS1fJ7SlJx4QsEaR+AWnFni5P9CtYC6brrSYGGZcIq81QuYTPiAQmPlfo
         tZDKEFniLI0acZgmgA5XMRyX/4epASNbrrg4Ssrfbo5VcGyP5iPUNHX0G9gKVdRlm10o
         p3NA==
X-Gm-Message-State: AOAM532DvPY2qdniBEZRRPo55GJQzsP9Y4ySyueEMG6CKxnWEIiJGP5R
	hn9YRh6noa9Uz7QgPF21Xnm1qFVgFmdHPQ==
X-Google-Smtp-Source: ABdhPJwzTuNA5JyyVO+GlxDLq+VUa9Scx+N6bbldeoP/6EAs8wkea7duvaloDVMFAVe6YKM44avhzQ==
X-Received: by 2002:a1c:3286:: with SMTP id y128mr1727115wmy.104.1611706266262;
        Tue, 26 Jan 2021 16:11:06 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.33.220])
        by smtp.gmail.com with ESMTPSA id b13sm509208wrt.31.2021.01.26.16.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:11:05 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v3 1/3] elfutils: split libdebuginfod into its own package
Date: Wed, 27 Jan 2021 01:10:43 +0100
Message-Id: <20210127001045.6686-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added package options for libdebuginfod.
Added GPLv2+ | LGPLv3+ license for libdebuginfod with reference to https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=de26af5bb26e187b51d9ea00d5826e199a96d01a;hb=HEAD

[YOCTO #13807]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v3:
added YOCTO bug tag
added LICENSE header
changed upstream status
edited typo error of recipe version from 0.181 to 0.182

 meta/recipes-devtools/elfutils/elfutils_0.182.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index f63208d72b..823f0cab98 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -1,8 +1,10 @@
 SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
-LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://${WORKDIR}/elfutils-0.182/debuginfod/debuginfod-client.c;beginline=4;endline=29;md5=f758740623cdf457eb76957eb50f0422 \
+                    "
 DEPENDS = "zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
 # The Debian patches below are from:
@@ -91,7 +93,7 @@ EXTRA_OEMAKE_class-nativesdk = ""
 BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
-PACKAGES =+ "${PN}-binutils libelf libasm libdw"
+PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 
 # shared libraries are licensed GPLv2 or GPLv3+, binaries GPLv3+
 # according to NEWS file:
@@ -103,6 +105,7 @@ LICENSE_${PN} = "GPLv3+"
 LICENSE_libelf = "GPLv2 | LGPLv3+"
 LICENSE_libasm = "GPLv2 | LGPLv3+"
 LICENSE_libdw = "GPLv2 | LGPLv3+"
+LICENSE_libdebuginfod = "GPLv2+ | LGPLv3+"
 
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
@@ -115,6 +118,7 @@ FILES_${PN}-binutils = "\
 FILES_libelf = "${libdir}/libelf-${PV}.so ${libdir}/libelf.so.*"
 FILES_libasm = "${libdir}/libasm-${PV}.so ${libdir}/libasm.so.*"
 FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils/lib*"
+FILES_libdebuginfod = "${libdir}/libdebuginfod-${PV}.so ${libdir}/libdebuginfod.so.*"
 # Some packages have the version preceeding the .so instead properly
 # versioned .so.<version>, so we need to reorder and repackage.
 #FILES_${PN} += "${libdir}/*-${PV}.so ${base_libdir}/*-${PV}.so"
-- 
2.17.1

