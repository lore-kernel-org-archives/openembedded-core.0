Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XD-0007yn-8a
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168877"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:03 -0800
Message-Id: <cover.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/7] Updates and QA Warning Fixes
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
X-List-Received-Date: Thu, 01 Mar 2012 07:34:43 -0000

Richard,

This patch set has update, qa warning fixes, and a non-GPLv3
fix (this one could be a M3 RC2 item).

Sau!

The following changes since commit 8054497b393d40a2ed8c802c74a02e92a3001297:

  image_types_uboot: Update to work after recent image_types changes (2012-02-29 18:23:04 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (7):
  perl: remove empty directories to clean QA Warnings
  netbase: fix QA Warnings
  hdparm: update to 9.39
  glproto: Update to 1.4.15
  pixman: updat to 0.24.4
  util-linux: Fix removal of lscpu for non-GPLv3 Build
  distro_tracking: Upgrade and Manual Checks

 .../conf/distro/include/distro_tracking_fields.inc |   19 +++++----
 meta/recipes-core/netbase/netbase_4.47.bb          |    3 +-
 .../util-linux/util-linux-2.21/remove-lscpu.patch  |   43 +++++++++++++------
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    6 ++-
 .../hdparm/{hdparm_9.37.bb => hdparm_9.39.bb}      |    5 +-
 .../{pixman_0.24.2.bb => pixman_0.24.4.bb}         |    7 +--
 .../{glproto_1.4.14.bb => glproto_1.4.15.bb}       |    4 +-
 8 files changed, 53 insertions(+), 36 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.37.bb => hdparm_9.39.bb} (89%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.24.2.bb => pixman_0.24.4.bb} (82%)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.14.bb => glproto_1.4.15.bb} (77%)

-- 
1.7.7.6



