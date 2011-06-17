Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QXaSh-0004fo-FL
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 16:55:56 +0200
Received: by gyd5 with SMTP id 5so806330gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=xTEzs8VibDs28B2B727l11w5QXh0ytrTNVd4AJCEioA=;
	b=c5KEwM2WkSE3Lm+7MNWa9uk4dMTUc/suOrL5VM4bDmI0YJXeqNTFW0Z2OQuT3vQRTd
	2EbcxPCO9eyvvqQ97OJ/ejSwrr29edSfxSomcdV18sQWZYK8DBybiWENGiNTCVpvZ3XS
	3EKvOw8VvbANd9MscYEw86SSSqEjd6n4GNUEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=dOPaJRyjsWps19IXiiIh728tkwSXUG17w13jsqVni/iWaQ6NtK/FESRPrPVizM/AGZ
	KRyZ095Ixp9Uk4SooiCQo9AAo++Pu/PMdF2DcMDNJn5AFhlyXeBXpsK4NK/esOAlKdPG
	tkF/4FAGAZeGvS2MtskVqHm1FqtIYEMM66IHU=
Received: by 10.236.76.65 with SMTP id a41mr3444640yhe.207.1308322346019;
	Fri, 17 Jun 2011 07:52:26 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k10sm1754092yhj.50.2011.06.17.07.52.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 07:52:25 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 14:51:41 +0000
Message-Id: <32343282aca11a8a1b6302965fe45c3094a95b41.1308322247.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308322247.git.otavio@ossystems.com.br>
References: <cover.1308322247.git.otavio@ossystems.com.br>
Subject: [PATCH 7/9] libxml: extend nativesdk class
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
X-List-Received-Date: Fri, 17 Jun 2011 14:55:56 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/libxml/libxml2.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index d9ea816..1187644 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,6 +21,7 @@ inherit autotools pkgconfig binconfig
 
 EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n"
 EXTRA_OECONF_virtclass-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n"
+EXTRA_OECONF_virtclass-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n"
 EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n"
 
 # required for pythong binding
@@ -42,4 +43,4 @@ PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-utils ${PN} ${PN}-doc ${PN}-locale"
 FILES_${PN}-dev += "${bindir}/*-config ${libdir}/xml2Conf.sh"
 FILES_${PN}-utils += "${bindir}/*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2.5



