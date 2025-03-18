Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20721C36000
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.4271.1742272734824679314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OnVwWE50;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224191d92e4so98219865ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272734; x=1742877534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dmrg0EeIZrkFPWnz835/8kFleF+SXogWt1MEkvwGaTc=;
        b=OnVwWE50tnRDrYItKqkSte/RCrGfzSmlf86sHkdEU2sf6l5Ul7GGDSvYUPhP+VF5KW
         DcIruF1wML1bOei0+GGnHsQ+Hfh73LfHa3EmFrfnS1uHpvcy1iy7tpjCSO10YZrG9ZBe
         C06SuELxqbGb1HqSeOSj9rJ4OPwZIcIPD7ys3XjXu4Y5cVl9bY3Ld4IGu7SChKZ58V//
         OipzyVeN+d0bo86IkqYB/lFIAxhg7eM6yk0yOHkAxVP51HGSFw9ztLUWxWsQ++B1h86W
         Rkr69OnnPBrUuJUAYa9BcuRf1b8gVGLd2sSpo5WpBspaC1pBgz+rLJ+rtIhL6SFAvaYO
         S5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272734; x=1742877534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dmrg0EeIZrkFPWnz835/8kFleF+SXogWt1MEkvwGaTc=;
        b=V0b0cjv+DszuJ0jtHut79DW7waksqux+Qp88koO9gxwJqDPR9iAeq3u3OjsHf0V1xD
         brx9JULax9eZcp77BdHg3Ws/BYbb5MtAFywDQbs0HqrXT+agZINkKt7uud8C3qK7LuJc
         6ozJj2eHfPibRtvSMkQB0/sGik1RpYDRoc0Cm28Dr6taBlmL/6dcTiKM4zcekmqX+sCO
         81FIKc+1MpHq+Va7T76jVKrTtkvSP87PRzWiJqgRyazDfZAJG/+lH8SZk+iyTehTGLwM
         h8ep1e5T3edvS5m4VVTpvgr81wO84xV08k41wUMjuue/e7NDeVBPlW5BEub/cllnt+Rd
         g2GA==
X-Gm-Message-State: AOJu0Yz7I67bdDJPAVOUnVKJ4/jyQWcF5mnNtmX6rATWrIM0FAIDP7Pp
	s+xgutChzVK92jHlqao2FNWSDQ3DVpf8cTgNgy7xBixfGwf32J4D1KH0naUa
X-Gm-Gg: ASbGncs5fPeA+/14/NHMEpZGpALZ1ZxL8m3cDt3nY5NzQonqWQl0ttzLb7upxPaw0rB
	Ojw+hiuGGEHkfuQtQgBuUa2UbLBb9mZyCTo1xWMeSFu+5xCLOuhORo7KLqqrahVDjm4IZLbJ+D7
	mVLOD69Odk/Jhg2LE5cvNBWkiDiiwIj0YKieQSxz3JsVKwU4IJVfmtGK+baRUQy0BFpQJJeNJLe
	LaMqPx+w+ihHbZ/mRCHoLti6ryjwLmoslsX3qq7R3dSeU4TbsJMzejeIGev/bJ3tvSUJstW4dxd
	TTqSfbO6CB+Vk5sHikbf0u0GKEj8cJ3/iFKd
X-Google-Smtp-Source: AGHT+IFbR003yHpWex63bNjFcu8/HpZ+21W0bkwr46jKF5ihJtWUjdBvp6s+S4zSS8UNYljnnLua8Q==
X-Received: by 2002:a17:902:e745:b0:224:160d:3f5b with SMTP id d9443c01a7336-225e0b2a55dmr186254915ad.49.1742272733846;
        Mon, 17 Mar 2025 21:38:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 05/24] ncurses: Upgrade to v6_5_20250315
Date: Mon, 17 Mar 2025 21:38:25 -0700
Message-ID: <20250318043846.2422141-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213139

Brings needed fixes to build with GCC15

