Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T8vvJ-0005Nx-MD
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:24:21 +0200
Received: from archHP.dbnet.local (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 6E98C47383;
	Tue,  4 Sep 2012 13:45:27 +0100 (BST)
From: ml@communistcode.co.uk
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:12:55 +0100
Message-Id: <1346775175-3963-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <ml@communistcode.co.uk>
References: <ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] scripts/cleanup-workdir: change autoconf-nativesdk to nativesdk-autoconf
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
X-List-Received-Date: Tue, 04 Sep 2012 16:24:21 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

the autoconf-nativesdk package name was recently changed to nativesdk-autoconf which in turn broke the cleanup-workdir script. Changed the package to the correct name.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 scripts/cleanup-workdir | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index c748846..9d161c2 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -51,7 +51,7 @@ def get_cur_arch_dirs(workdir, arch_dirs):
     pattern = workdir + '/(.*?)/'
 
     # select thest 5 packages to get the dirs of current arch
-    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'autoconf-nativesdk']
+    pkgs = ['hicolor-icon-theme', 'base-files', 'acl-native', 'binutils-crosssdk', 'nativesdk-autoconf']
 
     for pkg in pkgs:
         cmd = "bitbake -e " + pkg + " | grep ^IMAGE_ROOTFS="
-- 
1.7.12



