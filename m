Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gilbert_coville@mentor.com>) id 1Tpkcm-0007ON-Sn
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 20:02:13 +0100
Received: from ghc.alm.mentorg.com ([134.86.96.237])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBVIl3aG032274;
	Mon, 31 Dec 2012 12:47:12 -0600
From: Gilbert Coville <gilbert_coville@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2012 12:47:36 -0600
Message-Id: <1356979656-998-2-git-send-email-gilbert_coville@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1356979656-998-1-git-send-email-gilbert_coville@mentor.com>
References: <1356979656-998-1-git-send-email-gilbert_coville@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] copyleft_compliance: force the symlink creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2012 19:02:13 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Gilbert Coville <gilbert_coville@mentor.com>
---
 meta/classes/copyleft_compliance.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
index 786cf1e..06b0227 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -45,7 +45,7 @@ python do_prepare_copyleft_sources () {
             if os.path.exists(tarball_path):
                 local = tarball_path
 
-        os.symlink(local, os.path.join(dest, os.path.basename(local)))
+        oe.path.symlink(local, os.path.join(dest, os.path.basename(local)), force=True)
 
     patches = src_patches(d)
     for patch in patches:
-- 
1.8.0



