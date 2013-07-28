Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0EF6065F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 06:30:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jul 2013 23:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,762,1367996400"; d="scan'208";a="337988527"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.47])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2013 23:30:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jul 2013 23:30:50 -0700
Message-Id: <cover.1374992484.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL (Part 2) 00/15] Tobe Reviewed and ACK'ed
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
X-List-Received-Date: Sun, 28 Jul 2013 06:30:50 -0000

Paul, Ross, Richard:

This is part 2 of the C-Pull, part one was reviewed and ACK'ed on Friday,
these where some changes that have come in since, there are some additional
changes that I still need to review (Read-Only Rootfs specificly).

There are also 2 pending changes on poky, one from Ema for Regex and the
other from Lazslo for the layer.conf file.

This set address some of the external toolchain stuff also.

Thanks
	Sau!

The following changes since commit fe6fc253d6fe4ae08cfaaa05d82df54a277f575c:

  external-sourcery: add missing providers (2013-07-26 00:07:51 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Andrei Dinu (1):
  libpng : upgrade to 1.6.3

Emilia Ciobanu (2):
  distrodata.bbclass: Remove whitespaces
  distrodata.bbclass: Include PRSPV variable in upstream version
    checking

Hongxu Jia (3):
  util-linux: use u-a for su
  shadow: use u-a for su
  move /bin/su to /usr/bin/su to match util-linux and shadow

Jukka Rissanen (2):
  ofono: Add systemd support
  ofono: Enable bluetooth automatically

Laurentiu Palcu (1):
  csl-versions.inc: instruct user to check local.conf

Ming Liu (3):
  libpam: deny all services for the OTHER entries
  util-linux: fix a regression
  util-linux: replace += with _append to EXTRA_OECONF_class-native

Paul Eggleton (1):
  classes/sanity: check for suid root command evility

Peter Seebach (1):
  Always try to build 32-bit libpseudo when NO32LIBS is set to 0

Saul Wold (1):
  bluez5: Add obex as a PACKAGECONFIG and package seperately

 meta/classes/distrodata.bbclass                    | 41 ++++++++++++------
 meta/classes/sanity.bbclass                        | 10 +++++
 meta/conf/distro/include/csl-versions.inc          |  1 +
 meta/recipes-connectivity/bluez5/bluez5.inc        | 10 ++++-
 meta/recipes-connectivity/ofono/ofono.inc          | 14 ++++--
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |  1 -
 meta/recipes-connectivity/ofono/ofono_git.bb       |  4 --
 .../busybox/busybox-1.21.1/su-usr-bin.patch        | 26 +++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |  1 +
 meta/recipes-core/util-linux/util-linux.inc        | 15 ++++++-
 .../util-linux/configure-usrlibdir.patch           | 31 ++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.23.1.bb  |  7 ++-
 meta/recipes-devtools/pseudo/pseudo.inc            | 50 ++++++++++++++++++----
 meta/recipes-extended/pam/libpam/pam.d/other       | 15 +++----
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  3 +-
 .../libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb}    |  8 ++--
 16 files changed, 188 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/configure-usrlibdir.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb} (64%)

-- 
1.8.1.4


