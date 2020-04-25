Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.334.1587835713849237028
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hO+gGfcc;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id y24so15454100wma.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vq+tmhbs0Q/savfSLWs/7Ixxnzl9xlWd+ZE4N330pp4=;
        b=hO+gGfccDRAdYbKEik8l0DgBCpxA6Yp303GOXQnRAh3tZmvOGcJcNSqBAHk/FdQs+r
         F0S9i7wgukepW/WJpVu/aElJFSUPft1WBN6ReAzKux1zGDzKLZ6N/m90GAH4lUklBkBX
         0M0BAZs71T73NCEazpL5VEeK3vmd9v65JMw74wTcBnTqTYiGcLvL5XuoeNQryYPC5mW4
         G1UMk7AHXxKqT+wkxQfQEZ7HA+ZD3FxymIQlpbjLXk1NGZFXbM/F7EiRqFMb0jICNAGQ
         0D71psnJRZLtEeT1JipVeYllaN99AgPCJNLzD+yfzDSGggZe4GDwvCBjckuaD2hKm+si
         UW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vq+tmhbs0Q/savfSLWs/7Ixxnzl9xlWd+ZE4N330pp4=;
        b=S/NUH4RQX1awgqD8dU+TPEPq1XL7loavzR08jgk/UPW8FIfphJRom0uDVOMslg5GfZ
         eZRxzOlfMYxqou06KOXEcBVAYq7yTrWBhup2PtPxOcYNzt62J1fz1g2mTZ1Kdr7WwwzB
         ElVe7sy3aVFpK5BmNBnU/oItB+MDsvvdGnwC0JRxVvQ1/+sCQzIZ8LUich2YARRH1uct
         ZqgXZPPy0PTN6v3pzcdxtRof1xJ97j8ZA4ANUmbrIccRL8zXAl8gzD0VtLEZjy9fmCo6
         S53I9pE8yGL1Wt9WxB8B2URRAKzUdRP5Cg0byo2rCCKvzc9xJX13pdoshITLT6f3bVoZ
         oRKw==
X-Gm-Message-State: AGi0PuY8PaJTwoR2Dv2NiK1i8uuyvB7zaJckLV7LNPb8jVztAh9rx7f+
	VdS+KqfQGaV3Pz+8okb/4162OBJ4
X-Google-Smtp-Source: APiQypKmX/a6f6M/rqm7hRT4VHBOj6k9YqLCPdphApc1bO+v0X7Yaju3HTeoP0Kmta/kJog8L5OgRg==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr17305989wmi.147.1587835712135;
        Sat, 25 Apr 2020 10:28:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/15] libinput: add ptest
Date: Sat, 25 Apr 2020 19:28:05 +0200
Message-Id: <20200425172814.27370-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
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

