Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id D901E73068
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 20:56:47 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id v127so22036411itd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=l53CbyK7+TQcLEZVAqiRBDrKZ5V+dX5/dTISWlKqgmY=;
	b=VuyL5xXBbnTbji7SkogVeNpM0Ljvkcrhc+Fi2XX06zfM34ZKF1smDbIC+n3GfLDGMe
	7HGuVAzmdOTQJtj1Y5MIWUK6e+T7roohjrGi45o64VH9GjVL7WwN2wc6Bz7OM7Bw4K4C
	yTmdazBnbeaWNWIOcuxL9rSpfgJmkh4L+uT/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l53CbyK7+TQcLEZVAqiRBDrKZ5V+dX5/dTISWlKqgmY=;
	b=hB7LUYndUj2sPvnl0d8SOids9ojAVpGOQk7dd0pGY+tMLB6+pQH5Fbn4SHFcmijNbp
	CFUS4rYU3kfLUkiMgqCJ5QnvghTrFWHZoxeLeF0C51E0JQ3CK9TsdBDi+mCG/Eh3lJx1
	5P9hF+sQ6kCRJb1jXgkMhkx5p3NLGVNFxiI8rUjXxQmFk5RJ+JhCFUphWs2yI2eNEENi
	tsABtJ6I94s/N6XVA7yUZXn9MQtggRAkiQUzimCAB+RG1sLAdSka6oMs9MEiuMMzWgkN
	ZQGanc0g9FYE62Z3Soz5fVaiMLIrmhJle9i8ff0zwCUbh9Fxar6Pq7wvm3RozcpYK1dl
	aOzA==
X-Gm-Message-State: AIVw112gz+WThNCqe0rKAXtA7xduOQLWgZTE2rsI/F/dc+vpGlUGEJ9e
	nJyVUOdShQFRv4DH3VhSIA==
X-Received: by 10.36.73.146 with SMTP id e18mr4695809itd.28.1500584208524;
	Thu, 20 Jul 2017 13:56:48 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	j132sm1503000ita.40.2017.07.20.13.56.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 13:56:47 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 22:56:34 +0200
Message-Id: <20170720205634.27572-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] ffmpeg: add PACKAGECONFIG for sdl2
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
X-List-Received-Date: Thu, 20 Jul 2017 20:56:48 -0000

Enabling sdl2 will bring ffplay applications, which can be handy when working
with ffmpeg.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
index 30d918ea1a..3c18367411 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
@@ -65,6 +65,7 @@ PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
+PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
-- 
2.11.0


