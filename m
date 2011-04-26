Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QEW32-00020T-0K
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 02:22:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2011 17:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,267,1301900400"; d="scan'208";a="633993847"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2011 17:20:05 -0700
Message-Id: <cover.1303776892.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 25 Apr 2011 17:14:52 -0700
Date: Mon, 25 Apr 2011 17:19:46 -0700
To: scott.a.garman@intel.com, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/2] GPLv2 tar & cpio recipe fixes
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
X-List-Received-Date: Tue, 26 Apr 2011 00:22:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Acked by Scott Garman, who is maintainer of GPLv3 tar & cpio recipes.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (2):
  tar-1.17 (GPLv2) bugfix
  cpio-2.8 (GPLv2) bug fix

 .../cpio/cpio-2.8/avoid_heap_overflow.patch        |   25 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.8.bb             |    6 +++-
 .../tar/tar-1.17/avoid_heap_overflow.patch         |   22 +++++++++++++++++
 meta/recipes-extended/tar/tar_1.17.bb              |    3 +-
 4 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
 create mode 100644 meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch

-- 
1.7.2.2



