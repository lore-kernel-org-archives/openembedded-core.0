Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu6V-0005YU-3u
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:37:23 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=t+hxNcbklGmLK3C40G2IqJIbSTKbh0RkLptGtk+KPWg=;
	b=dsXID2BQS/T0vZ9JadRo5M++zwp2WLMBYYs/GM6ZMcBJeuZlTdkdWpjsu6eVr7bIpO
	DFXNdpYlFAbXCM0IlenDF1ElltQoXJOggEBl80+8XdQCeIcrnAISMS/+vbAKw2bbrCpO
	0XloilLmWk4TUk8q5X4PzUESvXnVoZyPguA9w=
Received: by 10.204.130.65 with SMTP id r1mr8878189bks.27.1321029066691;
	Fri, 11 Nov 2011 08:31:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id by2sm1773684bkb.15.2011.11.11.08.31.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:31:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:51 +0100
Message-Id: <4ae5661480a81af4bc80ed9a02c01bc3176d4f2b.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 15/22] libsdl: replace tabs with spaces
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index 2f49f16..b1b2137 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -18,7 +18,7 @@ DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-n
 PR = "r1"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
-	   file://configure_tweak.patch \
+           file://configure_tweak.patch \
        "
 
 S = "${WORKDIR}/SDL-${PV}"
@@ -35,7 +35,7 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
-		--disable-video-svga \
+                --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen \
                 --disable-rpath"
 
-- 
1.7.8.rc1



