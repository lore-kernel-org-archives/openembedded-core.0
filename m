Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R0leq-0003yn-G3
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 04:45:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Sep 2011 19:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,336,1312182000"; d="scan'208";a="49269079"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2011 19:39:56 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:36:11 +0800
Message-Id: <cover.1315276240.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] Fixes for X and site/x86_64
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
X-List-Received-Date: Tue, 06 Sep 2011 02:45:05 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

All,
    These are some fixes. One is for enabling some HID device for rootless X,
another is for grub conf error on x86_64. Pls. help to review.

Thanks,
Edwin

The following changes since commit 314131e472a7d728ea96cbd577d2947d7bc9f50e:

  linux-yocto: clean configuration for v3.0.4 (2011-09-05 20:25:46 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib gzhai/master2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2

Zhai Edwin (2):
  xserver-nodm-init: Change hidraw mode to allow normal user access
  site/x86_64: Add entries to fix conf error on x86_64

 .../x11-common/xserver-nodm-init/xserver-nodm      |    4 ++++
 meta/site/x86_64-linux                             |   10 ++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)



