Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0590B6CF40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:31:32 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:31:27 +0200
Message-Id: <1382009488-6120-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
References: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/4] cogl-1.0: depend on virtual/mesa
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
X-List-Received-Date: Thu, 17 Oct 2013 11:31:32 -0000

- Wayland support depends on wayland-egl, which is provided by mesa.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 59ff66e..0c4e86d 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -21,7 +21,7 @@ EDEPENDS_GLES2 = "virtual/libgles2"
 EDEPENDS_KMS = "libdrm virtual/egl"
 EDEPENDS_EGL = "virtual/egl"
 EDEPENDS_X11 = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
-EDEPENDS_WAYLAND = "wayland"
+EDEPENDS_WAYLAND = "virtual/mesa wayland"
 
 # Extra RDEPENDS for PACKAGECONFIG
 # This has to be explictly listed, because cogl dlopens the backends
-- 
1.8.1.2


