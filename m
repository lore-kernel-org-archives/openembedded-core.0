Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu7E-0005YU-8P
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:38:08 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0bcynj/XE/tZBJvrJKq71mZNahN3gEz2tyKLcenc09E=;
	b=wBMk2f1o78TBUkZRgmOj0CTgdt04BL/YvzmwtVK/dW/U/qxo1w/mIZN6vzFoHJqAks
	EPhaTeL4Tm03SdJrHN20LUEYSaR42kioHnzDpxyEaETBGcrP9sfg2PAtms1dtkiOiYSP
	7zufDyG+Q2T3s1ycSq+HdbjpaVFCRta1eRm4M=
Received: by 10.204.143.145 with SMTP id v17mr469205bku.81.1321029112601;
	Fri, 11 Nov 2011 08:31:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a4sm1775012bkq.13.2011.11.11.08.31.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:31:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:56 +0100
Message-Id: <ec4315afd25a7d713fb17823f5d4a7c48ec08067.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 20/22] util-linux: add missing u-a calls for setsid chrt
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
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

* someone added them to usrbinprogs_a, but without u-a calls added
* similar problem is with chfn chsh newgrp, but those are not built in
  current version

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3b80736..855a545 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -191,6 +191,8 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${bindir}/mesg mesg mesg.${PN} 100
 	update-alternatives --install ${bindir}/renice renice renice.${PN} 100
 	update-alternatives --install ${bindir}/wall wall wall.${PN} 100
+	update-alternatives --install ${bindir}/setsid setsid setsid.${PN} 100
+	update-alternatives --install ${bindir}/chrt chrt chrt.${PN} 100
 	update-alternatives --install ${bindir}/flock flock flock.${PN} 100
 	
 	# There seems to be problem, atleast on nslu2, with these, untill they are
@@ -221,6 +223,8 @@ pkg_prerm_${PN} () {
 	update-alternatives --remove mesg mesg.${PN}
 	update-alternatives --remove renice renice.${PN}
 	update-alternatives --remove wall wall.${PN}
+	update-alternatives --remove setsid setsid.${PN}
+	update-alternatives --remove chrt chrt.${PN}
 	update-alternatives --remove flock flock.${PN}
 }
 
-- 
1.7.8.rc1



