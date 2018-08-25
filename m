Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC4D792A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 17:13:44 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7PHDh9I011079;
	Sat, 25 Aug 2018 10:13:43 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sat, 25 Aug 2018 10:13:43 -0700
From: Kai Kang <kai.kang@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat, 25 Aug 2018 10:13:36 -0700
Message-Id: <cover.1535216766.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 0/5] allarch: disable allarch when multilib is used
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
X-List-Received-Date: Sat, 25 Aug 2018 17:13:44 -0000

V3:
* drop commit "cmake.bbclass: fix wrong toolchain flags of nativesdk package"
  which causes some oe-selftest cases fail
* update postinstall script update_font_cache
* drop oe-selftest case test_sstate_allarch_samesigs_multilib
* fix some install file conflicts

The following changes since commit 491082c56ce34f3fd644f8d4457ccd52af951087:

  poky.conf: Enable security flags+pie by defaultEnable security flags+pie by default (2018-08-21 14:52:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/allarch-enabled-V3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/allarch-enabled-V3

Kai Kang (5):
  allarch: disable allarch when multilib is used
  sstate.bbclass: update SSTATE_DUPWHITELIST
  update_font_cache: update script for multilib
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
 meta/recipes-graphics/cairo/cairo.inc              |  4 +-
 meta/recipes-graphics/cairo/cairo_1.14.12.bb       |  2 +-
 .../fontconfig/fontconfig_2.12.6.bb                |  8 +++-
 meta/recipes-support/icu/icu.inc                   |  4 +-
 .../libgpg-error/libgpg-error_1.32.bb              |  5 ++-
 scripts/postinst-intercepts/update_font_cache      |  2 +-
 16 files changed, 92 insertions(+), 75 deletions(-)
 create mode 100644 meta/classes/allarch-enabled.bbclass

-- 
2.11.0


