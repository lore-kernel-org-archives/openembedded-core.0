Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9l-00071d-Hy
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:25 +0100
Received: by wgbds1 with SMTP id ds1so1290440wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6nyU6W5JK+UHJ06xFN6RaPGvtpKnhgjjYyGfJARcFC0=;
	b=Shp6yvnU9VeptJTEetMwjV6ZDto6to3b/axT6pwo51wCsV2wOQuAxbSMqs/uZfAVm3
	+uChGFoKujiyVAgF0gTuIv+oEQO4V6AEITs9IU9Q33vCDDLEuGu20TXb4RahBbv+i7L1
	PMi9OMKmzLUjP7pfYf7OCwgjBVaFzlVvU+9whNNy/jXa4e5HE6RbPtJvWP7xU5R53dQI
	/l6EUSBUOxanWUii6hLZLSMVwOTDtEO2ITXaOr8pSulQHcHEpm/bd+jcduN4UF69494n
	wqQG9UdYoPlyBg28v/krzm/DnZ910tEO3cKKOc9xNc5gzaKvfnEkaq96L8Rj0bUoe9EB
	u8gg==
Received: by 10.180.95.34 with SMTP id dh2mr611154wib.15.1332541888970;
	Fri, 23 Mar 2012 15:31:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm28706980wiy.3.2012.03.23.15.31.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:45 +0100
Message-Id: <ecfac5f6eb5c63cf5071eefe300bb3dfcf329ae9.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 06/10] cairo: import native support from meta-oe
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:25 -0000

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



