Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy710-0004kh-AV
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:30 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=PfwuIikxT3CJou3UWq7yXWTuV6J0WUnsGSIod9KiY8o=;
	b=lkU306Qyyie1aQo2jnd3Yu03XAWp8LggcJxUHrxDMqGq2z07yr+SQdfv6EtnnI0rH/
	yTLJzlELv0hvXUBjRvx08nroajapwU7MQRufnT8So8Q2+mqvi0eELYecXq7RwojTP6j+
	u/DtKP2YLngKAMbhXr4eYaEn2WJ+zqgJOuwB6RfQ4wFwdjLVWmcU4Y0FJvkvWE+t+ALy
	iG77hOBp7zWWpIuApZIM9vlzWYr6EYzUiLv7tl1/GbfxTP2h5Cy4/dXUku9CMDX4OtrG
	0YgQTOyOCTXHNqA3tdymLstQYRNOVvJ/5coRlGC6GwxyYD6Xy1t5Rkoanj70THkBFqAG
	BU6A==
Received: by 10.180.97.33 with SMTP id dx1mr12340351wib.18.1344196188857;
	Sun, 05 Aug 2012 12:49:48 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:48 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:36 +0200
Message-Id: <1344196136-7643-9-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQla2/Z83JeRDaqTAXzyfobPP3vjlITOdOUwxqCQcBxZCvVyUAzkRVHO77ThEGqDkDdyP/Cw
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 08/28] ubootchart: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:30 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
index b49e94a..843024c 100644
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 SRCREV = "12"
 PV = "0.0+r${SRCPV}"
-PR = "r5"
+PR = "r6"
 
 #RRECOMMENDS_${PN} = "acct"
 
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



