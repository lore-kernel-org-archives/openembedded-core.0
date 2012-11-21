Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TbI82-00087X-AL
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 22:46:47 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qALLWUKr020293;
	Wed, 21 Nov 2012 13:32:33 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Nov 2012 16:32:25 -0500
Message-Id: <b667b1f0d7eb0abf19abc9c369ca14e17d6d85f5.1353532567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, linux-yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kernel-yocto: clarify KMETA branch comments
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
X-List-Received-Date: Wed, 21 Nov 2012 21:46:47 -0000

Having a meta branch is not strictly required by the tools (and
recipes like linux-yocto-custom do not have meta branches), but the
comments in the kernel-yocto.bbclass could lead someone to think that
it was required.

This commit clearifies the comment to the following:

  # We can fix up the kernel repository even if it wasn't a bare clone.
  # If KMETA is defined, the branch must exist, but a machine branch
  # can be missing since it may be created later by the tools.

[YOCTO #3422]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f78d63b..0d4ed21 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -130,8 +130,9 @@ do_kernel_checkout() {
 		echo "WARNING. ${WORKDIR}/git is not a bare clone."
 		echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
 		
-		# we can fix up the kernel repository, but at the least the meta
-		# branch must be present. The machine branch may be created later.
+		# We can fix up the kernel repository even if it wasn't a bare clone.
+		# If KMETA is defined, the branch must exist, but a machine branch
+		# can be missing since it may be created later by the tools.
 		mv ${WORKDIR}/git/.git ${S}
 		rm -rf ${WORKDIR}/git/
 		cd ${S}
-- 
1.7.10.4



