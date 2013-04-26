Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVdug-0005BM-Nf
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 10:21:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Apr 2013 01:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,556,1363158000"; d="scan'208";a="293336310"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2013 01:04:04 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 11:03:57 +0300
Message-Id: <cover.1366962026.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/5] Multilib related postinstall fixes
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
X-List-Received-Date: Fri, 26 Apr 2013 08:22:14 -0000
X-List-Received-Date: Fri, 26 Apr 2013 08:22:14 -0000
X-List-Received-Date: Fri, 26 Apr 2013 08:22:14 -0000

Changes in v2:
 * addressed Mark's comment

There is still work to do on the multilib postinstalls running on host front.
This is a first patchset trying to address some of the issues.

Thanks,
Laurentiu

The following changes since commit addcfcda84ed6b43b00f569a6060e3b78196ef52:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-23 13:00:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/ml_postinstall_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/ml_postinstall_fixes

Laurentiu Palcu (5):
  qemuwrapper: use fallback in case the ELF binary is wrong
  pango: fix postinstall when using multilib
  Revert "qemu.bbclass: Use the correct qemu binary in multilib cases"
  scripts/postinst-intercepts: create separete hooks for multilib
  Pass the mlprefix to postinst_intercept script

 meta/classes/fontcache.bbclass                     |    2 +-
 meta/classes/gtk-icon-cache.bbclass                |    4 +--
 meta/classes/pixbufcache.bbclass                   |    2 +-
 meta/classes/qemu.bbclass                          |    4 +--
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   28 +++++++++++++++++++-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 scripts/postinst-intercepts/postinst_intercept     |   23 ++++++++++++++--
 7 files changed, 54 insertions(+), 11 deletions(-)

-- 
1.7.9.5



