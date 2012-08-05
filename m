Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3M1-0007dQ-Ed
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:57 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm11so885152wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=uZonvDiU7XwBowdY3C1QAHDUis2AAFOwnmwe9TJKxuo=;
	b=Pr/lCVJFQ77GpM7d97Z8PAU0prYtwh9Nh+1mifDE6zfyrWee3Wt9GPa+7exrRKdbhY
	LFZGatU6TM0XeYK/qlfgSNFE7XMTHoLLcOomzpAR5n+RJPzCMkk0XYG/9aN+XDGKDGIh
	Mz4PxgJWc2rTxQTe9PB92mwm79J109qp7RW6k0o5KNYB7y8f+SvCMF6Zy1AL/KGgABNo
	wQ37qCFRhhstF5ArSKG2Uz6Olo0gPuDhgYzxFglWZrWW+1YO76iy/D0i9MAJh9SCc9zx
	oXqurvxsLekWrKhQzya/lK9yVuzslZIwx9axtRgxAXKXb6HIKg8xMZe60U81A3bIsLtl
	yleQ==
Received: by 10.180.82.39 with SMTP id f7mr11546893wiy.2.1344182116276;
	Sun, 05 Aug 2012 08:55:16 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:15 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:05 +0200
Message-Id: <1344182057-15981-19-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnRLtvlarURosGNtU1sXqLw6NB1Wh12s7Wuy/03x+XvG/rRbrcq+Xu8UKBPpbCbL4rSrO3a
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/30] openssh: use ${localstatedir} instead of /var for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:58 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 376023c..f0e87be 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -78,7 +78,7 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
-	rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
+	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
 }
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.7.7.6



