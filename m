Received: from mail-gx0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pPZ-0000H6-T7
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 15:21:58 +0200
Received: by gxk21 with SMTP id 21so143204gxk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=y+nkl5ExRM31ng3klu1UarhErOkIjsO0SIkf1RsXV1k=;
	b=KNCsfBH1UYk599u/adbdBRk4+ZzQDwylUueYAq1V623aFhnQMUrKSbXwLNWs5qCZxR
	Aj3F99b9sH4AAyV7ZDkJ0FAJnr08q6vhdLTPMqMW4xu25QrPO+fcJuxlv7G3Fs57eOgG
	rbsK0bB+vogIRPPhoZAopUHOitDeZDCypmKdQ=
Received: by 10.150.148.16 with SMTP id v16mr3377381ybd.396.1316006207149;
	Wed, 14 Sep 2011 06:16:47 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n2sm784948ybh.25.2011.09.14.06.16.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 06:16:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 13:16:31 +0000
Message-Id: <c7d30de848a0e0ee35b206755522043a4ac437b1.1316006156.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1316006156.git.otavio@ossystems.com.br>
References: <cover.1316006156.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1316006156.git.otavio@ossystems.com.br>
References: <cover.1316006156.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] xserver-xf86-common.inc: use ${datadir} instead of /usr/share
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
X-List-Received-Date: Wed, 14 Sep 2011 13:21:58 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xserver-xf86-common.inc           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
index b1a0f08..000aea3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
@@ -25,7 +25,7 @@ RDEPENDS_${PN} += "xserver-xf86-config xkeyboard-config"
 
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES_${PN} = "${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/xserver/SecurityPolicy ${libdir}/xorg/modules/*.so ${libdir}/xorg/modules/*/*.so ${libdir}/xorg/modules/*/*/*.so /etc/X11 "
-FILES_${PN}-doc += "${libdir}/X11/doc /usr/share/X11/xkb/compiled/README.compiled"
+FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled"
 
 FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
                     ${libdir}/xorg/modules/*/.debug \
-- 
1.7.2.5



