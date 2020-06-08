Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.25190.1591602526391810819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=twGK4QPv;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id k8so12577159edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60a77AEGu3CTz6slPM1qt1FLteDTBVOvoxrD25xw4TU=;
        b=twGK4QPv1p6Ks+Rznh9fMeBgLHDWBSAtPomyWVNUf5bFfHUnS2bUMZNxHGiNlx3Ux0
         eXm17ppT8Q5JU83Rz1ExhmtPXGRUibikXiYCnS90WrP0I6sitEzpojdrSgcN+SRvbAFS
         Ou3Fm81MjWSbz7IPl0T3jtSCCKoAfUgmqGFNfRD/gNNXE7NbRYmwJtUmFoLD7P389T85
         nK8rFpmLxEL+l4+6bmBQiDrjpv4AQTE8LqCGCes8DwOYzzKNenbJXGkhb9N7dXj7nxoS
         vo+DuPImBUcYTCN47k2T3OqMftXNlaqguq3HlrS7eCxJMtMwDXM4hHUjsNGg5ho2RnVj
         1fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60a77AEGu3CTz6slPM1qt1FLteDTBVOvoxrD25xw4TU=;
        b=k57q4p8I4NwJxBBXOoc2VSPZn79uKHpLhBwt0lI9vi2feiy0WZlW5nsxfaNgV4uo4z
         QBU426u90s4IS/GSxTo9d6jNyILSzAPmdwMNGLgwu/uO3iuTg7/d4tvgqTVZdXKAKLkX
         Aie305MCYb/pxyHSGUiZ2x46Wu8hSyRiIKnJetuC+4Ntpzp7i/c6YUEvxUzo69sV7eBc
         epLxEFLkcLdd8l9bb0WJZLvR0s/+lLfOGVUBw82XueocaMeezv6XnYaQTXExh2G8MkcE
         wiziz18tixIgKOT4F4g1Z/Kz+kSIqC1yjTgSv5aIsLxsHqNjW6T8PeNgf+HMFailzTMj
         qWPg==
X-Gm-Message-State: AOAM530wBtQv1g9nl+LggnmG7cdXCzw1ouuwvg1VICm6cc9aWrFnB3wW
	JMztnatjEMCykHhlsjbALdZ4fYT7+s4=
X-Google-Smtp-Source: ABdhPJzpZ6he7iRgPnOEoAS0CGxIAQTjRu9p56gLhxk+gm/kV6JxRr4cDAvlC/oSLZS6u1t99CeSIA==
X-Received: by 2002:a50:b022:: with SMTP id i31mr20120432edd.301.1591602524556;
        Mon, 08 Jun 2020 00:48:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/42] mpg123: update to 1.26.1
Date: Mon,  8 Jun 2020 09:46:52 +0200
Message-Id: <20200608074659.7051-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a patch merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/mpg123/mpg123/sdl2.patch   | 14 --------------
 .../mpg123/{mpg123_1.25.13.bb => mpg123_1.26.1.bb} |  6 ++----
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-multimedia/mpg123/mpg123/sdl2.patch
 rename meta/recipes-multimedia/mpg123/{mpg123_1.25.13.bb => mpg123_1.26.1.bb} (90%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123/sdl2.patch b/meta/recipes-multimedia/mpg123/mpg123/sdl2.patch
deleted file mode 100644
index 9dc9b923df..0000000000
--- a/meta/recipes-multimedia/mpg123/mpg123/sdl2.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Use libsdl2 instead of libsdl 1.2, which is dead upstream.
-
-Luckily the API that mpg123 use didn't change so this is a trivial change.
-
-Upstream-Status: Submitted [https://sourceforge.net/p/mpg123/bugs/268/]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 6216d4f..b8d3344 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1694 +1694 @@ do
--			PKG_CHECK_MODULES(SDL, sdl, output_modules="$output_modules sdl" HAVE_SDL="yes", HAVE_SDL="no" check_failed=yes)
-+			PKG_CHECK_MODULES(SDL, sdl2, output_modules="$output_modules sdl" HAVE_SDL="yes", HAVE_SDL="no" check_failed=yes)
diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.1.bb
similarity index 90%
rename from meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.26.1.bb
index 6c7b6fa8c3..affbac4919 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.25.13.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.1.bb
@@ -9,10 +9,8 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
-SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2 \
-           file://sdl2.patch"
-SRC_URI[md5sum] = "294a6c30546504ec3d0deac2b2ea22be"
-SRC_URI[sha256sum] = "90306848359c793fd43b9906e52201df18775742dc3c81c06ab67a806509890a"
+SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "74d6629ab7f3dd9a588b0931528ba7ecfa989a2cad6bf53ffeef9de31b0fe032"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.26.2

