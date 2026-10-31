Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.643.1793418617023625236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ED8MAhqV;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1846bc43c28so1609120c88.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 20:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793418616; x=1794023416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YuM0f6ylzfairJwcLPcwlFJZmqp6WYZ2TVp7tHHYreU=;
        b=ED8MAhqVWFI+EbFcvJ8A9pEm6s670ZS/vxNsX5+1aZdnPvyc/v2682FrMtr4YV6c3P
         ft+ja6mFyzndgi4kvNPWaYz/Y7bJeGVBaoUvZcdOSd1s9S+1b5UAGyoRCOF+y7VC8DNW
         cvYz5SpFiFOGZoKz3ci4bairhs/5brT2uhIwnQmKiAB+6gNKqWEPchrXBgWO0lN7lVpu
         E3oFnpQGlic3BcGu1tmxniz/d6HFThmn9g4CDTemFSQ5/JPkY5WNRcTK/jDId2XJPk/F
         EpiX0Z84q7gm43qtB9zmS2nRfErm/nzNuBKod0ELtIzV1+wKQB2xq3KfgRq8ufJYJFft
         D9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793418616; x=1794023416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuM0f6ylzfairJwcLPcwlFJZmqp6WYZ2TVp7tHHYreU=;
        b=iyBXuFs8Jr6+D8VtC5Wkla6SUXCCJfXtU8I/5dD2CtSJuGslPPuUFnWJTHFM/7T0Nt
         Q0/LcbJOFNYKHJuyGF6IYkNWYcAFFMqaTvhGK134XohSIq7DpptRX+f7LBT/Or9tFA+R
         ANE30ht51tRwulUrcpycFulRrmnABceQT50IBXCDXuMXMMzyVUSY4FIV3Gbm1PdE3gIz
         qk14d4xy2ikSj9fM8ye5Vx7Sy//1ndd6FsU6522KiaKDaWugpZp7S+gZv02iXbK87xec
         9PJJWIsbipk/RyQ8J2pFrXRExgGMOg2MfCjhhSlL8CVk7MlBXspwbiHrTi7MtauLPWlC
         Le/A==
X-Gm-Message-State: AFq9FYIrKFX4+BtB8QeRipdaLwRAJjguADnykRFOXURRPONnG5+I5RMI
	vrperMe7bxNS2fmTJsNKYEg3nxfJk1C4k9KLclRGmsidaCf0W2pj+q0zdBFYvCv07Nw=
X-Gm-Gg: AYBFou2bKFLwn8hMBEBhQooLen5iYx4ER9+wprcQSiXTx/MFa5n8rqIKvV0mSFLCi2f
	v0KM1Is6zwMUKtf5FGO+f4SjOaMJkJegXaRKTVMT0lABoUApxvhlLpOfdzYMMpQvXdm1fWd+8iV
	Zi3PDYPrzbyCUKIEAV4vtqkJEfIQbDRK7AbPCwt6onwufQfbAUYRcKkfEQZPoUspONmXBxaqCAh
	C01dKsDqqCbpLOUav7wLirVuRP4CteJrclD6/cmAUL6ECsh5cBJHlTG6nHLBQzXiCh56Y1Qs2Zz
	mnCzwIMJSYHsJNXrYlHiAvrtoID0lIDOZgCSNgf68NQxWgrIfG8StMKcHbl7tUKrQE/pEQIW+hV
	7Zeqznt0r5xT17a1FB3qx/R9S6PPDnxYVQOTGUapO+9OtAmuutxq9s3yD3mZpO5OWPAK4bgYdwI
	6KHXDZVxpSRcl1mB63eMTmvnzTLP6ktF+gI+5OyxjGUnpdJnUFhWQhfWT7f3h3oCi4PZ2Gj2U3s
	B5qR+zTj0i92N2ttwv9hWjelkQNXda8HGidX6DwBZISq2XZQkIwVnmtx6BY0LeGhf5ogmrSqSTr
	Y4R39X/43Yh4N3K+qe9Unprv9eTL/sSvrez101PlWgahk9FvgwIqa/nS1Ws0bx6c0dorWpoC+bD
	sKYQtjuqkxIluYTMBVydfuor9OLwd5mPHI6yjleCv20R/WrjDH+quxg2YAArEBZfb0nbBq1Gbly
	571v3G0qBUohIkOvw4QDu+cJE0yCTfL2zrozTscqzVYVa+8/ZgRw0HWpI+pDxbnfDI2VjZw/3WR
	RmHNnfc19t9FZZ16o9aYsh/hFiMDU84eOi3mGal/TOYv/SUi4LDDV9LOcGgCwSmh6YiOmGF7jiX
	u9iH
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr5718457c88.27.1793418616077;
        Fri, 30 Oct 2026 20:50:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm12958201c88.11.2026.10.30.20.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:50:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] tcl8: Fix http-4.15 ptest failure
