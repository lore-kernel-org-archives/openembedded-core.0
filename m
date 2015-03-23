Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0E48A6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 18:59:30 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 19:59:30 +0100
Message-Id: <1427137170-11071-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] rootfs.py: Also uninstall update-alternatives and shadow for read-only-rootfs
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
X-List-Received-Date: Mon, 23 Mar 2015 18:59:30 -0000

This brings back commit d41097a970e9bfa553cd4bc3c9fad4b9073d7bd5,
which got lost during transition from image.bbclass to rootfs.py.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/lib/oe/rootfs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 4e4e6eb..6fb749f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -190,6 +190,8 @@ class Rootfs(object):
                         pkg = pkg_installed.split()[0]
                         if pkg in ["update-rc.d",
                                 "base-passwd",
+                                "shadow",
+                                "update-alternatives",
                                 self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
                                 ]:
                             pkgs_to_remove.append(pkg)
-- 
1.9.1


