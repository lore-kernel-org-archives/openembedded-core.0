Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TndbM-00069F-BU
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 00:08:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Dec 2012 14:53:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,354,1355126400"; d="scan'208";a="262669365"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.150])
	by orsmga002.jf.intel.com with ESMTP; 25 Dec 2012 14:53:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Dec 2012 14:53:06 -0800
Message-Id: <cover.1356472937.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/27] Christmas Fixes!
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
X-List-Received-Date: Tue, 25 Dec 2012 23:08:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

After much hair pulling, I have a change set that builds
cleanly other than webkit (which was broken before).

More patch testing over the next few days!

Happy Holidays to all

Sau!


The following changes since commit bbd55cc34ca893c7202634fe138cedb2f380be56:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  telepathy-glib upgrade to 0.20.1

Björn Stenberg (6):
  Fix typo in kvm capability detection in runqemu
  Add a new distro feature "ptest".
  New package: ptest-runner
  Add ptest for glib.
  Add ptest for dbus.
  Add ptest for bash.

Bogdan Marinescu (4):
  bison: update to 2.7
  nasm: upgraded to 2.10.06
  rpm: remove declaration of "sykcparse"
  subversion: updated to 1.7.8

Constantin Musca (1):
  libmusicbrainz: upgrade to git SRCREV 0749dd0a35b4a543

Cristian Iorga (2):
  ofono: upgrade to 1.12
  iptables: upgrade to v1.4.16.3

Fahad Usman (2):
  blktrace: essentially rework the recipe, obey LDFLAGS
  cml1: set and export TERMINFO, to handle ncurses-native relocation

Kang Kai (4):
  bitbake.conf: import var ROOT_HOME
  base-files: use dynamic root home directory
  base-passwd: use configurable root home directory
  oprofile: use dynamic root home directory

Marcin Juszkiewicz (1):
  slang: added gnu-configize for AArch64 support

Martin Jansa (2):
  gtk-icon-cache: don't call gtk-update-icon-cache on files
  libpng: fix packaging

Muhammad Shakeel (1):
  wireless-tools: Remove QA warning: No GNU_HASH in the elf binary

Noor Ahsan (1):
  freetype: Update EXTRA_OECONF to use host gcc.

Ross Burton (1):
  python: add -crypt as a dependency on -math

Trevor Woerner (1):
  runqemu: change terminal's INTR key in 'serial' mode

 meta/classes/cml1.bbclass                          |   3 +-
 meta/classes/gtk-icon-cache.bbclass                |   4 +-
 meta/classes/image.bbclass                         |   6 +-
 meta/classes/packagegroup.bbclass                  |   2 +-
 meta/classes/ptest.bbclass                         |  34 +++++
 meta/conf/bitbake.conf                             |   3 +
 .../ofono/{ofono_1.10.bb => ofono_1.12.bb}         |   9 +-
 ...thy-glib_0.19.8.bb => telepathy-glib_0.20.1.bb} |   6 +-
 .../wireless-tools/wireless-tools/ldflags.patch    |  22 ++++
 .../wireless-tools/wireless-tools_29.bb            |   3 +-
 meta/recipes-core/base-files/base-files/profile    |   2 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |   3 +-
 .../base-passwd/base-passwd-3.5.26/root-home.patch |  16 ---
 .../recipes-core/base-passwd/base-passwd_3.5.26.bb |   4 +-
 meta/recipes-core/dbus/dbus-1.6.4/ptest.patch      | 144 +++++++++++++++++++++
 meta/recipes-core/dbus/dbus-1.6.4/run-ptest        |   3 +
 .../dbus/dbus-1.6.4/test-run-path.patch            |  26 ++++
 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb         |  46 +++++++
 meta/recipes-core/dbus/dbus.inc                    |   2 +
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |  61 +++++++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |   3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |  25 +++-
 meta/recipes-core/glib-2.0/glib.inc                |   7 +-
 .../automake/automake/buildtest.patch              |  33 +++++
 meta/recipes-devtools/automake/automake_1.12.5.bb  |   3 +-
 .../bison/{bison_2.5.1.bb => bison_2.7.bb}         |   4 +-
 .../nasm/{nasm_2.10.05.bb => nasm_2.10.06.bb}      |   4 +-
 .../python/python-2.7-manifest.inc                 |   2 +-
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |  14 ++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   3 +-
 .../fix-install-depends.patch                      |   0
 .../libtool2.patch                                 |   0
 .../{subversion_1.7.7.bb => subversion_1.7.8.bb}   |   4 +-
 .../bash/bash-4.2/build-tests.patch                |  48 +++++++
 meta/recipes-extended/bash/bash-4.2/run-ptest      |   2 +
 .../bash/bash-4.2/test-output.patch                |  25 ++++
 meta/recipes-extended/bash/bash.inc                |  16 ++-
 meta/recipes-extended/bash/bash_4.2.bb             |   3 +
 .../{iptables_1.4.15.bb => iptables_1.4.16.3.bb}   |   8 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |   8 ++
 meta/recipes-graphics/freetype/freetype_2.4.10.bb  |   2 +-
 .../blktrace/blktrace/blktrace-makefile.patch      |  55 --------
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |  89 +++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb       |  18 ++-
 meta/recipes-kernel/oprofile/oprofile.inc          |   1 +
 .../oprofile/oprofile/oprofile-root.patch          |  23 ++--
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb    |   7 +-
 .../allow-libdir-override.patch                    |   0
 .../fix_build_issue_for_gcc_4.5.0.patch            |  39 ------
 ...bmusicbrainz_3.0.3.bb => libmusicbrainz_git.bb} |  30 +++--
 .../ptest-runner/files/ptest-runner                |  16 +++
 .../ptest-runner/ptest-runner_1.0.bb               |  17 +++
 scripts/contrib/python/generate-manifest-2.7.py    |   2 +-
 scripts/runqemu                                    |   4 +-
 scripts/runqemu-internal                           |   7 +
 55 files changed, 738 insertions(+), 183 deletions(-)
 create mode 100644 meta/classes/ptest.bbclass
 rename meta/recipes-connectivity/ofono/{ofono_1.10.bb => ofono_1.12.bb} (53%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.8.bb => telepathy-glib_0.20.1.bb} (79%)
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/root-home.patch
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/ptest.patch
 create mode 100755 meta/recipes-core/dbus/dbus-1.6.4/run-ptest
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
 create mode 100644 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest
 create mode 100644 meta/recipes-devtools/automake/automake/buildtest.patch
 rename meta/recipes-devtools/bison/{bison_2.5.1.bb => bison_2.7.bb} (89%)
 rename meta/recipes-devtools/nasm/{nasm_2.10.05.bb => nasm_2.10.06.bb} (81%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.7 => subversion-1.7.8}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.7 => subversion-1.7.8}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.7.bb => subversion_1.7.8.bb} (88%)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/build-tests.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-4.2/test-output.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.15.bb => iptables_1.4.16.3.bb} (87%)
 delete mode 100644 meta/recipes-kernel/blktrace/blktrace/blktrace-makefile.patch
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/ldflags.patch
 rename meta/recipes-multimedia/musicbrainz/{libmusicbrainz-3.0.3 => files}/allow-libdir-override.patch (100%)
 delete mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
 rename meta/recipes-multimedia/musicbrainz/{libmusicbrainz_3.0.3.bb => libmusicbrainz_git.bb} (41%)
 create mode 100644 meta/recipes-support/ptest-runner/files/ptest-runner
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb

-- 
1.8.0.2



