Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4P-000258-Ap
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:21:53 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so3528794iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=djFECtHWOXrwKZ459w0U9y/eu652s7RcdPnoXMLRKww=;
	b=qy5oTMfOyzAlTybjx/gnnRbOEhKgzBS5zSHpSBqz5yjvzh8o3+yIY6t0kP/Jz34KgC
	3X71cREHttj0u6zxBPxLUuJaMAZTRT6YJY4n2ZDynLH8U4fYnAfsO2IDk1TlN3IjzLvI
	kSa+ure2kzdh8kfFYUuI6GrMZ4eIItS8LP0G0=
Received: by 10.42.146.72 with SMTP id i8mr3337223icv.290.1311034670849;
	Mon, 18 Jul 2011 17:17:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:25 -0700
Message-Id: <ba0b7fce68173247e54d37bc4cdb4b9192dca37e.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 06/16] libxdamage, libxft, libxrandr: Add missing dependency on virtual/libx11
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
X-List-Received-Date: Tue, 19 Jul 2011 00:21:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    4 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    4 ++--
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb  |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
index 81f90ba..f2b4eac 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb
@@ -16,10 +16,10 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe101f30dd24134cf43146863241868"
 
-DEPENDS += "damageproto libxfixes"
+DEPENDS += "virtual/libx11 damageproto libxfixes"
 PROVIDES = "xdamage"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXdamage"
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 1a56702..33c8a1e 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -15,10 +15,10 @@ require xorg-lib-common.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 
-DEPENDS += "libxrender freetype fontconfig"
+DEPENDS += "virtual/libx11 libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXft"
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
index 917fe20..616ac68 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.3.1.bb
@@ -11,9 +11,9 @@ require xorg-lib-common.inc
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4c5c132d3690478179d78ec3bf064584"
 
-DEPENDS += "randrproto libxrender libxext"
+DEPENDS += "virtual/libx11 randrproto libxrender libxext"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXrandr"
-- 
1.7.4.1



