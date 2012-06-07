Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQO-00047k-0i
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733164"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:00 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbDao006515 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:13 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbDGH006514
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:13 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:36:51 -0700
Message-Id: <56c8a69aafb3322b319136010f051c7f01bcfe27.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 03/22] task-core-basic: drop portmap
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:32 -0000

From: Christopher Larson <kergoth@gmail.com>

Both rpcbind and portmap are RPC port mappers. Having both is redundant. Chose
rpcbind over portmap as rpcbind supports ipv6, nfs4, and builds without the
glibc rpc headers, which have been obsoleted in glibc 2.14.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-extended/tasks/task-core-basic.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-basic.bb b/meta/recipes-extended/tasks/task-core-basic.bb
index 8bab0db..a810d37 100644
--- a/meta/recipes-extended/tasks/task-core-basic.bb
+++ b/meta/recipes-extended/tasks/task-core-basic.bb
@@ -148,7 +148,6 @@ RDEPENDS_task-core-sys-services = "\
     nfs-utils \
     pciutils \
     libpcre \
-    portmap \
     rpcbind \
     sysfsutils \
     tcp-wrappers \
-- 
1.7.5.4



