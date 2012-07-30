Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sw5UA-00084J-0d
	for Openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 07:59:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2012 22:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173448215"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 22:47:36 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Sun, 29 Jul 2012 22:45:35 -0700
Message-Id: <cover.1343627054.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] Misc: avoid QA warnings for libxcb
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
X-List-Received-Date: Tue, 31 Jul 2012 05:59:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit bd726660a3b365b8f0f702771afef30dcd05b6d7:

  libxcb: Update for python-native changes (2012-07-30 16:54:34 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (1):
  libxcb: Ensure nativesdk package extension is handled correctly

 meta/recipes-graphics/xcb/libxcb.inc       |   64 ++++++++++++++++------------
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb |    2 +-
 meta/recipes-graphics/xcb/libxcb_1.8.1.bb  |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb    |    2 +-
 4 files changed, 39 insertions(+), 31 deletions(-)

-- 
1.7.3.4



