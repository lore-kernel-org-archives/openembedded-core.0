Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SJ0ea-00006E-Ov
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 12:56:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Apr 2012 03:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="132448367"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2012 03:47:04 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 18:44:13 +0800
Message-Id: <cover.1334400035.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1][PULL] gst-plugins-bad: dependency fix
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
X-List-Received-Date: Sat, 14 Apr 2012 10:56:29 -0000

Hi Richard and Saul,

This pull request adds curl as gst-plugins-bad's dependency.

Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit be298b6f0168bbd6baf90602da35904c441deade:

  nspr: fix package spliting (2012-04-14 09:33:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore

Dongxiao Xu (1):
  gst-plugins-bad: add curl as build dependency

 .../gstreamer/gst-plugins-bad_0.10.23.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



