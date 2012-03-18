Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S9903-0004Fq-65
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Mar 2012 06:49:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Mar 2012 22:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120250385"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by azsmga001.ch.intel.com with ESMTP; 17 Mar 2012 22:40:59 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Sun, 18 Mar 2012 13:41:23 +0800
Message-Id: <cover.1332049148.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] self-hosted-image: fix bug 2065
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
X-List-Received-Date: Sun, 18 Mar 2012 05:49:51 -0000

The following changes since commit 26a46938d3ea1821e7bec4fa6cc8379babad238b:

  bitbake/fetch2: Fix typo which broke use of tarballs (2012-03-16 23:44:23 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/self
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self

Dexuan Cui (1):
  self-hosted-image: pre-populate the builder user with poky source

 meta/recipes-core/images/self-hosted-image.bb |   23 ++++++++++++++++++++++-
 1 files changed, 22 insertions(+), 1 deletions(-)

-- 
1.7.6



