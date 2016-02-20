Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 404E377214
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:36 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id jq7so124943198obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c45F80ixORTIQIWcZyor8P7N1abSZeMQzJkon4NZWnA=;
	b=dNvec/LxCof3QYsvfgJt/MNLPFLCy2qS/R2GDl9qT+DL7XH8KdrETk9lYi6wh4YDmo
	jc0SfEBJ3sJJpkBA8J+C/L79ALkuabARV7Cx0agWuwIhZi4/P8Ps6mOkUeljt6+JDKq6
	nxqeDsJEWArCiHTK3NlLL3yQQWADHTqsU7yzutgrpgtjLtIRryaPz82R9DUWW4ATYDrP
	biAkOcjYiI2tXdKmUbYFZ1N2/DCCxyHvorwUMe8gKF82KK8dX9Am99amp/4SQrPKmB0t
	+4KGSNttrvjGluAAPIfP8po7sRQQIve0Ki4q1oOKKpmgdm5YCqpVfBlcTs8UZLGOtrAf
	Mo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c45F80ixORTIQIWcZyor8P7N1abSZeMQzJkon4NZWnA=;
	b=CQdr3HJl1zso5LOq0Pjfct04LOmYeliRQm4OPw+3R31jnAHLJ3lGeTtUbPjcj932BR
	qGBuDA6FXqkkiX/vMAtdvfWMZYOaFWKs8a3lOciXNNAQT9dDAPqdoWCFMH///twWyzSK
	zVio9ABqwz+KjdXUVT7YDa+ukWYehz6kXnHwH90Hbo+b7JUfJetZHOm4TTIcvlUHeBd6
	91nImdTFGT06Rq6mkIBZymeXuHvGNZl3XqMmSqITQlHJaixqiHz69AlA0sANkYzKmOvX
	Vf7Tebr2HWPOrdeqmrCt3AzLcLnefmL3eJyIiYf9AOTMTCoQvCK4uLo+Uow50rTfvO7W
	gJGQ==
X-Gm-Message-State: AG10YORrsKlsOlJ2LR7uvti9/5Rqje/QkcimK121+W76mLjcXYtn9cAf4nApjCF8TtjguQ==
X-Received: by 10.182.38.199 with SMTP id i7mr15056971obk.86.1455936817592;
	Fri, 19 Feb 2016 18:53:37 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:36 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:17 -0800
Message-Id: <1455936797-13430-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
References: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/6] gstreamer1.0-libav_git: update 1.7.1 -> 1.7.2
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
X-List-Received-Date: Sat, 20 Feb 2016 02:53:37 -0000

Hash for libav LICENSE.md updated due to dropping libaacplus:

  https://github.com/FFmpeg/FFmpeg/commit/9ba54c1b82a81581e5283da75c153a76f04324c0

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 4cd51cd..1957a5a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -5,7 +5,7 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE.md;md5=5c6d1ed56d15ca87ddec48d0c3a2051d \
+                    file://gst-libs/ext/libav/LICENSE.md;md5=acda96fe91ccaabc9cd9d541806a0d37 \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
@@ -17,17 +17,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-libav;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
-    git://source.ffmpeg.org/ffmpeg;destsuffix=git/gst-libs/ext/libav;name=ffmpeg;branch=release/2.8 \
+    git://source.ffmpeg.org/ffmpeg;destsuffix=git/gst-libs/ext/libav;name=ffmpeg;branch=release/3.0 \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.7.2+git${SRCPV}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "0993ec8fa5cf6b09e33741f268c938719a1534d5"
-SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
-SRCREV_ffmpeg = "644179e0d4155ae8f5ddd5c3f6bd003e2e13cf94"
+SRCREV_base = "6c4878b6abc916b7f6f25b8926c4859119acf1ec"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+SRCREV_ffmpeg = "c40983a6f631d22fede713d535bb9c31d5c9740c"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


