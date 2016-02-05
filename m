Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 480C77727C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:35:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so5721394pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bKArgp+CsofT5pDJL66Uh81tzV8Wwed0Y7rYOmecdZk=;
	b=FRGtz6j/Yz5Us/wQ3sCTHjCFjgjsDyA7GnUO3S9aKSichtkqVwJqTv66t+r5sd0W1o
	xy5FPRUk+2z7jMTaZIdWOTxI+x8yGe4peAALzj2xT+UNN0352b2hMda5NzDuUSpgNwmx
	Z9KjtUYEs/hBHiZBsMqt5aoriXWoHL2MYqnLy0r2pGCKYh/kPwgEm8DkVtttUrogPZZ7
	oqE6xh/ruM3Vo7aSYT1X/MgfXV5G81hkkzq0ZE/tqvdMludTOREWUgf1/wX+OtJ6eHWf
	rbO1ddio7PEVi5/yPcYR/cD7zU7e1RaqiLXqejp59SPmX+UpEPlcg0v3S3FQGOeZJ/cR
	q0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bKArgp+CsofT5pDJL66Uh81tzV8Wwed0Y7rYOmecdZk=;
	b=I25rP2bH4NS8/6MxlqiG+DyW77IV6+GMUUT6UYVVPxQducAGkzu0ofz8A+rk6DLu+7
	96XWAXKOYk/9jdkZJDgiK+QKNlI1x6wOZi7Quioqw1oLi3rl40xSjzIvpCdnfM24QGG6
	76V7BLrgxA8ExhkjtENQpgr0Hhg7CefdfmYBIgtE0Rltl7+YW7Jeq8rTqZprB/7xnj5V
	VmKBabWw7pmrFANRrzKfzqMBSy3rmEHXe/+fN+nCsMw3sZo7Znyu14pLffqdzn015nZ8
	b+4iYXH9WZaRB2zpHrGGNY9/rEE4C/7Zih8WBrC7zJkDTleJDEoCmZhaoKQouD/rAmaa
	NTSg==
X-Gm-Message-State: AG10YOTLYaiSwlHgWQYvEN8soSUAcqszYToEPTXZD4wxA+KeICgHb5eiP82o2HMCFITrEw==
X-Received: by 10.98.10.149 with SMTP id 21mr23203022pfk.75.1454708113444;
	Fri, 05 Feb 2016 13:35:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f4sm13813513pfj.0.2016.02.05.13.35.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 13:35:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 13:34:56 -0800
Message-Id: <1454708096-1570-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
References: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 5/5] gstreamer1.0-plugins-base: move freetype dependency into 1.6.3 recipe
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
X-List-Received-Date: Fri, 05 Feb 2016 21:35:15 -0000

The dependency on freetype was dropped shortly after the 1.7.1 release
so is no longer required for the git recipe.

  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc     | 3 +--
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 5d18752..e04096c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -2,7 +2,7 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
 
-DEPENDS += "freetype iso-codes util-linux zlib"
+DEPENDS += "iso-codes util-linux zlib"
 
 inherit gettext
 
@@ -31,7 +31,6 @@ PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
 EXTRA_OECONF += " \
     --enable-zlib \
-    --disable-freetypetest \
 "
 
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
index b9ed3f4..429dc93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
@@ -4,6 +4,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
+# Note: The dependency on freetype was dropped shortly after the 1.7.1 release
+# so these lines should be removed during the update to 1.8.x
+# http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
+DEPENDS += "freetype"
+EXTRA_OECONF += "--disable-freetypetest"
+
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
     file://get-caps-from-src-pad-when-query-caps.patch \
-- 
1.9.1


