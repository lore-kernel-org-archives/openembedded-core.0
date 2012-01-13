Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rld0N-0003z2-HJ
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 10:01:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jan 2012 00:53:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106721086"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2012 00:53:26 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 16:55:47 +0800
Message-Id: <cover.1326444791.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/2 v3-updated][PULL] Hob: oe-core related changes
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
X-List-Received-Date: Fri, 13 Jan 2012 09:01:01 -0000

Hi Richard,

This is the UPDATED third pull request for Hob oe-core related changes.
meta-hob is NOT targeted to oe-core, so please ignore the previous one.

Please help to review and pull.

Note that this pull request has dependency on branch dxu4/hob-bitbake-changes-v3.

Changes from v2:
1. Remove the 'layers' from poky repo. We will have some indications in Hob GUI showing where to put new added layers.
2. Listen the specific event 'RequestPackageInfo' and then pass package information to GUI client.

Thanks,
Dongxiao

The following changes since commit 1d2697e6f00cc3771f39f5a7d4384a22d9696b16:
  Richard Purdie (1):
        multilib.conf: Clean up file and add missing entries for various dependencies

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes-v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-oecore-changes-v3

Dongxiao Xu (1):
  packageinfo.bbclass: add a new bbclass to pass package information

Shane Wang (1):
  package.bbclass: set package size into pkgdata for hob2's use

 meta/classes/package.bbclass     |    8 ++++++++
 meta/classes/packageinfo.bbclass |   30 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/packageinfo.bbclass



