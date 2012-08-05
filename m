Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lj-0007ds-Al
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:39 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1373222wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=dTK1H76JRr9Cn1TAh4Nog/z9F/nJAfdA+RJeLtrKuYo=;
	b=G+UjC1XCvXn7zvkrURSj5eLlNtwlHloHGvGbSCGsMXAC4+CqqnnTzQGr143a2BRjAU
	d0yC0o64BN078yeILd+C/hIt5XiqPtparnM8hFZk7gK4BVUu2uPFqjtoFuLDmXFttBF6
	Atwv7OkDVP6JCsCoByoo0nexFR+sEnIooNCvsxEXigU1lY0bRsKNgnvRNU0WHEaqJ/YD
	xoLEOGaTA3JNwPSssTTQwETvgA1a88B6p3bC8N6hhjH0LVZA3n7ipp5g1CyIW9bFewXN
	RFyeDniSDF7qP+4rFMITBEg6PHBe2BEXVE28WT0YgnsljG+SJR9F6feN/6bgyJErZimo
	orqg==
Received: by 10.216.255.148 with SMTP id j20mr3877272wes.106.1344182098113;
	Sun, 05 Aug 2012 08:54:58 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:57 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:55 +0200
Message-Id: <1344182057-15981-9-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQljT4EBulfeleMg8eg97uHMnkE9BB7oyc8VEVWon6LzvWHkP68BqTRuw8sZLzXHzLE3TczI
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/30] ubootchart: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:39 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
index b49e94a..4787857 100644
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
@@ -27,13 +27,13 @@ do_compile() {
 }
 
 do_install() {
-        install -m 0755 -d ${D}/sbin ${D}/etc/ubootchart ${D}/usr/share/applications
-        install -m 0755 ${S}/ubootchartd_bin ${D}/sbin
-        install -m 0755 ${S}/ubootchartd ${D}/sbin
-        install -m 0644 ${S}/ubootchart.conf ${D}/etc/ubootchart
-        install -m 0755 ${S}/start.sh ${D}/etc/ubootchart
-        install -m 0755 ${S}/finish.sh ${D}/etc/ubootchart
+        install -m 0755 -d ${D}${base_sbindir} ${D}${sysconfdir}/ubootchart ${D}${datadir}/applications
+        install -m 0755 ${S}/ubootchartd_bin ${D}${base_sbindir}
+        install -m 0755 ${S}/ubootchartd ${D}${base_sbindir}
+        install -m 0644 ${S}/ubootchart.conf ${D}${sysconfdir}/ubootchart
+        install -m 0755 ${S}/start.sh ${D}${sysconfdir}/ubootchart
+        install -m 0755 ${S}/finish.sh ${D}${sysconfdir}/ubootchart
         
-        install -m 0755 ${WORKDIR}/ubootchart-stop ${D}/sbin
-        install -m 0644 ${WORKDIR}/ubootchart.desktop ${D}/usr/share/applications
+        install -m 0755 ${WORKDIR}/ubootchart-stop ${D}${base_sbindir}
+        install -m 0644 ${WORKDIR}/ubootchart.desktop ${D}${datadir}/applications
 }
-- 
1.7.7.6



