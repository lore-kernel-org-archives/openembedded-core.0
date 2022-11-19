Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C74FC4167D
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:49 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.30652.1668892540803051602
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=H+ImDT09;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id q9so8046551pfg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh/SaLthHQ6Yp/DyAO3mDrt41Du72zA3lISMD7gYXI8=;
        b=H+ImDT09QbFGsYFsQGY/j692qRqBhVgCBHuwRI+/gDnnDJXSXijrg8f9vA/fVrEHKk
         TYixN9SH6ICuaMW9FlwEKD2td14Az5VzVoo46HiGrvysSgn+ghwZc6/EM4rQK87I4trB
         PvL+SKwL1AfXFNlKeLhAqlvCvq6UOTG+Bqx0WyKZKHeBUKHeCtrj/aWApGJEFiv/2C9G
         Mh/OtUpuITB5PveCJdPnyEY5SmYrTEorfHXLpcn3WDY12WlOJi4ZcqLqIJvTyVQ54zHL
         s54e/46ei5slep9GsGGxTRml65jwixyibKMhVY20mXjiO9YzhiEiElYg1BdqAgn07Ln8
         omwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh/SaLthHQ6Yp/DyAO3mDrt41Du72zA3lISMD7gYXI8=;
        b=IEpI9E6RRPgWZ+4552cr3vCudneGRgbgwXS+b4eadgECyn91e+q19Fld2X6MGBZN5c
         IvqQTyGII579ARgtC3e93J0Uf0jGgkcSY3pb53yAZ+z0XeQOTSVf/uO+ImAZQVVUJCva
         t7nqQUD3XEXC7vTsHcEroPORvkpg2bOSrbbDsM8oG6Zpdh7BavPsfVv/2zLASMZ3iuMG
         50NUHkIFIpMzQyvyYUQ2MYyB0LE00OyefYwg6aGNLTbFdDADRhZuP5QPUQfgD/amjgkF
         E1LhuXZQRqWZLtnMNxAmhFSS2QKRZ6g2QuRxy8ODny7N263TS663fDDYUUpn68gMh5Nk
         0LiQ==
X-Gm-Message-State: ANoB5pltHFoC6eMKp9sNLiiNVFZqpTVGKtc4Q4OnMGj8GQzyg6/HgDTn
	A5SVJkH52xqPkqdqp69G3N6qTmx4rp+uJGsBnm8=
X-Google-Smtp-Source: AA0mqf7KHXZxSqWMjmHSCq/++ag2KVke2SlMdVztdG/0sdrJnOdjzlXiL5PVgX3oIcifavH8gJi5LA==
X-Received: by 2002:aa7:9293:0:b0:56b:9bf4:c1c4 with SMTP id j19-20020aa79293000000b0056b9bf4c1c4mr2951747pfa.67.1668892539806;
        Sat, 19 Nov 2022 13:15:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/35] socat: upgrade 1.7.4.3 -> 1.7.4.4
Date: Sat, 19 Nov 2022 11:14:48 -1000
Message-Id: <d7570afa4163f6e94388763143f68752c9f1c1f4.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173549

From: Wang Mingyu <wangmy@fujitsu.com>

1.7.4.4 is a bug fix release

0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
removed since it's included in 1.7.4.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c00e9d66f0b8449ff1bf24546f232345eb6feebd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch | 35 -------------------
 .../{socat_1.7.4.3.bb => socat_1.7.4.4.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.3.bb => socat_1.7.4.4.bb} (89%)

diff --git a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch b/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
deleted file mode 100644
index fbfb0816dd..0000000000
--- a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d67d6b4f981db9612d808bd723176a1d2996d53a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 17 Jan 2022 13:21:32 +0100
-Subject: [PATCH] configure.ac: check getprotobynumber_r with AC_TRY_LINK
-
-AC_TRY_COMPILE won't error out if the function is altogether absent
-(e.g. on linux musl C library), the test needs to link all the way.
-
-Upstream-Status: Submitted [via email to socat@dest-unreach.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d4acc9e..973a7f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,13 +137,13 @@ AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
- # getprotobynumber_r() is not standardized
- AC_MSG_CHECKING(for getprotobynumber_r() variant)
- AC_CACHE_VAL(sc_cv_getprotobynumber_r,
--[AC_TRY_COMPILE([#include <stddef.h>
-+[AC_TRY_LINK([#include <stddef.h>
- #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024,NULL);],
- [sc_cv_getprotobynumber_r=1; tmp_bynum_variant=Linux],
-- [AC_TRY_COMPILE([#include <stddef.h>
-+ [AC_TRY_LINK([#include <stddef.h>
-  #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024);],
-  [sc_cv_getprotobynumber_r=2; tmp_bynum_variant=Solaris],
--  [AC_TRY_COMPILE([#include <stddef.h>
-+  [AC_TRY_LINK([#include <stddef.h>
-   #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL);],
-   [sc_cv_getprotobynumber_r=3; tmp_bynum_variant=AIX],
- 
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.3.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
similarity index 89%
rename from meta/recipes-connectivity/socat/socat_1.7.4.3.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index a4a0a8933e..5a379380d1 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -9,11 +9,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch \
-           "
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007"
+SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
 
 inherit autotools
 
-- 
2.25.1


