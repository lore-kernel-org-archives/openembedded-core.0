Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Ln-0007v6-AY
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:43 +0200
Received: by wgbds1 with SMTP id ds1so822968wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ENCWsXNQiVNzLHJgx3ElqAPrjj9y7BYVOk2hdh2KpAs=;
	b=fAZdnGBkQFcF577tDFeSdKjwhbf3Ada/X4XxihA9N/KGLmg6s2+46bm3ufowfHvvWl
	4dwR1AMTXFybuFzSJPmtcwBJTPDXwddaYibvkv3xVicncIODcZq1vxeXu96nbFBw1GOW
	EhKyKGvbpt2E5sZR+HCur9/eTNdX1GVj4EykOvGhbkU1sB0I5V55pNvYnRE5/MWQrDID
	CRs45XFgq9fqUBVN7zWgDoGGZgEPm/lTlVg/fI+hUdfA6Xk2x0H1ts1C2hGA0PaipJJ+
	qpDfjHTe4Wi6YTYcct59jovjswicAm9TlP6XFdFO9/YKsXeri0AR4XjZrHJ29bzsHOvT
	IY3Q==
Received: by 10.180.81.38 with SMTP id w6mr11489778wix.10.1344182100021;
	Sun, 05 Aug 2012 08:55:00 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:59 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:56 +0200
Message-Id: <1344182057-15981-10-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlfI4y3n1k5l/lYY+NqcsBEnS/emshFSlDNwD99AdDJq21TMEd/an02lZUgXZmkzfH5XAO2
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/30] xkeyboard-config: use ${datadir} instead of /usr/share for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:44 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../xorg-lib/xkeyboard-config_2.1.bb               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
index b077fa3..1fc94d8 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
@@ -29,6 +29,6 @@ FILES_${PN} += "${datadir}/X11/xkb"
 inherit autotools pkgconfig
 
 do_install_append () {
-    install -d ${D}/usr/share/X11/xkb/compiled
+    install -d ${D}${datadir}/X11/xkb/compiled
     cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
 }
-- 
1.7.7.6



