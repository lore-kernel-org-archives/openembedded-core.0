Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNDe-00025L-OS
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:55:30 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so9309171bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cO48nrGXTnxlZmEJbhN2tbeyI+EKthj7fIktR1tyI4M=;
	b=mxbVQoSwq146C3Gx6rf1RushmWPAw3A+4UPyKcSgQhf7ok6Pu9Y1vHbl4VmeCcNQ8d
	+N0YWL5lEXkGSkBQvuq0TKbPL77H3fSL7lcXnfQfCL4+tSa4YF5YyKD/dwcDDWzYtZYu
	K+1Dt87BZ8+mdGi4nPfn1pXq8exFzh6322Vxw=
Received: by 10.204.152.87 with SMTP id f23mr50491383bkw.18.1322570933605;
	Tue, 29 Nov 2011 04:48:53 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	hw14sm23860929bkc.16.2011.11.29.04.48.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:48:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 13:48:14 +0100
Message-Id: <b3fefe2fed7cd9ac81d709587502ea3b7d03dfed.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
References: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322570605.git.Martin.Jansa@gmail.com>
References: <cover.1322570605.git.Martin.Jansa@gmail.com>
Subject: [oe-core 5/5] libsdl: replace tabs with spaces
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
X-List-Received-Date: Tue, 29 Nov 2011 12:55:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index e5fdcc3..89b4487 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -18,7 +18,7 @@ DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-n
 PR = "r1"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
-	   file://configure_tweak.patch \
+           file://configure_tweak.patch \
        "
 
 S = "${WORKDIR}/SDL-${PV}"
@@ -35,8 +35,8 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
-		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-		--disable-video-svga \
+                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
+                --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen \
                 --disable-rpath"
 
-- 
1.7.8.rc4



