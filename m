Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 369FE7DE6F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:55:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m20so1980803wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 06:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7s0EQ6HhNdKvN7qzrgoVhmUVYbzz3EnNnvgqIiMWH9Y=;
	b=KE+3+Bjt8Z2S57fP9dYzsSElUmm7qsT9uzEjBnCs8HSpTNATGVfcFRWqz4B5pTxRwE
	yCiyuocJaGIfikV3CUsVHbthID7goU5gFERJ53qX0k6GKcBc1eawp7uyTCU5tRMUx89K
	efAs/TUKIL//1Nw7Hzs25bXODgeOp8Cx3KDysPA8fTn8wkmBZkJlyAVYjiHpszwYa+v1
	YO4blwbPhf4jSQ/Jpeq8CNJIx41tdWDihe9DgZSp879jiyaad7bj3wL0X1YvhHqq7CQz
	Yc5Jf81mn2OL8F8Znro/a3+zF6ypL9MUWPzlqIBK3P2X7lApmolLH0cWKVplEMTpQzHG
	oevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7s0EQ6HhNdKvN7qzrgoVhmUVYbzz3EnNnvgqIiMWH9Y=;
	b=N8HInQcQlOv11zjwrHv9z65ksmoAe/IY0FTrF6P0/FXZRCK2HOvzEZfi0dwF6H9MYf
	nVJvUTnj5YTtwwBTj2SQ0ouL7G2DZiO1ZOUEGlL8qVhgNOqb5b4E5pFGraHu8MGhfyLe
	k6ZMy/ClF5q+TlHmu1BnmL6bbRG9BuWhnTsEi4IUW7zJ1diEvlppt8ZFxTEpqTQVshoX
	A+RkU0OPfn1N6Mqhg944flYPIRzznUxgGnWgIEJzSqdqD8VwGlwz0eYeHD9Yy6Y4h2nm
	WvIk4L+p0QAvDOK6mjv6sXGByHieEFmahtAARpC4iLaCnSwBa6vhQ789uyCZlP0VcSJr
	Xidw==
X-Gm-Message-State: APjAAAVjrC1dkLgu1dQfjgMcestRiLIuSZfq3GaA3NcSRWuXd03oZx79
	YBwDyqykDtAZhhUZIKRinbHnV/gO
X-Google-Smtp-Source: APXvYqxQaKh2PmylcLG7CUs4TkqEh0ISUUuaaONbkDVOOcFFp3Xvzqq1AxgsyYKAkpPzdW2cazKcXg==
X-Received: by 2002:a1c:720c:: with SMTP id n12mr2372799wmc.122.1557323708587; 
	Wed, 08 May 2019 06:55:08 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j190sm4212478wmb.19.2019.05.08.06.55.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 06:55:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 15:54:59 +0200
Message-Id: <20190508135459.84886-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508135459.84886-1-alex.kanavin@gmail.com>
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] webkitgtk: update to 2.24.1
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
X-List-Received-Date: Wed, 08 May 2019 13:55:08 -0000

Add a patch to address a missing format string error.

Disable the recipe on 32 bit x86, as SSE2 is now required unconditionally.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...streamer-add-a-missing-format-string.patch | 24 +++++++++++++++++++
 ...ebkitgtk_2.24.0.bb => webkitgtk_2.24.1.bb} |  9 +++++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-gstreamer-add-a-missing-format-string.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.24.0.bb => webkitgtk_2.24.1.bb} (95%)

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
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
similarity index 95%
rename from meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
index 808c92a378e..771a893a6be 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
@@ -23,10 +23,11 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            file://narrowing.patch \
            file://snprintf.patch \
+           file://0001-gstreamer-add-a-missing-format-string.patch \
            "
 
-SRC_URI[md5sum] = "576d69c598b3e36c73441052d02466de"
-SRC_URI[sha256sum] = "2e4ad1503fe482ceb5a83cf70ac9cd42f37eb718555a4d6844fe4c59a9214407"
+SRC_URI[md5sum] = "ed70e2bf2476a58b17df3d051f42ce6a"
+SRC_URI[sha256sum] = "53cb8eaad2ca4caaae663d68331b83fd27d5bd5f6c5388d6ea3c455e338f396d"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
@@ -137,3 +138,7 @@ GI_DATA_ENABLED_armv7ve = "False"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
+
+# Requires SSE2 on x86 platforms as of 2.24.1
+COMPATIBLE_HOST_i586 = 'null'
+COMPATIBLE_HOST_i686 = 'null'
-- 
2.17.1


