Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9G3J-0006cu-3C
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 15:53:57 +0200
Received: by wgbdr1 with SMTP id dr1so553733wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=m3nEOHOahUZvtiu7JhJRWDkRypa8rmH0N3xDizxCSPQ=;
	b=Ua4iPDoDOhxb8NA9xLE6s92HTOL7xlOGTVk/ZHVsVS/lq60180VFKb5yNloCZEzz6q
	gZnm0X+dxhoXwmhw2NZqVQrQlmYjox22pmWiGnUbYxnAGZKXcyrdu7sFqXu2b3WWZi6r
	xmFyjYcQpLAogHxXhzP0yG3OuEYamTDre/6wc20UYCQptOsVh+FGuIksYOPdvVkvQivl
	MCJP/EmHHBknhbk78RMn2gwMEieCEivKgRBhbWcepmNqK5fuxSgvOPEePCPaEHL0uECx
	A1a4WPiJfeaCvviQFZN5NfLPKyXQq1jNlt8ZyKcY9tEXZDDkIvFdDiNixQU3y4/i8dHC
	W85w==
Received: by 10.180.100.133 with SMTP id ey5mr38365165wib.4.1346852494127;
	Wed, 05 Sep 2012 06:41:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm4784645wib.0.2012.09.05.06.41.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 06:41:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2012 15:42:01 +0200
Message-Id: <1346852521-22320-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] pulseaudio: fix pulseaudio-server RDEPENDS
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
X-List-Received-Date: Wed, 05 Sep 2012 13:53:57 -0000

* module-cork-music-on-phone was renamed to module-role-cork
  http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3c5cc345472302b9511c19244b3eceb4a3674d8c

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 22870ad..315d4dc 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -138,5 +138,5 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-suspend-on-idle \
     pulseaudio-module-console-kit \
     pulseaudio-module-position-event-sounds \
-    pulseaudio-module-cork-music-on-phone "
+    pulseaudio-module-role-cork "
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 5359146..97bd4d3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.12



