Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqJAi-00017D-Co
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 08:18:44 +0200
Received: by mail-iy0-f171.google.com with SMTP id 13so10283699iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2011 23:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7CLyqpYEdRx1r665dZVcu/AqVhJfATrhdmk2BH/gQ+8=;
	b=vQDtb1EH5wOrG0UJhwZrBKVvhtVIPH/XjFXcuWY96UrW3AHs5ul/EkQ96FLqFsS+wu
	GqLVkowAgKiVgzxddyxU4SfNJvs1xlrxmimW7h537USkwU9RSBeBZanAuQ7fSxlD+giU
	2VhOCi7HHXjVnbLbnvsZZ55PtYgPEr5SyBcrE=
Received: by 10.231.118.133 with SMTP id v5mr4775859ibq.97.1312784058709;
	Sun, 07 Aug 2011 23:14:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n14sm1596913ibi.22.2011.08.07.23.14.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Aug 2011 23:14:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2011 23:14:03 -0700
Message-Id: <1312784043-3081-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1312784043-3081-1-git-send-email-raj.khem@gmail.com>
References: <1312784043-3081-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] qemu: Poke more paths for presence of libgl
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
X-List-Received-Date: Mon, 08 Aug 2011 06:18:44 -0000

On ubuntu 11.10 libGL is not in
/usr/lib/`uname -i`-linux-gnu/ directory
so we search this dir too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ac8a3eb..85476d6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,6 +26,7 @@ do_configure_prepend_virtclass-native() {
 
     test -e /usr/lib/libGL.so -a -e /usr/lib/libGLU.so && libgl='yes'
     test -e /usr/lib64/libGL.so -a -e /usr/lib64/libGLU.so && libgl='yes'
+    test -e /usr/lib/`uname -i`-linux-gnu/libGL.so -a -e /usr/lib/`uname -i`-linux-gnu/libGLU.so && libgl='yes'
 
     test -e /usr/lib/pkgconfig/sdl.pc -o -e /usr/lib64/pkgconfig/sdl.pc -o -e /usr/include/SDL/SDL.h && libsdl='yes'
 
-- 
1.7.5.4



