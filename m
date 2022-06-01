Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD87C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 10:53:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.5968.1654080804111698858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ol6ZOJ9/;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so1717784pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=ql7iGGOAi2FMyBQ3JK6ijZHfkJdjF3iLsnxqEu//quY=;
        b=Ol6ZOJ9/346r3AQFSpnxVZq3aejT1AaGy4vFWGO7famjhxjAumzYATm7OtVCw7Pblw
         6cRtVNggycvi83GuSdvh2G7AUKDf9jXGAbhHIZ54hGDSnMETcQePf/+0yW9rY+8A4DLD
         K5IK8h/KOAMaOyAGsBPEogG9P2q0PIr2O++ZbFUk+bMrACtuFwCa5+0qtw8n/jIRsCRH
         /565bCICHDpDepe6iCUFD9gwzsIz9rgqWByJVTrZvVmXHe5Pu0PzjzZYX/H0AsK7K8K5
         9eUUWHI84LpThgABHb2/q+Gqo4YeGL1gF2fDFhg7lK/d5slZLqe5atcZLBrIIi4+q256
         ULzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ql7iGGOAi2FMyBQ3JK6ijZHfkJdjF3iLsnxqEu//quY=;
        b=s7eyrQW1xuRzkZUVtyPrRrueXEOTi3EW3EH4VM7wfWvWHRA3OlR1Wl1x4HGKx1XuMg
         vkv94pbF1cbGO9/A1qav3Xb3ag4fm/Tj+Pv8ZFYmTeOvhAP1t/Ugq2sySfRY/xa0axvU
         0M3zKMplyCh+J+Glgp+E+3zDVvJM1XtQQP6Ovao7g44f7zT5pThSClYUjSrfqoOAxk9n
         fAOo1GRG/htF5sQZMd9siCduGfX6XPSEdljOVsgBr+50PvJS1HJMRZ8e2U5DjkmLDL2D
         6j7H97z+Qfyc5zQoHYqOoJtncFK9CsxSSheGYNVMsTI7JMp8XTzwZIpKfqGklzJHDYL1
         wtYg==
X-Gm-Message-State: AOAM533KhAa6YeBiwMKhknPMBQDGc6zFYMqZA0D2RKB4ttJW911MzoMb
	HoiFH+m6kzhI1DEkivIZeJrmQUxkL6o9kg==
X-Google-Smtp-Source: 
 ABdhPJyBjj3zsOLbnwUrEVntzbfql9+B4XW9W4Pa7XhBGC0/MzgHGc5IJ80uCWlyVHHx/kQCvDRvsA==
X-Received: by 2002:a17:902:8501:b0:15c:ea4b:1398 with SMTP id
 bj1-20020a170902850100b0015cea4b1398mr66130276plb.109.1654080803393;
        Wed, 01 Jun 2022 03:53:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:4ccf:3fbd:a915:cbcd:1d5b:5016])
        by smtp.gmail.com with ESMTPSA id
 q19-20020a635c13000000b003c14af50623sm1074166pgb.59.2022.06.01.03.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 03:53:23 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-core@lists.openembedded.org,
	omkar.patil@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Markus Volk <f_l_k@t-online.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH 1/2] libxslt: update to v1.1.35
Date: Wed,  1 Jun 2022 16:23:11 +0530
Message-Id: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 10:53:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166372

From: Markus Volk <f_l_k@t-online.de>

Security

[CVE-2021-30560] Fix use-after-free in xsltApplyTemplates
Fix memory leak in xsltDocumentElem (David King)
Fix memory leak in xsltCompileIdKeyPattern (David King)
Fix double-free with stylesheets containing entity nodes

Fixed regressions

Fix performance regression with predicates in patterns
Fix regression in xsltComputeSortResult

Bug fixes

Fix conflict resolution for templates with same priority
Fix xsl:number generating invalid UTF-8
Support attribute value templates in xsl:sort lang attributes
Don't pass first xsl:sort in xsl:apply-templates twice
Fix quadratic runtime with text and xsl:message

Don't allow empty EXSLT durations

Improvements

Add xsltproc --huge Argument via libxml XML_PARSE_HUGE (William N. Braswell, Jr.)

Tests, code quality, fuzzing

Remove .travis.yml
Fix some misleading indentation (David King)
Use actual types for templates in struct _xsltStylesheet
Add CI for CMake on MSVC (Markus Rickert)
Check for null pointer before calling freelocale
Add CI test for Python 3
Don't set maxDepth in XPath contexts
Transfer XPath limits to XPtr context
Stop using maxParserDepth XPath limit
Make long-to-double cast explicit in date.c
Disable LeakSanitizer
Run clang CI tests with -Wimplicit-int-conversion
Fix implicit-int-conversion warning in exslt/crypto.c
Fix clang -Wimplicit-int-conversion warning (David Kilzer)
Fix clang -Wconditional-uninitialized warning in libxslt/numbers.c (David Kilzer)
Fix -Wshadow warnings in libexslt/dynamic.c (David Kilzer)
Also search parent dir for source XML when fuzzing

Build system, portability

Add CMake build files (Markus Rickert)
Initial support for Python 3 (Suleyman Poyraz)
Call ANSI versions of WinAPI functions explicitly
Remove redundant flags from pkg-config files
Suppress automake warning in tests/XSLTMark
Fix linking libexslt dynamic library when using MinGW (Vadim Zeitlin)
Added platform specific path separators (Dmitriy Korovkin)
win32: allow passing *FLAGS on command line
Fix export of xsltExtMarker on Windows (David Kilzer)
Fix redundant includes already in libexslt.h (David Kilzer)
Minor fixes to configure.js
Fix variable syntax in Python configuration
Add new EXSLT string tests to EXTRA_DIST
Fix xml2-config check in configure script
win32: Add configuration for profiler (Chun-wei Fan)
Check whether 'xml2-config --dynamic' is supported

Documentation

Add Makefile rule to regenerate xsltproc.html
Update links
Remove MAINTAINERS
Upload documentation to GitLab Pages
Add documentation in devhelp format
Add --enable-rebuild-docs configure option
Fix libexslt header summaries
Fix validity of tutorial XML (David King)
Use DocBook URL for tutorial DTD (David King)
Update libxslt.doap
Add missing options to xsltproc man page

(From OE-Core rev: 6b5b1486bbd381b2b657645e91a1712332ddcb94)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit daa312851681c55d81391b37a30a518f3e74e540)

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 .../libxslt/{libxslt_1.1.34.bb => libxslt_1.1.35.bb}        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.34.bb => libxslt_1.1.35.bb} (89%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
similarity index 89%
rename from meta/recipes-support/libxslt/libxslt_1.1.34.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 63cce6fe06..0f25043743 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -13,11 +13,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
-          "
+SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "db8765c8d076f1b6caafd9f2542a304a"
-SRC_URI[sha256sum] = "98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f"
+SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.17.1


