Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO1-0000dS-77
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926350"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:50 -0700
Message-Id: <cover.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/14]
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:33 -0000

Richard,

This Set includes changes multilib and ppc64, you may want to
review the ppc64 changes.

Thanks
	Sau!

The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:

  eglibc: Fix patch merge breakage (2011-08-04 15:41:08 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Beth Flanagan (1):
  buildstats.bbclass: Adding disk io measurement

Khem Raj (3):
  autoconf: Remove patch=1 from SRC_URI
  autoconf: Remove code checking for hardcoded /usr/local
  coreutils: Fix build on uclibc

Kumar Gala (7):
  libmusicbrainz: utilize base_libdir when configured
  libproxy: utilize libdir when configured
  prelink: Add lib64 dirs to prelink.conf
  tune/arch-powerpc64: include arch-powerpc.inc to keep things in sync
  gcc-4.6: Add support for the e5500 PowerPC core
  image-mklibs.bbclass: Add powerpc64 arch support
  image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib

Mark Hatle (1):
  libzypp: Increase the size of the arch compat table

Saul Wold (2):
  dpkg: Update to use perlnative
  linux-yocto_3.0: Fix SRC_URI to use yoctoproject.org

 meta/classes/buildstats.bbclass                    |  220 ++++++----
 meta/classes/image-mklibs.bbclass                  |   11 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    4 +
 .../remove-usr-local-lib-from-m4.patch             |   31 ++
 meta/recipes-core/coreutils/coreutils_8.12.bb      |    6 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    4 +-
 .../autoconf/remove-usr-local-lib-from-m4.patch    |   29 ++
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |   22 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    4 +-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 .../gcc/gcc-4.6/powerpc-e5500.patch                |  465 ++++++++++++++++++++
 meta/recipes-devtools/prelink/prelink/prelink.conf |    8 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 .../arm-workaround-global-constructor.patch        |   23 +-
 .../libzypp/libzypp/libzypp-compatargs.patch       |   54 +++
 ...libzypp-pokyarch.patch => libzypp-oearch.patch} |   24 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |   69 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 .../allow-libdir-override.patch                    |   19 +
 .../musicbrainz/libmusicbrainz_3.0.3.bb            |    7 +-
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    4 +-
 22 files changed, 847 insertions(+), 166 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.12/remove-usr-local-lib-from-m4.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/powerpc-e5500.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-compatargs.patch
 rename meta/recipes-extended/libzypp/libzypp/{libzypp-pokyarch.patch => libzypp-oearch.patch} (98%)
 create mode 100644 meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/allow-libdir-override.patch

-- 
1.7.3.4



