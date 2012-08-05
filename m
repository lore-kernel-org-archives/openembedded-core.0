Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71o-0004kh-RY
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:20 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=qpeAnIj2v6GiWtwdV+3B0IrknIQ8LDKp+YgpR5rXrL0=;
	b=ZxszzlX9I2p4vV5jqGmaTEjn38ZjA//Xerc/lGlcF3XAu0Zm0uPoe/gPFjB8vhLM38
	uffoLB51OHZPwOX+KQTWULEndkl2Y0SkRB32j65luo9Fxmfz1IMqbu6h2JNLtGl7u0oN
	Lrl7lgbbNw9RoC/huUCN1bMJaxL1z181Ph5N+9bLTkgj6947lRTN8sl0pDUeOosW7LSD
	vL67sIiTjPAebLgG3wFtnHAEOfe0RJ5KuNKFB5fuy+RyTbNwRsnVNYTktLLcocGj3Mln
	YrdsCN//yrtyboHKspedFMltRuyfIfglRKJsPXPJHf5oFZStbDud78lotTbImkwESsuG
	xMPA==
Received: by 10.180.74.33 with SMTP id q1mr12426914wiv.4.1344196239340;
	Sun, 05 Aug 2012 12:50:39 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:38 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:56 +0200
Message-Id: <1344196136-7643-29-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnyj2kw8O/u09L2n7mZmYs6Swx1n2AUwfdVwgIuxjsoLuVinDcoQReZ8xlHC1FbaLEm+Pzi
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 28/28] man: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:06:05 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/man/man_1.6f.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
index ee3d648..9f75307 100644
--- a/meta/recipes-extended/man/man_1.6f.bb
+++ b/meta/recipes-extended/man/man_1.6f.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "A set of documentation tools: man, apropos and whatis"
 SECTION = "console/utils"
 HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
 LICENSE = "GPLv2"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "groff less"
 
@@ -51,10 +51,10 @@ fakeroot do_install() {
 }
 
 do_install_append(){
-	mkdir -p  ${D}/etc/
+	mkdir -p  ${D}${sysconfdir}
         mkdir -p ${D}${datadir}/man/man5
         mkdir -p ${D}${datadir}/man/man7
-	cp ${S}/src/man.conf ${D}/etc/
+	cp ${S}/src/man.conf ${D}${sysconfdir}
         cp ${WORKDIR}/man.1.gz ${D}${datadir}/man/man1/
         cp ${WORKDIR}/man.7.gz ${D}${datadir}/man/man7/
         cp ${WORKDIR}/manpath.5.gz ${D}${datadir}/man/man5/
-- 
1.7.7.6



