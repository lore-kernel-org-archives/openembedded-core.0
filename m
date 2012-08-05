Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3MK-0008Ml-1m
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:16 +0200
Received: by wibhq4 with SMTP id hq4so885645wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ExebJFmY6a97DrS+gQEclk3DYiuOL0ZD8oMlssRuX8k=;
	b=kzROpNIrKO7243RnHYRRo5Zl2m0DIjk33044qhFzdZ5LC9zoo3fNqpHblqFQQLX28t
	zx5EpmO5UT3Kp2oAFbpMT0dJRDA5AHTSxxkvvway2TJzQTx+eHu7HIGBWClDv6OUrVy0
	lqGl8JoTIMiiNwPURAPryVFHUW62B/vP94BGHiDRou+vT6kt+TYTfMdTEBM0S0biA4dz
	SRaMsXIE3z3u6pRGxFLKNdBB6GDBqenp6KnWx6x9b3rfkkVIZnDCnGFSE6kf8vIBO5rL
	r/PyBk+B3uHM7HjhkhntQzr8al7F+9cSwT6GbULVHz2bBZjh2IwXyH6IiXXunjIixXTm
	fa3A==
Received: by 10.180.14.8 with SMTP id l8mr11524278wic.6.1344182132474;
	Sun, 05 Aug 2012 08:55:32 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:31 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:14 +0200
Message-Id: <1344182057-15981-28-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQl5uWFZzt5HEqAOu/fFxOy/bMccsnA9+kHTJ53xX1dy342/fEqDy7un743wYiFuc98VUha6
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/30] qemu-config: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:16 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 56ee465..a57d82c 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -28,8 +28,8 @@ do_install() {
     install -d ${D}${datadir}/applications
     install -m 0644 shutdown.desktop ${D}${datadir}/applications/
 
-    install -d ${D}/etc/init.d
-    install qemu-autostart ${D}/etc/init.d/
+    install -d ${D}${sysconfdir}/init.d
+    install qemu-autostart ${D}${sysconfdir}/init.d/
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.7.6



