Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B2EE47DDA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 14:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459TgP651Nz4J
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 16:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558709122;
	bh=DYZg3agS/5/9wxueX1xzMZ/xRZav2CdcxEHWVD3CREg=;
	h=From:To:Subject:Date:From;
	b=HzDsPE9fDs/IDbFjahfXT/BOg4SPlTVGUTN6mVPUTKKpxwzX0yauvz0F6/ESMRRGH
	d3kQya+JjY8n6FDilzHLwXMM4A9dZMM+jSl3bl+I+fxv2MVvJ+P1Q6YONPgbFMzFKY
	ijhqHDhESvY8K8+6vSE2CgXVuRnOpAR3ZVbXMA1HCqK5v8L9sDhQwmZw2exB/2C2g6
	pHstU9Z+FANrlN2oZMeMAcUBwTVjUXJUb5UKxEfO8Yr+6XeZbblRZ28CJJfl7KUowq
	DtyfWGw1FrNnJzjf3yX7WP8bw06vXpAFKGkSWT35LA6taN4fyT/TIJ2sPDi29tDVVR
	6RU0aHRdPWWvRcUhRxS/9kokdXa7axJaYCflQNgFGs88GLT31jpMYqYmgDUkrKzI4c
	fRnp5c7xs4XQq3FAKRwD8uhabKQkPJq1duU7u5GwmA2KLF3T8SIYtcMPVQ5qHLFOt8
	XZsI94Au1M1ttQVEjr1D5Mkz8ZU1GqbVv0AYM0pC73RUdXVk3KQqXUdpusWYyXEflG
	4AZ0d4nrd95ObCK0g0ZgG9RBsATV/HdM9QMGipnLGJX6b3PCirR+0YCn27V7PMdgYs
	ei1Vl94H1hJPMVTW3brQRIT9MgjewWFLzKz8pHpoa2xlO/zLwwzDlGJiTZJ2qU5l/u
	z0nVzdO4aCURdhNp+4jZl7rs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 17:45:20 +0300
Message-Id: <20190524144520.27300-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] pinentry: Switch pinentry-qt from Qt4 to Qt5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 May 2019 14:45:22 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/pinentry/pinentry_1.1.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/pinentry/pinentry_1.1.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
index 4116efc76f..fb529d25d6 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= "ncurses libcap"
 
 PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses"
 PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
-PACKAGECONFIG[qt] = "--enable-pinentry-qt, --disable-pinentry-qt, qt4-x11"
+PACKAGECONFIG[qt] = "--enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase"
 PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
 
 #To use libsecret, add meta-gnome
@@ -33,7 +33,6 @@ PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
 
 EXTRA_OECONF = " \
     --disable-rpath \
-    --disable-pinentry-qt5 \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


