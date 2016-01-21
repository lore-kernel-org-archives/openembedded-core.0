Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8748F731AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:20 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id is5so1823988obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UHly9000VOZ6H2exmiVA4hiZvh2ZlphKv6OkaPJLff0=;
	b=PVzpI61GhikrS8yxNBpWmJ44hPKEw80Nwy0uMFox3BxNKeKBXbKG3Xm2gZFYB9Iptn
	mmmLF1m92ewMq1PqLGxvs2w08JVJqGPVTQgz8TV8MFP1VWU592UDwDLEHfkkmu0S87Qe
	uJRP9gEuoP8ZzlwCYLziQWPulI4YmPI54wU5/av77NkALXor+Wee7uUoeuPh/jZi8HzA
	S4RUykYO+oq6/7E+5jV5br+dYNmwH15xMLh1usYv1eLHPOJ5us5or40lMiEst2FdZLkZ
	5GsDSa0l5h+WoZ5zFhuaGwdS4a4TerRgMKYN93QkAlYjR9d7XOIuU21gQAgrkjYOrva8
	LNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UHly9000VOZ6H2exmiVA4hiZvh2ZlphKv6OkaPJLff0=;
	b=K7ngxZ18mhRXywpvU2f/+o6D0eZHfMzG4SX8SJdLz1RPu4K2RIwcu+ga3Mqlf3lUzB
	q9CjsnNQbjmrFT5Fa4gpStT1cKosYWf6aJgN4B52ZabT25Tgr0eTs50NhklOzcHPn8SG
	bee4u9X4iiHBWNuAxvU9DMjCVblGYTndLK2Sz4ITQQlEjDTDJ1vC1XS7rGzotq37mi6g
	kWPKrmx+m/VX7okyv92bsKjWNXZqykgLanZd/WTnip2OA0qsqRve8xRu/LFrucuO96OS
	ClsjfGSJoBt/L5onD1FKqRN7/IwnmPgd0NlYlMjZZHrR4C86u/bd85CTStNz+OurHgH9
	7cgQ==
X-Gm-Message-State: ALoCoQnqvf3W8wOtKDAHKdPWraz6LVsibsnI2MOSTbgOm73NXHECVoxMPKztTTIyyrc87Z94nwyT8lSkYkkvCh6rjNyyd48H1A==
X-Received: by 10.182.85.194 with SMTP id j2mr30454577obz.44.1453344261485;
	Wed, 20 Jan 2016 18:44:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:23 -0800
Message-Id: <1453344203-7118-26-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 25/25] gstreamer1.0-libav: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:20 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-libav_git.bb            | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 32f4814..806f39f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -5,15 +5,27 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
+                    file://gst-libs/ext/libav/LICENSE.md;md5=5c6d1ed56d15ca87ddec48d0c3a2051d \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
+# To build using the system libav/ffmpeg, append "libav" to PACKAGECONFIG
+# and remove the ffmpeg sources from SRC_URI below. However, first note the
+# warnings in gstreamer1.0-libav.inc
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-libav;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    git://source.ffmpeg.org/ffmpeg;destsuffix=git/gst-libs/ext/libav;name=ffmpeg;branch=release/2.8 \
+"
 
-SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "0993ec8fa5cf6b09e33741f268c938719a1534d5"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_ffmpeg = "644179e0d4155ae8f5ddd5c3f6bd003e2e13cf94"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
@@ -23,7 +35,5 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cross-prefix='${HOST_PREFIX}'"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


