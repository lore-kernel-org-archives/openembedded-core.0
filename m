Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6AC7E07F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e15so14808714wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bJY/dB0EGfN0tWHD7VwIYk3U9dXqUzkcfscttxxdQNU=;
	b=HUM3FPg0u16D972xVeahXr35+vGa44RKiQq2JQWyedSZSdyL1+yOHohT3BBUDDG5HH
	ZEAAw7b9oO/xOmIZUHrOqUsYVTg5+bzdHJgjLQJak4msG/v60MhNTh6y0sTBQkDnglx6
	Pcm9NAd1zpPLfEFv1srKQ8TvkTvQFZ+ll4BQCWJM5cVTTy6IUcwIPmHUbPDZp1Pha/u9
	s7kg3nF3cI/Riu9A+ETVhxFXxXEETzETZk9K4Y5rSy2YKZ/V7jeDrTy/x2guszaTF90A
	Zmns7lTjDhK8m+0vrnnbhehDA4l+c3AoCXgoerPQx6nvBQ+gHJcFs2QkpQhIkrCzR4ew
	bpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bJY/dB0EGfN0tWHD7VwIYk3U9dXqUzkcfscttxxdQNU=;
	b=fTPMw8L6d5MKOeAVBcl1ja2ctZv78JXsDg6ms6f335uVq4ecJ7YOTRFzZsm+jCEqnI
	+YtW9O40dRhxCiB7eODNsVtpBsdHMK3rYwoCrQ5rm3yWZ9jOf0Uxt3SGD+1xG4xBozY1
	ezZ6LnNvzX9UukUZnHM73DVEz3gKJrn+86WsVxk7rCKLey9W/j4LPF0iT55awLWY88Mm
	LzSNmza7fjR0Btqdsj9mGYitlDnOX309Q4Ky1iYjqod3pdcQ7zaj3KpRqiB5ecsS8TZ8
	zC0FJdyMswsIDuzCvdvbmswG3xK+wSoTlgI+ttUG3UJsMeggzsEVcL/3mIpSEN8A1h1Y
	YJMg==
X-Gm-Message-State: APjAAAX+H0tg3jPI48zTteJhsBNwNkN/ajQB1BTVIDPsB3ABu6tdOc1a
	lb7bB+LJBV3sp2o8RGi0ix7vejNl
X-Google-Smtp-Source: APXvYqzRl4CnlxdAfaLZvncn2xo8oJvhEXHNebfPVbm3ereBx1Qb/O13Mr9UszzkQNi8BOCHEOnF4w==
X-Received: by 2002:adf:b3d4:: with SMTP id x20mr48457310wrd.284.1558361532717;
	Mon, 20 May 2019 07:12:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:23 +0200
Message-Id: <20190520141125.10805-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 40/42] webkitgtk: update to 2.24.2
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
X-List-Received-Date: Mon, 20 May 2019 14:12:12 -0000

Add a patch to address a missing format string error.

Drop the x86-specifc setting for GSTREAMER_GL as it is no longer needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...streamer-add-a-missing-format-string.patch | 24 +++++++++++++++++++
 ...ebkitgtk_2.24.0.bb => webkitgtk_2.24.2.bb} |  9 +++----
 2 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.24.0.bb => webkitgtk_2.24.2.bb} (94%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch b/meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
new file mode 100644
index 00000000000..bd4ac1e3538
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
@@ -0,0 +1,24 @@
+From 2d9687840b97186b80053dd262209e39455ac876 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 8 May 2019 15:31:23 +0200
+Subject: [PATCH] gstreamer: add a missing format string
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ .../platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp    | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp b/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
+index e1e497ee..483fd65c 100644
+--- a/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
++++ b/Source/WebCore/platform/graphics/gstreamer/WebKitWebSourceGStreamer.cpp
+@@ -738,7 +738,7 @@ static GstStateChangeReturn webKitWebSrcChangeState(GstElement* element, GstStat
+     WebKitWebSrc* src = WEBKIT_WEB_SRC(element);
+ 
+ #if GST_CHECK_VERSION(1, 14, 0)
+-    GST_DEBUG_OBJECT(src, gst_state_change_get_name(transition));
++    GST_DEBUG_OBJECT(src, "%s", gst_state_change_get_name(transition));
+ #endif
+     switch (transition) {
+     case GST_STATE_CHANGE_READY_TO_NULL:
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
similarity index 94%
rename from meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
index 96ac5ac18f3..056334fff5e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
@@ -23,10 +23,11 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://narrowing.patch \
            file://snprintf.patch \
+           file://0001-gstreamer-add-a-missing-format-string.patch \
            "
 
-SRC_URI[md5sum] = "576d69c598b3e36c73441052d02466de"
-SRC_URI[sha256sum] = "2e4ad1503fe482ceb5a83cf70ac9cd42f37eb718555a4d6844fe4c59a9214407"
+SRC_URI[md5sum] = "83012998e1b9f71abb37d8baf6f9c7e6"
+SRC_URI[sha256sum] = "019cb1f0d05bf6148b72c7a85734bcd006388a1c14132843ef9a1b2cb7b4321c"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -71,10 +72,6 @@ EXTRA_OECMAKE = " \
                 -DPYTHON_EXECUTABLE=`which python` \
 		"
 
-# GL/GLES header clash: both define the same thing, differently, on 32 bit x86
-EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
-EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
-
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
 # By default 25-bit "medium" calls are used on ARC
-- 
2.17.1


