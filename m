Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 847D774F87
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 20:24:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v63so26168146pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T+mMlYxYD1kKF/i4P55gjN6FSfv4fNg2l6VHdAU3qU0=;
	b=sYaVeeQtGgIFAGWOsk0e+wrR9iaRO/f8rASALpbkPdKDMShbhePYGuQte8af6q/xVW
	H0SSaDyeHLxQghjtQ2VhJnHqfmZ+miy4ruzY47qpgRASMXMJ0vsCbHXx+H0vCgzUNZMk
	N/r8M/Xrl8MIfSsECYMgTeok11rlv/BA7hMZKjCXzoupY2cNqPEhx72l+52LEevTril2
	iPSyl17veL9lR4eoZGcFji+PhWiMaAyPuwKYRPdIRMmwqlYfL/oXYAOMJDpI2SOs03a7
	vmqveIn1KMW9bl2Nx7f90kO2QxbCa13zGtxD3ZSn6SsC7rW46DSEanNTiSOaxeY3GLCM
	FKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T+mMlYxYD1kKF/i4P55gjN6FSfv4fNg2l6VHdAU3qU0=;
	b=KMFuZZQG2Hft4E2RxyX2o9JH1f7c+kOyJpFadBrwUz+LBB/wEOzTEOcPEix77hLEwf
	NgH0An3ie1tbLmPn8RnVNOPrgr9gWuRjr3e88Vw9nXNQyYMyPOHZaSkmHILbbx169tyM
	ODGrtNgXN/BquknUO9Sl7l1DVLrxJcRKC0/kJDRm9Q2q7bqhHmv56k/WIG5KvAfNBb1K
	bZ1ItTmYotQqPKpDxsiVwWdgRbsvalkeeE/UN9v56L/+R2rIpaMkV5uo/toKxlPikP3n
	/Meo1fBSAQvazW9w/zTbq2jJeu94/gmOFSIq9ZFdmkfj+99rI8IXPPqmXxdYj8looCof
	Z18g==
X-Gm-Message-State: ALQs6tD9FI3axrxZ/jUPDeFM1RKjU5K5xMYJDEuICAk6MN9x5QZG0H1q
	TAeSh83AYP1lcZiYbFFLkioRNw==
X-Google-Smtp-Source: AB8JxZraTQhgndwj6IGFJsZY5UT0u0ks6MUyR0ZhyybDGNAQic2G2gehhuV0B071wyWldXA7ajxebg==
X-Received: by 2002:a65:5088:: with SMTP id
	r8-v6mr31675855pgp.80.1525897469850; 
	Wed, 09 May 2018 13:24:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	x124sm2142222pfx.72.2018.05.09.13.24.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 13:24:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 13:24:18 -0700
Message-Id: <20180509202422.22501-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509202422.22501-1-raj.khem@gmail.com>
References: <20180509202422.22501-1-raj.khem@gmail.com>
Subject: [PATCH 5/9] Disable using GST_GL if gst does not enable it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2018 20:24:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkitgtk/detect-gstreamer-gl.patch       | 20 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.20.1.bb  |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch b/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
new file mode 100644
index 0000000000..57ae48c141
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch
@@ -0,0 +1,20 @@
+From: Alberto Garcia <berto@igalia.com>
+Subject: Disable USE_GSTREAMER_GL is the package is not found
+Forwarded: no
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk/Source/cmake/GStreamerChecks.cmake
+===================================================================
+--- webkitgtk.orig/Source/cmake/GStreamerChecks.cmake
++++ webkitgtk/Source/cmake/GStreamerChecks.cmake
+@@ -43,7 +43,8 @@ if (ENABLE_VIDEO OR ENABLE_WEB_AUDIO)
+             message(FATAL_ERROR "GStreamer 1.10 is needed for USE_GSTREAMER_GL.")
+         else ()
+             if (NOT PC_GSTREAMER_GL_FOUND)
+-                message(FATAL_ERROR "GStreamerGL is needed for USE_GSTREAMER_GL.")
++                set(USE_GSTREAMER_GL OFF)
++                message(STATUS "GStreamerGL is needed for USE_GSTREAMER_GL.")
+             endif ()
+         endif ()
+     endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
index 1e5def090c..360ab8e69b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-atomics-during-configure.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
+           file://detect-gstreamer-gl.patch \
            "
 
 SRC_URI[md5sum] = "0cd9b9ae1f48c04de5314f77806eceb4"
-- 
2.17.0


