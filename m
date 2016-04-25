Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC1D86FF5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:51:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3PDpiSJ005834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:51:45 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 06:51:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 06:51:38 -0700
Message-ID: <58417b3b5bd553a55771a9a5f9fbcc7a5c7138ba.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] insane.bbclass: remove workdir from package_qa_check_license()
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
X-List-Received-Date: Mon, 25 Apr 2016 13:51:45 -0000
Content-Type: text/plain

The parameter workdir is not used in package_qa_check_license()

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c57b217..a1d23d0 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -672,7 +672,7 @@ def package_qa_check_symlink_to_sysroot(path, name, d, elf, messages):
                 trimmed = path.replace(os.path.join (d.getVar("PKGDEST", True), name), "")
                 package_qa_add_message(messages, "symlink-to-sysroot", "Symlink %s in %s points to TMPDIR" % (trimmed, name))
 
-def package_qa_check_license(workdir, d):
+def package_qa_check_license(d):
     """
     Check for changes in the license files 
     """
@@ -1211,7 +1211,7 @@ Missing inherit gettext?""" % (gt, config))
     # Check license variables
     ###########################################################################
 
-    package_qa_check_license(workdir, d)
+    package_qa_check_license(d)
 
     ###########################################################################
     # Check unrecognised configure options (with a white list)
-- 
2.7.4


