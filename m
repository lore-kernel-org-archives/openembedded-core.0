Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 33DD7609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 11:41:28 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id w61so2561061wes.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a75XbbTVLPRbMAYKtXIaDFkZgvRk5W8O+kqwX9VYjRw=;
	b=IUqAClzONAF+PJzwghNj+Pgx/IEg5/sia6CN/aUDpdr8JKhTl4PR0qUUdT4SuQNzOI
	kVARMogLC+ifFMKNbGztFuUZNgU7ctNfgYSKBj2BCpd22vOOxORGCr1FUc5CgigU/o1N
	gAdLfZL86wyR4g5zPNsyha6eMlUBeIFEqybP3dk2nOeAa6fev8i00iVCkGC1zf8FAjsL
	ijhJmfLzGiUsK9sWolCaMx1ZNWMWItFp5crC4q9dcbamTH1WvN/t6s7WeNSRRKeF5yMe
	sUEw+HNw3/k8hfle7r4jKDl8aD+VrWnDBcTMzFNU5QUFkeSRL3EfZBZLlfljXVNdFWMX
	s9cQ==
X-Received: by 10.180.11.206 with SMTP id s14mr15155829wib.27.1407325289587;
	Wed, 06 Aug 2014 04:41:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm1875391wjd.30.2014.08.06.04.41.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 04:41:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 13:41:56 +0200
Message-Id: <1407325317-5030-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Wed, 06 Aug 2014 11:41:36 -0000

* building with libav-9 fails with:
  | checking for POSTPROC... configure: error: Package requirements (libpostproc libavcodec libavutil) were not met:
  |
  | No package 'libpostproc' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index e26b267..748157a 100644
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
2.0.4


