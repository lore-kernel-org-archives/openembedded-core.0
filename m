Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71g-0004kh-Nh
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:12 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=EVtRjs3WVo8HDkAwodFUeYGqI3wIVTCkvGZUtRfzeN8=;
	b=OQtRfRVaq1+8z+HzWSpdt01/Fza9IjeTLqD2bHJo1D1fW47K3RczioHyhLWp1s3okZ
	0pIPHZ7GsrsTmhaYWLwjTa3qAc24MN3ZxQgmCiohgn9c6xchGjVF+6gnJ8dDAJaeMGlc
	B1jsI/T0DbzKDV7GALao70/klsUV5GINfSEMrSocuLvsxQ+WVQOEKZhCEnVeFfm4ezoG
	BEltrTR+DgXXxy47E7wWuLLENQLUCsMiS26GD/z8TIPDg/EtCXZb6z8aBiRv4LTmWvfa
	jSTMzbBIB+N43RkhDRW+HSByIREUnZ/0PKMX7jUNxhipJCR61yq0iI0DCG0/232eX8RK
	hsHQ==
Received: by 10.180.83.66 with SMTP id o2mr12364030wiy.14.1344196231335;
	Sun, 05 Aug 2012 12:50:31 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:30 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:52 +0200
Message-Id: <1344196136-7643-25-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlCke7HvBcvaiX6wzoSVXUTsOZgK+0yMs3Ice7iov5N7TMPZhrh+zWj7JIcCxo+33Z0JOhf
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 24/28] usbinit: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:02:13 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-bsp/usbinit/usbinit.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index e2a036e..37e3b16 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "Initscript to manage gadget Ethernet"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "file://usb-gether \
            file://COPYING.GPL"
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



