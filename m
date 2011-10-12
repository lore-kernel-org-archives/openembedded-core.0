Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDtaw-0005Jl-D6
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 09:51:18 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so617268bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=j2LHG6P03fu1C00ROqjKAqXfH26FsM+DgPaacFxN/OY=;
	b=frii7/V0GRksA0u9vaphHr+yA5+MQDZoaBD6rXfr1/iSf7jR68LE0V92MxJkCvo06F
	qOjruq+PYDiD1Mxi0zvoy0lrf9T2hLGjWAh0Bh3fs5JXPla1Rpqf3fTAYzHVspq86ENv
	p5mT3Wju4RQ0GxCI0lPU5Zkid6yRh3vNTowro=
Received: by 10.204.148.68 with SMTP id o4mr9541237bkv.21.1318405538235;
	Wed, 12 Oct 2011 00:45:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm1074126bkt.4.2011.10.12.00.45.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 00:45:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 09:45:05 +0200
Message-Id: <7e093347edbd2234e2884a423cb4bc7f27c6bb52.1318405370.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318405370.git.Martin.Jansa@gmail.com>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
Subject: [oe-core 4/4] xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
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
X-List-Received-Date: Wed, 12 Oct 2011 07:51:18 -0000

* as discussed here http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010899.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 ++
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
index 690de3f..2c5bb0a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
@@ -3,5 +3,7 @@ SRC_URI += "file://crosscompile.patch"
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch"
 
+PR = "r1"
+
 SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
 SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 0cc3dc0..a8c7b0a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -60,7 +60,6 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-module-libxf1bpp \
              ${PN}-module-libxf4bpp"
 
-RDEPENDS_${PN} += "xorg-minimal-fonts"
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 
-- 
1.7.7



