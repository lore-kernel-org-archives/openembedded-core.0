Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATMH-0002tN-7D
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:46:17 +0100
Received: by wibhj13 with SMTP id hj13so1837592wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6nyU6W5JK+UHJ06xFN6RaPGvtpKnhgjjYyGfJARcFC0=;
	b=D9wCCYutdMOrPwoj+NDM1JPAkacAlpmCPr1exkBH6fpN4bzW3RazZbLdTwO9jzgkRT
	RB6o7M5m7e7XvoEe+9iI4ZIky0ehmOnB26xlPYBMjFHWLK4APcVnYT1ybkynPzHGz11H
	kM/qEeWAXskbBBuUMT8y3Zr3QqWr7FdEBtkXH5ZLxozcy38Ss65S3Io3NUYbnxz4m3kM
	OZ1W/ZOOHDvfTQGuXCZuHeYzxn+xeb/097LmZRkjgWR3+NCi52+i1WwHFwNgoSHE5isb
	M/wa8JIsribnV3HNiL0nNa4jhi6Fnn+e5jvImWp/+v7lIro4JXi5+GTGKyQrp1Dbwqao
	2Gtw==
Received: by 10.180.107.164 with SMTP id hd4mr41286865wib.18.1332365843280;
	Wed, 21 Mar 2012 14:37:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm12390570wib.8.2012.03.21.14.37.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:14 +0100
Message-Id: <3cab0afebdd32210797ca37f661df1d0d494a1a6.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/13] cairo: import native support from meta-oe
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
X-List-Received-Date: Wed, 21 Mar 2012 21:46:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc       |    1 +
 meta/recipes-graphics/cairo/cairo_1.10.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 69984cb..3059fae 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -16,6 +16,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
 PACKAGECONFIG[gtk-directfb] = "--enable-directfb=yes,,directfb"
+BBCLASSEXTEND = "native"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 206b026..56aff53 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
-- 
1.7.8.5



