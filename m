Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31000C6FA82
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.20184.1664133488088202726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MQK7jrBf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id a29so4756337pfk.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=bco9kWPuBI9K6NpE8x+GNkY1CPdnNCg7uM7hoSYBXqM=;
        b=MQK7jrBfkTyq474+Ar5by0HeGAjisBm3RTysohATorw5vKwaBrHhgMIOdltvZT9IVy
         ADuWp5QwozB4+s25quxSTbYsD3q2EdW3R3N9CA1rldn62RVgevUQvL2XmSWBE6P97U12
         hwP9ic/WE9MhqCpJD2dsXimI8spXwrvZDyYgEEOt8RZieGCHlQhzu6MpGUZzYVD6HQBw
         uckv/rKAQbKn21VmQNoWpCqwQOZD3Mmvy9ja6LLBeH4Vqsf9y3NGvexhYg+VdTEm5yUX
         c08CGkcfvUoMkA3+nIBOfjBdGvEnrGJ2UTvZPY/uN1YLAAhcSz5ltm8qGCYL4ypoDtUE
         cHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bco9kWPuBI9K6NpE8x+GNkY1CPdnNCg7uM7hoSYBXqM=;
        b=abqBkhlSoevUHdm1FHm5+k+C/Bt0WXw91pFJG7WWLP+zJWnVgjsMWoRW3dKO4QA8rp
         iMKWEig5qFItobPh/HBPTygTz2yZ9y0Z5ikRsNDchjPR5p1Mc1doQcusSNXL69qBU1vP
         UQ9bYX+xU2J7JWtSJ/7EsMc68yXRmk1eVEzBnlSH0/eErp841DwYd/jEl4NC4yzQc4G9
         2yzsVefOeFCQfN5TRUKkclO6RjwAgxmSj3jsOx32nigSoJx/QSoVXWKCzns3Xdo5Jysz
         H+Nuarf4n8MCCI68kFjCfLeu/WH/LZLyhiwGbru0UoDhYDrhk2zv/c+eF4MOQ0aHAV3x
         aLFA==
X-Gm-Message-State: ACrzQf1Q9Suf3g+0HpxhUdhKpgtG4d4A1pWWXSH67klRg7GjeRHZUHcW
	/ckE5ik6Gt2wQvl7v1XiJZBsIy8UVI3NLjJF
X-Google-Smtp-Source: 
 AMsMyM4vMoF8kWklrWwDSwcM2okIXMmfrLLvMZghBeuSkg3IKWReOH5Kq91gmylMWdFelZRk0ldQ3A==
X-Received: by 2002:a63:18f:0:b0:43c:24d2:c0f7 with SMTP id
 137-20020a63018f000000b0043c24d2c0f7mr14522589pgb.470.1664133487079;
        Sun, 25 Sep 2022 12:18:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/33] expat: upgrade 2.4.8 -> 2.4.9
Date: Sun, 25 Sep 2022 09:17:16 -1000
Message-Id: 
 <88e3b16da11c900b1fab09a46a94581285c01027.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171019

From: Florin Diaconescu <florin.diaconescu009@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


