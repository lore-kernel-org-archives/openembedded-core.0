Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 627E66B921
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:29 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so178481eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1gHcMs8TN+1erbAK5RPILRoEmmJ3bGz2wX0+59cJVMI=;
	b=BKlMqZjO50XnOx8IRNs/qwXekSXt+DKiPTRd0BZ0YNrBHw753JqdNexPW9srxv3Dwa
	KWIcewccOWHyT9dE/aqdptQPpinovwNYgyQ+ewUtNTIPAzQbQNMVG+IV0aLyWPVNwya6
	18EGz4OQAjnTrCDzcrNTohRxFa/Wxzp+l2L2U4yxWru6Ain6JoAslIk0hdntqaLvGcNp
	8nCMVd4Q1i/XFvnZJ6shjYo5BhohiPigXT2lh84pWr2GHgtoODShlVXYK5ILkdDruCx3
	NQyj2T9K/deJSBsNCQdQMcHYUvarjTTHGQctCqLi0MZsn67TNfnFeg6dIezR9J1P4mT2
	d8Rw==
X-Received: by 10.14.102.72 with SMTP id c48mr2834310eeg.52.1376551409829;
	Thu, 15 Aug 2013 00:23:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm82029890een.16.2013.08.15.00.23.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:40 +0200
Message-Id: <29754c99a8bef904fee7e2e1e10bbf7773f4d537.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 29/33] gst-plugins-good: add PACKAGECONFIG for jpeg, wavpack, gdkpixbuf, v4l, bzip2, orc
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:29 -0000

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


