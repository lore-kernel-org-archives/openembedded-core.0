Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44p-0006K2-4y
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478035"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:02 +0300
Message-Id: <cover.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/12] Updated and Fixes
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
X-List-Received-Date: Thu, 17 May 2012 17:01:23 -0000

Richard,

Pull in the backlog of changes from this week.  Bigest change
that need looking at are Chris's.

Sau!

The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:

  fotowall: Add #include ui_wizard.h to ExportWizard.cpp (2012-05-16 07:33:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru DAMIAN (1):
  xf86-video-vmware: update package to 12.0.2

Bogdan Marinescu (1):
  gnutls: update to 2.12.19

Christopher Larson (3):
  csl-versions: fix bb.process.CmdError reference
  oe.types: give the regex type more sane semantics
  kernel.bbclass: add deploy link to KERNEL_IMAGETYPE

Joshua Lock (2):
  meta/classes/sstate.bbclass: ensure sstate files have group R/W
  sanity.bbclass: check user can read and write to SSTATE_DIR

Laurentiu Palcu (1):
  gnupg: Update to upstream version 2.0.19

Marko Lindqvist (1):
  dpkg: update to upstream version 1.16.3

Martin Jansa (1):
  xserver-xorg-lite: disable xmlto like full xserver-xorg does

Saul Wold (1):
  xinetd: Update to 2.3.15

Xiaofeng Yan (1):
  archiver.bbclass: Add two default set for avoiding error when missing
    assignment

 meta/classes/archiver.bbclass                      |    4 +-
 meta/classes/kernel.bbclass                        |    1 +
 meta/classes/sanity.bbclass                        |   17 ++-
 meta/classes/sstate.bbclass                        |    1 +
 meta/conf/distro/include/csl-versions.inc          |    2 +-
 meta/lib/oe/types.py                               |   31 +++
 meta/recipes-devtools/dpkg/dpkg.inc                |    5 +-
 .../recipes-devtools/dpkg/dpkg/check_version.patch |   26 ++-
 .../dpkg/dpkg/dpkg-deb-avoid-fflush.patch          |  198 --------------------
 .../dpkg/dpkg/ignore_extra_fields.patch            |   39 ++--
 .../dpkg/dpkg/ignore_lutimes_errors.patch          |   26 +++
 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch   |   22 ---
 meta/recipes-devtools/dpkg/dpkg/preinst.patch      |   45 +++--
 .../dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.3.bb}      |   10 +-
 .../xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb}  |    6 +-
 ...mware_12.0.1.bb => xf86-video-vmware_12.0.2.bb} |    6 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 .../gnupg/{gnupg_2.0.18.bb => gnupg_2.0.19.bb}     |    6 +-
 .../configure-fix.patch                            |    0
 .../correct_rpl_gettimeofday_signature.patch       |    0
 .../fix-gettext-version.patch                      |    0
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../{gnutls_2.12.18.bb => gnutls_2.12.19.bb}       |    4 +-
 25 files changed, 159 insertions(+), 293 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-deb-avoid-fflush.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/ignore_lutimes_errors.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/perllibdir.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.15.8.7.bb => dpkg_1.16.3.bb} (42%)
 rename meta/recipes-extended/xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb} (90%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.1.bb => xf86-video-vmware_12.0.2.bb} (74%)
 rename meta/recipes-support/gnupg/{gnupg_2.0.18.bb => gnupg_2.0.19.bb} (81%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/configure-fix.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/correct_rpl_gettimeofday_signature.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/fix-gettext-version.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.18 => gnutls-2.12.19}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.18.bb => gnutls_2.12.19.bb} (77%)

-- 
1.7.7.6



