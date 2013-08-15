Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id DA9256B8A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:22:56 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so185675eek.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=83cc7dSQNR9/N6PNtb1eeyntnl4zenx60lgXlAvuVyo=;
	b=oLGfjYUNN7lKy+u+EuIbpJKdP5f4v04tmELQt1jdH2GJ524PCaTLLfB9EeqxylXy8z
	irKN5Ny/cYCXQQ3QGrR5oDr9o9W6JdHv1/snKlJB233kDF5NhgNh38yLs/gjMgsvqKX6
	aKQep4NiRXgxqhXBl/by0gmWsQAoKpyYNGm2MW5PHLAxNYNdOxUpcji0IinR5xBabKWC
	IdHnRIoP6ocJXhLphr8/+wlx5RyaIAromd82YoLS8KgYQK7g9yfIEpevse4fxRathPOb
	8DykfoTKakRjoSan5X+RjiXvbq1vwJ21xnh55AGqRIsCVmKY1xHLbh11RAYSMQoKcDel
	Vr1Q==
X-Received: by 10.15.21.142 with SMTP id d14mr139290eeu.90.1376551377338;
	Thu, 15 Aug 2013 00:22:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81968065eeb.11.2013.08.15.00.22.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:22:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:14 +0200
Message-Id: <c4c367079b0bf6fb1452f079e5b61f5b9898cec1.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 03/33] gst-plugins-base: add missing dependency on glib-2.0-native
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
X-List-Received-Date: Thu, 15 Aug 2013 07:22:57 -0000

* glib-genmarshal is needed during do_compile:
  | /bin/bash: line 1: glib-genmarshal: command not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 462c54d..f4a5d49 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv libsm libice', '', d)}"
-DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
+DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor glib-2.0-native"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
             file://configure.ac-fix-subparse-plugin.patch"
-- 
1.8.3.2


