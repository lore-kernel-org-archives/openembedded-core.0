Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFe4k-0002EX-BJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 06:13:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 21:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85498788"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Apr 2012 21:04:21 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 12:04:38 +0800
Message-Id: <cover.1333598600.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] a fix to self-hosted-image: use the correct location of the file sudoers
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
X-List-Received-Date: Thu, 05 Apr 2012 04:13:34 -0000

The following changes since commit 5607729d9901c394b7cd4db6e38fe7fb19116f39:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:55 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (1):
  self-hosted-image: use the correct location of the file sudoers

 meta/recipes-core/images/self-hosted-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.6



