Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBD9e-00070I-7s
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:18 +0100
Received: by wibhj13 with SMTP id hj13so2271335wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=23HW9bDzIt0NRpmylY5pME7GAXc5WP6g7rv8bixJR+k=;
	b=IJ57GaanC2l+B4S/ZBEnv7g3xxOfuSee4ZZ006lLLJemkSaZD42Yv77DU8D1fzMQ1G
	M4/nfF3bQatsrCy5OyuGl3ioY9kP4RgDB7mAyCa0YMKyzHkwhYorzZelXaY0q+WZ8QiG
	DpMWV7q2SQ54XsbpcXV1pOcMsJLc2WLmJDMxp4xc5NsMbSiWCo5rZZooM4WScO/bK+wb
	nKUHWLS6xD4ujF37MuXmrwBWW2uCTQe3Nvmzq5hYIhYucj3/l87SEDwTsKzgu/zhoaPm
	dLoOV9zKw3bFNOXGXOW9+FBb5FlhhQw7xG216pTIyHrKfzTf2+ECu6xZbyYk/9fSWzGO
	KBxQ==
Received: by 10.216.132.151 with SMTP id o23mr7675900wei.120.1332541881904;
	Fri, 23 Mar 2012 15:31:21 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	bx13sm17468801wib.10.2012.03.23.15.31.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:44 +0100
Message-Id: <91da393da433b492fb7db038bd767c8428f24321.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 05/10] pixman: add native support and perl-native to DEPENDS from meta-oe
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
index bf239d9..e4e3460 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
-DEPENDS += "zlib libpng"
+DEPENDS += "zlib libpng perl-native"
+BBCLASSEXTEND = "native"
 
 PR = "r1"
 
-- 
1.7.8.5



