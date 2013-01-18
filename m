Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tw4bY-0000Rb-Oy
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 06:35:15 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0I5JaTC006246;
	Thu, 17 Jan 2013 21:19:37 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 18 Jan 2013 00:19:26 -0500
Message-Id: <041fb6a4dbaa76e4cc54e1ec319967361d68b54f.1358485481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1358485481.git.bruce.ashfield@windriver.com>
References: <cover.1358485481.git.bruce.ashfield@windriver.com>
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] kernel-yocto: remove unnecessary non-bare warning
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
X-List-Received-Date: Fri, 18 Jan 2013 05:35:16 -0000

In the past working from a non-bare clone would cause problems,
due to branches not existing in the WORKDIR clone. This hasn't
been true for some time, since the routines which convert remotes
into local branches have been functioning without problems.

So we no longer need the warning and it can be removed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index c74317e..99b3a46 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -120,15 +120,11 @@ do_kernel_checkout() {
 
 	# A linux yocto SRC_URI should use the bareclone option. That
 	# ensures that all the branches are available in the WORKDIR version
-	# of the repository. If it wasn't passed, we should detect it, and put
-	# out a useful error message
+	# of the repository. 
 	if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
 		# we build out of {S}, so ensure that ${S} is clean and present
 		rm -rf ${S}
 		mkdir -p ${S}
-
-		echo "WARNING. ${WORKDIR}/git is not a bare clone."
-		echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
 		
 		# We can fix up the kernel repository even if it wasn't a bare clone.
 		# If KMETA is defined, the branch must exist, but a machine branch
-- 
1.7.10.4



