Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Rs6Su-0002LO-8B
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 06:41:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2012 21:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="104423701"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2012 21:33:03 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 21:36:29 -0800
Message-Id: <cover.1327987354.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] adt-installer tar ball regen issue with sstate
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
X-List-Received-Date: Tue, 31 Jan 2012 05:41:12 -0000

The following changes since commit 08235ba0527a493fd652fdcbfded059c3a802333:
  Jessica Zhang (1):
        Merge branch 'master' of git://git.yoctoproject.org/poky

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/adt-installer
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jzhang/adt-installer

Jessica Zhang (1):
  Fix the issue that adt-installer tar ball is not regenerated if
    sstate is on, and other minor bug fixes

 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../installer/adt-installer_1.0.bb                 |   13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)



