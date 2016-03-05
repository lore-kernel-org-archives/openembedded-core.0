Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E1FED731C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 05:06:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2016 21:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,539,1449561600"; d="scan'208";a="901929337"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2016 21:06:33 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 21:06:28 -0800
Message-Id: <cover.1457154293.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] mtools uninative fix
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
X-List-Received-Date: Sat, 05 Mar 2016 05:06:35 -0000

These patchset is against master next to fix previous uninative patches. They
most likely will not apply cleanly to master.

The following changes since commit dd359830ad267f9763e9c35493b2846fd2269234:

  poky: Enable uninative (2016-03-04 17:15:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib b82b129692a4eb3c216901cd57d0fc51b0715a9a
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=b82b129692a4eb3c216901cd57d0fc51b0715a9a

Randy Witt (2):
  uninative.bbclass: Set UNINATIVE_LIBDIR if uninative is enabled
  mtools: Make sure mcopy works when using uninative

 meta/classes/uninative.bbclass                | 5 ++++-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb | 8 +++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.5.0


