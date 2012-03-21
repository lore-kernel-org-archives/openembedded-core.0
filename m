Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATM0-0002jI-Ns
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:46:00 +0100
Received: by mail-wg0-f43.google.com with SMTP id dr12so823501wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=wFio1MGvn84ucalyYZHJjNawUlUlPbAnETrKMlKekKQ=;
	b=cxnaWcE6qJgcPaxQGidxhfIV987E9n0op2/OaOs8ZOmqtl2lV9GpC0c+QuAPkjGH81
	jHF/VNOqv1NUnjyYlfVDQ9y9/ZvNdxuG0o0NTeTNUVfCw0ubGhp9Mr6ZXP62D6QF947F
	Ef2ggwt8UNtBTraEIvzBR9ksFj9Hrujx7ZrI3Xe3lHf5jGw3OWIj+/lukecSx4pWdx6c
	ccSM0h7vRWzEBlSk4K8w5I59g74AI+POaSFg6MOt7qhOh+JswdGOPg790dP+D/M3wO53
	CAH4cGXZB383tvze2Chrc8D8DHQlhq7Ocx2bzqACBPhpHo3DQGR1vPuFLNKKTNz7Lo/V
	BSZg==
Received: by 10.180.107.101 with SMTP id hb5mr5879549wib.7.1332365828941;
	Wed, 21 Mar 2012 14:37:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm12428077wib.4.2012.03.21.14.37.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:12 +0100
Message-Id: <7e01365d0aa28f560a8f3dbd636d5f4f6fd0f6c3.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 07/13] librsvg: import native support from meta-oe
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
X-List-Received-Date: Wed, 21 Mar 2012 21:46:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 1e57647..4e4e339 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
+DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
+BBCLASSEXTEND = "native"
 
 PR = "r5"
 
-- 
1.7.8.5



