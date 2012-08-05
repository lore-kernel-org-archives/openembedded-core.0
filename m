Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3MA-0007d8-Nt
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:07 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm11so885140wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=GdpAbhvfwXko6tNQeOVZErzbM/eY4KP0zIZtG+9Pbvc=;
	b=d6KEnoSHjW26K/+ZUkrCeLsWrSBIddjZvoDfNz0lBpw9nfn8Cp6Wkkxw10rkAljrv/
	OOMnxnaNLIsXSy2gVmyQ2J2EK3C9TuY/5CU69lfUn9hA4KOkzkdbY+rG/ZYxrfVtfLt2
	Y+9zM4hqOvUdr6Ra8GKuSyLuVHn8u/Kq1sTFaLEVeKENAlI4U5fIIkFRT2kT0ohDFoAn
	6CulUAo4urRhVgYy90lCKmxNM/MzYbY8CMNKvyPHvMZmXVlOFsUzlXkAwId0CTa7qjyq
	7M14tLw09vuuJLmS2MHLZcjXBIrrtXU7FgC8QaROuapEqqMr2/opBMsl8cuxFG9QXRS9
	a8IA==
Received: by 10.216.192.85 with SMTP id h63mr357599wen.7.1344182125377;
	Sun, 05 Aug 2012 08:55:25 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:24 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:10 +0200
Message-Id: <1344182057-15981-24-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQkEChpyg5e2bd7fqsOQ3P/XErjqyG/4I7G8k5mkb0+RU/nTx6cjwwp6fL2TY28RUZKBT7LM
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/30] xserver-nodm-init: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:07 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 .../x11-common/xserver-nodm-init.bb                |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
index 8fca056..0f7f46e 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
@@ -14,12 +14,12 @@ S = "${WORKDIR}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_install() {
-    install -d ${D}/etc
-    install -d ${D}/etc/init.d
-    install xserver-nodm ${D}/etc/init.d
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/init.d
+    install xserver-nodm ${D}${sysconfdir}/init.d
     if [ "${ROOTLESS_X}" = "1" ] ; then
-        install -d ${D}/etc/X11
-        install Xusername ${D}/etc/X11
+        install -d ${D}${sysconfdir}/X11
+        install Xusername ${D}${sysconfdir}/X11
     fi
 }
 
-- 
1.7.7.6



