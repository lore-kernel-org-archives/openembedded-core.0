Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QuXH6-0002aa-SL
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:10:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2011 15:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,253,1312182000"; d="scan'208";a="41868770"
Received: from unknown (HELO localhost) ([10.255.13.233])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2011 15:06:06 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 15:06:05 -0700
Message-Id: <cover.1313791350.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/3] tune: update arm7a and cortexa8 tune files
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
X-List-Received-Date: Fri, 19 Aug 2011 22:10:49 -0000

Correct some typographical errors in the arm7a and cortexa8 files. Add support
for the hard floating point abi. Leave the default as cortexa8-neon.

These are in preparation to enable hardfp for meta-yocto's beagleboard BSP.

The following changes since commit 8aa14b444f16c4fd0afe93eccd238a8fb2bc0292:

  newt: update distro tracking fields (2011-08-19 09:29:20 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/tune-cortexa8
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/tune-cortexa8

Darren Hart (3):
  tune: add missing closing quote to arch-armv7a.inc for AVAILTUNES
  tune: remove thumb flag from non-thumb cortexa8 tune variables
  tune: Add hard floating point variants of cortexa8 tunes

 meta/conf/machine/include/arm/arch-armv7a.inc |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc   |   20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
1.7.6



