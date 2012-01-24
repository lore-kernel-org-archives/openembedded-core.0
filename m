Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rppse-0008Cn-TF
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:34:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2012 15:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59668883"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.34])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2012 15:26:37 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 15:26:32 -0800
Message-Id: <cover.1327447344.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/4] Various updates
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
X-List-Received-Date: Tue, 24 Jan 2012 23:34:25 -0000

The key patch in this series is the linux-tools change. With builds that don't 
include GPLv3 licensed packages the linux-yocto kernel was being skipped due to
it pulling in perf and perf requiring binutils.

The short-term fix is to not build perf if GPLv3 is in INCOMPATIBLE_LICENSE,
long term there's a bug open to move perf to a separate package.

Cheers,
Joshua

The following changes since commit a4a98b6d6273d4e716afbff0880d0ac2ff7be0a9:

  gcc-common.inc: Fix comment (2012-01-24 14:38:31 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/stuff
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff

Joshua Lock (4):
  clutter-gst: update to 1.4.6
  linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
  cogl: update upstream status for build_for_armv4t.patch
  distro-tracking-fields: update entries for clutter-gst-1.8

 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 ...r-gst-1.8_1.4.4.bb => clutter-gst-1.8_1.4.6.bb} |    4 ++--
 .../clutter/cogl/build_for_armv4t.patch            |    2 +-
 meta/recipes-kernel/linux/linux-tools.inc          |   20 ++++++++++++++++++--
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 6 files changed, 25 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.8_1.4.4.bb => clutter-gst-1.8_1.4.6.bb} (80%)

-- 
1.7.7.6



