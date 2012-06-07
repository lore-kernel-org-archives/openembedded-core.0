Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQD-00045n-KB
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jun 2012 16:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476554"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:36:50 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57Nb4Nl006448; Thu, 7 Jun 2012 16:37:04 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57Nb2jE006447;
	Thu, 7 Jun 2012 16:37:02 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:00 -0700
Message-Id: <cover.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: Scott Garman <scott.a.garman@intel.com>, Joe Slater <jslater@windriver.com>,
	"Song.Li" <song.li@windriver.com>
Subject: [Consolidated Pull 00/22] Random pulls
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here are the next batch of pull requests. I'm excluding Mark's rpm work
as during testing it uncovered some bugs. We've also uncovered some issues 
with connman-gnome DEPENDS that I'll hopefully have a patch for in the morning
that cause it to fail if the DEPENDS aren't met.

-b

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:

  ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib stage/eflanagan_mut-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stage/eflanagan_mut-next

Andreas Müller (1):
  systemtap: Unbreak build for systems with nss headers installed

Christopher Larson (2):
  task-core-basic: drop portmap
  rpcbind: add and use startup script, move binaries

Cristian Iorga (1):
  telepathy-glib: update to 0.19.0

Jesse Zhang (1):
  beecrypt: disable java

Joe Slater (2):
  shared-mime-info: fix build race condition
  gettext: install libgettextlib.a before removing it

Mark Hatle (2):
  shadow-native: Disable nscd support
  insane.bbclass: Make ldd exec_prefix error reporting easier to read

Otavio Salvador (1):
  openjade: autoreconf to fix building on newer host systems

Robert P. J. Day (1):
  README: Correct documentation URL in top-level README file

Robert Yang (3):
  apt-get 0.7.14: hangs at runtime
  apt 0.7.14: do_compile failed with gcc 4.7
  rootfs_rpm.bbclass: save rpmlib rather than remove it

Ross Burton (3):
  connman: respect the 3g feature and enable/disable ofono support
  connman: Document the ACL-breaking sed
  connman: upgrade to 1.0

Scott Garman (1):
  runqemu-ifup: enable arp proxying

Song.Li (1):
  groff: Fix build on Fedora 17

Tom Zanussi (2):
  gnupg: add libusb to DEPENDS
  gnupg: disable CCID driver

Xiaofeng Yan (1):
  archiver.bbclass: Reduce some duplication for function get_licenses

 README                                             |    2 +-
 meta/classes/archiver.bbclass                      |   23 +-
 meta/classes/image.bbclass                         |    6 +
 meta/classes/insane.bbclass                        |   20 +-
 meta/classes/rootfs_rpm.bbclass                    |    6 +-
 meta/recipes-connectivity/connman/connman.inc      |   33 +-
 ...ange-visibility-to-default-for-debug-symb.patch |   35 -
 .../connman/connman/disable_alg-test.patch         |   46 -
 .../connman/connman/ethernet_default.patch         |   22 -
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 -
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 -
 meta/recipes-connectivity/connman/connman_0.79.bb  |   14 -
 meta/recipes-connectivity/connman/connman_1.0.bb   |    9 +
 ...thy-glib_0.18.1.bb => telepathy-glib_0.19.0.bb} |    4 +-
 .../gettext/gettext-0.18.1.1/parallel.patch        |   34 +
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 .../apt/apt-0.7.14/remove-redeclaration.patch      |   32 +-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt.inc                  |    1 +
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    6 +-
 .../openjade/openjade-1.3.2/autoreconf.patch       |21657 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |   24 +-
 meta/recipes-extended/rpcbind/rpcbind/init.d       |   85 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   18 +-
 .../shadow/shadow-native_4.1.4.3.bb                |    5 +-
 meta/recipes-extended/tasks/task-core-basic.bb     |    1 -
 ...prun-configure.ac-support-without-nss-for.patch |   50 +
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   10 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    4 +-
 meta/recipes-support/gnupg/gnupg_2.0.19.bb         |    3 +-
 .../shared-mime-info/install-data-hook.patch       |   21 +
 .../shared-mime-info/shared-mime-info_0.91.bb      |    5 +-
 scripts/runqemu-ifup                               |    1 +
 35 files changed, 22002 insertions(+), 289 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.18.1.bb => telepathy-glib_0.19.0.bb} (82%)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/autoreconf.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/init.d
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch

-- 
1.7.5.4



