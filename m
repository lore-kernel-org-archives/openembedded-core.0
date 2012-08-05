Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71i-0004kU-Sz
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:14 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=uQNVNwU8KBnhSsJMnPtltCxI3NP0xPnceiug81FhN+k=;
	b=I7f7yNTX1Xw8fARjGRaBFR6s7Fu3/B0EqqjgEtGiVqB8nx3efSj56LVzb/20fXWP2R
	vT8vUmUphhPJUXdVAUMSYk8r3atxV3YXFi84nrCT+QUKRycImSnQVld9ijVFGoM9JDbR
	RS2emXjKTODq+QW+ftg5SAtLamfnNCg0T8BB9Gpe6uzmbbhFjWpyQSCzRRVihvTByJHp
	qexhr9mM1WqF6ae4gOY6+KLQgzl77TF1L+c+G/F2yLBk6lWHd6TGIPeXwR3nVbEIzbcx
	sHRDlntkOOcnj5aYxKl05dYEyMXknkrgA7+bDJ7VRzRSA51AxxvsdQT2Eunz3PwLtEhn
	yz+A==
Received: by 10.180.105.6 with SMTP id gi6mr12432554wib.4.1344196233265;
	Sun, 05 Aug 2012 12:50:33 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:32 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:53 +0200
Message-Id: <1344196136-7643-26-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQliTaw3Vm9P1iQHA0gcuwfdw7LziTc8s0uzdT94wpgWnP/XwQuhR4g0p9q9NmHM3yLMoGqp
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 25/28] qemu-config: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:02:15 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 56ee465..8305f3a 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 
-PR = "r24"
+PR = "r25"
 
 SRC_URI = "file://distcc.sh \
            file://anjuta-remote-run \
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



