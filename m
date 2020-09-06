Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.24265.1599413504508986210
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2020 10:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=LV6eI4e6;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.214.170, mailfrom: rahulk@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id r24so463110pls.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2020 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K0aUbVFCUhbBOSqYSG1aWzktNgBt/mfVOd0g3rzF0Yw=;
        b=LV6eI4e6u1lE1P1ZARbljFLn2pGcC+CxVZ0KZd87omLQy9SVbaTa4tfvU3223X7zxi
         LRIRG3QcY6GXbMq6AVoL/ytZNlIRfTm14DZxs4WA9FMYS00RYNXvSOXFcEIAIEnCilqo
         boywSqz2cvZ6GFQjbCKUPBqnN9Tsyk1SyqoZe7a27Q2qwvtj3eNR84B6hK/wrP494wKT
         ekItJUeGiiFi0XNBeS62br654jpkSAqbgtdKOSmp7OHLWiIEGKzdl+IlAKDuEmdY7g4I
         kDMabI76T24NjiCSFpz0vJHugfh7WlztkQjLG8IAcnKS9NmP63BDtTUgjOlA3odevUCR
         /AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K0aUbVFCUhbBOSqYSG1aWzktNgBt/mfVOd0g3rzF0Yw=;
        b=jOJYU9Jvj0E6Bdz3t0zGeu7mzGhGGkprVNOlOxk2/NEQ8SHDsvWCoWAs9wWReENsYt
         AR8YT6n9BU5OHhDtJq7+/kRG8WZ/2JNRDUC6lboLEF6lrMiN35NOBeOkg9/VwwSJRPus
         K2eCXeLB7JdoHMt326reaX+mCXGGVv+vUth2zIdXRg9/Da1sSLaVHbFZgvDCRT6Lki6t
         OWTlD5Ogr7MLiBvLV4TalHvMu6wSNrTCO+X8lgOPJjCECX1rwO9KDypE7WBT19Ig669Q
         RygiWxfMhcF+ctsUdUTF1YhkIB5zKVbfRA3BlKTOG7KR4oejEEswg+yp8gvn3prU0e+P
         LZVQ==
X-Gm-Message-State: AOAM530vra74o5ct6De9+i4hzG8TOrVGlfxe7/gbxLLv6NXzKhnnw5D0
	wZIroGrKak+UVU+AYvXhTmhZoI3DU27Frw==
X-Google-Smtp-Source: ABdhPJySLYO58pYSGl7uAuS3HGLu2bczjWmtCgCO6eDcPFSGrkim/RrckDET9xPYUPaqN12B8OoXZA==
X-Received: by 2002:a17:902:a5c3:: with SMTP id t3mr14525133plq.134.1599413503637;
        Sun, 06 Sep 2020 10:31:43 -0700 (PDT)
Return-Path: <rahulk@mvista.com>
Received: from localhost.localdomain ([103.217.132.60])
        by smtp.gmail.com with ESMTPSA id j26sm4165024pfa.160.2020.09.06.10.31.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Sep 2020 10:31:42 -0700 (PDT)
From: "Rahul Kumar" <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Kumar <rahulk@mvista.com>
Subject: [PATCH] systemd-serialgetty: Fix sed: -e expression #1, char 13: unterminated `s' command
Date: Sun,  6 Sep 2020 23:01:28 +0530
Message-Id: <20200906173128.17277-1-rahulk@mvista.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error Message:
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['pseudo-native', 'glibc', 'patch-native', 'quilt-native', 'gcc-cross-arm', 'gcc-runtime', 'linux-libc-headers', 'libgcc', 'flex-native', 'xz-native', 'libtool-native', 'automake-native', 'binutils-cross-arm', 'zlib-native', 'mpfr-native', 'texinfo-dummy-native', 'autoconf-native', 'libmpc-native', 'gnu-config-native', 'gmp-native', 'attr-native', 'm4-native', 'gettext-minimal-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| sed: -e expression #1, char 13: unterminated `s' command
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/opt/Projects/poky/build/tmp/work/qemux86_64-poky-linux/systemd-serialgetty/1.0-r5/temp/run.do_install.11228' failed with exit code 1:
| sed: -e expression #1, char 13: unterminated `s' command
| WARNING: exit code 1 from a shell command.
|

To Fix this Issue using the strong (single quote) character in sed command.
It is recommend to use quotes. If we have meta-characters in the command, quotes are necessary.

Signed-off-by: Rahul Kumar <rahulk@mvista.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 044c6c5b67..059fccc2b6 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -21,7 +21,7 @@ do_install() {
 		install -d ${D}${systemd_unitdir}/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
 		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-		sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.service
+		sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g' ${D}${systemd_unitdir}/system/serial-getty@.service
 
 		tmp="${SERIAL_CONSOLES}"
 		for entry in $tmp ; do
-- 
2.27.0

