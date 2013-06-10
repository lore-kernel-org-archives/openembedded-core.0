Return-Path: <net147@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id CBA0761FB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 07:46:13 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tj12so2390187pac.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 00:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mI2pyOd7g2SCoA05mPdRSqqidfFuI4+FsuK6+Ie8xe8=;
	b=l2t5PfRGzhMYngj5ZIkSC6oVpXOhFWPVPtvY9JWigmVYGBzUYsNKEfEb8yFte0gaHD
	+lFpkAMkZ8+iIhA3XMUP029Z1DGcZywcslDN77nZhegtxvMwgWYLTec8fZovWQOdHFf0
	C4Q863RdGWMAs0ihK1qrznX/w8s57QY8QcLpp2zABuYdDbxjmoUUu0suHxR8McfWQ6Sa
	GILnXhWFqZP0kajUBuzuUOtwAAjCeeSZDp8GdgfnV2ZBKeElqbWZhemqcGsAI9e+mzY2
	NXUEWKnTJGNE9r1FheKwpbP1A23eQpwu4Mn/ePWHqZyj0Lx5g6y0g/nUlyUrMdU+dnBC
	UYag==
X-Received: by 10.66.88.105 with SMTP id bf9mr12838612pab.175.1370850374935;
	Mon, 10 Jun 2013 00:46:14 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id iq6sm4131211pbc.1.2013.06.10.00.46.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 00:46:14 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 18:00:01 +1000
Message-Id: <1370851201-30757-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] mesa: remove unrecognized configure options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2013 07:46:13 -0000

--disable-glut and --disable-glw are not recognized since Mesa 8.0.
--disable-glu is not recognized since Mesa 9.0.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index c37ad69..f9d7ced 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -20,10 +20,7 @@ PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
 inherit autotools pkgconfig pythonnative
 
-EXTRA_OECONF = "--disable-glu \
-                --disable-glw \
-                --disable-glut \
-                --enable-shared-glapi"
+EXTRA_OECONF = "--enable-shared-glapi"
 
 PACKAGECONFIG ??= "egl gles \
 		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
-- 
1.8.2.3


