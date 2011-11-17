Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RQutb-0005Ih-Eg
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 06:52:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Nov 2011 21:44:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="76566313"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2011 21:44:52 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 14:05:46 +0800
Message-Id: <cover.1321509543.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] sanitytest: Fix 2 bugs on non-rpm or non-procps installed image
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
X-List-Received-Date: Thu, 17 Nov 2011 05:52:23 -0000

Current sanitytest will report failure on non-rpm or non-procps installed image.
Add check for busybox/procps and use different option for different ps command.
Remove rpm/zypper tests if image is not based on rpm.

The following changes since commit da8425174529f10e16cde21fbea7f804284c38ae:

  alsa-lib: add nativesdk BBCLASSEXTEND (2011-11-15 12:22:58 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (2):
  sanitytest: use different option for command ps from busybox and
    procps
  sanitytest: remove rpm/zypper tests if PACKAGE_CLASSES does not set
    package_rpm

 meta/classes/imagetest-qemu.bbclass           |   25 +++++++++++++++++++++-
 scripts/qemuimage-tests/tools/connman_test.sh |   28 +++++++++++++++++++++---
 2 files changed, 48 insertions(+), 5 deletions(-)



