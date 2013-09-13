Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A4E0461586
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 21:18:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2013 14:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,900,1371106800"; d="scan'208";a="377931702"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2013 14:18:07 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com
Date: Fri, 13 Sep 2013 21:16:38 +0000
Message-Id: <cover.1379106339.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] a fix for disabling pointing devices
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2013 21:18:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This was believed to be a kernel issue earlier. With further debugging and
discussions the issue was identified as a faulty rule in the udev package.
  Disabling the faulty udev rule solved the issue. With further digging we
found another fix for this issue in fedora, which also fixes the issue for
different people using different input devices. This issue is mainly
observed with keyboard/mouse combination USB devices which has built-in
USB hub.

  Thanks to Ross, for trying out various fixes on his setup, and also thanks to
Darren & Tom for helping with discussions to find the right solution.

Thanks,
Nitin


The following changes since commit dd36930f3f37b2e0e1258de28ac1b1fa99cf196f:

  bitbake: data_smart: Account for changes in append/prepend/remove in the config hash (2013-09-12 17:03:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  udev: avoid autosuspend of USB input devices

 meta/recipes-core/udev/udev.inc                    |  1 +
 .../udev/udev/avoid-mouse-autosuspend.patch        | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch

-- 
1.8.1.4


