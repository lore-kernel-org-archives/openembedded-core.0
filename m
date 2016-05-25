Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8776465CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:29:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 25 May 2016 06:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="814546967"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 25 May 2016 06:29:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 16:29:02 +0300
Message-Id: <cover.1464176988.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/7] upgrades + gnupg.org SRC_URI change
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
X-List-Received-Date: Wed, 25 May 2016 13:29:15 -0000

Bunch of unrelated upgrades and an update on everything hosted at
gnupg.org: change from using the unreliable and slow FTP site to
HTTPS.

 - Jussi

The following changes since commit 56ab1a53453525f3200a8c4d1e1963df0e4e8890:

  linux-yocto/4.4: integrate v4.4.11 (2016-05-25 07:50:18 +0100)

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

 meta/classes/mirrors.bbclass                       |   7 +-
 meta/conf/bitbake.conf                             |   2 +
 .../0001-mkfs.fat-fix-incorrect-int-type.patch     |  46 ---------
 .../dosfstools/dosfstools/largefile.patch          |  19 ----
 .../{dosfstools_3.0.28.bb => dosfstools_4.0.bb}    |  18 ++--
 .../gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb}      |   4 +-
 .../0001-build-Use-AC_COMPILE_IFELSE.patch         | 105 ---------------------
 ...clutter-1.0_1.24.2.bb => clutter-1.0_1.26.0.bb} |   5 +-
 ...gst-3.0_3.0.16.bb => clutter-gst-3.0_3.0.18.bb} |   4 +-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   2 +-
 meta/recipes-support/gnupg/gnupg_2.1.11.bb         |   2 +-
 meta/recipes-support/gnutls/gnutls.inc             |   2 +-
 meta/recipes-support/gpgme/gpgme_1.6.0.bb          |   2 +-
 meta/recipes-support/libassuan/libassuan_2.4.2.bb  |   2 +-
 .../{libevdev_1.4.6.bb => libevdev_1.5.1.bb}       |   4 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   2 +-
 .../0001-libgpg-error-Add-nios2-support.patch      |  46 ---------
 .../{libgpg-error_1.21.bb => libgpg-error_1.22.bb} |  11 +--
 meta/recipes-support/libksba/libksba_1.3.3.bb      |   2 +-
 meta/recipes-support/npth/npth_1.2.bb              |   2 +-
 meta/recipes-support/pinentry/pinentry_0.9.2.bb    |   2 +-
 21 files changed, 33 insertions(+), 256 deletions(-)
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


