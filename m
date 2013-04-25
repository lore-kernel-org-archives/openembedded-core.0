Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVLVW-0002cq-8H
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:42:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 05:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="292207762"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2013 05:24:03 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:23:56 +0300
Message-Id: <cover.1366892003.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Multilib related postinstall fixes
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
X-List-Received-Date: Thu, 25 Apr 2013 12:42:45 -0000

There is still work to do on the multilib postinstalls running on host front.
This is a first patchset trying to address some of the issues.

Thanks,
Laurentiu

The following changes since commit addcfcda84ed6b43b00f569a6060e3b78196ef52:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-23 13:00:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/ml_postinstall_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/ml_postinstall_fixes

Laurentiu Palcu (4):
  qemuwrapper: use fallback in case the ELF binary is wrong
  pango: fix postinstall when using multilib
  Revert "qemu.bbclass: Use the correct qemu binary in multilib cases"
  scripts/postinst-intercepts: create separete hooks for multilib

 meta/classes/qemu.bbclass                          |    4 +--
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   28 +++++++++++++++++++-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 scripts/postinst-intercepts/postinst_intercept     |   18 +++++++++++++
 4 files changed, 47 insertions(+), 5 deletions(-)

-- 
1.7.9.5



