Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QKd5e-0004yR-9Q
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 23:06:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 14:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,360,1301900400"; d="scan'208";a="435187753"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 14:03:45 -0700
Message-Id: <cover.1305234110.git.nitin.a.kamble@intel.com>
Old-Date: Thu, 12 May 2011 14:01:50 -0700
Date: Thu, 12 May 2011 14:03:44 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/1] a fix for gcc 4.6.0 target recipe
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
X-List-Received-Date: Thu, 12 May 2011 21:06:34 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  gcc: fix target gcc runtime issue

 meta/recipes-devtools/gcc/gcc-4.6.0.inc          |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
 meta/recipes-devtools/gcc/gcc_4.3.3.bb           |    2 +-
 meta/recipes-devtools/gcc/gcc_4.5.1.bb           |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb  |    2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.7.3.4



