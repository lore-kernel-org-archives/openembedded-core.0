Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.3211.1622061640730335909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 13:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oItNgrch;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id j10so3091760edw.8
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KfbDfo347ISlb0o/9GfZunydeAmwP+6RGp87rnmEwHo=;
        b=oItNgrchOMcaCtcrSzUOjGsyT0UJikp/hDGsZ7eUL5FNX+V/hN6Aqw1kKvNOrH9iCD
         l8fTe4E2Flk8IpDonRqYlag0d+MIq62tZTPA2varXqA8r2kyuld4NrZMTTp4uU9SaVu0
         DFIjc7kVuLxXewyIGl5rcs8ci5PDOiqRkZe19KuCXhJRQRuUL9JLR4FoQxXlm+bqEA24
         qiXInnyahTvvVekfKwClBatthL6q/M3bayimk9tJiS4jTgYaGHVtsNEuTuMkjPNFNtyJ
         yUIZXFZX7giU3qvu4mnRYvG343lmLexWD0jFYJ8W4QW5eWlyoaYGzQOP09dPEVrpqY+L
         9y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfbDfo347ISlb0o/9GfZunydeAmwP+6RGp87rnmEwHo=;
        b=lCPwOncN2GU2q4Q+beGzkF1qT9lJmx+khR0ypd4tKV9QmZOpfeuSVQh10pIFci8/2P
         zywq3FpYi6jnWPL1MJOcbGHFqLJW1V+HJleqwJESLrExDXF6ZzTyJuXly8EctgYi7Exa
         7xkGSyEc4Knnl2QE1JaDJDNBTi6y8pHS8LpfnS71yfBfTu0fnHA+5M4AoQRx8QQcs7PQ
         p8sdaypiYwDO6lfTnLqTmn2zxD5W7tf0qwSAqIH3XLs1TSzLlk5ENboBW8i7vOqh1oYi
         QF1nI2TUaszTnguhpHqtOBeKl0bGIt7jPQviFP//G2f8x3J0WVN/I0tHHUM1pU0uCxmi
         Agig==
X-Gm-Message-State: AOAM531uSDkj3bM5FCZ9FsE0LYsNUBrTZDuvUrWviD+8MeNgP3xwaP0M
	Xi8lN1KafJY2dEFuz8Vr5b6HUiV+t2U=
X-Google-Smtp-Source: ABdhPJyZSKRCux479IfRz15fWByhR4+wa6Ei2RA2FdXKvY1PCjHyKusAQzYZY+V837lTbBYlQfr8bA==
X-Received: by 2002:a05:6402:50d2:: with SMTP id h18mr127368edb.10.1622061639059;
        Wed, 26 May 2021 13:40:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id hb14sm70184ejb.118.2021.05.26.13.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 13:40:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] ptest: add newly discovered missing runtime dependencies across recipes
Date: Wed, 26 May 2021 22:40:16 +0200
Message-Id: <20210526204018.496352-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526204018.496352-1-alex.kanavin@gmail.com>
References: <20210526204018.496352-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Making ptest images based on core-image-minimal uncovered quite a
few missing depenendcies from various recipes, here they are.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.21.bb         | 2 +-
 meta/recipes-devtools/python/python3_3.9.5.bb     | 3 ++-
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
 meta/recipes-extended/parted/parted_3.4.bb        | 2 +-
 meta/recipes-graphics/wayland/wayland_1.19.0.bb   | 2 +-
 meta/recipes-support/libssh2/libssh2_1.9.0.bb     | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/gettext/gettext_0.21.bb
index bc14867bbb..b86e8d8381 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -174,7 +174,7 @@ do_install_ptest() {
     fi
 }
 
-RDEPENDS_${PN}-ptest += "make"
+RDEPENDS_${PN}-ptest += "make xz"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
     glibc-gconv-big5 \
     glibc-charmap-big5 \
diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
index 82177f4a18..f4002f2516 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -344,6 +344,7 @@ PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
+INSANE_SKIP_${PN}-ptest = "dev-deps"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
@@ -367,7 +368,7 @@ FILES_${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ctypes_append_libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter tcl', '', d)}"
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index ebbd83dd3f..d0c60d0a3d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -130,7 +130,7 @@ RDEPENDS_${PN} += "perl"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " bash coreutils file \
+RDEPENDS_${PN}-ptest += " bash coreutils curl file \
    gdb libgomp \
    perl \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index c15f5aeb0b..fb583489f8 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -47,7 +47,7 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make gawk e2fsprogs-mke2fs python3-core"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make gawk e2fsprogs-mke2fs python3-core dosfstools"
 RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
         glibc-utils \
diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
index 7e8a2884fe..0fda80ccae 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -59,4 +59,4 @@ FILES_${PN}-tools += "${bindir} ${datadir}/wayland"
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS_${PN}-ptest += "binutils sed"
+RDEPENDS_${PN}-ptest += "binutils sed ${PN}-tools"
diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
index a5451628e7..f290bf3268 100644
--- a/meta/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGI
 BBCLASSEXTEND = "native nativesdk"
 
 # required for ptest on documentation
-RDEPENDS_${PN}-ptest = "man-db openssh"
+RDEPENDS_${PN}-ptest = "man-db openssh util-linux-col"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"
 
 do_compile_ptest() {
-- 
2.31.1

