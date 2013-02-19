Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7mMw-0007Gk-OR
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 13:32:23 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so4688690wib.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 04:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=LAxd4T38Q7HktsJ/pmZALHWtcYYcs7uku+3JLrNm/3I=;
	b=VnS37wP0VS8ygu86xIFC5I/pAgJ4NazgDXvUsXZc/AQh3+3oX0//Quyyl15Itj5v2E
	UKWfiPlg2RBNhgyhrusKWE5Ybc0h6lL1jOUQhxTw8c9AhxDxQn+T1F/EkaIBBjlOBecL
	44lZOcdK+vn4ATOo+nR1VsUKvtMLPWNJuDhGaCI3GCc8G109i6FUWsiOb2GmmQZxKuEX
	V3jqdvEmQL0we2FuKWRne6+frLauAdILezXvxqRpJV4INShJZVQPvavcUOpeDo6+XsLB
	K9KJqCVgdWjPK3SgyGUh/g5aGZph0jJmg1meSYw+QPRkv9desJjHJxFp9O3yPnKp3t+R
	ynSg==
X-Received: by 10.180.14.233 with SMTP id s9mr24926805wic.25.1361276164621;
	Tue, 19 Feb 2013 04:16:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fg6sm27407696wib.10.2013.02.19.04.16.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Feb 2013 04:16:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 12:13:42 +0000
Message-Id: <1361276022-22204-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1361276022-22204-1-git-send-email-ross.burton@intel.com>
References: <1361276022-22204-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlgB8NfBYxB3zSEYbd7he3sra49cDWHHxFrCDuEMqe6/WC9cpzKD8YafoBj8DHfMS9o3vlt
Cc: Jeremy Stashluk <stashluk@gmail.com>, jstashluk@dekaresearch.com
Subject: [PATCH][V2] gst-plugins-gl: add package recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2013 12:32:23 -0000

From: Jeremy Stashluk <stashluk@gmail.com>

Added notes, signoff, and upstream status to internal patch.

Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-conditional-gl-framebuffer-undefined-use.patch |   35 ++++++++++++++++++++
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   19 +++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
new file mode 100644
index 0000000..bc2f88b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl/0001-conditional-gl-framebuffer-undefined-use.patch
@@ -0,0 +1,35 @@
+From 14d51cbefef19737e7ab2b6818ee1d3bdb248d12 Mon Sep 17 00:00:00 2001
+From: Jeremy Stashluk <jstashluk@dekaresearch.com>
+Date: Wed, 6 Feb 2013 09:59:48 -0500
+Subject: [PATCH] conditional gl framebuffer undefined use
+
+The OpenGL extension GL_ARB_framebuffer_object defines the macro
+GL_FRAMEBUFFER_UNDEFINED. The macro will only need to map to an error
+string if the extension provides functions that might return the macro.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jeremy Stashluk <jstashluk@dekaresearch.com>
+---
+ gst-libs/gst/gl/gstgldisplay.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/gl/gstgldisplay.c b/gst-libs/gst/gl/gstgldisplay.c
+index 3ed0b71..64c6c2c 100644
+--- a/gst-libs/gst/gl/gstgldisplay.c
++++ b/gst-libs/gst/gl/gstgldisplay.c
+@@ -2177,9 +2177,11 @@ gst_gl_display_check_framebuffer_status (void)
+       GST_ERROR ("GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS");
+       break;
+ 
++#if defined(GL_ARB_framebuffer_object)
+     case GL_FRAMEBUFFER_UNDEFINED:
+       GST_ERROR ("GL_FRAMEBUFFER_UNDEFINED");
+       break;
++#endif
+ 
+     default:
+       GST_ERROR ("General FBO error");
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
new file mode 100644
index 0000000..ffda977
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -0,0 +1,19 @@
+require recipes-multimedia/gstreamer/gst-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+SRC_URI[md5sum] = "ac70ede13f79978d56eaed8abaa3c938"
+SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c429bf210"
+
+SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
+
+DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
+
+inherit gettext gconf
+
+# This package doesn't have a configure switch for EGL or GL, so forcibly tell
+# configure that it can't find gl.h so it always uses EGL.  If/when we have some
+# way for machines to specify their preferred GL flavour this can be
+# automatically adapted.
+EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
-- 
1.7.10.4



