Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QiyQe-0002hO-1m
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:44:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2011 17:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,225,1309762800"; d="scan'208";a="27369859"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2011 17:40:45 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:37:53 +0800
Message-Id: <cover.1311035762.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1 v2][PULL] alsa-tools: fix recipe build error.
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
X-List-Received-Date: Tue, 19 Jul 2011 00:44:53 -0000

Hi Richard and Saul,

This is the second version of alsa-tools build fix, please help to review and pull.

Changes from v1:
Remove some sub-components to avoid further dependency on gtk+ and fltk.

Thanks,
Dongxiao

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/alsa-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/alsa-tools

Dongxiao Xu (1):
  alsa-tools: Fix recipe build error.

 .../alsa/alsa-tools-1.0.24.1/autotools.patch       |   34 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |    7 +++-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools-1.0.24.1/autotools.patch



