Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmgrI-0006Vg-I6
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:47:46 +0200
Received: by fxg11 with SMTP id 11so2229244fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ENdYMqTOmbskRUE0VdbbI9mAd75i5kdP6uKvGEmHAag=;
	b=YToz78QnMX3Ag28QLyWiLYC6ZORU36Ju8toqjHqJwX/EQSminnsDslCVeqsdtey7Ae
	xwoQZs4U8GnGuoek0ol2q5qgZWpDecaaDA2Q1H1JFJeCclcy9+DDW2ouFACNim7SF3kr
	sfkjhwWvdbSLjYM2B6bjyo4bIbgGugEo9H+C4=
Received: by 10.223.98.130 with SMTP id q2mr1251609fan.137.1311921808108;
	Thu, 28 Jul 2011 23:43:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c28sm899182fam.40.2011.07.28.23.43.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 23:43:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 08:43:19 +0200
Message-Id: <1311921799-28859-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] polkit: depend on intltool-native instead of intltool
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
X-List-Received-Date: Fri, 29 Jul 2011 06:47:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/polkit/polkit_0.101.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 64cca10..f3a6f1c 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 PR = "r1"
-DEPENDS = "libpam expat dbus-glib eggdbus intltool"
+DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
 
-- 
1.7.6



