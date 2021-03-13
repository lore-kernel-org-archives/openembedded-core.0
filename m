Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.2550.1615661499527967625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ML8o4Bg/;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id u198so25452727oia.4
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fOhLx4upHv/aI7YXCEIUwJ850SBkzDndt2vVsg0S6oo=;
        b=ML8o4Bg/fGboMO5qe3cdVfgF8QkCXlllYjp8hPXG79lCYCJ+244kDP0m3EnEqi7hov
         xxNDMr5QVQLzsqHD8z9FRfhognvVAG//26DL0AHkUEzcDlFS0vk+n8VFmDrSPcTW+vKO
         TYOMR4mbqSQ8usML0OixwS3ahQQdQYUi0sjqxmSgqyPCDQq4Wq40VAM9XmSyv3Wn1KjY
         UZprA4wQXGrFv9UBqi0qBZ3CKM3qsKXz7F7ax4qBOxfTmg4EsnECaXbRorbswT9lTHxe
         8LArNc4OlaHs7wpV4D8Un2lbC9ooTVYVPkQvEqVeAVa2NkB4wjjcCu+u8M2w8eIKCn0W
         8hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fOhLx4upHv/aI7YXCEIUwJ850SBkzDndt2vVsg0S6oo=;
        b=EmMu0LSMY2SHjYQtM9c8AbQoJYpkEUXU5uweKOFap8rOUH3/ISyJvuzfqqPAwggk3X
         ZM3B6IyjrGIBm9BF7FHHIEqBirtNMdJGAMtwHBUfjcqHszS2CEmFgHuNUzNXmqYh901D
         EzpHf8KkKfHKy7stDWU4wR/TFExTabjgMUE95QEW0OtOVQ1R7DEH5L80W/h26KXlu+tw
         cXpyNgJjTVr0/pclsOHWnaKRCtZZpVyL5gQTl2aIDS9/XVwl9RJw9V8jitWtkwrnuytD
         sg/z6+6tAJackKKgGzB0xDxepiamSlvqWpwBSKmntvjFEUchO037E7Z0RVFCCx29LB5V
         laxQ==
X-Gm-Message-State: AOAM530AnpcxvopEILAmPPvhTHVm3wDLlnf5Z/HdWUNozFVJfq530w+E
	3MDCeAcxbXHIC3JkfmCHYMItwQu68nIm+GCB
X-Google-Smtp-Source: ABdhPJxt5cdHSBfOGvawmlPZ9jd1OwGZALwHsMv23QJ231yxJsZDFYC/jnw4NExctv3prlv/phxfoQ==
X-Received: by 2002:a05:6808:d48:: with SMTP id w8mr13329770oik.166.1615661498426;
        Sat, 13 Mar 2021 10:51:38 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/38] meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:10 -1000
Message-Id: <a6f1da03c9534c3ea1607d479e08d1037688a59f.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda Bassey <dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7290b773486da3888f848abf0dba747f2d9f42e1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb    | 1 +
 meta/recipes-devtools/python/python3-pygobject_3.34.0.bb | 2 ++
 meta/recipes-devtools/python/python3-scons_3.1.2.bb      | 1 +
 3 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
index 9d0666a5c1..45167d52a2 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -1,4 +1,5 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
+HOMEPAGE = "https://pypi.org/project/Jinja/"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
index 6babf0cae8..29825492b9 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.34.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Python GObject bindings"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/pygobject"
+DESCRIPTION = "PyGObject is a Python package which provides bindings for GObject based libraries such as GTK, GStreamer, WebKitGTK, GLib, GIO and many more."
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
index ce117a92d4..12122131a5 100644
--- a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Software Construction tool (make/autotools replacement)"
+HOMEPAGE = "https://github.com/SCons/scons"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=e14e1b33428df24a40a782ae142785d0"
-- 
2.25.1

