Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJab-00043l-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:36:41 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=98hl7R5PXvtfvj6l+IEhEVHkPRpoQ4GUrsdGP9CSpxY=;
	b=w6/SaDRdoDh+sVzPZ1Otr3PCI3QzL9zLQcMoLsnCyKd5NEgk7aKWGckJLnnTstxKpO
	26dzoGuPMaQfhgxtbC9mkYXcR4sQ0m2RFv2lBo9KkD2eI9UXUaCQtVVU0J6fM1p4UjEF
	93t0Dr/CrGc3OFOGxJD01JdidgVe8WoMSwk/o=
Received: by 10.204.144.87 with SMTP id y23mr2335879bku.93.1318505454782;
	Thu, 13 Oct 2011 04:30:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm3291029bks.1.2011.10.13.04.30.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:30:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:20 +0200
Message-Id: <021fd1501d3aece3f23a2e2b645874fabc36d7a7.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 02/20] xserver-xorg: move PE to xserver-xorg-common and bump it
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
X-List-Received-Date: Thu, 13 Oct 2011 11:36:41 -0000

* to provide upgrade path for meta-oe users, where it had PE = 2 already

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |    2 ++
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index a8c7b0a..2559397 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -12,6 +12,8 @@ PROVIDES = "virtual/xserver-xf86"
 # Other packages tend to just care that there is *an* X server:
 PROVIDES += "virtual/xserver"
 
+PE = "2"
+
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
 SRC_URI += "file://macro_tweak.patch"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
index 8e97888..0f94fe2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
@@ -1,4 +1,2 @@
 require xserver-xorg.inc
 require xserver-xorg-${PV}.inc
-
-PE = "1"
-- 
1.7.7



