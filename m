Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QW96x-00031L-T5
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:31:32 +0200
Received: by rex (Postfix, from userid 1000)
	id 3ADD82013D; Mon, 13 Jun 2011 16:27:49 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 16:27:37 +0100
Message-Id: <cover.1307978499.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 00/11] Various dependency tweaks + nastivesdk fixes
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
X-List-Received-Date: Mon, 13 Jun 2011 15:31:32 -0000

This patch series contains various dependency tweaks simplifying the 
dependencies of some of the configuration file/script packages.

It also fixes some bugs in nativesdk handling which were recently 
introduced and improves some misleading package names.

The following changes since commit 6a3e57fcd3a172c9b2707510d65741734c98a143:

  Revert "gcc: rebase the patch to avoid patch rejection" (2011-06-10 12:56:29 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/for-master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/for-master

Richard Purdie (11):
  pointercal: Inhibit toolchain dependencies as its just config files
  formfactor: Inhibit toolchain dependencies as its just config files
  keymaps: Inhibit toolchain dependencies as its just configuration
    files
  usbinit: Inherit allarch as its a generic script
  base-files: Inherit toolchain dependencies as a compiler isn't used
  poky-feed-opkg: Disable default toolchain dependencies as these are
    just configuration files
  initscripts: makedevs is no longer used anywhere so drop dependency.
    Also inhibit compiler/libc dependencies as they're unused
  sysvinit-inittab: Inhibit compiler/libc dependencies as this is just
    a configuration file
  initrdscripts: Inhibit compiler/libc dependencies as this is just a
    configuration file
  task-sdk-host: Add nativesdk to the task name so its clearer what the
    contents of the task represent
  nativesdk.bbclass: Correct ordering of manipulations

 meta/classes/nativesdk.bbclass                     |   53 ++++++++++++++------
 meta/classes/populate_sdk.bbclass                  |    2 +-
 meta/recipes-bsp/formfactor/formfactor_0.0.bb      |    1 +
 meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    2 +
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |    1 +
 meta/recipes-bsp/usbinit/usbinit.bb                |    4 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +
 .../feed-config/poky-feed-config-opkg_1.0.bb       |    1 +
 .../initrdscripts/initramfs-live-install_1.0.bb    |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    2 +
 ...task-sdk-host.bb => task-sdk-host-nativesdk.bb} |    0
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    2 +-
 ...ost.bb => task-qte-toolchain-host-nativesdk.bb} |    2 +-
 14 files changed, 55 insertions(+), 24 deletions(-)
 rename meta/recipes-core/tasks/{task-sdk-host.bb => task-sdk-host-nativesdk.bb} (100%)
 rename meta/recipes-qt/tasks/{task-qte-toolchain-host.bb => task-qte-toolchain-host-nativesdk.bb} (70%)

-- 
1.7.4.1



