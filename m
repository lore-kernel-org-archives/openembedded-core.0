Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9Qj-0004wG-Eb
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:51:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Jun 2011 08:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="15668173"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2011 08:48:32 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:11 +0800
Message-Id: <cover.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH 00/13] fix to bug #1163 and misc upgrades
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
X-List-Received-Date: Mon, 13 Jun 2011 15:51:57 -0000

Please review them.

The following changes since commit 1a35778905893ff11cab48955a4e94e031734ebe:

  Revert "native/nativesdk: Clean up the depends ordering after bitbake override handling updates" (2011-06-13 15:06:01 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (13):
  tcmode-default: fix PREFERRED_VERSION_gcc-cross-canadian
  recipes: update Upstream-Status for multiple recipes' patches
  gnome-doc-utils: upgrade from 0.20.5 to the latest version 0.20.6
  startup-notification: upgrade from 0.10 to the latest version 0.12
  util-macros: upgrade from 1.13.0 to the latest version 0.14.0
  resourceproto: upgrade from 1.1.1 to the latest version 1.2.0
  dri2proto: upgrade from 2.3 to the latest version 2.4
  glproto: upgrade from 1.4.12 to the latest version 1.4.13
  inputproto: upgrade from 2.0.1 to the latest version 2.0.2
  pixman: upgrade from 0.20.2 to the latest stable 0.22.0
  libxext: upgrade from 1.2.0 to the latest version 1.3.0
  libxi: upgrade from 1.4.2 to the latest version 1.4.3
  distro_tracking_fields.inc: update the info for the following recipes

 .../conf/distro/include/distro_tracking_fields.inc |  113 +++++++++----------
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |    2 +-
 ...c-utils_0.20.5.bb => gnome-doc-utils_0.20.6.bb} |    6 +-
 ...cation_0.10.bb => startup-notification_0.12.bb} |    4 +-
 .../{libxext_1.2.0.bb => libxext_1.3.0.bb}         |    6 +-
 .../xorg-lib/{libxi_1.4.2.bb => libxi_1.4.3.bb}    |    6 +-
 .../{pixman_0.20.2.bb => pixman_0.22.0.bb}         |    8 +-
 .../{dri2proto_2.3.bb => dri2proto_2.4.bb}         |    4 +-
 .../{glproto_1.4.12.bb => glproto_1.4.13.bb}       |    4 +-
 .../{inputproto_2.0.1.bb => inputproto_2.0.2.bb}   |    4 +-
 ...sourceproto_1.1.1.bb => resourceproto_1.2.0.bb} |    6 +-
 ...util-macros_1.13.0.bb => util-macros_1.14.0.bb} |    4 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 14 files changed, 84 insertions(+), 87 deletions(-)
 rename meta/recipes-gnome/gnome/{gnome-doc-utils_0.20.5.bb => gnome-doc-utils_0.20.6.bb} (56%)
 rename meta/recipes-graphics/startup-notification/{startup-notification_0.10.bb => startup-notification_0.12.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.2.0.bb => libxext_1.3.0.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.2.bb => libxi_1.4.3.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.20.2.bb => pixman_0.22.0.bb} (66%)
 rename meta/recipes-graphics/xorg-proto/{dri2proto_2.3.bb => dri2proto_2.4.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.12.bb => glproto_1.4.13.bb} (77%)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.1.bb => inputproto_2.0.2.bb} (78%)
 rename meta/recipes-graphics/xorg-proto/{resourceproto_1.1.1.bb => resourceproto_1.2.0.bb} (61%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.13.0.bb => util-macros_1.14.0.bb} (79%)



