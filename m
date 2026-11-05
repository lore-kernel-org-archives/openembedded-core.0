Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29808.1793868226874161188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GZavbFPa;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so17150255e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868225; x=1794473025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6zt6tWrFJUSAvKy51sNbIWHwF1rygOtMD53DnU1LeaU=;
        b=GZavbFPac5Q4onA25mBGasuiO6DcI7aasNcNyxa0qXSk9kqTk8j35Y8rWi2Apq0X4I
         RnFJVYxeDOxeCT3105SAma3baITTNh1bXKX1WaplxPMiyHBtmNN1C7sCfzHa784akNSZ
         5QQ+WVnU56NP5QrAJzjhgDccsAcDCzAB390m8b0FWDiu+Ve+VCtn3/4sy5HggJb0R5PV
         tJXEyQbYVqIm7dx1BvrxvMDqoYV/uYAzGhM6A0MYSNxk4RVsPyx9P1F/pLLayLJUzepK
         Y4M45izaKgTh/uGoYCLoTZjxBaVVIu0baEO1JQNA8tyJv0FTaDrBU0r01w5a3mGct+U1
         /FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868225; x=1794473025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6zt6tWrFJUSAvKy51sNbIWHwF1rygOtMD53DnU1LeaU=;
        b=TsiMUVx/aegCGjMnqwAzYWxlSpq+MCPQn5v6WEwIgC71JwQEqeiw++8YaTtIDJMhcb
         u6J4BpbdJrOgZ9bb0LK2dy0vsTqtTsBEPoGFW2G0Ab+mGhzWRp0CcHiaKWMu+f3q4T3p
         abIb7wLOGoZJSRXfsXkhvtEOEXxyJfcUgiBgNIDUDrpxe5hOylXMniiDlgUrkws3oR09
         i+8WrssgcQZu0f9arhiTn0JkIcun9GevhJiCZu6/XRQEd1wM/tR4bGRV/RmuK/x3ORpn
         4nY6t5EJGxsjt3Dx6syKJ9hSwhx+EJZcnLJbzL+MfnQtxHU+J6sCGyGjEook4iDB1agE
         H9oA==
X-Gm-Message-State: APuU4Z8+qQsVgqMoP37lsBW6k2sE+IZER8+GKNIAh5ZTAtJU4X0qGUzX
	B+YYNtXlvc0e6gGZ7GAmyNEw5+gGW8YNKIoeR51wRY3Z3l2nuMwfR33Y6JUajxyt0kewItUsGJz
	9HcxM0io=
X-Gm-Gg: AYBFou2pcmdNN8mirs37gFyf4QPWgqYMLuYtsXHwsQtRNF9PD3lWNx89ruAmCKSmhG2
	r7GpPtXL4ydhdGsdnGJOmVvWu3qzpcU6j3lA+vFQ4E5hStCp6K3V4DgVZqS2UNDcjV6SiI1OCvN
	2gR8fOuPaJQ6hZWmB/NZJZwIqnXlI3ZGwJwZWo7cO5BV7/erahCNlolhWZSXQuKYY3O8gn+w7IO
	qZPaocFYnq4KaAUj7BMQpOLk+eor/URnHPny32EchiZCK/wtlKPNuxtd6rlgHEVTrnSD97raXWd
	HD+pqd89AUuyvm02GB+szVF0axhRE8Yxh+rQtply10LTEGMnnmOuTEjWhEX1RZ3+CTVIruJ66P+
	804kj4tTBdz89JduginOSwW809dPCpQIiHK4MISQ7gFD/R20LBd/Hw4i1rGocRKcaYYmMOpRshh
	9JyMHOPp3NGfWKKFGnFgrC6W8U8XRYwQJ3LbIvuzGK6+Wt6JiqlSKQdXYba3xJsdtGZ+TjVLwlX
	8/09clEntGdslNfZB55UMfO1mDCWNt+6j/Vor/sZpTrfXbFooUUl+M9AgEHfw0ZwqVq2WMmxx0g
	O+/bRkmyBbGtJjjMYnEoiQigRzjpd3alREl0y0LcZgoFhzKxj87tyBlFt8nWe1H5hN93HaaHB4u
	RkbOUo3BsfrJ3JSPZ3furgEnig04Y
X-Received: by 2002:a05:600c:848c:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ac17471091mr423667325e9.6.1793868224990;
        Thu, 05 Nov 2026 00:43:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 14/60] libical: uprade 4.0.5 -> 4.0.6
Date: Thu,  5 Nov 2026 09:42:33 +0100
Message-ID: <2dd434f74077dc80a2d6d91f2e9d3a5aea1f6eff.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249473
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Drop upstreamed patch.

- CVE: Fix UBSAN issue "bsearch comparator through an incompatible
  function pointer"
- RFC5545 section 3.3.5 Date-Time fixes:
  - Resolve local times in a fall-back overlap to the first occurrence
  - Fix explicit local time in a DST gap resolves using the
    post-transition offset
- RFC5545 section 3.3.10 Recurrence Rule fixes:
  - FREQ=WEEKLY with BYMONTH and BYSETPOS loses occurrences in the week
    straddling month boundary
