Received: from mail-gx0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pPc-0000H6-DK
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 15:22:00 +0200
Received: by mail-gx0-f178.google.com with SMTP id 21so143204gxk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=16Xhzzc/V3YadXrHz/kZADFLHJYuqSKBXcSjyL8oMW4=;
	b=LCv/ZFDirnyayhA8IGlCQVdtEzQYIlrqMOfgMrMmgHsxwMg7Qi375xicc7UVdZ3ifl
	0fi31tFBXoJdMHExVrrVrArXOqXSSSsP6w917zJxhr0BlfLgabJMUkHwXv34QDrYWeVi
	rSpoEbBv8JD8/90Bdn8Q4GMr28hSoPwJth0RE=
Received: by 10.150.194.14 with SMTP id r14mr941601ybf.113.1316006212113;
	Wed, 14 Sep 2011 06:16:52 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n2sm784948ybh.25.2011.09.14.06.16.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 06:16:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 13:16:33 +0000
Message-Id: <88dbb86072e8f52a8fe16bc9ccf3947f24bbe190.1316006156.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1316006156.git.otavio@ossystems.com.br>
References: <cover.1316006156.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1316006156.git.otavio@ossystems.com.br>
References: <cover.1316006156.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] xserver-xf86-lite.inc: use ${datadir} instead of /usr/share
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
 .../xorg-xserver/xserver-xf86-lite.inc             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
index 7150a2a..5447058 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
@@ -29,6 +29,6 @@ EXTRA_OECONF += "--disable-static \
                  --disable-glx \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
-                 --with-fontdir=/usr/share/fonts/X11 \
+                 --with-fontdir=${datadir}/fonts/X11 \
                  --with-xkb-output=/var/lib/xkb \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no"
-- 
1.7.2.5



