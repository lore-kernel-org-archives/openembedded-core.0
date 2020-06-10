Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.305.1591811586170939034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 10:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TJ9YMZjc;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id p20so3542209ejd.13
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2020 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xtPfoyIVllIwTg/hVbZ9W9Vo9UbBEmnvENfuRA2QwXw=;
        b=TJ9YMZjcFsFrbZvUA9Jf2RzcuRm+z5r7vTCoOq7O+fpgCGh9x5pdt0u8dSH7MZPjjT
         HV0YzIntJsBnr+O9TDWHgnH7QjflbnfIXLt7Mh2bjNKI8KVHlUs9jM6M51K/B8hr2yi9
         8vGrQV40RZG7zMj/GyF/TEYi6KdGFwwDGQnnIB2W5nfD9KO4K12MAuH6Opr6BaZhC/xr
         4AQrjE6JbCchi0u2x8GaYDgk5tS3oJXcGwdhOr2hdNbx9GFoJUqiJpzzU69aLs89NBBJ
         9XmAwvBUEkjOGZSkfBANZ0J2TQEO0cRUHj0upHhUXzB4RAkPXi14pouXLIgpjTLYzo2M
         aeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xtPfoyIVllIwTg/hVbZ9W9Vo9UbBEmnvENfuRA2QwXw=;
        b=KnserXXGZGOEZwChwbSvuNvHESo31XcSDQeKyDTl828ussxkVxsvivaUUQRqRsEnhu
         vEtXYT17ucESNOE8p1eUmLYpvvvvyD1H2xhndVMgVdB+qKLKWDZkqIm2bPl9LPsJxWLt
         BUqQ6r49tZ6XP7MxtEdEAUpDI1MF0Etoas2T5NdktIlXKyUv4/3BMtVf+pgqCvJ/XS5I
         oqzC6qzbvUt8Z4a4lhLa7udcBeQceS017xkVD27my1B+AwDL5DHM3/z1gsfYow5JUCds
         /voawjY18NM74JnmP+nsdCD2u3rjrtDkaJU0nwsRILNPnyYz3AvZbhUJ98mugvSn+YR+
         A+gA==
X-Gm-Message-State: AOAM532J6UkQBC60irapB+zQJdcbU3h9fxiEHG0v5rRnW7J+pFdjxr30
	EMpbYh7dQUTD3MEsZNmwd26/dnww
X-Google-Smtp-Source: ABdhPJxStoRuBiefSV4LM6dMkYRhYq5cz9FgwCUR+PSC1hmJiLzGcd8AHG1ApCbmX9M3PVx77pQhYQ==
X-Received: by 2002:a17:906:6c82:: with SMTP id s2mr4389994ejr.215.1591811584176;
        Wed, 10 Jun 2020 10:53:04 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id j31sm200606edb.12.2020.06.10.10.53.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:53:03 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] meta: Don't inherit 'features_check' in recipes that don't utilize it
Date: Wed, 10 Jun 2020 19:52:44 +0200
Message-Id: <20200610175245.38481-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610175245.38481-1-jacob.kroon@gmail.com>
References: <20200610175245.38481-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-bsp/usbutils/usbutils_012.bb     | 2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   | 2 +-
 meta/recipes-core/glib-2.0/glib.inc           | 2 +-
 meta/recipes-core/glibc/glibc.inc             | 2 +-
 meta/recipes-core/libxml/libxml2_2.9.10.bb    | 2 +-
 meta/recipes-devtools/mtools/mtools_4.0.24.bb | 2 +-
 meta/recipes-graphics/libva/libva.inc         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

Changes since v1:
  Ignoring where the class is included from uncovered some more places
  that needed fixing
diff --git a/meta/recipes-bsp/usbutils/usbutils_012.bb b/meta/recipes-bsp/usbutils/usbutils_012.bb
index b670fa4ab6..28031e72a7 100644
--- a/meta/recipes-bsp/usbutils/usbutils_012.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_012.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "7484445cbcf04b3eacac892fe58f8d9f"
 SRC_URI[sha256sum] = "ae2e10aad530d95839b6f4d46cd41715eae6f0f1789310d793e9be21b3e7ae20"
 
-inherit autotools pkgconfig features_check update-alternatives
+inherit autotools pkgconfig update-alternatives
 
 ALTERNATIVE_${PN} = "lsusb"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 150d909d73..eee7a53cd6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -57,7 +57,7 @@ S = "${WORKDIR}/bluez-${PV}"
 
 CVE_PRODUCT = "bluez"
 
-inherit autotools pkgconfig systemd update-rc.d features_check ptest gobject-introspection-data
+inherit autotools pkgconfig systemd update-rc.d ptest gobject-introspection-data
 
 EXTRA_OECONF = "\
   --enable-test \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fb84db83c2..a0055d81b0 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -28,7 +28,7 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages features_check
+inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages
 
 DEPENDS_append_class-target = "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 23a6ca99ae..d2f02ad59b 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -5,7 +5,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools texinfo features_check systemd
+inherit autotools texinfo systemd
 
 LEAD_SONAME = "libc.so"
 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 097aceb2c0..d11b083e8b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG ??= "python \
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-inherit autotools pkgconfig binconfig-disabled ptest features_check
+inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.24.bb b/meta/recipes-devtools/mtools/mtools_4.0.24.bb
index d7cc72d172..f11cdad37a 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.24.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.24.bb
@@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
 
 SRC_URI_append_class-native = " file://disable-hardcoded-configs.patch"
 
-inherit autotools texinfo features_check
+inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index ac39e92de7..e7bec80c14 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -24,4 +24,4 @@ UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
 DEPENDS = "libdrm"
 
-inherit meson pkgconfig features_check
+inherit meson pkgconfig
