Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qf0Ly-0005pP-TJ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 03:59:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2011 18:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="27689591"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2011 18:55:45 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:11:52 +0800
Message-Id: <cover.1310090994.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2][PULL] alsa-tools: Fix recipe build error
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
X-List-Received-Date: Fri, 08 Jul 2011 01:59:39 -0000

Hi Saul,

This pull request fixes the alsa-tools recipe build error.
Please help to review and pull.

[YOCTO #1038]

Thanks,
Dongxiao

The following changes since commit 2c79c9eb7ef8ef0aef8c3096c3c4387e28e56ea2:

  pulseaudio: add 0.9.23 (2011-07-07 13:45:32 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/alsa-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/alsa-tools

Dongxiao Xu (2):
  fltk: add this recipe for alsa-tools build
  alsa-tools: Fix recipe build error.

 .../alsa/alsa-tools-1.0.24.1/autotools.patch       |   31 ++++++++++++++++
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   16 +++++++--
 .../fltk/fltk-1.1.10/disable_test.patch            |   18 +++++++++
 meta/recipes-multimedia/fltk/fltk_1.1.10.bb        |   38 ++++++++++++++++++++
 4 files changed, 100 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch
 create mode 100644 meta/recipes-multimedia/fltk/fltk-1.1.10/disable_test.patch
 create mode 100644 meta/recipes-multimedia/fltk/fltk_1.1.10.bb



