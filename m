Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATM7-0002jI-OZ
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:46:07 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so823501wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=hOaZvQQeiJoumXTBhx3zCgRa2yVZxhRH+MkjLq01VV8=;
	b=fqa7E4ikC/cBFlC064dBtNe0hvG4r9phzQJhyqA+Q7q0lBFm5PQ7MX+v5hpMq074v3
	J5tiyM5TIYM3jehxpGpyUA/GG13BaVHn+aXa7BmSf9mzumQd0NJ/rhCWrWYz3reRf0sH
	SnFrKivZO6OKJuwJbCxrCXrSe+HWKEdb0rDPbWBXtCpteih4pPX/OzlxVxkRrguZzecO
	Bl64W/6emset4Xv8d9qrumOIA2wq9g5wtmTBS9dcf/L63byexaUZI/2sQVSnqfjCVLYQ
	S10FsbAwa5zUduMcm7fDxROrjmwfnAk13QWTItKiyaPD0BumI5/ec4oFNGRIusIuep13
	g5SQ==
Received: by 10.180.79.72 with SMTP id h8mr29961323wix.1.1332365835963;
	Wed, 21 Mar 2012 14:37:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm7658632wiy.7.2012.03.21.14.37.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:13 +0100
Message-Id: <415b61b4b9dad662b7c72e995ba18fb69f86270e.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/13] pixman: add native support and perl-native to DEPENDS from meta-oe
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
X-List-Received-Date: Wed, 21 Mar 2012 21:46:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
index 4cff6f9..8281476 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
-DEPENDS += "zlib libpng"
+DEPENDS += "zlib libpng perl-native"
+BBCLASSEXTEND = "native"
 
 PE = "1"
 
-- 
1.7.8.5



