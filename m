Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgpAN-0003A8-Uz
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 04:27:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 19:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25187214"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2011 19:23:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 19:23:09 -0700
Message-Id: <cover.1310521783.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] Updating patch Upstream-Status
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
X-List-Received-Date: Wed, 13 Jul 2011 02:27:12 -0000

Richard,

This cleans up some inconistent Upstream-Status: statuses along with some
duplicate entries.  I will have another batch soon with more Upstream-Status
info, we have under 200 patches remaining with no status.

Thanks
	Sau!


The following changes since commit a6e9edb7b4b5b0bdb067a59d691d33fba8948963:

  sato-sdk: add clutter for sato-sdk image (2011-07-12 15:23:35 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  Patches: Fix Upstream-Status info

 ...Drop-config.h-include-in-tools-imximage.h.patch |    2 +-
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    2 +-
 ...Drop-config.h-include-in-tools-imximage.h.patch |    2 +-
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    2 +-
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |    4 +-
 .../eglibc-2.13/shorten-build-commands.patch       |    1 -
 ...003-gatomic-proper-pointer-get-cast.patch.patch |    2 +-
 .../0005-glib-mkenums-interpreter.patch.patch      |    2 +-
 .../glibc/glibc-2.10.1/glibc-check_pf.patch        |    2 -
 .../cdrtools/cdrtools-native/no_usr_src.patch      |    2 +-
 .../elfutils/elfutils/mempcpy.patch                |    1 -
 .../makedevs/makedevs-1.0.0/COPYING.patch          |    2 +-
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |    3 +-
 .../qemu/qemu-git/qemugl-fix.patch                 |    2 +-
 meta/recipes-extended/at/at-3.1.12/configure.patch |    1 -
 .../libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch    |    2 +-
 .../clutter/clutter-gst/autofoo-0.4.patch          |   19 ------------
 ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |   29 ------------------
 .../clutter/clutter-gst/autofoo.patch              |   31 --------------------
 meta/recipes-qt/qt4/files/qt-dbus-const.patch      |    3 +-
 20 files changed, 15 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/autofoo.patch

-- 
1.7.3.4



