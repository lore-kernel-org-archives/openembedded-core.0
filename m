Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RaT02-00065X-QD
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 15:06:30 +0100
Received: by eaal1 with SMTP id l1so1585883eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 05:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Hai9QmGxqR5jLOawgtpdjdXOtHVaojqz+ShzoT9YnOY=;
	b=LNaQTaFbq6oQFKbx4IS8IaVeRQRSr+VQIycSWa68YEaEUKl410zBoPk+LUNQiqCo+8
	WW5xK776iR5wpH+uUjG1mOpKTyR9WOD6WQClNRW4UtzGfm1DjjEsiXfgH7CVff81FRL/
	7jDKw1k7HirJV8GIgBZ/SdtI9I/lQekwJSTzw=
Received: by 10.14.4.160 with SMTP id 32mr4314100eej.91.1323784772264;
	Tue, 13 Dec 2011 05:59:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm77116973eef.7.2011.12.13.05.59.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 05:59:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 14:59:14 +0100
Message-Id: <de47874e4149d761b2a03fb2ebd445b71d7a06db.1323784347.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <f62734520b4996df6a49cc7be7d60e2af934447e.1323784347.git.Martin.Jansa@gmail.com>
References: <f62734520b4996df6a49cc7be7d60e2af934447e.1323784347.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323784347.git.Martin.Jansa@gmail.com>
References: <cover.1323784347.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 2/3] xf86-video-omapfb: bump PR due to arm OVERRIDES change
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
X-List-Received-Date: Tue, 13 Dec 2011 14:06:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-video-omapfb_git.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 565ad7e..f16441e 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
 DEPENDS += "virtual/libx11"
 
 SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 PV = "0.1.1+gitr${SRCPV}"
 
 SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
-- 
1.7.8



