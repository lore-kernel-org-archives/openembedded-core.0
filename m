Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3N-0001do-Kt
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396901"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:50:47 -0700
Message-Id: <cover.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/22] Patches and Kernel Updates
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:42 -0000


Richard,

I have done a first pass review of these pull requests, and a number 
of build both on the Autobuilder and privately across architecutres.  

I believe that the GCC 4.6.1 is ready to go and safe.

There will be some corresponding yocto requests that I will push once
you have pulled these into oe-core.

Please review and comment on these

Thanks
	Sau!



The following changes since commit b975de5ea76c5f8827fb48c0c3c29902872ad3d6:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:22:59 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Mueller (1):
  gdk-pixbuf: Fix QA issues and clean minor formatting

Bruce Ashfield (1):
  linux-yocto/meta: update meta SRCREV for routerstation pro

Darren Hart (2):
  send-pull-request: default to --supress-cc=all
  ofono: fix test block syntax error

Ihar Hrachyshka (1):
  Fixed concurrency problem for ZIP packed recipes.

Joshua Lock (2):
  sanity: don't warn about SRC_URI checksums for connectivity test uris
  scripts/hob: wrapper script to run hob gui with a UI specific config
    file

Khem Raj (2):
  oe-buildenv-internal: Replace POKYMODE POKYLIBC with TCMODE and
    TCLIBC
  bitbake.conf: Change TERM default fallback to XTERM instead of
    GNOME_TERM

Koen Kooi (1):
  gcc-package-target: don't fail if the .la files we try to delete are
    not there to start with

Otavio Salvador (1):
  package.bbclass: add support to split Qt translation files

Paul Eggleton (3):
  kernel.bbclass: minor whitespace fixes
  classes: remove obsolete classes
  classes: remove classes that don't belong in oe-core

Phil Blundell (3):
  gcc-4.6: update to 4.6.1 release
  libcap: pass prefix to "make install"
  sanity, base: remove gcc3 check since qemu doesn't need it any more

Saul Wold (3):
  libiconv: add version 1.13.1
  distro tracking: Updates
  eglibc: Tighten LICENSE Fields

