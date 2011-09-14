Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pPc-0000HO-Gg
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 15:22:00 +0200
Received: by yxj17 with SMTP id 17so1316567yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5SnukEZAmD1UVQ9tLx+UOshToV6r0QpJpdz2wKN1xtM=;
	b=puequNZ3x72AuREnl0PEirSsNOT0/rXULVTyamXscqYrj0EVKIVX3h20FuBaWEXmVW
	mkMWwg8zAYVDvtSUOo8NQcNhbNTCt9+LDv+uNpqE0PoedOawv+iawZfD+gAL4ZDic3Iv
	plRBWfarKfm/La8W9wJudAVuqr+b/HlZ86Zfc=
Received: by 10.151.29.5 with SMTP id g5mr696449ybj.336.1316006209770;
	Wed, 14 Sep 2011 06:16:49 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n2sm784948ybh.25.2011.09.14.06.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 06:16:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 13:16:32 +0000
Message-Id: <a683dab2359836c05ab621247e6d65f51fc58140.1316006156.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1316006156.git.otavio@ossystems.com.br>
References: <cover.1316006156.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1316006156.git.otavio@ossystems.com.br>
References: <cover.1316006156.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] xserver-xf86-dri-lite.inc: use ${datadir} instead of /usr/share
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
X-List-Received-Date: Wed, 14 Sep 2011 13:22:00 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
index db2d126..3aca760 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
@@ -28,7 +28,7 @@ EXTRA_OECONF += "--disable-static \
                  --localstatedir=/var \
                  --with-pic \
                  --with-int10=x86emu \
-                 --with-fontdir=/usr/share/fonts/X11 \
+                 --with-fontdir=${datadir}/fonts/X11 \
                  --with-xkb-output=/var/lib/xkb \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no"
 
-- 
1.7.2.5



