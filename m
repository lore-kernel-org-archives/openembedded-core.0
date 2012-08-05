Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy718-0004kh-8V
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:38 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Z8jxBo6QPxPnD9IzClSt8TeJtbjhaTduu75Ci+dVGH8=;
	b=ScQFP1VcyCFtzhcIUJ8Q/07pCiVmDHdby1LtOl5sIz/Gwl8njNEExPbpXJ10fs3ZPL
	uYWErHhkcOI5W1WahNu7YGPq9FYz7b3xXN3dVXN2gOjwsTeuVazEu+dzmivaOHu1lGuB
	V1DU7sa04lSWFF8jycczsP/IEJnTUZhhA1PJGn3UQs76BpCUpwhW3e88qX9ky68aOKDE
	50ct215HdfaD/jyvQNVWkxhi0mDRG5JK+R3CDX6dXqbfuGvy2S2aGMmTkngLvp/X81iq
	oPYcacxdYKe4VhUdY0iCEutQL/NcCxwQg6A9rnJmp/AE9BUbn87DUV67VN0Z1F59fSjC
	H3tA==
Received: by 10.180.78.135 with SMTP id b7mr12368667wix.11.1344196196870;
	Sun, 05 Aug 2012 12:49:56 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:56 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:40 +0200
Message-Id: <1344196136-7643-13-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQn1HnGQIUKINcdFe5MvzxNop7iSayLgeKt1e56dfPWVk6hlKW/MoiwkZywnbq/6P05cs5N0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 12/28] mingetty: use ${base_sbindir} instead of /sbin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:38 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index fed5dfd..a1f9eb2 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -2,7 +2,7 @@ DESCRIPTION = " A compact getty program for virtual consoles only"
 SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
 SRC_URI = "http://cdnetworks-kr-1.dl.sourceforge.net/project/mingetty/mingetty/${PV}/mingetty-${PV}.tar.gz"
@@ -14,7 +14,7 @@ EXTRA_OEMAKE = "CC='${CC}'"
 
 do_install(){
     mkdir -p ${D}${mandir}/man8
-    mkdir -p ${D}/sbin
+    mkdir -p ${D}${base_sbindir}
     oe_runmake install DESTDIR=${D}
 }
 
-- 
1.7.7.6



