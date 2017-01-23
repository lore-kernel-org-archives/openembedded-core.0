Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 04F8D60269
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 12:59:53 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id r126so131624534wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 04:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=okrVwP9gvxFb+LZRSiDthZqEPGLjbI5H07ADbREHyX4=;
	b=WZkDjHDOCUfuSuOUoS/iadvZz85Ear/G6a3d3HsAnl/SVf9JVu/85A9D2DPfpUzqLS
	s/N76nv7QGW8Woi0qrlXjzUHx1sIoG52ugyxkjifkQFL5idgwsENjiXmtD6i0Mofw+L8
	IhklIsEN/Vx1nalJ52aDMqgdTvcou5TNjw3LQah/bk1DhiGngztdUS5cpj+38ma8duFh
	amzA5Kp8tOFcDHsXQTfAD5S7u1+fsZYfi+XADplWqeaY1kGU73HzLT9jtMMaTWHBzifr
	cKg5e7taHC6M9CBYYL4A8KJ1lJc7r6a8BlUavyW+RUkn71LYEUiJQIGERgGegNK2xQ7C
	uDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=okrVwP9gvxFb+LZRSiDthZqEPGLjbI5H07ADbREHyX4=;
	b=VMUnzsVLj2hY7ite3J7ufxHRu5GYh2LGzcvO7od2Q5pbXkp5+HFxCilNnH24szlOku
	o8VQRudLKBxnDSThNZgKiNKQMA8VU08MgROv81aafKOWRqCNWXkR6hcESpbA4kZbJMRW
	uZ5NYJOmlUK9fcMdIhDzr7NTYP87+e+1AxtppliZ+9ONsegcVXh48cnn7EzqK+gEdDRY
	ACHyxBLSRMswbLMiBUQo7lqaHSQCammBhmRo9dHoBGee/URmNFYsosU3R8gjE8pTKeR0
	NB/DjTHWHFAC/L7OwM0Tz+osmIS8VovqIR4rDSmz5BRE9LMdZqRhAcuIYo4roOEaTixR
	Y2sQ==
X-Gm-Message-State: AIkVDXIZbj++VhAyKjdJTgRUH+/lt+SuKFDt9g8SspWRnfDVCKlaJlNish8DZOG0kgQfn+FQ
X-Received: by 10.28.54.226 with SMTP id y95mr13069636wmh.105.1485176393590;
	Mon, 23 Jan 2017 04:59:53 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y127sm20932215wmg.12.2017.01.23.04.59.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 04:59:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 12:59:50 +0000
Message-Id: <1485176390-9664-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer1.0-plugins-base: disable ivorbis
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
X-List-Received-Date: Mon, 23 Jan 2017 12:59:54 -0000

Even old hardware these days doesn't really need fixed-integer Vorbis decoding
by default, so disable Tremor out of the box.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index a04f155..1c56200 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -19,7 +19,7 @@ PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    gio-unix-2.0 ivorbis ogg pango theora vorbis \
+    gio-unix-2.0 ogg pango theora vorbis \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
-- 
2.8.1


