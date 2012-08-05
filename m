Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70s-0004kU-SU
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:22 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=lYoDrXMXVZolTq7W3/oPGd4GxsOGcVTAirYels8CLZ8=;
	b=VSmgqDzhtsbvCurvd220MrSSgILU6buxVwMSOMmAMONsT4WyZZiu+lE8W2n0MQq2Sn
	tTqMxxp+BOsMb6MyA2zCuKUY+an4RGx7KRqvGyo3rPVcFrppA0JnNp1GnmwSjdj4VOtj
	cy8mhed9Dd5zag9u/7c+Dd6BdcvgPfkEZ6cQETKr+tet4sX2FFTHVwRed+EGiqUhqY/d
	khbECmgNdS3uhECizfVkGujLNJuhKT1sX5KPODa6S0tQ8MKTzQrimvjo0Uljgp102AR9
	Y2m1JPe6TPi44/xcT3UFIdvuiATbolKyXM8NipuX8BnQRWMM90aUEu1O5Rdqs2Zsq+a1
	mZ5Q==
Received: by 10.180.75.209 with SMTP id e17mr14414340wiw.0.1344196181423;
	Sun, 05 Aug 2012 12:49:41 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:40 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:33 +0200
Message-Id: <1344196136-7643-6-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQklAbMUkZUlXGkCfr74L5B8GCh5cU3LQGW5J19NAco/rk/HBPzva/+9a33MwBKwMHz6Ddki
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 05/28] lsbtest: use ${bindir} instead of /usr/bin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:23 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsbtest_1.0.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 1191164..5ebea53 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "automate test for lsb"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LSB_Test.sh;beginline=3;endline=16;md5=7063bb54b04719df0716b513447f4fc0"
 
@@ -14,8 +14,8 @@ RDEPENDS_${PN} = "rpm"
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}/usr/bin
-	install -m 0755 ${S}/LSB_Test.sh ${D}/usr/bin
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/LSB_Test.sh ${D}${bindir}
 	install -d  ${D}/opt/lsb-test
 	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
 	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
-- 
1.7.7.6



