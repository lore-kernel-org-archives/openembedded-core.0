Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E5D246B05F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 16:59:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2014 08:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,713,1384329600"; d="scan'208";a="464226087"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2014 08:58:20 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2014 19:01:07 +0200
Message-Id: <cover.1390582813.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] rpcbind: fix crash at start
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
X-List-Received-Date: Fri, 24 Jan 2014 16:59:59 -0000

The following changes since commit 1a9226f140f578f11696abf1a3c989fae1d4c14a:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-01-23 12:18:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5733
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5733

Cristian Iorga (1):
  rpcbind: fixes crash during start

 ...bind-rpcuser-not-being-set-in-Makefile.am.patch | 31 ++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-rpcuser-not-being-set-in-Makefile.am.patch

-- 
1.8.3.2


