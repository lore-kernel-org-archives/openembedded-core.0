Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.37628.1597028388265792494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 19:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c/qXCNI0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id o1so4074402plk.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 19:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/FN+aBRPgSOXgbKLlc0Z60js/ep2xnlSxjzglKVI8Zw=;
        b=c/qXCNI0uw+f+YcP9xnIr/JIOvOAE7Wfks10+Rqqi3EyHGu/WFWLshdBe2SqGbhYd+
         AdkFCxahezqMe3cnzQAZwhJz2bXUV0qkRBDO391PCyFWW5jXOV071KPeiGem+iPN36l/
         bVPfY4XBc2mlNfrUCdLmV+IK3lKiFzoj2X/BkfMenIrUz27+zujq9ThU0Ph53IoTRv9Q
         5FxRDmKyculNH+F9K/ou2PwS74al4ZEEexoiZJExp5Gqyf42UhejlFXskHCGPIOYuI9V
         cd7SLxZ7yahYtTtCuCyMjr/8Cc37r85os74JoYUB1m982YQdXJEed2etgj4w0L5tNNz/
         DynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FN+aBRPgSOXgbKLlc0Z60js/ep2xnlSxjzglKVI8Zw=;
        b=n03vzipYfjTPV8VmGyTP9lYqcHCy0fFQhnAkt6ahKOsSxBpuXG7f3jWNGvpLGC5dr+
         swJfJ9o81pVuOrxIsNEWladkB4xcbD+tOwR7dh5WTBjIcLfW4rDklE/UccOiv/DDNHhm
         Q/iYeEtjJKjIFFdlXIj6fsepo8kpqAs5J1wXp0LU2ZkOgpP7V8K4OVeykO0+BYZJsYRp
         rAkjAI171gk4quzlZPfZgQuYcPqOBZHzLOVAOvnT6wXsAqNOzkxJnv+D2cH5REYeZ//5
         yWo11cpK1kExjk2LyEWtQscoqLH2wxHacl3DAAO4YdWR336G5aMuYF7qs3KOfbOzwLtj
         Uhcg==
X-Gm-Message-State: AOAM5301KPDmvKl2fBtRaQxdNxAZGkbmCKabSGJN0IDL+gHzPcSYuwSQ
	QJoNAxyt/rDyiGKXWfoouh3t6n1We5Q4zA==
X-Google-Smtp-Source: ABdhPJw7bXqcbIEI1PxiX/sbJ9NJGkWIR65lNmMNvUIhQ9ocmlW3SSkoWmXHE5UlPLre1HgTLVpcCw==
X-Received: by 2002:a17:90b:368c:: with SMTP id mj12mr22342136pjb.152.1597028387174;
        Sun, 09 Aug 2020 19:59:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 19:59:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/19] glib-2.0: update 2.62.5 to 2.62.6
Date: Sun,  9 Aug 2020 16:59:09 -1000
Message-Id: <2dc1266eb39faa29c79ab2697564072f11d3feb8.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Stable branch bug fix and security release.

One patch update, none deleted.

This is expected to be the final release in the 2.62.x stable series

Changes:

Fix SOCKS5 username/password authentication (#1986)
Exception handling fixes on Windows (!1373)

Bugs fixed:

1986 Socks5 Proxy: Authentication seems broken
1988 Socks5 Proxy: Wrong error returned when using no authentication
2049 Crash in g_array_copy
1378 Backport !1373 win32 exception fixes to glib-2-62
1380 Backport !1254 “giomodule: gio modules are no longer installed in bindir on MSVC” to glib-2-62
1393 Backport !1390 “garray: Fix copying an array with reserved elements” to glib-2-62
1394 Backport part of !1375 “tests: Skip g-file-info-filesystem-readonly test if bindfs fails” to glib-2-62
1411 Backport SOCKS5 fixes to glib-2-62

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch    | 4 ++--
 .../glib-2.0/{glib-2.0_2.62.5.bb => glib-2.0_2.62.6.bb}       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.5.bb => glib-2.0_2.62.6.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index fc320dcab8..36d32506e2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -31,8 +31,8 @@ index 1007abd..5380982 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1158,7 +1160,15 @@ get_gio_module_dir (void)
- #endif
+@@ -1149,7 +1151,15 @@ get_gio_module_dir (void)
+                                      NULL);
        g_free (install_dir);
  #else
 -      module_dir = g_strdup (GIO_MODULE_DIR);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.62.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
index e463dd9b7c..911152ddaa 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
@@ -20,8 +20,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "4029ea2df04a8d4c360e45d9e8316784"
-SRC_URI[sha256sum] = "b8d1cdafa46658b63d7512efbe2cd21bd36cd7be83140e44930c47b79f82452e"
+SRC_URI[md5sum] = "46bba5410ad4e75f65e4b2cc61a1afc8"
+SRC_URI[sha256sum] = "104fa26fbefae8024ff898330c671ec23ad075c1c0bce45c325c6d5657d58b9c"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.17.1

