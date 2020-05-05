Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.7078.1588683724465329741
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSYDURs5;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id z6so2252587wml.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEocnxp4PJ6PWGZiNOMXu7yPytWXWMcFJjI/sXJd5qY=;
        b=HSYDURs568G7QG1907YzWOFfW2vCLmM1qbo53RhXtwOMC+K3Mree9HOg7mzU+5E3Ac
         hUF2kwOKLXNsIcZtOlRbRPXR7Eer6CEqu7XtLKUm3ntPzRpyuWxcTlsIOUZ4qgL7UcDu
         IDaEfIgK9LYMj/11hyAJU8v6ZCnK+BDWNQC9JX+NRrpfKGh+HKoVE+VqgMFM0pGpfexq
         0WPR97fFsHMcYEcn18J0J8bJtW+T5eqqoIGLHIW6YZ6dQHk3cwj6wCPmG8JsTUEOyCoq
         MNBoPgY0AeXMbzCUAwPm8o2ZoLvj+lSx9pFjVFh+w+M9Lc4s/KFAZVa0c5flYJgM1eCE
         4rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEocnxp4PJ6PWGZiNOMXu7yPytWXWMcFJjI/sXJd5qY=;
        b=brLr4tngWOmFL3vfbS7rnTHZQo1lz6/StlW9YTDDaEmltxIR3nv1SnQ4egMfA4HEHR
         jswLX8pbD8/VQsodnb/JYIdxF8DWdjoBcdtJTR7BWib11s2mRxfJiCUO6cPo9lGIwdhp
         OubDJSwiQOf7BKO1nxJiLPvE1Tz2pdZj4g/0xk0VZPgNSARq7Sowm10gqor+Wl3oSMBF
         PFiGackbJ4WKxPGlbipJOWhex74/QcJbLSlDRF9FM7BGO/0OzPIMIM8XXiPqPBDDGuf0
         Eoqa/lr3kQcNYkNtS7aKhOo/5aQ8p9s3pWaLCNU51aZOnT51AcCYVq3lNE89bN997BMx
         eTiQ==
X-Gm-Message-State: AGi0Puba97hhspaOpZXKBPxsmCY9Ch1J8dcp8zQnL8owN6gV2GlnayME
	Is8sK4iTxU/iCON1/p5ASOuWK751
X-Google-Smtp-Source: APiQypLUCTeIjGa92HnaOdhG20qc1swUEOpPrpZ0Ytx4ze8eBk+Sny+lKjacUwf05Jpw+Y9SaDL5XA==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr1197051wmh.78.1588683722567;
        Tue, 05 May 2020 06:02:02 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/24] libinput: add ptest
Date: Tue,  5 May 2020 15:01:10 +0200
Message-Id: <20200505130133.24930-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test takes about 17 minutes, and fully passes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc  |  1 +
 meta/recipes-graphics/wayland/libinput/run-ptest |  9 +++++++++
 meta/recipes-graphics/wayland/libinput_1.15.2.bb | 16 +++++++++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c13ff724b1..ab44757a11 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -72,6 +72,7 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
+    libinput-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
diff --git a/meta/recipes-graphics/wayland/libinput/run-ptest b/meta/recipes-graphics/wayland/libinput/run-ptest
new file mode 100644
index 0000000000..5a84c568b9
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/run-ptest
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+/usr/libexec/libinput/libinput-test-suite
+if [ $? -eq 0 ]; then
+  echo 'PASS: libinput-test-suite'
+else
+  echo 'FAIL: libinput-test-suite'
+fi
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
index 810532774e..fd236f75dd 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
@@ -10,9 +10,10 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 
-DEPENDS = "libevdev udev mtdev"
+DEPENDS = "libevdev udev mtdev libcheck"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://run-ptest \
            file://determinism.patch \
            "
 SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
@@ -20,7 +21,15 @@ SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-inherit meson pkgconfig lib_package
+inherit meson pkgconfig lib_package ptest
+
+# Patch out build directory, otherwise it leaks into ptest binary
+do_configure_append() {
+    sed -i -e "s,${WORKDIR},,g" config.h
+    if [ -e "litest-config.h" ]; then
+        sed -i -e "s,${WORKDIR},,g" litest-config.h
+    fi
+}
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
@@ -30,7 +39,7 @@ UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
 EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} \
                   -Ddocumentation=false \
-                  -Dtests=false \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true -Dinstall-tests=true', '-Dtests=false -Dinstall-tests=false', d)} \
                   -Dzshcompletiondir=no"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
@@ -38,3 +47,4 @@ RPROVIDES_${PN} = "libinput"
 RREPLACES_${PN} = "libinput"
 RCONFLICTS_${PN} = "libinput"
 
+FILES_${PN}-ptest += "${libexecdir}/libinput/libinput-test-suite"
-- 
2.26.1

