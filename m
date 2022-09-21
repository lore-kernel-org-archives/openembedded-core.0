Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BE2C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 08:26:20 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.4080.1663748778841051050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 01:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CMiMw7jo;
 spf=pass (domain: gmail.com, ip: 209.85.219.47,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id mi14so3819710qvb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 01:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=sdhvoyIqNn9REW3urXe6RFKnCyVxwCz36dvVhmQJvw4=;
        b=CMiMw7joNOoZKDSkbT6CoBg8fLYUPIgrjEdrMph4IgTTk2iIBQEAafXw68lElpFUBn
         RyFAyOjqJgqsproW/Hv6081lMtHEPkH04FWcVfndeYFJ+df+YvXgNTN+0tw5fQv9rn+Y
         GTQZr6OIBIALePmkh/UwKEiTxljfTjERT77EC2OFNdL4ke7BjcGvXZywHY+B1tRXmDX8
         p+I23mKfsIciSO678LlVAG2t2pdh28VRO+ipjaQ+IG/utMaCSI0OGzMq8j/tJj/UQl+i
         y5qN49XpGALUkZm4hXaoZ06ksWGGwGCsV2lvZm+znCUqP9Evdahom2Flu+mIgRgeP1hl
         AYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=sdhvoyIqNn9REW3urXe6RFKnCyVxwCz36dvVhmQJvw4=;
        b=Kl7x+9yx6KtO1StIC79ceI6n4ayot52owSvB0i5o8VsfkPINmvR92qLJGpzBO5hWC/
         dkwHKhWVjyriaH9cKfxEbd5EZzFeGCc+6DZtFrxR8xg/WJ8ciJBUc4hMiwyB7lR2txh1
         SLfQS7oLxnybVEgW0FR+4apVihRPoYwCuHUTDnolhv66drRpA3rYTsO7A/3LxJhN0ZGB
         K3tzVS1Op/pG/7iMekCstZSxj0sNRa9mILldSA8VmekSVTawy/2Dp90AWNcGM6ulLLku
         +1ckwk47f7oO3Je8hug2ZcAFKXvPn6nGz2YWfopxa4V7o5+DSRZmXBUTgQWTk45pQTS5
         p0aA==
X-Gm-Message-State: ACrzQf2B9R73PLedOJNca4w/QAULVcmXK+ZaxDXGZuLk82TaktGneUXY
	PWtjA4bDtszQ5SmGjpqzK+X5HrtnjwId/A==
X-Google-Smtp-Source: 
 AMsMyM7/u9r1zdtTaEB3hEjVJUA8NLwD/F/n9p2+2S81ovaRPajRncEwwHC8kibdDgFkVan7FimvKA==
X-Received: by 2002:a05:6214:300a:b0:4ad:61d6:5c15 with SMTP id
 ke10-20020a056214300a00b004ad61d65c15mr4449778qvb.125.1663748777559;
        Wed, 21 Sep 2022 01:26:17 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([84.232.223.213])
        by smtp.gmail.com with ESMTPSA id
 bt13-20020ac8690d000000b0031eebfcb369sm1238322qtb.97.2022.09.21.01.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:26:17 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] expat: upgrade 2.4.8 -> 2.4.9
Date: Wed, 21 Sep 2022 11:25:12 +0300
Message-Id: <20220921082511.486-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 08:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170940

Changelog:
=========
        Security fixes:
       #629 #640  CVE-2022-40674 -- Heap use-after-free vulnerability in
                    function doContent. Expected impact is denial of service
                    or potentially arbitrary code execution.

        Bug fixes:
            #634  MinGW: Fix mis-compilation for -D__USE_MINGW_ANSI_STDIO=0
            #614  docs: Fix documentation on effect of switch XML_DTD on
                    symbol visibility in doc/reference.html

        Other changes:
            #638  MinGW: Make fix-xmltest-log.sh drop more Wine bug output
       #596 #625  Autotools: Sync CMake templates with CMake 3.22
            #608  CMake: Migrate from use of CMAKE_*_POSTFIX to
                    dedicated variables EXPAT_*_POSTFIX to stop affecting
                    other projects
       #597 #599  Windows|CMake: Add missing -DXML_STATIC to test runners
                    and fuzzers
       #512 #621  Windows|CMake: Render .def file from a template to fix
                    linking with -DEXPAT_DTD=OFF and/or -DEXPAT_ATTR_INFO=ON
       #611 #621  MinGW|CMake: Apply MSVC .def file when linking
       #622 #624  MinGW|CMake: Sync library name with GNU Autotools,
                    i.e. produce libexpat-1.dll rather than libexpat.dll
                    by default.  Filename libexpat.dll.a is unaffected.
            #632  MinGW|CMake: Set missing variable CMAKE_RC_COMPILER in
                    toolchain file "cmake/mingw-toolchain.cmake" to avoid
                    error "windres: Command not found" on e.g. Ubuntu 20.04
       #597 #627  CMake: Unify inconsistent use of set() and option() in
                    context of public build time options to take need for
                    set(.. FORCE) in projects using Expat by means of
                    add_subdirectory(..) off Expat's users' shoulders
       #626 #641  Stop exporting API symbols when building a static library
            #644  Resolve use of deprecated "fgrep" by "grep -F"
            #620  CMake: Make documentation on variables a bit more consistent
            #636  CMake: Drop leading whitespace from a #cmakedefine line in
                    file expat_config.h.cmake
            #594  xmlwf: Fix harmless variable mix-up in function nsattcmp
  #592 #593 #610  Address Cppcheck warnings
            #643  Address Clang 15 compiler warnings
       #642 #644  Version info bumped from 9:8:8 to 9:9:8;
                    see https://verbump.de/ for what these numbers do

        Infrastructure:
       #597 #598  CI: Windows: Start covering MSVC 2022
            #619  CI: macOS: Migrate off deprecated macOS 10.15
            #632  CI: Linux: Make migration off deprecated Ubuntu 18.04 work
            #643  CI: Upgrade Clang from 14 to 15
            #637  apply-clang-format.sh: Add support for BSD find
            #633  coverage.sh: Exclude MinGW headers
            #635  coverage.sh: Fix name collision for -funsigned-char

        Special thanks to:
            David Faure
            Felix Wilhelm
            Frank Bergmann
            Rhodri James
            Rosen Penev
            Thijs Schreijer
            Vincent Torri
                 and
            Google Project Zero

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 meta/recipes-core/expat/{expat_2.4.8.bb => expat_2.4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/expat/{expat_2.4.8.bb => expat_2.4.9.bb} (84%)

diff --git a/meta/recipes-core/expat/expat_2.4.8.bb b/meta/recipes-core/expat/expat_2.4.9.bb
similarity index 84%
rename from meta/recipes-core/expat/expat_2.4.8.bb
rename to meta/recipes-core/expat/expat_2.4.9.bb
index 980c488640..cb007708c7 100644
--- a/meta/recipes-core/expat/expat_2.4.8.bb
+++ b/meta/recipes-core/expat/expat_2.4.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/libexpat/libexpat"
 SECTION = "libs"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7b3b078238d0901d3b339289117cb7fb"
 
 VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "a247a7f6bbb21cf2ca81ea4cbb916bfb9717ca523631675f99b3d4a5678dcd16"
+SRC_URI[sha256sum] = "7f44d1469b110773a94b0d5abeeeffaef79f8bd6406b07e52394bcf48126437a"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


