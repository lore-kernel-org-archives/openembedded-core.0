Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T1Q28-0005oW-De
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 00:56:20 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id C80031E966;
	Tue, 14 Aug 2012 15:44:25 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:44:22 -0700
Message-Id: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
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
X-List-Received-Date: Tue, 14 Aug 2012 22:56:20 -0000

The task-core-lsb-runtime-add subpackage includes eglibc-pic as an
RDEPEND.  That's incorrect, eglibc-pic is nothing but 22MB of static
libraries and should never appear as a runtime dependency.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 553b89e..be9eac2 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -194,7 +194,6 @@ RDEPENDS_task-core-lsb-runtime-add = "\
     eglibc-localedata-posix \
     eglibc-extra-nss \
     eglibc-pcprofile \
-    eglibc-pic \
     eglibc-utils \
 "
 
-- 
1.7.11.2



