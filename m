Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70o-0004kh-B4
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:18 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=zE+2+Hdvt/8696+ax9lL4V0X+lgzVWF5geofRtOy1tI=;
	b=NktAnl8hzzDWwhFRS4PK7ipqYDfGaiUYHB3vkDDUhNuuOqS5Q6ZiRCO4pj3m1bmuK4
	v5aBOgsvCJCKgJ4TMI3HcXtJsivgwU6fRRMMSXaxPD+SsFX5LCttTqtEOt3rUb8fAFx9
	qxxIdqB7aDKwOBU+VCAHQIufS+Uvkx4wLmEH4w2RlswFR88mr1jfbuDnf8Xfph69p7iT
	pioFxx2JKtxdKr3Bk0/XUII8EgO46gYC0HVx87fVDZJvlHg4QavIKXuRyxGVcfhxEJZR
	0Mx44ii5xyZF3VCgRTsk5fGyCEpO8L2n1gb25Nd3tCrtMgMLOuTCSTvKS3GLuNVfY6wM
	P5WQ==
Received: by 10.180.106.137 with SMTP id gu9mr12324977wib.20.1344196176912;
	Sun, 05 Aug 2012 12:49:36 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:36 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:31 +0200
Message-Id: <1344196136-7643-4-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlLZZPEpT1qdx5IDJGLlSgzmgEW9MjZFzPRGG2EW0h/j+pDaA4rSlwiVfD+zIEtz+SDA5Dt
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 03/28] lsbsetup: use ${bindir} instead of /usr/bin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:18 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsbsetup_1.0.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
index 9172ee3..2792d51 100644
--- a/meta/recipes-extended/lsb/lsbsetup_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "auto-setup environment for lsb test"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM = "file://LSB_Setup.sh;beginline=3;endline=16;md5=97451c7c0786ce5bbe9ac58042945583"
 
@@ -11,9 +11,9 @@ S = "${WORKDIR}"
 
 do_install() {
     # Only install file if it has a contents
-    install -d ${D}/usr/bin
+    install -d ${D}${bindir}
     install -d ${D}/${sysconfdir}
-    install -m 0755 ${S}/LSB_Setup.sh ${D}/usr/bin
+    install -m 0755 ${S}/LSB_Setup.sh ${D}${bindir}
     install -d  ${D}/${libdir}/lsb
     ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/install_initd
     ln -sf ${base_sbindir}/chkconfig ${D}/${libdir}/lsb/remove_initd
-- 
1.7.7.6



