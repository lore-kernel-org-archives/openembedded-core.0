Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QMOjJ-0002as-C5
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:10:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2011 11:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2908710"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:07:54 -0700
Message-Id: <cover.1305655392.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 17 May 2011 11:03:12 -0700
Date: Tue, 17 May 2011 11:07:54 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/1] switch to gcc 4.6.0 for x86 x86-64 & arm
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
X-List-Received-Date: Tue, 17 May 2011 18:10:49 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

gcc 4.6.0 is good enough to switch for x86, x86-64 & arm now.

I could build core-sdk images and run them through the qemu machines 
when compiled with gcc 4.6.0.

mips & ppc are still not ready, mainly the kernel compilation issues
with gcc 4.6.0. These kernel issues are being worked on by Bruce.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  tcmode-default: switch to gcc 4.6.0 for x86, x86-64 & arm

 meta/conf/distro/include/tcmode-default.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.3.4



