Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T5Q22-0004EJ-31
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 01:44:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Aug 2012 16:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,313,1344236400"; d="scan'208";a="184920956"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.20])
	by azsmga001.ch.intel.com with ESMTP; 25 Aug 2012 16:32:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Aug 2012 16:32:34 -0700
Message-Id: <cover.1345937340.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/21] Updates and Fixes (Cover Letter Only)
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
X-List-Received-Date: Sat, 25 Aug 2012 23:44:46 -0000


Richard,

This set has been built in the AB, I know you are still
holding back on the bitbake and bitbake.conf, there are included
as a reminder for when you are ready.

I think that it's safe to pull in the eglibc-pic change.

Thanks
	Sau!


The following changes since commit 968cfc0b630fb409430a46b1512d6bf0de225ad1:

  build-appliance-image: Add vmx* files and build zip file (2012-08-24 17:32:34 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  dhcp : upgrade to 4.2.4-P1

Andy Ross (1):
  task-core-lsb: Don't pull in eglibc-pic via RDEPENDS

Bruce Ashfield (2):
  kernel-yocto: don't require meta branch for custom repos
  kernel-yocto: set master branch to a defined SRCREV

Constantin Musca (4):
  wget: upgrade to 1.14
  npth: upgrade to 0.91
  kconfig-frontends: upgrade to 3.5
  base-passwd: upgrade to 3.5.26

Jackie Huang (1):
  gdk-pixbuf: call gtk-update-icon-cache with -t in postinstall script

Jason Wessel (1):
  terminal.py: use unique ids for screen sessions

Liang Li (1):
  kernel.bbclass: fix INC directory for SLANG

Marcin Juszkiewicz (2):
  libcap: fetch from Debian
  subversion: update to 1.7.6

Mark Hatle (1):
  bitbake.conf: add variables to exclude from hash.

Matthew McClintock (1):
  kmod-native_git.bb: fix builds for hosts with older libc

Mihai Lindner (1):
  grub-efi: fix Nothing PROVIDES 'grub-efi-x86_64-native'

Robert Yang (2):
  bitbake.conf: add STAMPS_DIR for constructing STAMP
  bitbake-whatchanged: print what is about to happen

Roy.Li (1):
  bitbake: compile tar-replacement firstly

Saul Wold (2):
  runqemu: Move the KVM check after the MACHINE/KERNEL Checks
  build-appliance-image: Update SRCREV for beta build

 meta/classes/grub-efi.bbclass                      |    2 +-
 meta/classes/kernel-yocto.bbclass                  |   17 +-
 meta/classes/kernel.bbclass                        |    3 +
 meta/conf/bitbake.conf                             |    5 +-
 meta/lib/oe/terminal.py                            |    4 +-
 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../fix-client-path.patch                          |    0
 .../fix-external-bind.patch                        |    0
 .../fixincludes.patch                              |    0
 .../link-with-lcrypto.patch                        |    0
 .../noattrmode.patch                               |    0
 .../dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/site.h   |    0
 .../dhcp/{dhcp_4.2.3-P2.bb => dhcp_4.2.4-P1.bb}    |    7 +-
 .../nobash.patch                                   |    0
 .../root-home.patch                                |    0
 ...base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} |    6 +-
 meta/recipes-core/images/build-appliance-image.bb  |    2 +-
 ...g-frontends_3.4.bb => kconfig-frontends_3.5.bb} |    6 +-
 .../subversion-1.7.6/fix-install-depends.patch     |   48 +++
 .../libtool2.patch                                 |    0
 ...ersion-1.7.6_mod_dontdothat_svnserve_only.patch |  108 ++++++
 .../{subversion_1.7.2.bb => subversion_1.7.6.bb}   |    9 +-
 meta/recipes-extended/tasks/task-core-lsb.bb       |    1 -
 .../wget/wget-1.13.4/remove-gets.patch             |   23 --
 .../{wget-1.13.4 => wget-1.14}/fix_makefile.patch  |    0
 meta/recipes-extended/wget/wget_1.13.4.bb          |   10 -
 meta/recipes-extended/wget/wget_1.14.bb            |    9 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    4 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |    3 +-
 .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        |   17 +
 .../recipes-kernel/linux/linux-yocto/noslang.patch |   20 --
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    4 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    4 +-
 meta/recipes-support/libcap/libcap.inc             |    2 +-
 meta/recipes-support/libcap/libcap_2.22.bb         |    4 +-
 .../npth/{npth_0.90.bb => npth_0.91.bb}            |    4 +-
 scripts/bitbake                                    |    7 +-
 scripts/bitbake-whatchanged                        |  342 ++++++++++++++++++++
 scripts/oe-buildenv-internal                       |    5 +-
 scripts/runqemu                                    |   31 +-
 42 files changed, 598 insertions(+), 115 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.3-P2.bb => dhcp_4.2.4-P1.bb} (59%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.24 => base-passwd-3.5.26}/root-home.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.24.bb => base-passwd_3.5.26.bb} (94%)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.4.bb => kconfig-frontends_3.5.bb} (88%)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/fix-install-depends.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.2 => subversion-1.7.6}/libtool2.patch (100%)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
 rename meta/recipes-devtools/subversion/{subversion_1.7.2.bb => subversion_1.7.6.bb} (79%)
 delete mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
 rename meta/recipes-extended/wget/{wget-1.13.4 => wget-1.14}/fix_makefile.patch (100%)
 delete mode 100644 meta/recipes-extended/wget/wget_1.13.4.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.14.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto/noslang.patch
 rename meta/recipes-support/npth/{npth_0.90.bb => npth_0.91.bb} (76%)
 create mode 100755 scripts/bitbake-whatchanged

-- 
1.7.7.6



