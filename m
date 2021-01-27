Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7414.1611754056038825849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 05:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WmAECw0g;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id i9so1662964wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 05:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KhVo+OpsvIyNWo/I2Oe5TZc5nzIC93uxnfblZLrJQX4=;
        b=WmAECw0gpPiAWK73b4gd4DD60+KBPLS1raZuGJM3tLVptzctFr6i1e+p2kI3v9dZzK
         J1Rl4md19PfXHmqAaTLrFMKoXJ4ey6bBCnNdsJV+c46WcxwAGJ575p2C/LoB7doMDRUo
         1Bk8fndUbfLctmQ9T0VQKanh1sEdJ0rlgaqL0j9O59bq91n2XftrFG3Q4Gw+dqBWTOAf
         ej5BAABMJ3dPlelAWiknEvDUjG8AtcVTZ493u7IN9RDDOGjhUhL9xSZn6Wec4s1+i9AG
         ZSgXQOr4GXqWfz6yeukRtnUxCr0Gg8W8uB/wBzHLCPJXpNoCNTWBd3ubHJiwOyRyQ1dI
         5N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KhVo+OpsvIyNWo/I2Oe5TZc5nzIC93uxnfblZLrJQX4=;
        b=QI9j2L1OAMvClmckp1ON3kMLKwV9Re0/rn6J6dTuE515OdAq8mvZd6AWNmLvaBNzZ+
         ypoKjfixouGJ/4KZa5ae5s1/h28h0J5tt8l3gCZGjm1Ekn2Z1I6STE19CGdXL6b7CQ+l
         F7gdXsNQ/ZeshPBmD3/19xy4ffubj//5Y9EbCpfDhvxFybY8KFgwUL2TNZVofMC+3Lt0
         ZJmMM5Otv3vykyEGRMfnVHPJSGjmr+Rj4rt3iK+Ifw/87wG2WPTuVqblj2Qnw0T6l65q
         P7culaRacCBiqGp8BP92Z5SKXDQdJgDsAxbDVbmmmuEybBqO0Q+TRDnhqhTvagA7xeQS
         eX5w==
X-Gm-Message-State: AOAM531smSFrQNo5SvWXaAx+5/mchvao4vsvVXmAbg9IV44h4PYmJHlo
	kYNrc28xl5v3O+yP63wk2scveuZmJVEX+Q==
X-Google-Smtp-Source: ABdhPJwVNFzw0c+bfMHtHS3kKHREWGTuJvnKlGnKTkp67+5xVuhzsacs/N1aoxoJWpU8/6sUhkAP/A==
X-Received: by 2002:a1c:1b44:: with SMTP id b65mr4236735wmb.188.1611754053627;
        Wed, 27 Jan 2021 05:27:33 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.37.32])
        by smtp.gmail.com with ESMTPSA id w23sm2538344wmi.13.2021.01.27.05.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:27:31 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v4] elfutils: split libdebuginfod into its own package
Date: Wed, 27 Jan 2021 14:27:12 +0100
Message-Id: <20210127132712.24952-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added package options for libdebuginfod.
Added GPLv2+ | LGPLv3+ license for libdebuginfod with reference to https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=de26af5bb26e187b51d9ea00d5826e199a96d01a;hb=HEAD

[YOCTO #13807]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v4:
-changed LIC_FILES_CHKSUM for debuginfod-client.c

 meta/recipes-devtools/elfutils/elfutils_0.182.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index f63208d72b..0b4c30b936 100644
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
+                    file://debuginfod/debuginfod-client.c;md5=0cf97982735b2ea53f5d7fcd7d88dafe \
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

