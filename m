Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 723906B333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:41 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so190093eek.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1gHcMs8TN+1erbAK5RPILRoEmmJ3bGz2wX0+59cJVMI=;
	b=PJ+UGtXPge1YHFNd/IR2gUPFY40a+zOup9opOjEuT4jOIwkd9EIJ3KCuNeRxZi8tsy
	z8smhaJKjPOwPojbaHL789a9xMELn3CA0Utxrcl6DQceEn/Ipb0QXapjDWeCIsQUBRb3
	pvJTDZrjoXV0b1qLS6SSgaFdMYcNwFPs39dEGchO9S0U4Q/Mhb7hF/NgAc5RA+84XNmi
	hafYUX0xiIj5YQUSqQMPAfzjwEWUCXSUIY8jIHKAjMrFc0S8Lu6nxiWQLc+XupxW8a9u
	FDpIDvZ67gMr/lJXDZiwwUwRhsV8OD14Mazkf/EJHTg7dq8JVCoKI0u5mi88HalL9knY
	nCNg==
X-Received: by 10.15.41.196 with SMTP id s44mr37270069eev.138.1374667361914;
	Wed, 24 Jul 2013 05:02:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm65644000eez.6.2013.07.24.05.02.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:39 +0200
Message-Id: <b1ecda171cc9bbedee6624e67a7a5c8a52f78306.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 17/18] gst-plugins-good: add PACKAGECONFIG for jpeg, wavpack, gdkpixbuf, v4l, bzip2, orc
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e630f67..8868ba7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,11 +7,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 PR = "r8"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} jpeg"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-
-DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
+PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
+PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
+PACKAGECONFIG[v4l] = "--with-libv4l2,--without-libv4l2,libv4l"
+PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+
+DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
             speex libsoup-2.4"
 
 inherit gettext gconf
-- 
1.8.3.2


