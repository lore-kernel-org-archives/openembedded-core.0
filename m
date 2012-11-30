Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeEGR-0007iy-1r
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 01:15:32 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 16:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,188,1355126400"; d="scan'208";a="224515787"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2012 16:00:45 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 16:00:39 -0800
Message-Id: <1354233643-3385-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/4] cmake and util-linux updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 00:15:32 -0000

Richard,

I have done futher testing with cmake and I am happy with it. I
also worked out my issues with util-linux and have an update for
sysvinit since util-linux added utmpdump.

The build-appliance-image is a tweak to allow us to set the SRCREV
automagically from a config file via an override.

Consolidated pull coming later after MUT finishes building.

Sau!


Saul Wold (4):
  cmake: Update to 2.8.10.1
  sysvinit: Update ALTERNATIVES List for utmpdump
  util-linux: Update to 2.22.1
  build-appliance-image: Allow SRCREV to be overriden

 meta/recipes-core/images/build-appliance-image.bb  |  2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |  4 +-
 meta/recipes-core/util-linux/util-linux.inc        | 21 +++++-----
 .../util-linux/add-aarch64-support.patch           | 18 ---------
 .../util-linux/util-linux/configure-sbindir.patch  | 15 ++++---
 .../util-linux/util-linux/fix-configure.patch      | 20 ++++++++++
 .../util-linux/uclibc-__progname-conflict.patch    | 14 +++----
 .../util-linux-ng-replace-siginterrupt.patch       | 15 +++----
 .../{util-linux_2.21.2.bb => util-linux_2.22.1.bb} | 10 ++---
 .../cmake/cmake-native_2.8.10.1.bb                 |  4 ++
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb  |  8 ----
 meta/recipes-devtools/cmake/cmake.inc              |  3 ++
 .../cmake/cmake/dont-run-cross-binaries.patch      | 19 ++++-----
 .../cmake/cmake/support-oe-qt4-tools-names.patch   | 46 +++++++++++-----------
 .../cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb}    |  3 --
 15 files changed, 105 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/fix-configure.patch
 rename meta/recipes-core/util-linux/{util-linux_2.21.2.bb => util-linux_2.22.1.bb} (85%)
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb} (88%)

-- 
1.8.0



