Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U3Znv-00083f-O3
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:18:52 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2013 08:29:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,622,1355126400"; d="scan'208";a="259153806"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 07 Feb 2013 08:29:54 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 18:29:47 +0200
Message-Id: <cover.1360254263.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] fix segfaults when running qemu through pseudo
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
X-List-Received-Date: Thu, 07 Feb 2013 22:18:53 -0000

The following changes since commit 9f5a6f89d9f4a6c7bed3b163e6eaa764d762f523:

  qemu.bbclass: Use the correct qemu binary in multilib cases (2013-02-07 15:25:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/qemu_segfault_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/qemu_segfault_fix

Laurentiu Palcu (1):
  qemu.bbclass: fix segfaults when running through pseudo

 meta/classes/qemu.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5



