Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UNTv6-0005ig-13
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 22:04:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 12:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288954184"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 12:47:17 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 12:49:35 -0700
Message-Id: <cover.1365018433.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH V2 0/3] Add input group and udev rule to fix rootless X
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
X-List-Received-Date: Wed, 03 Apr 2013 20:04:32 -0000

Fix [YOCTO 4164] (usb mouse and keyboard don't work at liveboot on atom-pc) by
adding an input group and a udev rule to make all /dev/input/* devices added to
the input group with g+rw permissions. Drop the o+rw setting from
xserver-nodm-init.

Tested on atom-pc from current poky master using core-image-sato.

V2: Package the udev rule in udev-extraconf so systemd can use it also.

Thanks,

Darren


The following changes since commit 92aeb31341b28b193d616ab5cf38af1b9673e37d:

  qemuimage-testlib: Fix quoting issue (2013-03-30 17:26:56 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib dvhart/xuser
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/xuser

Darren Hart (3):
  base-passwd: Add input group
  udev-extraconf: Add rule adding input devices to input group
  xserver-nodm-init: Add xuser to input group

 .../base-passwd/base-passwd-3.5.26/input.patch     |   22 ++++++++++++++++++++
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |    5 ++-
 .../udev/udev-extraconf/localextra.rules           |    2 +
 meta/recipes-core/udev/udev-extraconf_1.0.bb       |    2 +-
 .../x11-common/xserver-nodm-init.bb                |    4 +-
 .../x11-common/xserver-nodm-init/xserver-nodm      |    1 -
 6 files changed, 30 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/input.patch

-- 
1.7.5.4