Scott Garman (2):
  man: add Upstream-Status field to paches
  unfs-server: add Upstream-Status field to patches

 meta/classes/base.bbclass                          |   19 +++---
 meta/classes/base_srpm.bbclass                     |   20 -----
 meta/classes/ccdv.bbclass                          |   21 ------
 meta/classes/flow-lossage.bbclass                  |    5 --
 meta/classes/kernel.bbclass                        |    4 +-
 meta/classes/mozilla.bbclass                       |   53 --------------
 meta/classes/openmoko-base.bbclass                 |   19 -----
 meta/classes/openmoko-panel-plugin.bbclass         |    6 --
 meta/classes/openmoko.bbclass                      |    3 -
 meta/classes/openmoko2.bbclass                     |   31 --------
 meta/classes/package.bbclass                       |   41 ++++++++++-
 meta/classes/patcher.bbclass                       |    7 --
 meta/classes/sanity.bbclass                        |   14 ++--
 meta/classes/singlemachine.bbclass                 |   15 ----
 meta/classes/srec.bbclass                          |   28 -------
 meta/classes/tmake.bbclass                         |   77 --------------------
 meta/classes/xfce.bbclass                          |   25 -------
 meta/classes/xlibs.bbclass                         |    7 --
 meta/conf/bitbake.conf                             |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   21 ++++--
 meta/recipes-connectivity/ofono/ofono/ofono        |    2 +-
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    6 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 +-
 .../001-2.2b47-2.2b51.patch                        |    5 ++
 .../unfs-server-2.1+2.2beta47/002-destdir.patch    |    5 ++
 .../unfs-server-2.1+2.2beta47/003-manpages.patch   |    5 ++
 .../unfs-server-2.1+2.2beta47/004-strsignal.patch  |    5 ++
 .../unfs-server-2.1+2.2beta47/005-sys-time.patch   |    5 ++
 .../unfs-server-2.1+2.2beta47/006-reiserfs.patch   |    5 ++
 .../unfs-server-2.1+2.2beta47/007-map.patch        |    5 ++
 .../unfs-server-2.1+2.2beta47/008-configure.patch  |    5 ++
 .../unfs-server-2.1+2.2beta47/009-multirw.patch    |    5 ++
 .../unfs-server-2.1+2.2beta47/010-realpath.patch   |    5 ++
 .../011-fno-strict-aliasing.patch                  |    5 ++
 .../unfs-server-2.1+2.2beta47/012-nostrip.patch    |    5 ++
 .../unfs-server-2.1+2.2beta47/013-mntpathlen.patch |    5 ++
 .../014-uninitialized.patch                        |    5 ++
 .../unfs-server-2.1+2.2beta47/015-setattr.patch    |    5 ++
 .../016-makefile.in.patch                          |    5 ++
 .../017-wrs-dynamic-rpc.patch                      |    5 ++
 .../018-remove-tcp-wrappers.patch                  |    5 ++
 .../019-pid-before-fork.patch                      |    5 ++
 .../020-undefined-chmod-fix.patch                  |    5 ++
 .../unfs-server-2.1+2.2beta47/021-nolibwrap.patch  |    5 ++
 .../022-add-close-on-exec-descriptors.patch        |    5 ++
 .../man/man-1.6f/man-1.5g-nonrootbuild.patch       |    4 +
 .../man/man-1.6f/man-1.5h1-gencat.patch            |    4 +
 .../man/man-1.6f/man-1.5h1-make.patch              |    4 +
 .../man/man-1.6f/man-1.5i2-initial.patch           |    4 +
 .../man/man-1.6f/man-1.5i2-newline.patch           |    4 +
 .../man/man-1.6f/man-1.5i2-overflow.patch          |    4 +
 .../man/man-1.6f/man-1.5j-i18n.patch               |    4 +
 .../man/man-1.6f/man-1.5j-nocache.patch            |    4 +
 .../man/man-1.6f/man-1.5j-utf8.patch               |    4 +
 .../man/man-1.6f/man-1.5k-confpath.patch           |    4 +
 .../man/man-1.6f/man-1.5k-nonascii.patch           |    4 +
 .../man/man-1.6f/man-1.5k-sofix.patch              |    4 +
 .../man/man-1.6f/man-1.5m2-bug11621.patch          |    4 +
 .../man/man-1.6f/man-1.5m2-buildroot.patch         |    4 +
 .../man/man-1.6f/man-1.5m2-multiple.patch          |    4 +
 .../man-1.6f/man-1.5m2-no-color-for-printing.patch |    4 +
 .../man/man-1.6f/man-1.5m2-sigpipe.patch           |    4 +
 .../man/man-1.6f/man-1.5m2-tv_fhs.patch            |    4 +
 .../man/man-1.6f/man-1.6e-i18n_whatis.patch        |    4 +
 .../man/man-1.6f/man-1.6e-lzma+xz-support.patch    |    4 +
 .../man/man-1.6f/man-1.6e-mandirs.patch            |    4 +
 .../man/man-1.6f/man-1.6e-new_sections.patch       |    4 +
 .../man/man-1.6f/man-1.6e-ro_usr.patch             |    4 +
 .../man/man-1.6f/man-1.6e-security.patch           |    4 +
 .../man-1.6e-use_i18n_vars_in_a_std_way.patch      |    4 +
 .../man/man-1.6f/man-1.6e-whatis2.patch            |    4 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    7 ++-
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   14 ++--
 meta/recipes-support/libcap/libcap.inc             |    2 +-
 meta/recipes-support/libcap/libcap_2.20.bb         |    2 +-
 .../{libiconv-1.11.1 => files}/autoconf.patch      |    2 +
 .../shared_preloadable_libiconv_linux.patch        |    2 +
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   29 ++++++++
 scripts/hob                                        |   18 +++++
 scripts/oe-buildenv-internal                       |    2 +-
 scripts/send-pull-request                          |    2 +-
 83 files changed, 357 insertions(+), 371 deletions(-)
 delete mode 100644 meta/classes/base_srpm.bbclass
 delete mode 100644 meta/classes/ccdv.bbclass
 delete mode 100644 meta/classes/flow-lossage.bbclass
 delete mode 100644 meta/classes/mozilla.bbclass
 delete mode 100644 meta/classes/openmoko-base.bbclass
 delete mode 100644 meta/classes/openmoko-panel-plugin.bbclass
 delete mode 100644 meta/classes/openmoko.bbclass
 delete mode 100644 meta/classes/openmoko2.bbclass
 delete mode 100644 meta/classes/patcher.bbclass
 delete mode 100644 meta/classes/singlemachine.bbclass
 delete mode 100644 meta/classes/srec.bbclass
 delete mode 100644 meta/classes/tmake.bbclass
 delete mode 100644 meta/classes/xfce.bbclass
 delete mode 100644 meta/classes/xlibs.bbclass
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => files}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => files}/shared_preloadable_libiconv_linux.patch (98%)
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb
 create mode 100755 scripts/hob

-- 
1.7.3.4



