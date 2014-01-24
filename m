Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB64A6B05F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 18:26:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jan 2014 10:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,714,1384329600"; d="scan'208";a="471993311"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2014 10:26:07 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 20:28:51 +0200
Message-Id: <cover.1390588074.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2 0/1] rpcbind: fix crash at start
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
X-List-Received-Date: Fri, 24 Jan 2014 18:26:37 -0000

The following changes since commit 1a9226f140f578f11696abf1a3c989fae1d4c14a:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-01-23 12:18:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5733
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5733

Cristian Iorga (1):
  rpcbind: fixes crash during start

 ...bind-rpcuser-not-being-set-in-Makefile.am.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch

-- 
1.8.3.2


