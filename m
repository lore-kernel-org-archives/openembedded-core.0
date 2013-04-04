Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNdpc-0004pz-IF
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 08:39:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2013 23:20:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,405,1363158000"; d="scan'208";a="312151715"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.17])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2013 23:22:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 23:22:18 -0700
Message-Id: <cover.1365056117.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 0/8] Patches for build issues
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
X-List-Received-Date: Thu, 04 Apr 2013 06:39:40 -0000

Richard,

This set up patches is being built by the AB currently and the progress is good.

The changes currently proposed have been reviewed.

My rpm-postinsts is working, but we will need to investage similar changes for 
deb and opkg, maybe considering a common run-postinsts package that can select the 
correct rootfs based packaging system (maybe a 1.5 item)

There are other changes pending that I have not tested yet, such as Chases' DTB
change, please review and pull as appropirate

Thank
	Sau!

The following changes since commit ca36be708e54c0c86535bc8512295c76c48f6cf5:

  classes/sstate: avoid traceback when no files have been staged (2013-04-03 17:01:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Carlos Rafael Giani (1):
  gst-ffmpeg: configure-fix patch used wrong test

Darren Hart (3):
  base-passwd: Add input group
  udev-extraconf: Add rule adding input devices to input group
  xserver-nodm-init: Add xuser to input group

Martin Jansa (2):
  buildhistory: record tag names and show warning when the same tag
    corresponds to different revision
  rm_work: keep do_fetch, do_write_srcrev stamps

Paul Eggleton (1):
  icon-naming-utils: import version 0.8.90 from meta-oe

Saul Wold (1):
  rpm-postinsts: Split out run-postinsts

 meta/classes/buildhistory.bbclass                  | 29 +++++++++++--
 meta/classes/rm_work.bbclass                       |  8 ++++
 .../base-passwd/base-passwd-3.5.26/input.patch     | 22 ++++++++++
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |  5 ++-
 .../udev/udev-extraconf/localextra.rules           |  2 +
 meta/recipes-core/udev/udev-extraconf_1.0.bb       |  2 +-
 ...native_0.8.7.bb => icon-naming-utils_0.8.90.bb} | 15 ++++---
 meta/recipes-devtools/rpm/rpm-postinsts.bb         | 50 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             | 30 +------------
 .../x11-common/xserver-nodm-init.bb                |  4 +-
 .../x11-common/xserver-nodm-init/xserver-nodm      |  1 -
 .../gst-ffmpeg-0.10.13/configure-fix.patch         |  2 +-
 12 files changed, 123 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/input.patch
 rename meta/recipes-devtools/icon-naming-utils/{icon-naming-utils-native_0.8.7.bb => icon-naming-utils_0.8.90.bb} (58%)
 create mode 100644 meta/recipes-devtools/rpm/rpm-postinsts.bb

-- 
1.8.0.2



