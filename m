Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56DED6B2CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:07:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jul 2013 08:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,770,1367996400"; d="scan'208";a="377835287"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.47])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2013 08:07:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 08:07:51 -0700
Message-Id: <cover.1375110365.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL (Part 2) (resend) 00/26] Branch Updated with Correct Set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jul 2013 15:07:51 -0000

Branch is updated, sorry not sure what happened with the
obex and texinfo, I thought I had removed them since they did not 
show up in the summary below (in the first email).

Already basicly ACK'ed by Ross and Paul

Thanks
Sau!

The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:

  external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Andrei Dinu (1):
  libpng : upgrade to 1.6.3

Emilia Ciobanu (14):
  babeltrace: fix recipe name
  build-appliance-image: fix recipe name add GIT revision to PV variable
  chkconfig-alternatives-native: fix recipe name and add GIT revision to
    PV variable
  connman-gnome: fix recipe name add GIT revision to PV variable
  docbook-sgml-dtd-3.1-native: fix recipe name
  docbook-sgml-dtd-4.1-native: fix recipe name
  hwlatdetect: fix recipe name and add GIT revision to PV variable
  lttng-ust: fix recipe name and add GIT revision to PV variable
  mtd-utils: fix recipe name and add GIT revision to PV variable
  neard: fix recipe name
  rt-tests: fix recipe name add GIT revision to PV variable
  update-rc.d: fix recipe name and add GIT revision to PV variable
  distrodata.bbclass: Remove whitespaces
  distrodata.bbclass: Include PRSPV variable in upstream version
    checking

Hongxu Jia (3):
  util-linux: use u-a for su
  shadow: use u-a for su
  move /bin/su to /usr/bin/su to match util-linux and shadow

Jukka Rissanen (1):
  ofono: Move bluetooth enablement from .bb to .inc

Laurentiu Palcu (1):
  csl-versions.inc: instruct user to check local.conf

Ming Liu (3):
  libpam: deny all services for the OTHER entries
  util-linux: fix a regression
  util-linux: replace += with _append to EXTRA_OECONF_class-native

Paul Eggleton (1):
  classes/sanity: check for suid root command evility

Peter Seebach (1):
  pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0

Saul Wold (1):
  bluez5: Add obex as a PACKAGECONFIG and package seperately

 meta/classes/distrodata.bbclass                    | 41 ++++++++++++------
 meta/classes/sanity.bbclass                        | 10 +++++
 meta/conf/distro/include/csl-versions.inc          |  1 +
 meta/recipes-connectivity/bluez5/bluez5.inc        | 10 ++++-
 .../{connman-gnome_0.7.bb => connman-gnome_git.bb} |  2 +
 .../neard/{neard_0.10.bb => neard_git.bb}          |  0
 meta/recipes-connectivity/ofono/ofono.inc          |  6 +++
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |  1 -
 meta/recipes-connectivity/ofono/ofono_git.bb       |  4 --
 .../busybox/busybox-1.21.1/su-usr-bin.patch        | 26 +++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |  1 +
 ...e-image_8.0.bb => build-appliance-image_git.bb} |  2 +
 .../{update-rc.d_0.7.bb => update-rc.d_git.bb}     |  1 +
 meta/recipes-core/util-linux/util-linux.inc        | 15 ++++++-
 .../util-linux/configure-usrlibdir.patch           | 31 ++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.23.1.bb  |  7 ++-
 ...ative.bb => docbook-sgml-dtd-3.1-native_3.1.bb} |  0
 ...ative.bb => docbook-sgml-dtd-4.1-native_4.1.bb} |  0
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  0
 ...t-cleanmarker-with-flash_erase--j-command.patch |  0
 .../mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb}   |  2 +-
 meta/recipes-devtools/pseudo/pseudo.inc            | 50 ++++++++++++++++++----
 ....59.bb => chkconfig-alternatives-native_git.bb} |  2 +-
 meta/recipes-extended/pam/libpam/pam.d/other       | 15 +++----
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  3 +-
 .../{babeltrace_1.1.1.bb => babeltrace_git.bb}     |  0
 .../lttng/{lttng-ust_2.2.0.bb => lttng-ust_git.bb} |  2 +-
 .../libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb}    |  8 ++--
 .../{hwlatdetect_0.85.bb => hwlatdetect_git.bb}    |  1 +
 .../rt-tests/{rt-tests_0.85.bb => rt-tests_git.bb} |  0
 30 files changed, 192 insertions(+), 49 deletions(-)
 rename meta/recipes-connectivity/connman/{connman-gnome_0.7.bb => connman-gnome_git.bb} (97%)
 rename meta/recipes-connectivity/neard/{neard_0.10.bb => neard_git.bb} (100%)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch
 rename meta/recipes-core/images/{build-appliance-image_8.0.bb => build-appliance-image_git.bb} (99%)
 rename meta/recipes-core/update-rc.d/{update-rc.d_0.7.bb => update-rc.d_git.bb} (97%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/configure-usrlibdir.patch
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-3.1-native.bb => docbook-sgml-dtd-3.1-native_3.1.bb} (100%)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-4.1-native.bb => docbook-sgml-dtd-4.1-native_4.1.bb} (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.5.0 => mtd-utils}/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.5.0.bb => mtd-utils_git.bb} (98%)
 rename meta/recipes-extended/chkconfig/{chkconfig-alternatives-native_1.3.59.bb => chkconfig-alternatives-native_git.bb} (98%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.1.1.bb => babeltrace_git.bb} (100%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.0.bb => lttng-ust_git.bb} (97%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb} (64%)
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.85.bb => hwlatdetect_git.bb} (97%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.85.bb => rt-tests_git.bb} (100%)

-- 
1.8.1.4


