Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.25487.1588523191646223460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hw8WTnQh;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id d17so17954771wrg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgEwRn5LuE9OzUJG+FV81HW7t4Z2QtolTffugCtYTyc=;
        b=Hw8WTnQhFKe2zLVZ3DngJAKKcx0V3h2KH69DfZTj/aRQxyEunqCu6N/PsNw5ORg9pE
         Upxj+zIXuxh04eSakP575VysKVW9YwShgEONs9C4pp1f43jeZKanhOGCcEFJiAeVXC2x
         Ra7xk8gWZi/ViQbJ2s48y8VGA3uwM+8BybIiyCwUZjGB3NaMPEWJaqmQ8oviFv9hWO2R
         iQ5Sql51DECUM8Xc89tpxhOeOu2OAWCZzgeBepP9LqGU+x8T62KpxzJKf/MqIQMs7qix
         SejVJmAiJM/MKfWsSL7ra+IpyX1BoXt6WmU2iw+WWatuS7xlG2iOuDzw40ZgsVlcet1B
         ilEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xgEwRn5LuE9OzUJG+FV81HW7t4Z2QtolTffugCtYTyc=;
        b=hg9tZfkhQSIuQetoORVEk9BmzGCzIVbrTvSm55QFSiKIk/judFxIuRSj0t0xRAeTHY
         XB9cgWB9IzNPGd9xsszhfZ2Vsesch8qxJlSs99GllWoTi1BN2OPiX2Ore1ORimK/I9Lb
         26MCpce82mosak4i0q/U5lurjiUCcHMBDLBPcoVdNcnb+sPBy8O/hRWhZ7WVOQPdpTsU
         w6sSbqUwG12lGE0tqfA+dNLAsedbESZ7+sBXbkUgHkh46EAGFopT8tVOAv0HLxBTNRV7
         IRzSDEFggAlvm4BYMQUs1l3JT7GA/8yAObQ2K9Aw7nOUM8wPDnkOvoB2BTha2rkUDN7J
         pshg==
X-Gm-Message-State: AGi0PubrmuffLYI2BSqJbrmHLTPmFi39SEVrFYMlUOKvRovHusSWjyLS
	8JC3vGYRrIaDUak5KPID9WHrC3Nz
X-Google-Smtp-Source: APiQypJiMh/RzVPS8MfUZ7P4NKUjTlmRciehvMj8kyiFd4Qp0qTN+D7qJX0uOW2zzkrTLHSIb3JA4A==
X-Received: by 2002:adf:a704:: with SMTP id c4mr14314876wrd.303.1588523189679;
        Sun, 03 May 2020 09:26:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/17] libinput: add ptest
Date: Sun,  3 May 2020 18:25:43 +0200
Message-Id: <20200503162559.946-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test takes about 17 minutes, and fully passes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc  |  1 +
 meta/recipes-graphics/wayland/libinput/run-ptest |  9 +++++++++
 meta/recipes-graphics/wayland/libinput_1.15.2.bb | 14 +++++++++++---
 3 files changed, 21 insertions(+), 3 deletions(-)
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
index 810532774e..31652cc342 100644
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
@@ -20,7 +21,13 @@ SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-inherit meson pkgconfig lib_package
+inherit meson pkgconfig lib_package ptest
+
+# Patch out build directory, otherwise it leaks into ptest binary
+do_configure_append() {
+    sed -i -e "s,${WORKDIR},,g" config.h
+    sed -i -e "s,${WORKDIR},,g" litest-config.h
+}
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
@@ -30,7 +37,7 @@ UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
 EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} \
                   -Ddocumentation=false \
-                  -Dtests=false \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true -Dinstall-tests=true', '-Dtests=false -Dinstall-tests=false', d)} \
                   -Dzshcompletiondir=no"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
@@ -38,3 +45,4 @@ RPROVIDES_${PN} = "libinput"
 RREPLACES_${PN} = "libinput"
 RCONFLICTS_${PN} = "libinput"
 
+FILES_${PN}-ptest += "${libexecdir}/libinput/libinput-test-suite"
-- 
2.26.1

