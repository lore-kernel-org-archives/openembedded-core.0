Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lc-0007dQ-8f
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:32 +0200
Received: by wibhm11 with SMTP id hm11so885152wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=d7HAfISthuZHw4LjNmZjpu/AjwtcvZAwbWvNqjIf8wY=;
	b=iw5zWtBCmQGNJSLbLLplz5IkDVCu/3ApFQv83Eoxhxw1wc1wawS6fKxv7n4Qf/EWmO
	FWyb8wD77mABrqykm1bYGBRmzEo7eK6jkmxSaY4wYpyF3k+UD+4qI6d3OFcL6e5dgEkP
	Vzy/UTga9Ig6t9vWFwKI7p1ZwUcJfUwS10N8/M+ugR93lcL+yL/6e00hb+ZGda0osze6
	yaYJgHXmmIP8dpAN7+KB8hnHCmCWOmGRKlni/WvnBjOE01keKxuzIWtOmTVyIpbunNfA
	4naJbimOXqFoo4DCE5CMUsvoE+LIf+Q8f29agHEPVPog6Jz48S3d6jQSPlfenG0dq4c8
	ZsEA==
Received: by 10.180.98.138 with SMTP id ei10mr11533277wib.1.1344182088895;
	Sun, 05 Aug 2012 08:54:48 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:48 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:50 +0200
Message-Id: <1344182057-15981-4-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQk80j/NUPuI2vCZWqM+p4rFO/+6yh3an7rQ3o7J9HTQiEIV4UUaoSWL1gP+rFPiGDfrjrgS
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/30] lsbsetup: use ${bindir} instead of /usr/bin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:32 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsbsetup_1.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbsetup_1.0.bb b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
index 9172ee3..bda4589 100644
--- a/meta/recipes-extended/lsb/lsbsetup_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbsetup_1.0.bb
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



