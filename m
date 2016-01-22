Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E726560670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 01:59:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0M1xTUI011325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 17:59:29 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 17:59:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 17:59:28 -0800
Message-ID: <cover.1453427939.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] meta: cleanup PACKAGECONFIG ??= ""
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
X-List-Received-Date: Fri, 22 Jan 2016 01:59:30 -0000
Content-Type: text/plain

The following changes since commit 8084c185c43cb7e7f5e29d31939dfd308f8a0f93:

  udev: Add 2 patches to support 4.4 kernel (2016-01-20 09:20:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/clean
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/clean

Robert Yang (1):
  meta: cleanup PACKAGECONFIG ??= ""

 meta/recipes-bsp/grub/grub2.inc                    |    1 -
 meta/recipes-core/dbus/dbus-glib.inc               |    1 -
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |    1 -
 meta/recipes-devtools/gdb/gdb_7.10.1.bb            |    1 -
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    1 -
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    1 -
 meta/recipes-devtools/opkg/opkg_0.3.1.bb           |    2 --
 .../python/python-imaging_1.1.7.bb                 |    1 -
 meta/recipes-devtools/ruby/ruby_2.2.2.bb           |    1 -
 meta/recipes-extended/mc/mc_4.8.15.bb              |    1 -
 meta/recipes-extended/minicom/minicom_2.7.bb       |    1 -
 meta/recipes-extended/screen/screen_4.3.1.bb       |    1 -
 meta/recipes-extended/sudo/sudo.inc                |    1 -
 meta/recipes-extended/tar/tar_1.28.bb              |    1 -
 meta/recipes-extended/wget/wget.inc                |    1 -
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    1 -
 meta/recipes-graphics/directfb/directfb.inc        |    1 -
 meta/recipes-graphics/piglit/piglit_git.bb         |    1 -
 meta/recipes-graphics/wayland/libinput_1.1.4.bb    |    1 -
 meta/recipes-graphics/xorg-lib/libice_1.0.9.bb     |    1 -
 .../recipes-graphics/xorg-lib/libx11-diet_1.6.3.bb |    1 -
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.2.bb   |    1 -
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    1 -
 .../xorg-proto/xorg-proto-common.inc               |    1 -
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    1 -
 meta/recipes-multimedia/webp/libwebp_0.5.0.bb      |    1 -
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc    |    1 -
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    1 -
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    1 -
 meta/recipes-support/boost/boost.inc               |    1 -
 meta/recipes-support/gmp/gmp.inc                   |    1 -
 .../gnome-desktop-testing_2014.1.bb                |    1 -
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    1 -
 meta/recipes-support/gnupg/gnupg_2.1.10.bb         |    1 -
 meta/recipes-support/libevent/libevent_2.0.22.bb   |    1 -
 meta/recipes-support/libunwind/libunwind.inc       |    1 -
 36 files changed, 37 deletions(-)

-- 
1.7.9.5


