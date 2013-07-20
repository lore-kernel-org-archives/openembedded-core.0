Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 996606AF66
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:09 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so2956336eak.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rRvSE59qm8asi5iqNauYTmFcJ15dbg7jVHoBYpE4+3w=;
	b=StrbRG/+mRwjFNGkS0/LYRlMWINIsx7fNwtlLnhem+YYiRxsTRqWVhDNI/jCKKZaBs
	mjIKMTJvjfUCMR606QlNsuQhlCokRiRR4/woAv3JtL3RRXb1kdQ6zwe24Fh7rS2Q71aX
	5+jyWx+CT2+1C1bWqaPuxHgOB+3xoL3kqb39YQ4QvoNzPozHc6EvSIWgeiqkahGG8Pur
	B1xVXFeh0CrNUHmGwWuGg++Rd69bbpE6g3Ka4XeIzef1zuhNOefERU78gVVBT3iqk+u/
	7lsB4ZuPfv+CUYfY8CRVJ2rHXSwEruCnRrxZIZOC2o+/B7SvWMT0DTZ0t3ua+BRAp+Nm
	184w==
X-Received: by 10.14.220.66 with SMTP id n42mr20314596eep.67.1374332229949;
	Sat, 20 Jul 2013 07:57:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm35825403eeh.11.2013.07.20.07.57.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:19 +0200
Message-Id: <8559f196057c09fa4da4096b0f456c630b85dad9.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] gst-plugins-good: add PACKAGECONFIG for jack
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:10 -0000

* jack is autodetected from sysroot
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 70d1e4f..e630f67 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -9,6 +9,7 @@ PR = "r8"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
             speex libsoup-2.4"
-- 
1.8.3.2


