Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1371E6D064
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:31:34 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:31:28 +0200
Message-Id: <1382009488-6120-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
References: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/4] cogl-1.0: explicitly disable cairo
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
X-List-Received-Date: Thu, 17 Oct 2013 11:31:34 -0000

- Cairo was auto-detected, but not listed as a dependency.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 0c4e86d..11810ef 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -33,6 +33,7 @@ EXTRA_OECONF += "--disable-introspection	\
 	       	 --enable-examples-install	\
 	       	 --enable-debug		 	\
 	       	 --disable-gles1		\
+	         --disable-cairo                \
 	    	"
 
 # OpenGL/GLX
-- 
1.8.1.2


