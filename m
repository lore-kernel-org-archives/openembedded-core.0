Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPjhc-0001h8-SP
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:10:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2011 16:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,276,1304319600"; 
   d="scan'208";a="5588259"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2011 16:07:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 16:07:31 -0700
Message-Id: <cover.1306451124.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [Consolidated Pull 0/9] Fixes for M1 and build breakage
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
X-List-Received-Date: Thu, 26 May 2011 23:10:53 -0000

There a number of changes here for M1.

Nitin's change is included since it was queued already, bounce as needed


Sau!

The following changes since commit 9281ac4c98d4287a5492f13f94e1bd0eea4791c6:

  dbus 1.4.1: enable systemd support, but package systemd files seperately (2011-05-26 11:02:30 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Darren Hart (1):
  utils.bbclass: make FILESEXTRAPATHS colon delimited

Koen Kooi (2):
  dbus: clean up dbus-x11 packaging
  x11-common: fix dbus-launch RDEPENDS

Martin Jansa (1):
  rm_work: keep all sigdata files in stamps dir

Nitin A Kamble (1):
  mesa-xlib: workaround gcc 4.6.0 ICE

Phil Blundell (1):
  busybox: sync do_install() with oe master (mostly)

Saul Wold (3):
  bitbake.conf: change IMAGE_ROOTFS_EXTRA_SPACE to soft (?=) default
  gnutls: Add libcap to DEPENDS
  Revert "createrepo: Update to 0.9.9"

 meta/classes/rm_work.bbclass                       |    4 +
 meta/classes/utils.bbclass                         |    6 +-
 meta/conf/bitbake.conf                             |   11 +-
 meta/recipes-core/busybox/busybox.inc              |   99 +++++++++++---------
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    2 +-
 meta/recipes-core/dbus/dbus_1.4.1.bb               |    2 +-
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    6 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 +-
 .../createrepo/createrepo/fix-native-install.patch |   88 ++++++++---------
 .../{createrepo_0.9.9.bb => createrepo_0.4.11.bb}  |    7 +-
 meta/recipes-support/gnutls/gnutls.inc             |    6 +-
 meta/recipes-support/gnutls/gnutls_2.10.4.bb       |    2 +-
 13 files changed, 129 insertions(+), 110 deletions(-)
 rename meta/recipes-support/createrepo/{createrepo_0.9.9.bb => createrepo_0.4.11.bb} (73%)

-- 
1.7.3.4



