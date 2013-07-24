Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 659046AE6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:19 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so186503eek.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GL30ydxPxVSM5v93877uhQd8NmkzQfuT4yAy5rdnS6Q=;
	b=dSS5YpqOVKcMC9TztuYkqo0fKk0inkI0iUOxXaWA4h6aTCx217/Jy00mzhOvnpMncm
	fZQT1m9AKUJ/AM0iwbjcsJCxK0u0T12ovZmwXvuMO/V8yjl4nQs4gbcmr+JZXJmxgY6M
	o/wdm+HxLTJfXnDyKC6kN1Su3CWwDji2vCmlH6EA/UZxEl3m9eQpjIMMvAQiN1XmGZ/f
	NgmYPWcxlIZ8+VxVMbGu7xXuPNzP1i1JV5edOhmEnP6u5k6wjuRAftU2VTNOC74yg+JS
	6nuXXVEqzZFqQljuTFvOoey4MrgP1BCnNqZtOqvFW4KexPPaB6Sfnu8Z5fwgXMcdPINv
	XBVw==
X-Received: by 10.14.173.70 with SMTP id u46mr36861395eel.92.1374667339853;
	Wed, 24 Jul 2013 05:02:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p49sm65675618eeu.2.2013.07.24.05.02.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:24 +0200
Message-Id: <b452909b33600acbc9e0ab5bd8f74fc7443a17ad.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/18] gst-plugins-bad: add few more PACKAGECONFIGs
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 7e80ce4..dceb12c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -24,6 +24,16 @@ PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[rsvg] = "--enable-rsvg,--disable-rsvg,librsvg,"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
 PACKAGECONFIG[neon] = "--enable-neon,--disable-neon,neon"
+PACKAGECONFIG[mms] = "--enable-libmms,--disable-libmms,libmms"
+PACKAGECONFIG[cog] = "--enable-cog,--disable-cog,libpng"
+PACKAGECONFIG[faad] = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[jp2k] = "--enable-jp2k,--disable-jp2k,jasper"
+PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
+PACKAGECONFIG[vp8] = "--enable-vp8,--disable-vp8,libvpx"
+PACKAGECONFIG[ass] = "--enable-assrender,--disable-assrender,libass"
+PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.3.2


