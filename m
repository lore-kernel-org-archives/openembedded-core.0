Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.3883.1603919171341614400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uIyZwuKF;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id za3so896087ejb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lyq9ruICk6Lz+Nb+C9DU29fBEVIAd+rwaner8tORTIk=;
        b=uIyZwuKFB6D0uNCxc7io6G4Cv4A3VJavJC8xXdvRfxs/pjxumQKa/cLdPz27M8nmth
         2JgzfeZx4GgRHcmrcJPitx0JM3BqhP4AsLHbg2LlU7jUws25Qmams5UmOysvE/njK7pF
         vtAMsh6DO91bsSd0yt7ppsk2uSYMa+AvYf7/FoOTxbQ+kuHagMrhDdZl3qvMKJpK/3RD
         pC+9103Bd6rGJVRQlj8uia4DLJiD1nJIG2SvflDqk4wKj5FaG0SOEyyfI4MZP+cz5a5o
         w0BVTI1l0p+1mUxcxrmdUylbZkM4pzeF47bqunI1nfrPignwPDspgtD5oUoNevtCkL2M
         kPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lyq9ruICk6Lz+Nb+C9DU29fBEVIAd+rwaner8tORTIk=;
        b=fvf6ZTWXBmClrFnYRkgwPIEJTMes4M46cX5GBda9M+APzmzlVTUlyip9ToojigajwT
         d2JCGi71OdcHY51w7ZjA+E702JQmaWTjbcWxHQ8WkM0bRRPMWi50YYE0mhyqH4CCxkZ4
         CJeviQ0r0+Fv4pUtkUfToN+jCV4O6Mmbt9z9KCuE5aXtbnK6WxcR4NmvVV5sjaBYE55S
         xT43W1E4l23onmW24jMYYZ9aWsVTz/1MriQtapCKeMtxJBbdnairclkCq1M2ZH2NP9m1
         OyTyYQ3wODODjEK0vfCQLSvB4B4dwobT2mnM0+ddGD1Lm1usaiZtGTL3is94z71QFqW8
         w3uQ==
X-Gm-Message-State: AOAM531YCFjJlADir/9kNjHTfA3GKTyL3qQvbUfbjsZCuJwWPh5savPl
	suMCTR9QvLBtjXNVZUcMuNhepiyCDkX0/w==
X-Google-Smtp-Source: ABdhPJweHRCch8bmNvsoXr0NDgzWTtHLZGrgG4idrevYb7ARhiREM9lOPyeuDOWr0yY9lQzFgyY4dQ==
X-Received: by 2002:a17:906:6cb:: with SMTP id v11mr1001899ejb.31.1603919169659;
        Wed, 28 Oct 2020 14:06:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/33] python3-pygobject: upgrade 3.36.1 -> 3.38.0
Date: Wed, 28 Oct 2020 22:05:29 +0100
Message-Id: <20201028210558.21070-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...thon3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.36.1.bb => python3-pygobject_3.38.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
index 0a34d4373f..b4427050f5 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
@@ -14,8 +14,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[md5sum] = "ebfebc4533856572281add29f08412bf"
-SRC_URI[sha256sum] = "d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f"
+SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
@@ -27,7 +26,7 @@ RDEPENDS_${PN} += "python3-pkgutil"
 
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
-PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
+PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo python3-pycairo, python3-pycairo"
 
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
-- 
2.29.0

