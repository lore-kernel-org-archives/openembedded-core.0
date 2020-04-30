Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.1224.1588282935796196855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 14:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="key unavailable" header.i=@gmail.com header.s=20161025 header.b=IxB55aUF;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id x17so9152623wrt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 14:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G0UPLYBEJMD8tgJfCBoDszkMxkU+0xv/bqM+PTkKbH0=;
        b=IxB55aUFCtbHlDmh94dXsDDnoHIvcIgKj9s1mFzUeUZDDptyQ8X8gq7f26lLrviBct
         j+e/unqIivmS0qN0/F2SC5TIBCR4UUdDLBNOT56YzUc1rW5lMIrDGWT8yc7uhAyQLg+9
         b9PV5rogh4aIm4kKFE6X7CJfPDLcA6D8GH4T+k+eB/6l0YOk2ZIWYgG+CxKIInbOaIK0
         lJs0G/M2p1TVQefZWEdS9u54JC+55QEKkgkDVmrDG3wmDfjkMp44GTLFgnMJX42aakVj
         /W/CG+xNH13/++YKfVrJlIbj00KAT2nY+H1jjJgsjpbLr8lLYfEf6Nn9Mz+DJMkUVcvX
         xvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0UPLYBEJMD8tgJfCBoDszkMxkU+0xv/bqM+PTkKbH0=;
        b=Q/IBu9qL913YAQE0zX7NaQhN/ecfzZa/aIK5l4NoS4uUHWKNf/WhOxal02uZ2DaLlt
         sIhsZBErWXaKV0z9wn8/n8QfnNMENK0EYz4Zl7mLv0kuIVCDrj6wOEx78yFs+/q1e9j2
         gde2wTOChKkzjKZKCz0b+rLqW5G+HjQouI3cKOIAWG0POPKpepESA/6mhbdnNuT5zEaz
         lEcqE50cH2gBPlVGcZBzZ+Vno1g+Nb3ywX6Z78YFwKIaBypg3GPvhkW83CEwjsZ3O/qE
         sMjDGp9s1PJCqmccrJx+fQKSGBrDgrk6mO5cseHLz/jNL+w7x6Dblxoahb26rLkr+7oP
         SVHQ==
X-Gm-Message-State: AGi0PuYd11GAvJdi2tx5WmyCWB5dkEw9O2ATAX7JyibJcgXAbR2qu3qj
	8x8EZVUnngWVqoeUbyS8DgGOKraE
X-Google-Smtp-Source: APiQypK/dpin7ouzPYHW3+mWtiCZPuFCyw22QWc/dfEcZ8Y/g8SlmFaIVl6DOj1NHBql+qLdtw7dSA==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr547901wrm.337.1588282933909;
        Thu, 30 Apr 2020 14:42:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED4889B49C017C853F8D3.dip0.t-ipconnect.de. [2003:f0:7f0e:d488:9b49:c017:c853:f8d3])
        by smtp.gmail.com with ESMTPSA id q10sm1421069wrv.95.2020.04.30.14.42.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 14:42:13 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
Date: Thu, 30 Apr 2020 23:42:03 +0200
Message-Id: <20200430214203.26595-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200430214203.26595-1-schnitzeltony@gmail.com>
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

0.20.3
 * secret-file-backend: Fix use-after-free in flatpak [!52]
 * docs: Add man subdir only if manpage is enabled [!51]

From [2]:

0.20.2
 * secret-file-collection: force little-endian in GVariant [!49, #42]
 * Prefer g_info() over g_message() [!48, #40]
 * meson: Don't specify shared_library() [!47]
 * docs: Make sure to set install: true [!46]

[1] http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libsecret-0.20.3.news
[2] http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libsecret-0.20.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ibsecret_0.20.1.bb => libsecret_0.20.3.bb} | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.1.bb => libsecret_0.20.3.bb} (63%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
similarity index 63%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
index 72511af02d..d3a0c2ff54 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
@@ -7,21 +7,24 @@ LICENSE = "LGPLv2.1"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+SRC_URI[archive.md5sum] = "47c3fdfeb111a87b509ad271e4a6f496"
+SRC_URI[archive.sha256sum] = "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
 
-SRC_URI[archive.md5sum] = "d2dd660a8d502099317bc8af9f30302e"
-SRC_URI[archive.sha256sum] = "57f73e94ec6263a17a077fb809cf8cf424637a897a7f15b4eec42ce4aef52447"
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+PACKAGECONFIG[manpages] = "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv6 = "arm"
-
-# vapigen.m4 bundled with the tarball does not yet have our cross-compilation fixes
-do_configure_prepend() {
-    rm -f ${S}/build/m4/vapigen.m4
-}
-- 
2.21.1

