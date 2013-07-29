Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCA46B436
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:51:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2013 08:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,770,1367996400"; d="scan'208";a="372955348"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.47])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2013 08:51:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 08:51:01 -0700
Message-Id: <cover.1375112939.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL (Part 2) (resend) 00/14] Fixed again
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
X-List-Received-Date: Mon, 29 Jul 2013 15:51:01 -0000

Clearly having a bad morning!

This one drops the Recipe Re-names from Ema, should not have been
there.

Sau!

The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:

  external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)

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
 meta/recipes-connectivity/ofono/ofono.inc          |  6 +++
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
 16 files changed, 183 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/configure-usrlibdir.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb} (64%)

-- 
1.8.1.4


