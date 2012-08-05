Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3MN-0008Ml-0g
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:07:19 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so885645wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=8JP//vHwV9CBzgvnMRhOxjZBP2DeoRJCgw8ZuVj3QtU=;
	b=N1GTW9zvNWFP/n2N1uvfCgjHHeRRGRcHPi1n9XXFliTKb7la1S+S0Xa6SzBS5grLQ1
	+OTbzH/WGpRjQqLxfliA3UQnIXwcwhULWjJunef+YN8gGviPC6J3wDin7Ct06+tLDxKk
	cZLCE5fxVSVrV4ABVPtY62ugynnpnJ9Ho852EPQy1UPMGF5a6ncaF1ue9t68IyFcYtdR
	jJRoLt4bYN1SyrKwp/u1+hpDsPLiXsiwfzYeA+Xfj7+lzoAk6KF/8VgYXeJhyJvFsQ94
	WKokD+Z5Xy98X3htwOm2QUUD/blWNMgTq9rniHQpXC/90eYaR5Rjt9+8btBajdvjWCb5
	W8Jw==
Received: by 10.216.144.234 with SMTP id n84mr4129792wej.78.1344182137842;
	Sun, 05 Aug 2012 08:55:37 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.55.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:55:37 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:54:17 +0200
Message-Id: <1344182057-15981-31-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQn0qje529ThxvZOmYBcaxY7aU3yX2tdNM/IoTAiwiBxhFVmNMvS4P94hsVLqdUZncluGuiu
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/30] man: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:07:19 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/man/man_1.6f.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
index ee3d648..c8b3f40 100644
--- a/meta/recipes-extended/man/man_1.6f.bb
+++ b/meta/recipes-extended/man/man_1.6f.bb
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



