Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7AB6057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:54:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2016 05:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="974979574"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 05:54:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 15:54:36 +0300
Message-Id: <cover.1464266929.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/7] upgrades + gnupg.org SRC_URI change
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
X-List-Received-Date: Thu, 26 May 2016 12:54:49 -0000

Bunch of unrelated upgrades and an update on everything hosted at
gnupg.org: change from using the unreliable and slow FTP site to
HTTPS.


Changes since V1:
 * dosfstools: Enable compatibility symlinks
 * gnupg.org-hosted recipes: Set UPSTREAM_CHECK_URI, drop gnutls
   changes
Other patches unchanged.

The same branch has been force pushed.

Jussi


The following changes since commit 2718e843b3502afa1e21510bb6b9c4720f75124c:

  yocto-bsps: update to 4.4.11 (2016-05-26 11:34:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gnupg-mirror-plus-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gnupg-mirror-plus-upgrades

Jussi Kukkonen (7):
  clutter-1.0: Upgrade 1.24.2 -> 1.26.0
  clutter-gst-3.0: Upgrade 3.0.16 -> 3.0.18
  gtk+: Upgrade 2.24.29 -> 2.24.30
  dosfstools: Upgrade 3.0.28 -> 4.0
  libevdev: Upgrade 1.4.6 -> 1.5.1
  gnupg.org-hosted recipes: Change SRC_URI to https site
  libgpg-error: Upgrade 1.21 -> 1.22

 meta/classes/mirrors.bbclass                       |   8 +-
 meta/conf/bitbake.conf                             |   2 +
 .../0001-mkfs.fat-fix-incorrect-int-type.patch     |  46 ---------
 .../dosfstools/dosfstools/largefile.patch          |  19 ----
 .../{dosfstools_3.0.28.bb => dosfstools_4.0.bb}    |  18 ++--
 .../gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb}      |   4 +-
 .../0001-build-Use-AC_COMPILE_IFELSE.patch         | 105 ---------------------
 ...clutter-1.0_1.24.2.bb => clutter-1.0_1.26.0.bb} |   5 +-
 ...gst-3.0_3.0.16.bb => clutter-gst-3.0_3.0.18.bb} |   4 +-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   2 +-
 meta/recipes-support/gnupg/gnupg_2.1.11.bb         |   3 +-
 meta/recipes-support/gpgme/gpgme_1.6.0.bb          |   3 +-
 meta/recipes-support/libassuan/libassuan_2.4.2.bb  |   3 +-
 .../{libevdev_1.4.6.bb => libevdev_1.5.1.bb}       |   4 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   3 +-
 .../0001-libgpg-error-Add-nios2-support.patch      |  46 ---------
 .../{libgpg-error_1.21.bb => libgpg-error_1.22.bb} |  12 +--
 meta/recipes-support/libksba/libksba_1.3.3.bb      |   3 +-
 meta/recipes-support/npth/npth_1.2.bb              |   3 +-
 meta/recipes-support/pinentry/pinentry_0.9.2.bb    |   3 +-
 20 files changed, 41 insertions(+), 255 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
 rename meta/recipes-devtools/dosfstools/{dosfstools_3.0.28.bb => dosfstools_4.0.bb} (60%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb} (91%)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0/0001-build-Use-AC_COMPILE_IFELSE.patch
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.24.2.bb => clutter-1.0_1.26.0.bb} (52%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.16.bb => clutter-gst-3.0_3.0.18.bb} (58%)
 rename meta/recipes-support/libevdev/{libevdev_1.4.6.bb => libevdev_1.5.1.bb} (74%)
 delete mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.21.bb => libgpg-error_1.22.bb} (74%)

-- 
2.1.4


