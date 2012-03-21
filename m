Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAOdv-0003r1-Mv
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 17:44:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2012 09:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="142631624"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2012 09:35:16 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org, eric@eukrea.com, fcooper@ti.com,
	Martin.Jansa@gmail.com, richard.purdie@linuxfoundation.org
Date: Wed, 21 Mar 2012 09:35:12 -0700
Message-Id: <cover.1332347414.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] fix for the sdk gdb issue
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
X-List-Received-Date: Wed, 21 Mar 2012 16:44:12 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This reverts the commit for adding python support to sdk gdb. It is 
breaking the sdk gdb as reported in this bug: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2077


The following changes since commit 40f95685e6a3b4359d2ab2fea1418fe5e4bd0aa1:

  gzip/pigz-native: Install into a prefix to avoid clashing with system binaries (2012-03-21 15:33:07 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfix

Nitin A Kamble (1):
  Revert "gdb-cross-canadian: build gdb with python support"

 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   20 +-------------------
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 2 insertions(+), 20 deletions(-)

-- 
1.7.6.4



