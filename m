Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TDeCs-00053D-2i
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 18:29:58 +0200
Received: by oagn9 with SMTP id n9so5034992oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=CoY56D5Biwu+SbQ6i+nLH+5LW94QIsTFXwCoz65vnCM=;
	b=D3k/Y4KpFWp1z+7eVofiEJKe+R817TRDrvcBHFizI9c5nOJThMxxTXPMfzY9QY+467
	sfcASrCHMemP2cS2Y0YvmrPy2Ai/R/nFWJQn2z9cN84y7vIkPi7XYyu7Nu70OrjoDyL9
	tq3hXp6d8R2F0bwOGR5wI3Z+vrUHIw6uLsuJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=CoY56D5Biwu+SbQ6i+nLH+5LW94QIsTFXwCoz65vnCM=;
	b=DWAfezruKFeFJ4VQTKqJZymA9sJFnQt6dNovqP04u69ihJ9jAQzazkjh6+v/Ic7Mdb
	yKhItC6Tmxhjyab2gyHN+/EhemJwl8llB5tFOvY5h3BjLNEHLcQZouwLMm4Olul5HFdF
	pMssS7fORR/28tgVaAHUx1UfIExJg04MKlbpmwEYrLQlRUwte3oelCGG1qCXmq07WK5k
	xM7U5RRfYnDeCb0wKfhigAhW4c7dwQh9Pp9fHq/5vYdkOOLaDwZt/fGbcQEBK/dLIPd+
	IBdNP2r1oPfWXEkL7o9AbpjI85qb9RkxD8V3Q+z2PQJj7VB1fPoeiLqVuT961NBV3ano
	mgXg==
Received: by 10.60.13.9 with SMTP id d9mr11939937oec.92.1347898638755;
	Mon, 17 Sep 2012 09:17:18 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id k8sm8954428oeh.9.2012.09.17.09.17.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 09:17:16 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 09:17:01 -0700
Message-Id: <1347898621-24929-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmU+DLCfVtMhQFJZmPn8pGr3tXd29khBheLILVP/io75zawNF51mD01XGQjYWSBrD7/6v1y
Subject: [PATCH] xserver-xorg: Modify RREPLACES for RCONFLICTS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 16:29:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index b4a348c..c71896a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,4 +8,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r6"
+PR = "r7"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 6133344..98fe534 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-RREPLACES_${PN}-module-exa = "${PN}"
+RCONFLICTS_${PN}-module-exa = "${PN} (<${PV})"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.9.5



