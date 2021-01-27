Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.8147.1611757651876127023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uBy3Y+uB;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: dorindabassey@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id g3so2921226ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0XwrEBA1lFcP2WD5zCsbwNtu+NmLikDcgOHlbSqLhas=;
        b=uBy3Y+uB2ahr0R9GI3wQUTgn7GegYTu83YYCnvv3O5KRhpZOmHssfR1AzL4OsBVKH+
         4stjdplfQ2i4RmGNINkQDqX2HMB3Xr2P3F6FD2X5sTrAeLiu7ckDic/iF4HIYrRCchus
         6rHRsMvzwV9QxWTS/iNNCfa08zqz5gErmD1eVs+94QdWdhlF7ZmA8gawopAIYCfPj6z/
         +rLiiH1YatX06cPJNuUO8L3qRELbWVLkusTY96Pjmj0LtfVZQrzN7dY8SPfDC7bKthiI
         dZKL1eiMaw2alftb7GxOgZFPkd1giZad/JqHWWszhSuWZ/2abNdXubhJQrVLWd9B5dds
         Wtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0XwrEBA1lFcP2WD5zCsbwNtu+NmLikDcgOHlbSqLhas=;
        b=LD5bgudX5ABy6kE0Btqal4Eotuhv44ETQGFdo6W6oPodMxr21X0+FkCkh33/yHc6UB
         i0teLDCQXUro/P3fnVwt4jQyby84CTq5KQIVIiRYVk2UXfgrMBB8T7eq6UYHnneEZP10
         aU/08qZLBU+8H79OZG0R2hCkj9ExSUMeZuuVFu7jW4Es8tLQPXQMseWwMnNxIuVdLvEY
         FnbyV3+ywMp1axRTxjTBV6Ckt5iBBoZGuVgHqTQslUJb2KAIPFvhTYpoFRBwnoPUxUqW
         GC2uJTYgKbezfXfowICVlEOLUISeBs41K27ZmCJBNZU/2E8XgXeod4yTa+2Bkvvbpp1U
         zMEw==
X-Gm-Message-State: AOAM531kWufRJL1uGRmr3Ov9PDATdkXToYniR/yE7ee7k3jp+IkbPtFE
	xV8WxsgSWDYPdG/UlMq+6rmRtWm2LkdV+g==
X-Google-Smtp-Source: ABdhPJwRkxtLn0n0DiLg2k9kt2OIhe1FpJYdvtZobTAU7+h/K4f9N3i9olcQAsWSohZuC5WK664iTQ==
X-Received: by 2002:a17:906:660b:: with SMTP id b11mr7705323ejp.458.1611757650025;
        Wed, 27 Jan 2021 06:27:30 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.37.32])
        by smtp.gmail.com with ESMTPSA id m5sm905365eja.11.2021.01.27.06.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:27:29 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v5] elfutils: split libdebuginfod into its own package
Date: Wed, 27 Jan 2021 15:27:10 +0100
Message-Id: <20210127142710.17763-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added package options for libdebuginfod.
Added GPLv2+ | LGPLv3+ license for libdebuginfod with reference to https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=de26af5bb26e187b51d9ea00d5826e199a96d01a;hb=HEAD

[YOCTO #13807]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v5:
-edited LIC_FILES_CHKSUM for debuginfod-client.c

 meta/recipes-devtools/elfutils/elfutils_0.182.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index f63208d72b..43df79b04f 100644
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
+                    file://debuginfod/debuginfod-client.c;endline=27;md5=f8e9d171c401c493ec45a0b2992ea2ed \
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

