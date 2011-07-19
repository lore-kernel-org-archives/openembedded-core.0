Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjEeW-00079T-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:04:16 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JI0AMg031373
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 13:00:10 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 11:00:08 -0700
Message-Id: <05b68a989a62c4061d66e259714707dfdaa5d609.1311097889.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311097889.git.tom_rini@mentor.com>
References: <cover.1311097889.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311097889.git.tom_rini@mentor.com>
References: <cover.1311097889.git.tom_rini@mentor.com>
Subject: [PATCH v3 1/4] bitbake.conf, sanity.bbclass: Drop mercurial-native
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
X-List-Received-Date: Tue, 19 Jul 2011 18:04:16 -0000

We have no hg URIs in the metadata, so don't require and don't
ASSUME_PROVIDED it either.  meta-oe has a mercurial-native recipe
if hg URIs are added in a recipe later.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/sanity.bbclass |    2 +-
 meta/conf/bitbake.conf      |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c9d37c9..75fb52c 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -209,7 +209,7 @@ def check_sanity(e):
     if not check_app_exists('${BUILD_PREFIX}g++', e.data):
         missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", e.data, True)
 
-    required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg chrpath wget cpio"
+    required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk chrpath wget cpio"
 
     # qemu-native needs gcc 3.x
     if "qemu-native" not in assume_provided and "gcc3-native" in assume_provided:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 463991d..15fd97e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -132,7 +132,6 @@ ASSUME_PROVIDED = "\
     cvs-native \
     grep-native \
     diffstat-native \
-    mercurial-native \
     patch-native \
     perl-native-runtime \
     python-native-runtime \
-- 
1.7.0.4



