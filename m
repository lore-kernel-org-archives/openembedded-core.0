Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Px8Cr-0003Ec-2N
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 02:28:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Mar 2011 17:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,286,1297065600"; d="scan'208";a="717959650"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2011 17:26:13 -0800
Message-Id: <cover.1299633840.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 8 Mar 2011 17:24:00 -0800
Date: Tue, 08 Mar 2011 17:26:12 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Cc: Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 0/1] a bugfix for gcc-runtime recipe
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
X-List-Received-Date: Wed, 09 Mar 2011 01:28:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

More details in the commit email.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  gcc-runtime: fix LSB library checks for libstdc++.so.6

 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    3 +++
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.3.4



