Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SsFAt-00016r-Mo
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:31:28 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6KFJt15008000;
	Fri, 20 Jul 2012 08:19:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 20 Jul 2012 11:19:23 -0400
Message-Id: <6e944735bd6f8ecfbc56ddda8274caae1977daf7.1342796935.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1342796935.git.bruce.ashfield@windriver.com>
References: <cover.1342796935.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] kernel-yocto.bbclass: Fix some obvious typoes in comments.
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
X-List-Received-Date: Fri, 20 Jul 2012 15:31:28 -0000

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index d914b11..1e08faa 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -147,10 +147,10 @@ do_kernel_checkout() {
 		fi
 	done
 
-	# Create a working tree copy of the kernel by checkout out a branch
+	# Create a working tree copy of the kernel by checking out a branch
 	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
 	if [ $? -eq 0 ]; then
-		# checkout and clobber and unimportant files
+		# checkout and clobber any unimportant files
 		git checkout -f ${KBRANCH}
 	else
 		echo "Not checking out ${KBRANCH}, it will be created later"
@@ -200,7 +200,7 @@ python do_kernel_configcheck() {
 }
 
 
-# Ensure that the branches (BSP and meta) are on the locatios specified by
+# Ensure that the branches (BSP and meta) are on the locations specified by
 # their SRCREV values. If they are NOT on the right commits, the branches
 # are reset to the correct commit.
 do_validate_branches() {
-- 
1.7.5.4



