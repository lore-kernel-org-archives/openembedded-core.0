Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3MF-0007dQ-S4
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:12 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm11so885152wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=8GcSeq4pZV5w/OOe3eF5pSYSRwcZur1gtR/bqwEF0So=;
	b=fAXVtxSdmMCKSPA/ugrh6X1M7bl4IU6ayYNVbRrQ9/u27s94AiquJTkoKysZobtf6+
	9ohmewPBxoUYmIhqdO2AAJO+Xuj1Stt8VdSHMomvYQUU9PljaEyaLMmHaFSunZbhGmqb
	7pXcxDfFRaBf28v40SDdzrhgTBiIVJev0kI/GfPYI3+FeTu6G8LqnBmTjv5JBr1VR9jZ
	F/PqZpBRyylealSPndt0XP3K9iOqPGXVglx/+pV39D1JiRbGXxiViodiIJUIUUBm1y2l
	hEnmMtRZLtvmGIW1IW3lFa8UM42uIukgU1yXwZnQQXHZNv4s7iqhpLOszNj4VnwZIwNn
	qrZw==
Received: by 10.180.96.3 with SMTP id do3mr11535224wib.5.1344182130621;
	Sun, 05 Aug 2012 08:55:30 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:29 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:13 +0200
Message-Id: <1344182057-15981-27-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkqqtvkc6yVWpyTvCw8JGVzBG3beHWrSqbMDAYcaqInv31d0NYF7wp12G9f3C7ly1mUsFvv
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/30] usbinit: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:12 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-bsp/usbinit/usbinit.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index e2a036e..5baa49a 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -10,9 +10,9 @@ SRC_URI = "file://usb-gether \
 S = "${WORKDIR}"
 
 do_install() {
-    install -d ${D}/etc
-    install -d ${D}/etc/init.d
-    install usb-gether ${D}/etc/init.d
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/init.d
+    install usb-gether ${D}${sysconfdir}/init.d
 }
 
 inherit update-rc.d allarch
-- 
1.7.7.6



