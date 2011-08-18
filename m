Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qtyeo-0000Ih-PW
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:12:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Aug 2011 02:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39592548"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2011 02:08:18 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 17:08:56 +0800
Message-Id: <cover.1313658393.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/5][PULL] multilib: Some fixes of improper ${PN}
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
X-List-Received-Date: Thu, 18 Aug 2011 09:12:59 -0000

Hi Richard,

This pull request fixes some improper ${PN}, please help to reivew and pull.

Thanks,
Dongxiao

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (5):
  curl: Use BPN instead of PN for style like lib${PN}
  ea-acl: Use BPN instead of PN for style like lib${PN}
  attr: Use BPN instead of PN for style like lib${PN}
  acl: Use BPN instead of PN for style like lib${PN}
  procps: Fix lib path to support multilib

 .../procps/procps-3.2.8/install.patch              |   29 --------------------
 meta/recipes-extended/procps/procps.inc            |    3 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    8 +++---
 meta/recipes-support/attr/acl.inc                  |    2 +-
 meta/recipes-support/attr/attr.inc                 |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |    6 ++--
 meta/recipes-support/curl/curl_7.21.7.bb           |    8 +++---
 7 files changed, 14 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps-3.2.8/install.patch



