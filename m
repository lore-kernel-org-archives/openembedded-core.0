Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fL7-0003th-FJ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:49:29 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YVox4oyNZhVo9+FVoFPxOxkksWXe3LlJ4cyjOFPASlw=;
	b=AemZxiKoeDTePNB3o/06v7+35oGKR7MycmOjLzgy8ZXtE6uimvMVpB84CrGXbdId++
	O4hoxbBSwFGRanzN9pT6XFYnIJGz5Ay8syZ3POWdFxvKkKSAFBatucf0mhmTroAaidRl
	j02KepYheKD/lf5evgB8zVhlD1pLtlOHXc0/A=
Received: by 10.223.9.69 with SMTP id k5mr18648319fak.62.1317397442613;
	Fri, 30 Sep 2011 08:44:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u18sm7158471fac.24.2011.09.30.08.44.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:44:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:23 +0200
Message-Id: <320622e8b1dfae52c230a37e69b50d263700e73a.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 4/9] libglade: add gdk-pixbuf dependency
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
X-List-Received-Date: Fri, 30 Sep 2011 15:49:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/libglade/libglade_2.6.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index b0e0339..90a7b33 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "libs"
 PR = "r1"
-DEPENDS = "gtk+ gtk-doc-native"
+DEPENDS = "gdk-pixbuf gtk+ gtk-doc-native"
 
 inherit autotools pkgconfig gnome
 
-- 
1.7.6.1



