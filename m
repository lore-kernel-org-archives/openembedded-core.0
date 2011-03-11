Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Py6tp-00006T-0X
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 19:17:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2011 10:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,304,1297065600"; d="scan'208";a="896347729"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2011 10:15:14 -0800
Message-Id: <cover.1299867196.git.nitin.a.kamble@intel.com>
Old-Date: Fri, 11 Mar 2011 10:13:16 -0800
Date: Fri, 11 Mar 2011 10:15:13 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/1] perl parallel build fixes
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
X-List-Received-Date: Fri, 11 Mar 2011 18:17:17 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

imore information in the commit emails

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  perl: another set of parallel build fixes

 .../perl/perl-5.12.2/parallel_build_fix_4.patch    |   55 +++
 .../perl/perl-5.12.2/parallel_build_fix_5.patch    |  428 ++++++++++++++++++++
 .../perl/perl-5.12.2/parallel_build_fix_6.patch    |  156 +++++++
 meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    5 +-
 meta/recipes-devtools/perl/perl_5.12.2.bb          |    5 +-
 5 files changed, 647 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch

-- 
1.7.3.4



