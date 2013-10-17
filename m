Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 045506CD0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:31:32 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 13:31:26 +0200
Message-Id: <1382009488-6120-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
References: <1382009488-6120-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/4] mesa-gl: use base_set_filespath
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

- Fixes FILESEXTRAPATHS being ignored in mesa-gl bbappend.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
index 0e9dbb5..21f6151 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
@@ -2,7 +2,7 @@ require mesa_${PV}.bb
 
 SUMMARY += " (OpenGL only, no EGL/GLES)"
 
-FILESPATH = "${FILE_DIRNAME}/mesa-${PV}:${FILE_DIRNAME}/mesa"
+FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/mesa-${PV}", "${FILE_DIRNAME}/mesa"], d)}"
 
 PROVIDES = "virtual/libgl virtual/mesa"
 
-- 
1.8.1.2


