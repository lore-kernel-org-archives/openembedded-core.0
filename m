Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje36-000446-Ah
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:20 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B6Ze/o5Llzv86+375+ol70xothlKvyx5RmHPs5IsAEc=;
	b=osb4x+38sNU/o6CKYpIxtltctCxuD0Jk5i/5b9fasOtGzUQqY3B82MHjCGxgmhI/vc
	JDvfzyhs6XmisMUmmA5I2YtgdP8CXKUHTGskLlG29LS8JrtC6YR8tKNp1+/dSQX9kWMs
	Uf13qnpcKFxLX0LnFRqZRyzzINJ0a9s2IPGsg=
Received: by 10.223.69.83 with SMTP id y19mr894613fai.108.1311196035964;
	Wed, 20 Jul 2011 14:07:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm933236faj.38.2011.07.20.14.07.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:07:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:23 +0200
Message-Id: <c308195bbd9a282ef7b60c3d60f91ad02d7eaa32.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/10] xkeyboard-config: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:20 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/xkeyboard-config_2.1.bb               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
index b077fa3..5633d9c 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.1.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF = "--with-xkb-rules-symlink=xorg"
 RDEPENDS_${PN} += "xkbcomp"
 FILES_${PN} += "${datadir}/X11/xkb"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig perlnative
 
 do_install_append () {
     install -d ${D}/usr/share/X11/xkb/compiled
-- 
1.7.6