Date: Fri, 30 Oct 2026 20:50:12 -0700
Message-ID: <20261031035012.2124098-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 03:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249132
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

The test expects the DNS lookup of the bogus host not_a_host.tcl.tk to
fail, but tcl.tk now has a wildcard DNS record, so the request succeeds
with a "301 Moved Permanently" reply and the test fails. Backport the
upstream Tcl 9 change to use a host in a non-existent TLD instead.

Tested with core-image-ptest-tcl8 on qemux86-64 with glibc and musl.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...t-Do-not-rely-on-tk-TLD-in-http-4.15.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/tcltk8/tcl8/0001-http.test-Do-not-rely-on-tk-TLD-in-http-4.15.patch

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-http.test-Do-not-rely-on-tk-TLD-in-http-4.15.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-http.test-Do-not-rely-on-tk-TLD-in-http-4.15.patch
new file mode 100644
index 0000000000..28eb6c9436
--- /dev/null
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-http.test-Do-not-rely-on-tk-TLD-in-http-4.15.patch
@@ -0,0 +1,35 @@
+From 54accd2a65ec689be9f0bbed6870d231a8d35f90 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 31 Oct 2026 02:56:00 +0000
+Subject: [PATCH] http.test: Do not rely on tk TLD in http-4.15
+
+http-4.15 expects the lookup of the bogus host not_a_host.tcl.tk to
+fail, but tcl.tk now has a wildcard DNS record, so the request
+succeeds with a "301 Moved Permanently" reply and the test fails:
+
+---- Test completed normally; Return code was: 0
+---- Return code should have been one of: 1
+
+Use a host in a non-existent TLD instead and increase the timeout so a
+slow negative DNS lookup does not confound the test, as done upstream
+for Tcl 9 in [bbaf69c3dd].
+
+Upstream-Status: Backport [https://github.com/tcltk/tcl/commit/0a97f6d1c55f4158bafd1539dc1b20cce6188857]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/http.test | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/http.test b/tests/http.test
+index 6406675..d6b3537 100644
+--- a/tests/http.test
++++ b/tests/http.test
+@@ -624,7 +624,7 @@ test http-4.14 {http::Event} -body {
+ test http-4.15 {http::Event} -body {
+     # This test may fail if you use a proxy server. That is to be
+     # expected and is not a problem with Tcl.
+-    set token [http::geturl //not_a_host.tcl.tk -timeout 3000 -command \#]
++    set token [http::geturl //not-a-host.nodns. -timeout 30000 -command \#]
+     http::wait $token
+     http::status $token
+     # error codes vary among platforms.
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 5e296cc7e6..8d2aa34acb 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -23,6 +23,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
+           file://0001-http.test-Do-not-rely-on-tk-TLD-in-http-4.15.patch \
            "
 SRC_URI[sha256sum] = "1880b6337de72431174511419550bb4cf1327b7c8200a5466d1c4eb3ecac5132"
 
