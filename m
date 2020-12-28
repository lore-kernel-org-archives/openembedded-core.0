Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.4116.1609193788783812823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tE2dQ8WH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id v3so6237226plz.13
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KDBk6N+zGzPLqCJpW9EL2v63fgslDjhYy2VDpSQKo2M=;
        b=tE2dQ8WHjMNxNQjPRLltQpZDQLytLBLlXNs8UjbYiV8vyo16mZlKvbM4KeajnGsmkF
         trWaVXZIgaZov88KIyjE8yl/raHq1XcSdRyZnF5sLqYom3+su5bP7EY0hF38tNYQPNiV
         e4grcBGQc1OOKw6xbSVixLn/OOhuDET/4ELppSZ/SDBj620Z4lb3U7vOSDoiVduFeT2D
         CqLM2dSR9mxHrLtSOy+auqHoxO0WPsvFUgtMJfCBEHPXMsLzWB6mA5yBSNGcCRCHKbZN
         LsW7uGBxnXcTfrhYXtvZlFGHMmCy+NKRh48c6gGJNiWkg9LRVxZwn1guh4lplvfoUmuq
         elxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KDBk6N+zGzPLqCJpW9EL2v63fgslDjhYy2VDpSQKo2M=;
        b=UmzVjRUgV54iSqgiujFITF+9P9guRVlJm89qr6Ddu5YYrrShvO5NSRjZqXuuUuWNFq
         k3o6D/UTGeADB6uA6v3GBnzToTVQiRX7UArd0p9Kc8faBNFqpPSdAERnR3HHd/9/ADny
         6dcctUpZ56pUrTCwt+toESC51JEWD90yclgomQyXf5IycAvpxxiGfnyo+G2/8AlTjORS
         /M1+E3sBEhSDLNN2P61zD/LH3xlwcOrlFbisRXx9Q+F4v1HCgnJMf9FdRRCSvfD/Lk9f
         1ZFSoeyvnnYPv8jaW3GeME+jwVNzPhTDuSIC+3gfNPJ6+vowEEQYkxZSeY4OrUq3m8PU
         oOPw==
X-Gm-Message-State: AOAM5326HnkZBPuIT08YGrJrOQz2RVFHRp31sSMUmtwccRwltFhCe6k0
	I29TPvY9vU5O0HJscJIVxZNnxs7abCu0kwknP7A=
X-Google-Smtp-Source: ABdhPJzJSYdPeX3vaxTz+cUWRQcP7iKUVK/orpmaQFvZmdiZfJ6UjaUZqGAaobGJj4q9fLSMO/PMLw==
X-Received: by 2002:a17:90a:ab8e:: with SMTP id n14mr915314pjq.96.1609193788015;
        Mon, 28 Dec 2020 14:16:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/17] linux-yocto/5.4/cfg: fix FIRMWARE_LOADER warnings
Date: Mon, 28 Dec 2020 12:15:45 -1000
Message-Id: <1a436be5f3f5485cee52e7656d051068cef2de6b.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    a1b2d188bdf config: set firmware loader to 'y'

The updated kern-tools are showing us warnings that were previously
hidden. To silence the fw_loader warning, we need to set the value
to 'y' (since it is 'y' selected by other options and we can't
override that).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 491665d42f3a7b139ab0f220e8e18dcd29f1e2e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index fae1eaa90f..451a088f84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7bc8ae3fc04fdc06192d39d725cb18d4c0b78d9f"
-SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
+SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2c7ce3621f..0d29f8f63c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "2b6db4fbe53a1986c0249bc663d8ce7d99cbf19c"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
+SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 7b729064ab..330744969c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemux86-64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
 SRCREV_machine_qemumips64 ?= "75c7340de480587c3a6650b46be7b1a2f71501a9"
 SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "b721178c41a2bffd19cc9be9e33af23b7a4affd9"
+SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.17.1

