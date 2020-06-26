Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.557.1593143132114104727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 20:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DatY7bO8;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id m2so4376014pjv.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CQeh65HRvmNcgqhhalcEU3fMTbfxYMXi5C1hl3F76Ag=;
        b=DatY7bO84VeQHXYMyvpgEQtGJm2P6vlUk9W/uxfoVoqsjA/ZpnVOgZeg+dWlQhJOAf
         slORc9rjZe37ADBCU2csTjcAwsMI8TYvVGqPdheJu/vIXQdx8kmxs6Ogb2Uf3RMrCzWF
         7damyiOJKMyJN/xC4N3+YtiBhFQFrOaj4WQ3+H+AkRgrKMbfStPThau9mJOjIvYN9MQj
         Cru0Wvs1QBrVkTvXn14zNHIMaLzlkdyTCD7FueZhuFyhbfckL4ZQJfGwtXVpXUYhQgiK
         uJudx3WN+2b6DsMgv0wy1xr5SrLGnkhg+BZYYQVxBSPaEgWur5yt+c8j0TuEo3riLXlP
         pcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CQeh65HRvmNcgqhhalcEU3fMTbfxYMXi5C1hl3F76Ag=;
        b=kKVwz7U5GUSgDJrNE7qIEx3wLth8QhRibnsOZUtcNfPBmPgeRDKuUYzOo2m45zhzas
         avCMVBX/NOTsEAt2eRvkjE7QaKhMZWefveGsR4Fb9L91/rxxOauAAAgyA5B/5lPVXqDY
         DAZPhq7hbJadx+X0fDX2cZFCjB/kXjFXKbx/mdmtl5VwmUv1TSU6FgI2PIi5YxQR2OYf
         vcOGbnqwPhi2PR4V9VhLXWUuju7kUGOJYrjSuSfsMCB4L/sNXFFAQGELvRPcG2zmdUfV
         qKDLTR4D12+9WhCO3M7//p58K7iOGm4bRYmaaHHKL7znsjORiKaUYIVvgN7Q2B177dVT
         lWzQ==
X-Gm-Message-State: AOAM533ErlmPzLpG5mnJWlHlzmd+U9cGgP2XiIL89QyqVs6vaanRVrh8
	XQuk0wFUbRsaxuC0ruYnYwdKvV+spls=
X-Google-Smtp-Source: ABdhPJxgHFmYEUQX3d+57ltVRZARidWhKvL4CwOATTCmHsuWHtNGL8G++rmPoEOda27swJ2qNvK2gw==
X-Received: by 2002:a17:90a:e02:: with SMTP id v2mr1245860pje.90.1593143131189;
        Thu, 25 Jun 2020 20:45:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id y10sm25565863pfq.34.2020.06.25.20.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 20:45:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] musl: Update to tip of master
Date: Thu, 25 Jun 2020 20:45:24 -0700
Message-Id: <20200626034525.3955716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detailed changelog [1]
Refresh patches

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1b4e84c56df0f8ca30f6bc05962a860f869e71df..fca7428c096066482d8c3f52450810288e27515c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ynamic-linker-a-relative-symlink-to-libc.patch | 11 ++---------
 ...libdir-and-libdir-as-default-pathes-to-l.patch | 15 ++++-----------
 meta/recipes-core/musl/musl_git.bb                |  2 +-
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
index 462d338b96..ba00efe7b3 100644
--- a/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
+++ b/meta/recipes-core/musl/musl/0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch
@@ -22,11 +22,9 @@ Upstream-Status: Pending
  tools/install.sh | 8 +++++---
  2 files changed, 6 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index 8246b78..d1dbe39 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -215,7 +215,7 @@ $(DESTDIR)$(includedir)/%: $(srcdir)/include/%
+@@ -210,7 +210,7 @@ $(DESTDIR)$(includedir)/%: $(srcdir)/inc
  	$(INSTALL) -D -m 644 $< $@
  
  $(DESTDIR)$(LDSO_PATHNAME): $(DESTDIR)$(libdir)/libc.so
@@ -35,8 +33,6 @@ index 8246b78..d1dbe39 100644
  
  install-libs: $(ALL_LIBS:lib/%=$(DESTDIR)$(libdir)/%) $(if $(SHARED_LIBS),$(DESTDIR)$(LDSO_PATHNAME),)
  
-diff --git a/tools/install.sh b/tools/install.sh
-index d913b60..b6a7f79 100755
 --- a/tools/install.sh
 +++ b/tools/install.sh
 @@ -6,18 +6,20 @@
@@ -62,7 +58,7 @@ index d913b60..b6a7f79 100755
  m) mode=$OPTARG ;;
  ?) usage ;;
  esac
-@@ -48,7 +50,7 @@ trap 'rm -f "$tmp"' EXIT INT QUIT TERM HUP
+@@ -48,7 +50,7 @@ trap 'rm -f "$tmp"' EXIT INT QUIT TERM H
  umask 077
  
  if test "$symlink" ; then
@@ -71,6 +67,3 @@ index d913b60..b6a7f79 100755
  else
  cat < "$1" > "$tmp"
  chmod "$mode" "$tmp"
--- 
-2.7.4
-
diff --git a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
index 6a875a717e..f57aae5f3c 100644
--- a/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
+++ b/meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
@@ -20,11 +20,9 @@ Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
  ldso/dynlink.c | 4 +++-
  2 files changed, 5 insertions(+), 2 deletions(-)
 
-diff --git a/Makefile b/Makefile
-index b46f8ca4..c07e4ae8 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -46,7 +46,8 @@ CFLAGS_AUTO = -Os -pipe
+@@ -47,7 +47,8 @@ CFLAGS_AUTO = -Os -pipe
  CFLAGS_C99FSE = -std=c99 -ffreestanding -nostdinc 
  
  CFLAGS_ALL = $(CFLAGS_C99FSE)
@@ -34,20 +32,18 @@ index b46f8ca4..c07e4ae8 100644
  CFLAGS_ALL += $(CPPFLAGS) $(CFLAGS_AUTO) $(CFLAGS)
  
  LDFLAGS_ALL = $(LDFLAGS_AUTO) $(LDFLAGS)
-diff --git a/ldso/dynlink.c b/ldso/dynlink.c
-index ec921dfd..7c119c55 100644
 --- a/ldso/dynlink.c
 +++ b/ldso/dynlink.c
-@@ -22,6 +22,8 @@
+@@ -24,6 +24,8 @@
+ #include "libc.h"
  #include "dynlink.h"
- #include "malloc_impl.h"
  
 +#define SYS_PATH_DFLT SYSLIBDIR ":" LIBDIR
 +
  static void error(const char *, ...);
  
  #define MAXP2(a,b) (-(-(a)&-(b)))
-@@ -1038,7 +1040,7 @@ static struct dso *load_library(const char *name, struct dso *needed_by)
+@@ -1071,7 +1073,7 @@ static struct dso *load_library(const ch
  					sys_path = "";
  				}
  			}
@@ -56,6 +52,3 @@ index ec921dfd..7c119c55 100644
  			fd = path_open(name, sys_path, buf, sizeof buf);
  		}
  		pathname = buf;
--- 
-2.7.4
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 6aa69985d7..0913b09aaf 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1b4e84c56df0f8ca30f6bc05962a860f869e71df"
+SRCREV = "fca7428c096066482d8c3f52450810288e27515c"
 
 BASEVER = "1.2.0"
 
-- 
2.27.0

