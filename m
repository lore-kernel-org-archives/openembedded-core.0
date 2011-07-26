Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qlbm2-0000jl-NI
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 09:09:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2011 00:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,267,1309762800"; d="scan'208";a="31464769"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2011 00:05:35 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Tue, 26 Jul 2011 15:12:57 +0800
Message-Id: <cover.1311664242.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] add upstream status field for some recipe
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
X-List-Received-Date: Tue, 26 Jul 2011 07:09:51 -0000

Hi Saul,

this patch add upstream status for libsdl and xserver patches.

Regards
Ke

The following changes since commit 819f18f8bc000f13b644edc194d2a12b4ea5fecf:
  Richard Purdie (1):
        Move architecture specific TARGET_OS mangling into tune files

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/upstream-status
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/upstream-status

Yu Ke (1):
  upstream status: add for libsdl and xserver patches

 .../libsdl/files/directfb_obsolete_calls.patch     |    2 ++
 .../recipes-graphics/libsdl/files/extra-keys.patch |    2 ++
 .../libsdl/files/kernel-asm-page.patch             |    2 ++
 meta/recipes-graphics/mesa/mesa-dri/uclibc.patch   |    2 ++
 .../xorg-xserver/files/macro_tweak.patch           |    2 ++
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |    2 ++
 6 files changed, 12 insertions(+), 0 deletions(-)



