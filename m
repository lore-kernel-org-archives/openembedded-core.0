Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RSsRo-0004Vy-B0
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 16:39:49 +0100
Received: by ggnh4 with SMTP id h4so330279ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=seVViJERC4lG7tBn6Q1JsI8cnnlsSEmoD+o02tiJ9AY=;
	b=Igb0ztX1b+QQcurBddtve/M9d4bsGpMVe/Jp58wlO1UlT+rNh4gHr0zd1LSUrTJTYd
	4Cqs+Ma+/vS/XX9pAYlT6/Qz5onXiYIj6nXpQlf4SRUhhm7CxfLXgFR+SXClTiIhGOg3
	MOB7hg0axtK7AVlmn9rqhba6g/MwY16dujGX0=
Received: by 10.236.170.231 with SMTP id p67mr27100052yhl.111.1321969667908;
	Tue, 22 Nov 2011 05:47:47 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm19621150yhk.1.2011.11.22.05.47.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 05:47:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 13:47:36 +0000
Message-Id: <65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1321969615.git.otavio@ossystems.com.br>
References: <cover.1321969615.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1321969615.git.otavio@ossystems.com.br>
References: <cover.1321969615.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Tue, 22 Nov 2011 15:39:49 -0000

Xorg VESA driver calls DGAInit enforcing this symbol to be available
to the driver to work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
index 2c5bb0a..8b0808d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
@@ -3,7 +3,7 @@ SRC_URI += "file://crosscompile.patch"
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
 SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 2559397..c1a552e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -100,7 +100,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --disable-acfb \
                  --disable-ccfb \
                  --disable-mcfb \
-                 --disable-dga \
                  --disable-xinerama \
                  --disable-xf86misc \
                  --disable-xorgcfg \
-- 
1.7.2.5



