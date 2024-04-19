Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8992DC41513
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.19159.1713529200933514078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjjMKmXb;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e4a148aeeso892202a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529199; x=1714133999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQnbGbpMoJt+W5/+ezwIlZ/HCcY54RueZSbiFiGg35o=;
        b=TjjMKmXb44XKSs2Qx11QH3vPby24bUWCY7KOoqc5uo+iyVwSXqjbfseGf18zivrz1F
         NsZ9q/xZsIXG2JznXIbM/68vTIfPkPK7ELm4Qk2wi7HJFc30foNECu0rnoaWK+GMYXks
         vZ1hX8kAtxRLVBmxss4R++t67AmXIFWQpvmRDtQmGALtXpqY3vqOeDDncPPdweg8i5gX
         TqICNr33Qk7qFSQ5QVOukBhKDj3Ud5hFwgqJZ90vBCrAqfGOe40ALpv88B8wFdT4773u
         O0mFvd5huLoTr3K+qEYMJC7XcAj9SxSS1houHEmFd6GPSg/B3XSo4FIhpDHUrXVsw0IC
         YUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529199; x=1714133999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQnbGbpMoJt+W5/+ezwIlZ/HCcY54RueZSbiFiGg35o=;
        b=dEqRWNNm7GNmYf8fu2MQWqe3CcsQQQf3MjJEh87G6mNZpN7nkugu5Bwf3BOhgxW71F
         8Mu1Yjf4YvEoJ4ia1mBBfFwbQqzeEUW2nD9GEqz52Se4j8S/vuRWaFDIsADgW9UIeg3/
         m3Wg/qK1giIBdcFhmeiYLzLWOXSsjPU/mZPg9mdUrsp3Nn9qyqb65hfxhGP2jXIESyWc
         7xw2sopWoQIKQsE0aZfsScIvbnPO0VpugvVRgvtjy9IpZkc0Nb4IoIKYU+a7TJ2tuA0W
         1RBor7TKD80uzzPwh8yRtRcEgTLUY6mC5trRyXFERHWQh0v/5h2qJMMTfnRz1u67PqP4
         KzvA==
X-Gm-Message-State: AOJu0YxvtdlbvWV3jxLAvgpQrInavUryL8imgLTTm0EBiYB7q8HyGa/1
	Phv8DcWnyPUpSFDR07AJjO1sVhtuMNo3ukTK2MeyvjeubAbxHxyiQWXEVA==
X-Google-Smtp-Source: AGHT+IFCe2tcsP/ECCJDWLojNmTDoIr587Yqoc/BhEwysWCINepC/AHx7Oz0jFfUGLKaZWDHBRL6aw==
X-Received: by 2002:a05:6402:26d0:b0:56e:2a05:a0e3 with SMTP id x16-20020a05640226d000b0056e2a05a0e3mr2249009edd.21.1713529199071;
        Fri, 19 Apr 2024 05:19:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/19] gstreamer1.0-plugins-good: remove 0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
Date: Fri, 19 Apr 2024 14:19:41 +0200
Message-Id: <20240419121945.1920944-15-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198543

At some point this patch became unnecessary as the respective qt5 plugin is building without issues
without it (checked on qemuarm/qemuarm64).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch | 54 -------------------
 .../gstreamer1.0-plugins-good_1.22.11.bb      |  1 -
 2 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
deleted file mode 100644
index 9703a3a8894..00000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 99f48716051ce5ddb8c1b77292213af1e462549e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 31 Mar 2020 21:23:28 -0700
-Subject: [PATCH] qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h
-
-gst/gl/gstglfuncs.h is included via ext/qt/gstqtgl.h which has logic to
-prefer qt headers definitions for GLsync
-
-This helps in fixing build errors like below
-
-/mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/gstreamer1.0-plugins-good/1.16.2-r0/recipe-sysroot/usr/include/QtGui/qopengles2ext.h:24:26: error: conflicting declaration 'typedef struct __GLsync* GLsync'
-   24 | typedef struct __GLsync *GLsync;
-      |                          ^~~~~~
-In file included from /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/gstreamer1.0-plugins-good/1.16.2-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/gstglfuncs.h:84,
-                 from ../gst-plugins-good-1.16.2/ext/qt/gstqsgtexture.cc:30:
-/mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linux-gnueabi/gstreamer1.0-plugins-good/1.16.2-r0/recipe-sysroot/usr/include/gstreamer-1.0/gst/gl/glprototypes/gstgl_compat.h:40:18: note: previous declaration as 'typedef void* GLsync
-'
-   40 | typedef gpointer GLsync;
-      |                  ^~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- ext/qt/gstqsgtexture.cc | 2 +-
- ext/qt/qtwindow.cc      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
-index 663696b..36b17d4 100644
---- a/ext/qt/gstqsgtexture.cc
-+++ b/ext/qt/gstqsgtexture.cc
-@@ -27,7 +27,7 @@
- 
- #include <gst/video/video.h>
- #include <gst/gl/gl.h>
--#include <gst/gl/gstglfuncs.h>
-+#include <ext/qt/gstqtgl.h>
- #include "gstqsgtexture.h"
- 
- #define GST_CAT_DEFAULT gst_qsg_texture_debug
-diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
-index 2872cb5..5a36be9 100644
---- a/ext/qt/qtwindow.cc
-+++ b/ext/qt/qtwindow.cc
-@@ -25,7 +25,7 @@
- #include <stdio.h>
- 
- #include <gst/video/video.h>
--#include <gst/gl/gstglfuncs.h>
-+#include <ext/qt/gstqtgl.h>
- #include "qtwindow.h"
- #include "gstqsgtexture.h"
- #include "gstqtglutility.h"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
index edd8609b7cd..57924d5c9fc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-           file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
 SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22faad52e2"
-- 
2.39.2