License-Update: Copyright Years changed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ncurses/files/0001-tic-hang.patch           |  4 +---
 .../files/0002-configure-reproducible.patch     |  4 +---
 ...in-Do-not-include-LDFLAGS-in-generated.patch |  4 +---
 .../ncurses/files/exit_prototype.patch          | 17 ++++++++++++-----
 meta/recipes-core/ncurses/ncurses.inc           |  2 +-
 meta/recipes-core/ncurses/ncurses_6.5.bb        |  8 +++++---
 6 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-core/ncurses/files/0001-tic-hang.patch b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
index 8cb92a39398..d2df9680ffc 100644
--- a/meta/recipes-core/ncurses/files/0001-tic-hang.patch
+++ b/meta/recipes-core/ncurses/files/0001-tic-hang.patch
@@ -16,11 +16,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  misc/terminfo.src | 11 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
 
-diff --git a/misc/terminfo.src b/misc/terminfo.src
-index 5d575b8e..f9cc6880 100644
 --- a/misc/terminfo.src
 +++ b/misc/terminfo.src
-@@ -6518,12 +6518,11 @@ konsole-xf3x|KDE console window with keyboard for XFree86 3.x xterm,
+@@ -6577,12 +6577,11 @@ konsole-xf3x|KDE console window with key
  # The value for kbs (see konsole-vt100) reflects local customization rather
  # than the settings used for XFree86 xterm.
  konsole-xf4x|KDE console window with keyboard for XFree86 4.x xterm,
diff --git a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
index 11ca66c8e8f..1353405ee25 100644
--- a/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
+++ b/meta/recipes-core/ncurses/files/0002-configure-reproducible.patch
@@ -17,11 +17,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure b/configure
-index 488d93fc..005d44e2 100755
 --- a/configure
 +++ b/configure
-@@ -5129,7 +5129,7 @@ else
+@@ -5448,7 +5448,7 @@ else
  		;;
  	(*)
  		cf_cv_ar_flags=unknown
diff --git a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
index d89399bbe51..c2e3984db92 100644
--- a/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
+++ b/meta/recipes-core/ncurses/files/0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch
@@ -14,11 +14,9 @@ Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
  misc/gen-pkgconfig.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/misc/gen-pkgconfig.in b/misc/gen-pkgconfig.in
-index 89a5cd4a..07d94d17 100644
 --- a/misc/gen-pkgconfig.in
 +++ b/misc/gen-pkgconfig.in
-@@ -83,7 +83,7 @@ if [ "$includedir" != "/usr/include" ]; then
+@@ -83,7 +83,7 @@ if [ "$includedir" != "/usr/include" ];
  fi
  
  lib_flags=
diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index 299852d2c07..09a9d5dce1b 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -9,19 +9,26 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/configure b/configure
-index 005d44e2..72fa6c23 100755
 --- a/configure
 +++ b/configure
-@@ -3462,6 +3462,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
+@@ -3763,6 +3763,7 @@ rm -f "conftest.$ac_objext" "conftest.$a
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3463 "configure"
+ #line 3764 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -13533,6 +13534,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -3821,7 +3822,7 @@ echo $ECHO_N "checking if $CXX works...
+ 
+ 		save_CPPFLAGS="$CPPFLAGS"
+ 		eval cf_includedir=${includedir}
+-		CPPFLAGS="$CPPFLAGS -I${cf_includedir}"
++		CPPFLAGS="$CPPFLAGS "
+ 
+ cat >"conftest.$ac_ext" <<_ACEOF
+ #line 3827 "configure"
+@@ -13891,6 +13892,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f93550cf99..513cb4c1c9c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6f291ee54551d9d8d992ecd623fe4bc7;endline=27"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c534844fa5a74d14ae8fa3d9b3b42138;endline=27"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS:class-native = ""
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.5.bb
index 2e3ee337ea4..980671218ca 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
@@ -6,10 +6,12 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"
+# v6_5_20250315
+SRCREV = "5fa5aea6d020750dbe601c1136c7cc35a8a53dd8"
+PV .= "+20250315"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+_\d+)$"
 
-# This is needed when using patchlevel versions like 6.1+20181013
-#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
+# This is needed when using patchlevel versions like 6.5+20250315
+CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"