- libicalvcard: the typed vcardvalue getters now check that the value
  type of the property uses the same union member as the expected value
  type of the getter. If the type mismatches, then they return the zero
  value for the expected value type. The typed setters error with
  ICAL_BADARG_ERROR instead of overwriting a value held in another union
  member.
- libicalvcal: Fixed a memory leak in vobject.c
- Buildsystem changes:
  - Fix build paths in installed cmake files (esp. for cross-compiling)
  - Install the libicalversion.h header
  - Fix building libical as a submodule in a larger CMake project
  - Fix "now" linker support check in the hardening compiler options
  - Fix the DESTINATION path for libical.jar
  - Use private linkage for 3rdparty libraries (icu, glib, ..)
- Built-in timezones updated to tzdata2026e.
- Remove ancient hack (since 2012) to support malformed TZID parameters

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3c04485f3effa61811fabadb52473ee29bc95f1e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...001-Mark-ICU-as-private-linkage-1366.patch | 76 -------------------
 .../{libical_4.0.5.bb => libical_4.0.6.bb}    |  6 +-
 2 files changed, 2 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
 rename meta/recipes-support/libical/{libical_4.0.5.bb => libical_4.0.6.bb} (91%)

diff --git a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch b/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
deleted file mode 100644
index 53bd1683af2..00000000000
--- a/meta/recipes-support/libical/libical/0001-Mark-ICU-as-private-linkage-1366.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 13642054f650795446f6020d9d2e14d147b8da51 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross@burtonini.com>
-Date: Wed, 2 Sep 2026 16:14:44 +0100
-Subject: [PATCH] Mark ICU as private linkage (#1366)
-
-* libical-glib: Hide some target options in the installed CMake files
-
-The build paths could be shown in the installed .cmake files, thus
-hide them from there, because they are not needed.
-
-Closes https://github.com/libical/libical/issues/532
-
-* libical: mark ICU linkage as private
-
-There's no need to expose the ICU linkage publically as the .so will
-pull this in itself.
-
-This has a side-effect of removing build/sysroot paths from the installed
-.cmake files.
-
-Closes #532.
-
----------
-
-Co-authored-by: Milan Crha <mcrha@redhat.com>
-(cherry picked from commit 38c7e6d31a3a1a4bd67479f402c323fb0679271e)
-
-Upstream-Status: Backport [libical 13642054f650795446f6020d9d2e14d147b8da51]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/libical-glib/CMakeLists.txt | 9 +++++----
- src/libical/CMakeLists.txt      | 2 +-
- 2 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLists.txt
-index d63bbf3c..470a4d22 100644
---- a/src/libical-glib/CMakeLists.txt
-+++ b/src/libical-glib/CMakeLists.txt
-@@ -24,16 +24,17 @@ if(NOT DEFINED LIBXML2_DEFINITIONS)
- endif()
- target_compile_options(
-   ical-glib-src-generator
--  PUBLIC
-+  PRIVATE
-     ${GLIB_CFLAGS}
-     ${LIBXML2_DEFINITIONS}
-     -DG_LOG_DOMAIN=\"src-generator\"
- )
- target_link_libraries(
-   ical-glib-src-generator
--  ${GLIB_LDFLAGS}
--  ${GOBJECT_LDFLAGS}
--  ${LIBXML2_LIBRARIES}
-+  PRIVATE
-+    ${GLIB_LDFLAGS}
-+    ${GOBJECT_LDFLAGS}
-+    ${LIBXML2_LIBRARIES}
- )
- 
- install(
-diff --git a/src/libical/CMakeLists.txt b/src/libical/CMakeLists.txt
-index 6fc2e953..583f2eeb 100644
---- a/src/libical/CMakeLists.txt
-+++ b/src/libical/CMakeLists.txt
-@@ -294,7 +294,7 @@ if(DEFINED CMAKE_THREAD_LIBS_INIT)
-   target_link_libraries(ical ${CMAKE_THREAD_LIBS_INIT})
- endif()
- if(ICU_FOUND)
--  target_link_libraries(ical ${ICU_LIBRARIES})
-+  target_link_libraries(ical PRIVATE ${ICU_LIBRARIES})
-   if(VCPKG_MANIFEST_MODE)
-     if(NOT APPLE AND NOT WIN32)
-       target_link_libraries(ical "m;stdc++")
--- 
-2.43.0
-
diff --git a/meta/recipes-support/libical/libical_4.0.5.bb b/meta/recipes-support/libical/libical_4.0.6.bb
similarity index 91%
rename from meta/recipes-support/libical/libical_4.0.5.bb
rename to meta/recipes-support/libical/libical_4.0.6.bb
index e9b093544f1..7b9185c3742 100644
--- a/meta/recipes-support/libical/libical_4.0.5.bb
+++ b/meta/recipes-support/libical/libical_4.0.6.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
                     "
 SECTION = "libs"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-Mark-ICU-as-private-linkage-1366.patch \
-           "
-SRC_URI[sha256sum] = "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b8965102581401e67c9c"
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "2e3729cb69c282d3bb17a8d2b198af6e4bc7502fd3621c9adf573921fe9dceb0"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
