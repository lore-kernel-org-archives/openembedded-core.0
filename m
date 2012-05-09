Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SRzeq-0007YP-0b
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:42:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="138499760"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2012 22:31:58 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 13:28:20 +0800
Message-Id: <cover.1336541197.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1][1.2.1][PULL] Multilib bug fix
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
X-List-Received-Date: Wed, 09 May 2012 05:43:26 -0000

Hi Richard and Scott,

This pull request is to fix some multilib issues in libc-package.bbclass. Please help to review and pull.

This is both for upstream and 1.2.1 branch.

Thanks,
Dongxiao

The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/multilib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/multilib

Dongxiao Xu (1):
  libc-package.bbclass: Add MLPREFIX while dynamically set RDEPENDS

 meta/classes/libc-package.bbclass          |   12 +++++++-----
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

-- 
1.7.4.1



