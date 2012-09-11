Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TBR8a-0005Cs-Ik
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 16:08:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Sep 2012 06:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,404,1344236400"; d="scan'208";a="191605295"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 11 Sep 2012 06:55:37 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:55:30 +0300
Message-Id: <cover.1347371624.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/1] Fix nativesdk-qemu relocation issue
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
X-List-Received-Date: Tue, 11 Sep 2012 14:08:24 -0000

Changes in V2:
	- bump PR

Thanks,
Laurentiu

The following changes since commit 7250638ec895bc89508711831083d43b9e1e9826:

  upstream_tracking: Fix format issues (2012-09-10 23:21:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/qemu_issue
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/qemu_issue

Laurentiu Palcu (1):
  nativesdk-qemu: fix SDK relocation issue

 .../qemu/qemu-1.2.0/relocatable_sdk.patch          |   34 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |    6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/relocatable_sdk.patch

-- 
1.7.9.5



