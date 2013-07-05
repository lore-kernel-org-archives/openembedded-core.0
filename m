Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id C6A376B01A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:29:00 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so1168470eaj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kMyiMQy8ZzLq/c5oAUdrI3JHiwjWVTRNbXcNmrve8Kk=;
	b=wvlV2NZzjwulatedhcRK/MsdQwhar/WAKQQAHVqIIGIszaYqWvneULJKcGwE3qDsOm
	LdhZl/56O1Et4sQfobBnYGPcs/vVADu8PTkjf/rnaioyAw6P/SLd4m3hxs4qERWuBn7z
	KtbyS3dPDAA/DXx0MtLKV/xalNOtYNf70E36Mzl2lCvzgBoCjGVmPhxGwfmiqrX5pvIf
	C4lc3uH/64pSVhP2xqs3OIbKMCGrxu7f671U4brclqk0fPW3LVsWr7v02iR7u016RO/q
	xsXM1D5k9t2DSawshh+kTb7mYyVbGF/THy3noGPs92ykjppT57/pv1fawPV142hJo5II
	733g==
X-Received: by 10.14.95.135 with SMTP id p7mr9485712eef.16.1372987741567;
	Thu, 04 Jul 2013 18:29:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id a4sm9807464eez.0.2013.07.04.18.29.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:29:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:55 +0200
Message-Id: <0697bb154dfc5257d18c590db711becdca38f44f.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] gst-plugins-base: add missing dependency on glib-2.0-native
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
X-List-Received-Date: Fri, 05 Jul 2013 01:29:01 -0000

* glib-genmarshal is needed during do_compile:
  | /bin/bash: line 1: glib-genmarshal: command not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 26c562c..19473ba 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "alsa-lib liboil libogg libvorbis libtheora util-linux tremor"
+DEPENDS += "alsa-lib liboil libogg libvorbis libtheora util-linux tremor glib-2.0-native"
 
 SRC_URI += "file://gst-plugins-base-tremor.patch \
             file://configure.ac-fix-subparse-plugin.patch"
-- 
1.8.2.1


