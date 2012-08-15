Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T1gJQ-0002jN-Bi
	for openembedded-core@openembedded.org; Wed, 15 Aug 2012 18:19:16 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id F3F741EA69;
	Wed, 15 Aug 2012 08:58:33 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org
Date: Wed, 15 Aug 2012 08:58:17 -0700
Message-Id: <1345046297-321-2-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1345046297-321-1-git-send-email-andy.ross@windriver.com>
References: <6F6DFF61-5E17-4374-9624-1904572762C7@dominion.thruhere.net>
	<1345046297-321-1-git-send-email-andy.ross@windriver.com>
Subject: [PATCH] task-core-lsb: Don't pull in eglibc-pic via RDEPENDS
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
X-List-Received-Date: Wed, 15 Aug 2012 16:19:16 -0000

The task-core-lsb-runtime-add subpackage includes eglibc-pic as an
RDEPEND.  That's incorrect, eglibc-pic is nothing but 22MB of static
libraries and should never appear as a runtime dependency.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 553b89e..19e2129 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Small Image Tasks"
-PR = "r9"
+PR = "r10"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -194,7 +194,6 @@ RDEPENDS_task-core-lsb-runtime-add = "\
     eglibc-localedata-posix \
     eglibc-extra-nss \
     eglibc-pcprofile \
-    eglibc-pic \
     eglibc-utils \
 "
 
-- 
1.7.11.2



