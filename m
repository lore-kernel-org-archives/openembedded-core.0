Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85E9860602
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 13:06:36 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7QD6Y7S002644;
	Sun, 26 Aug 2018 06:06:34 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sun, 26 Aug 2018 06:06:34 -0700
From: Kai Kang <kai.kang@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 26 Aug 2018 06:06:25 -0700
Message-Id: <cover.1535288685.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V4 0/6] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Sun, 26 Aug 2018 13:06:36 -0000

V4:
* rebase on origin/master-next
* update postinstall script update_gtk_immodules_cache


V3:
* drop commit "cmake.bbclass: fix wrong toolchain flags of nativesdk package"
  which causes some oe-selftest cases fail
  * update postinstall script update_font_cache
  * drop oe-selftest case test_sstate_allarch_samesigs_multilib
  * fix some install file conflicts


The following changes since commit ec8f8ba112abe2d57b91a00d0c9d6c9a597f83a0:

  cmake: add CMAKE_SYSROOT to generated toolchain file (2018-08-24 16:01:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/allarch-enabled-V4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/allarch-enabled-V4

Kai Kang (6):
  allarch: disable allarch when multilib is used
  sstate.bbclass: update SSTATE_DUPWHITELIST
  update_font_cache: update script for multilib
  update_gtk_immodules_cache: update for multilib
  statetests.py: drop test_sstate_allarch_samesigs_multilib
  multilib: fix install file conflicts

 meta/classes/allarch-enabled.bbclass               | 52 ++++++++++++++++++++++
 meta/classes/allarch.bbclass                       | 51 +--------------------
 meta/classes/icecc.bbclass                         |  2 +-
 meta/classes/multilib.bbclass                      |  2 +-
 meta/classes/multilib_global.bbclass               |  2 +-
 meta/classes/package.bbclass                       |  6 +--
 meta/classes/sstate.bbclass                        |  4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py        | 11 +----
 meta/recipes-core/udev/eudev_3.2.5.bb              |  6 ++-
 .../gobject-introspection_1.56.1.bb                |  6 ++-
 meta/recipes-gnome/gtk+/gtk+.inc                   |  4 ++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  4 ++
 meta/recipes-graphics/cairo/cairo_1.14.12.bb       |  6 ++-
 .../fontconfig/fontconfig_2.12.6.bb                |  8 +++-
 meta/recipes-support/icu/icu.inc                   |  4 +-
 .../libgpg-error/libgpg-error_1.32.bb              |  5 ++-
 scripts/postinst-intercepts/update_font_cache      |  2 +-
 .../postinst-intercepts/update_gtk_immodules_cache |  8 ++--
 18 files changed, 104 insertions(+), 79 deletions(-)
 create mode 100644 meta/classes/allarch-enabled.bbclass

-- 
2.11.0


