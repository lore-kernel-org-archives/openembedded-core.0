Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A5CD060DA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 09:32:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2013 01:28:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="454758873"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 01:32:19 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 11:34:51 +0200
Message-Id: <cover.1387445582.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2 0/1] libtirpc: upgrade to 0.2.4
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
X-List-Received-Date: Thu, 19 Dec 2013 09:32:32 -0000

Better commit message, according to Saul's review.
Thanks Saul.

The following changes since commit 2961b58640daa8078ae3a70028f0fbbf2abb7882:

  security_flags: more relocation issues (2013-12-18 17:24:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (1):
  libtirpc: upgrade to 0.2.4

 .../libtirpc-0.2.3/obsolete_automake_macros.patch         | 15 ---------------
 .../libtirpc-0.2.1-fortify.patch                          |  0
 .../{libtirpc-0.2.3 => libtirpc}/remove-des-uclibc.patch  |  0
 .../libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb}     |  8 +++++---
 4 files changed, 5 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc}/libtirpc-0.2.1-fortify.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc}/remove-des-uclibc.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb} (84%)

-- 
1.8.3.2


