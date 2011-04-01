Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q5en7-0002T4-N1
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 15:53:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Apr 2011 06:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,282,1299484800"; d="scan'208";a="622196801"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by orsmga002.jf.intel.com with ESMTP; 01 Apr 2011 06:51:30 -0700
Message-Id: <cover.1301665368.git.josh@linux.intel.com>
Old-Date: Fri, 1 Apr 2011 14:42:48 +0100
Date: Fri, 01 Apr 2011 14:51:24 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 0/7] Fedora 15 and GCC 4.6 compatability patches
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
X-List-Received-Date: Fri, 01 Apr 2011 13:53:36 -0000

From: Joshua Lock <josh@linux.intel.com>

Folks,

Attached is a series of patches to ensure we can run oe-core builds on the
soon to be released Fedora 15.

I don't think any of these should be too controversial and with the series
applied I am able to build both minimal and sato images on my Fedora 15 box.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: josh/fedora15
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/fedora15

Thanks,
    Joshua Lock <josh@linux.intel.com>
---


Joshua Lock (7):
  elfutils: fix builds with gcc 4.6
  python-native: add missing SRC_URI hashes
  libx11: add missing SRC_URI hashes
  xorg-[lib-common|proto-common]: disable use of fop document
    generation
  libx11: disable building of specs
  openjade: fix build with GCC 4.6
  xserver-xf86: explicitly disable fop document generation

 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    4 +
 .../user-declared-default-constructor.patch        |   88 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    5 +-
 .../recipes-devtools/python/python-native_2.6.6.bb |    3 +
 meta/recipes-graphics/xorg-lib/libx11.inc          |    2 +-
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |    3 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    1 +
 .../xorg-xserver/xserver-xf86-common.inc           |    1 +
 9 files changed, 105 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/user-declared-default-constructor.patch

-- 
1.7.4.1



