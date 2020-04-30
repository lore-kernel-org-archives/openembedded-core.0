Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.3977.1588240711455346740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qJSXI8kE;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id g12so1177891wmh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vq+tmhbs0Q/savfSLWs/7Ixxnzl9xlWd+ZE4N330pp4=;
        b=qJSXI8kE8wvhff4EfvNsyGpftMTLcZ54R1PMmag923S2uJzbnwhFFQt4fD1yjKp30u
         unawlznlvTyZ+rKisH2yIPj1DLvPVSu97wLl4NFtO8dA1fc2XSFdVC8Y8+jXIrlSfYLu
         fYo0BWtQdXEP8/em4czBzjMvCzc0MLo5IQRx0yuluyM7niBMHaqOtBC06MdKKNw9WCyF
         YL9FYgy1sG4ANhQN9c6nzmA9DFFMpkeUwJ4+91Rml8pGVLXAAL7duwaCwDWljlACjbIL
         CpWARRdSahdCgjNFsIak7AmyoixQpxGa4LTAZCSqpZfjBiV5iN9RDswkg2IasBOA5Gic
         Ya9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vq+tmhbs0Q/savfSLWs/7Ixxnzl9xlWd+ZE4N330pp4=;
        b=Vj/ad0N+LYV96EOasK2ullDKXw/MoRp0abw5nHD2D15kCfi/Blvllz7wCjAw7XT2hT
         uXwNu40JIBsU913f5wWsMbGFX96RHWqWIdNmN1SLLEDHLsRMbz3dmBQHeU3pZlMVAldr
         Me9RXdwLtAK4AKOq0P5CTL5ql599Nn5c8g+DGz8eWyUIfd/klx5ikXSc0LI66NhXiI8U
         dNOwvbr4c4SDISrUpzMgLR8MPaZpP9bwcf3MJBvtBj9blHHPgmQ24bEzZQ7JZvS8JKYO
         dQQ71ioUDVgLNiNlR6K7gSkRzgfsfzgh851khg7O9Fle50NOPtW66D9ErrZ8YpmNZhzA
         d9og==
X-Gm-Message-State: AGi0PuZZSxYCEr+wVGrbUI65by8EjiTFH3QwsiRgUklmnicH3xGDTg8+
	YMwmbMnym13O1bS5WXWQ+wI3T8IX
X-Google-Smtp-Source: APiQypJV1THwADfdVGldvscKLxyiyA4t7BrQor+Qd52lKYWHWJn5TwrsfukGCnqJNoejbeUi/u53Vg==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr2210192wml.144.1588240709264;
        Thu, 30 Apr 2020 02:58:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/17] libinput: add ptest
Date: Thu, 30 Apr 2020 11:57:59 +0200
Message-Id: <20200430095815.2824-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test takes about 17 minutes, and fully passes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc  | 1 +
 meta/recipes-graphics/wayland/libinput/run-ptest | 9 +++++++++
 meta/recipes-graphics/wayland/libinput_1.15.2.bb | 8 +++++---
 3 files changed, 15 insertions(+), 3 deletions(-)
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
index 810532774e..62dc9d2f0f 100644
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
@@ -20,7 +21,7 @@ SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-inherit meson pkgconfig lib_package
+inherit meson pkgconfig lib_package ptest
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
@@ -30,7 +31,7 @@ UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
 EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} \
                   -Ddocumentation=false \
-                  -Dtests=false \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true -Dinstall-tests=true', '-Dtests=false -Dinstall-tests=false', d)} \
                   -Dzshcompletiondir=no"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
@@ -38,3 +39,4 @@ RPROVIDES_${PN} = "libinput"
 RREPLACES_${PN} = "libinput"
 RCONFLICTS_${PN} = "libinput"
 
+FILES_${PN}-ptest += "${libexecdir}/libinput/libinput-test-suite"
-- 
2.26.1

