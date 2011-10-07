Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDy7-0005sF-Hd
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:12:19 +0200
Received: by bke11 with SMTP id 11so5226789bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=w1cDAkA48020Q15L66XBNRRA5hrakfTScY+11uH1Fzg=;
	b=vEW2igbayXsQt9NNHilcYLk/FfqsQpKaxShR2QGbteYLE5+o2pIa7AqeQerrnkyLlF
	yQsr4cIQOAohiVQqV/0CY2Z9Kdt6MCQhGE/EAsQDkFhaaqP29N67d4saQg9nHrItktDo
	jO7HilICxZ8JaZfHUm5xL9QdT9HozNILRXrww=
Received: by 10.204.3.12 with SMTP id 12mr1542394bkl.185.1318007199378;
	Fri, 07 Oct 2011 10:06:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t13sm1837042fae.0.2011.10.07.10.06.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:04 +0200
Message-Id: <3f73019c545d85c8411b72fe9adbb3d5b16ff7cb.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 09/31] xserver-xorg-common: lower xserver-xf86-config and xkeyboard-config dependency to RRECOMMENDS and add few more recipes to RRECOMMENDS
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
X-List-Received-Date: Fri, 07 Oct 2011 17:12:19 -0000

* when someone is using hal or udev explicitly, then he doesn't need xserver-xf86-config
* add xkeyboard-config to RDEPENDS_${PN}-xvfb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index d901e2c..099d240 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -60,7 +60,8 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-module-libxf1bpp \
              ${PN}-module-libxf4bpp"
 
-RDEPENDS_${PN} += "xserver-xf86-config xkeyboard-config"
+RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
+RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.7



