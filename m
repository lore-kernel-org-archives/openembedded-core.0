Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF36610C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 19:59:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 31 Dec 2013 11:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,582,1384329600"; d="scan'208";a="452091091"
Received: from unknown (HELO localhost) ([10.255.12.41])
	by fmsmga001.fm.intel.com with ESMTP; 31 Dec 2013 11:59:22 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2013 13:59:20 -0600
Message-Id: <cover.1388446489.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1][master] Fix for Bug 5403
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
X-List-Received-Date: Tue, 31 Dec 2013 19:59:22 -0000

This fixes a problem seen when accessing function params in systemtap
on certain platforms, due to flaky debuginfo.

Tested on the following machines with various systemtap scripts:

qemuppc
qemuarm
qemux86
qemux86-64
crownbay
nuc

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-bug-5403-master
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/systemtap-bug-5403-master

Tom Zanussi (1):
  systemtap: Add --enable-prologues to configuration

 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1


