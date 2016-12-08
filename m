Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 89C0471BF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:01 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 3355DB85C90; Thu,  8 Dec 2016 22:47:57 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:29 +0100
Message-Id: <1481233677-27298-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 05/33] package_manager/deb: pass option --force-script-chrootless to dpkg
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:05 -0000

Fixes removal of packages with new dpkg version.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7ba2e4d..4ef4f6d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -2090,7 +2090,7 @@ class DpkgPM(OpkgDpkgPM):
             cmd = "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
         else:
             cmd = "%s --admindir=%s/var/lib/dpkg --instdir=%s" \
-                  " -P --force-depends %s" % \
+                  " -P --force-depends --force-script-chrootless %s" % \
                   (bb.utils.which(os.getenv('PATH'), "dpkg"),
                    self.target_rootfs, self.target_rootfs, ' '.join(pkgs))
 
-- 
2.7.4


