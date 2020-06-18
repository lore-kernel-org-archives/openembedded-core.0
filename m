Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web10.10594.1592494971406422886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jAiu3lW5;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.196, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f196.google.com with SMTP id a137so5479326oii.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sTswGzNr48PUT+e9uyGTGri0kmSCu4xbHjpZfap+VU4=;
        b=jAiu3lW5/62XY1yDmd9PX+CkfgzUaak34iP7vphey+Pa3byg/1uPim28hM749TETBe
         AWmgF4Zu00VKooKuO4O9VTN/E2nqmJSviQHpRlgKtVrKtFTmiT43IRHAl4q/i9Z3UHfa
         Ct3elvSVhMKzrheXx8hjzHoHdZur8pUJK33xylRIvXJr9k/z6qWroLXbTNAeFSX4H945
         XRp6x4ytIt73dn/mfTrjaXo966AuwJPdnlhHBMlrOzn8Knt7focrmePyjooxfocLFjRd
         73w7oGkHlizASrf54Kn+zcv6a9Nmlae0PNuM2RH0b+vkRXdK7GDSk3KC3WQ1p/52pVn+
         MZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sTswGzNr48PUT+e9uyGTGri0kmSCu4xbHjpZfap+VU4=;
        b=BN/FBZkjyPRN2AEogkcmCf9/XwnuRW9a3Po8ukWm+VRKlD1gcydYiIrK6EDFnwtUdr
         aoY3ioJXofcv8zY0h8BJKrFfMKm9GZ3zrSfRvwBdXaBhUTDadz38DNPG7OIQFJWotrtT
         SpJ1cSpfaiLOCFe4SNOEqT3aR2HGU2qY+zFOMqnlRzU46gh/pvkoQlkvgmjWHbaESDCs
         ZtrMcMgHfq4TiR01EFnRH8iNqda2+c0Fhgba6xJdUAEbiU7kk5/w/4Owtg9VnD1SCJUr
         C//wjoNxJhmN+gjDgZaU2yyat5MRHFrPs4ubuRZoIxcihJeh/VTvp2riP9qRzWuFvGhr
         le8w==
X-Gm-Message-State: AOAM531NkeD2jjGHYSYZZFhUe2tTFdeg8g1BRYfxtFK0othEOTD7+CiK
	ZOobKqMB7OdW8Nu0oLchUrWgMCHofRKBQg==
X-Google-Smtp-Source: ABdhPJy0t2RVKkXjprFoTsk092eww0ZyAPrIrdol2WfOWAlQ1OwBoVGqOmaLldAwowPqzDKzhvEt4Q==
X-Received: by 2002:aca:ed02:: with SMTP id l2mr3416025oih.148.1592494970307;
        Thu, 18 Jun 2020 08:42:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/21] wayland: fix condition for strndup detection
Date: Thu, 18 Jun 2020 05:40:45 -1000
Message-Id: <7a0f9b4fed4fec0cb0925231bb0ba4bbbb4bb3a9.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

current check does not work with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce6c50ea68c34e02b487d54fdd9288e04833cdef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-build-Fix-strndup-detection-on-MinGW.patch        | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index e445838750..c2ceae4a47 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -17,8 +17,6 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/merge
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/meson.build b/meson.build
-index 26b084f..c05d019 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -36,11 +36,11 @@ have_funcs = [
@@ -30,10 +28,7 @@ index 26b084f..c05d019 100644
  foreach f: have_funcs
  	config_h.set('HAVE_' + f.underscorify().to_upper(), cc.has_function(f))
  endforeach
-+config_h.set('HAVE_STRNDUP', cc.has_function('strndup', prefix:'#include <string.h>'))
++config_h.set('HAVE_STRNDUP', cc.has_function('strndup') and cc.has_header_symbol('string.h', 'strndup'))
  
  if get_option('libraries')
  	ffi_dep = dependency('libffi')
--- 
-2.17.1
-
-- 
2.17.1

