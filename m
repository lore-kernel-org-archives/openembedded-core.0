Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id B3146725DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:17:13 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so11388845wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=shPcuoZ2Qv7II0iOk2u9TZgjURkv7SSoEPzpKQUPbrk=;
	b=GG2GvYezLmhWxPFkHc2hTGLPBRJRU7O1wRQaWa4GyltPoF4y8NrweVT8VMtCDQFUOM
	iakTE5He7G9X2b/izYfKnV1zZmjFAc5gyVL3L55DoatTc7UUhpMa9nhyzu0YXa+jNK0a
	cbbH1ISlbQihSA/7gXk/RTGtKuI/pdh1AjF9egzalVfM4quRELHYHkzRf3CbWYNFNsh/
	ciaJAX8ew+N9DVtS/6twcDYgffgtIIG9fcSGYStLuPtZFvDQLAyHfADnwqirkLo0Yy9S
	ENgYL96zGGGkUbARN+6fTaCr/c/UntlmpS6Yzl7USxa6xz8ToeUqIpEUtTTOIFZ/Evmv
	1M+A==
X-Received: by 10.180.80.194 with SMTP id t2mr7049069wix.6.1418221033826;
	Wed, 10 Dec 2014 06:17:13 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id n5sm6518761wic.6.2014.12.10.06.17.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:17:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:17:04 +0100
Message-Id: <1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <20141030082101.GE15148@jama>
References: <20141030082101.GE15148@jama>
Subject: [PATCHv2 1/4] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Wed, 10 Dec 2014 14:17:16 -0000

* building with libav-9 fails with:
  | checking for POSTPROC... configure: error: Package requirements (libpostproc libavcodec libavutil) were not met:
  |
  | No package 'libpostproc' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 30e5deb..7304fff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native"
+DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native libpostproc"
 
 inherit autotools pkgconfig
 
-- 
2.1.3


