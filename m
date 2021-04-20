Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.9606.1618920365107603753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 05:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GOxavPrE;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id g5so51186485ejx.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 05:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2OFuAqQQlAwtl9z75BzqIOmpjLci9XsomXm4/k2SOag=;
        b=GOxavPrE57Q28ozs5PljLcrqQt+mC1JUDXvQocXDUtnIrb4uTirDqEXCYVzjmb1OqL
         jopL4DRaHCPqMlrBk5+bHCmQxj+JqQM9af8CryJwMs4KYgc+w+q1+7PyS+MZd0DIMa1k
         76vSrCobgtk4uBJTBueaaUT1OzD+3ggAFPb9RDH09axOMp6NC+ZJTosPCccOQC1VHHp/
         X+vaxCUSALtfHP5+t5FPVKmZZ9tz2LVj5Y1WC8x5FYCtoxHf2oPDgLwT2EoLhPIh+MfA
         biyV2+6RaFksoNALzTqJpCtcUpXrwkSZjgYziz0tc///AkU+6WcEXSRomf0apoEdyr4p
         kaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2OFuAqQQlAwtl9z75BzqIOmpjLci9XsomXm4/k2SOag=;
        b=cymCMaL5s2MwK7hBa8GwDdNr1ZTl2B9RzqfYWeeGJoqQ5zZ9FITd8WWpI3jUhIGLV7
         8fYOr4eQPr75I6FA94yU5i1DHaoVFxFDTJj0bbokuIOXiiVzsHh96k+aCNVAVLtE1NHr
         PewnBzIZjY3+codgBdRsVWzpbrx/6awNuRsJQEE/8R866m9V7w/VPAS1o9CRAB07NGfJ
         i3Irg0Sgov8GXMK25hHNcJTPB4b7iFeqPKq8HKhEujHY6lHeuj2VXBG7PiF2wbWhecIE
         LHhT32i8VM9F6lkCyCaqjnuJ3pkaJ/Ymg2gCMxI5AwnwXZCrPtyLjUdPua0KX91Npo2I
         YXUg==
X-Gm-Message-State: AOAM5332Uogl1T6i73YGF0JngIRHh78nuw0fpwxM7mYVSAXyYjLHZlB+
	dSwhM4gKoopzsi/TK79jLTmpkm0raSHaWw==
X-Google-Smtp-Source: ABdhPJxGjtgPduOWUWEJryg42KWg0L7XNdO3040jMfO2yB7jfV62//vOEXAxmcUeIQ8QwvAmQ2ebPQ==
X-Received: by 2002:a17:906:fb19:: with SMTP id lz25mr26506426ejb.544.1618920363780;
        Tue, 20 Apr 2021 05:06:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n12sm9316216edw.95.2021.04.20.05.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 05:06:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] elfutils: adjust ptests for correct debuginfod testing
Date: Tue, 20 Apr 2021 14:05:49 +0200
Message-Id: <20210420120549.608450-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420120549.608450-1-alex.kanavin@gmail.com>
References: <20210420120549.608450-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.183.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
index a4ea8da32e..dfc3a3fa5b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.183.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[libdebuginfod] = "--enable-libdebuginfod,--disable-libdebuginfod,curl"
 PACKAGECONFIG[debuginfod] = "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
 
-RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
+RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils iproute2-ss bsdtar"
 
 EXTRA_OECONF_append_class-target = " --disable-tests-rpath"
 
@@ -89,6 +89,7 @@ do_install_ptest() {
 		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
 		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
 		cp -r ${B}/backends                     ${D}${PTEST_PATH}
+		cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
 		sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
 		find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
 	fi
@@ -145,6 +146,7 @@ INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/tests/backtrace-data \
     ${PKGD}${PTEST_PATH}/tests/backtrace-dwarf \
     ${PKGD}${PTEST_PATH}/tests/deleted \
+    ${PKGD}${PTEST_PATH}/tests/dwfllines \
     ${PKGD}${PTEST_PATH}/src/strip \
     ${PKGD}${PTEST_PATH}/src/addr2line \
     ${PKGD}${PTEST_PATH}/src/elfcmp \
@@ -162,4 +164,4 @@ INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/backends/libebl_x86_64.so \
 "
 
-PRIVATE_LIBS_${PN}-ptest = "libdw.so.1 libelf.so.1 libasm.so.1"
+PRIVATE_LIBS_${PN}-ptest = "libdw.so.1 libelf.so.1 libasm.so.1 libdebuginfod.so.1"
-- 
2.30.2

