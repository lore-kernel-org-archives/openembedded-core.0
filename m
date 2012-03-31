Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDsKW-0005ja-3k
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 09:02:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Mar 2012 23:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="123918732"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2012 23:53:08 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 14:49:20 +0800
Message-Id: <cover.1333176251.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] Misc fixings of nativesdk
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
X-List-Received-Date: Sat, 31 Mar 2012 07:02:32 -0000

This patch serie fixed bunch of things for nativesdk recipes, including:

1. Fixed the issue of reading in incorrect pkgdata files of do_package_write_xxx.
2. Avoided crosssdk tasks generating different task hashs for different MACHINE.
3. Dropped unnecessary target tasks for nativesdk.

The following changes since commit 627998726ca3ee2ed2510c0f666747f688d06c56:
  Steffen Sledz (1):
        docbook-utils-native: fix syntax problem in jw.in

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/nativesdkfixing
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/nativesdkfixing

Lianhao Lu (5):
  nativesdk.bbclass: Set PACKAGE_ARCHS to SDK_PACKAGE_ARCHS.
  crosssdk.bbclass: Set TUNE_PKGARCH to SDK_PKGARCH.
  autotools.bbclass: Drop -nativesdk dependency to lib-cross.
  eglibc-nativesdk: Set GCC_ADDONS.
  pkgconfig.bbclass: corrected dependency for -nativesdk.

 meta/classes/autotools.bbclass          |    1 +
 meta/classes/crosssdk.bbclass           |    5 +++++
 meta/classes/nativesdk.bbclass          |    8 +-------
 meta/classes/pkgconfig.bbclass          |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb |    3 ++-
 meta/recipes-core/eglibc/eglibc_2.15.bb |    3 ++-
 6 files changed, 12 insertions(+), 9 deletions(-)



