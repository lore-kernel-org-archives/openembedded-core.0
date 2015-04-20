Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4F365CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:09:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3K89NJ3029733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:09:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 01:09:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2015 01:09:15 -0700
Message-ID: <cover.1429517334.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8] Package Upgrades
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
X-List-Received-Date: Mon, 20 Apr 2015 08:09:22 -0000
Content-Type: text/plain

The following changes since commit 97d56a5b8e4f15eb32095f242eb2fd62fc5d85f2:

  gmp: remove referencing paths from the build host (2015-04-19 13:34:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PUs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PUs

Robert Yang (8):
  cracklib: 2.9.2 -> 2.9.3
  directfb: 1.7.6 -> 1.7.7
  ccache: 3.1.9 -> 3.1.11
  dbus-glib: 0.102 -> 0.104
  cryptodev: 1.6 -> 1.7
  liberror-perl: 0.17022 -> 0.17023
  pax-utils: 0.9.2 -> 1.0.3
  lz4: r127 -> r128

 meta/recipes-core/dbus/dbus-glib_0.102.bb          |    5 --
 meta/recipes-core/dbus/dbus-glib_0.104.bb          |    4 +
 .../ccache/{ccache_3.1.9.bb => ccache_3.1.11.bb}   |    4 +-
 .../{pax-utils_0.9.2.bb => pax-utils_1.0.3.bb}     |    4 +-
 ...or-perl_0.17022.bb => liberror-perl_0.17023.bb} |    5 +-
 .../{cracklib_2.9.2.bb => cracklib_2.9.3.bb}       |    6 +-
 meta/recipes-graphics/directfb/directfb_1.7.6.bb   |    8 --
 meta/recipes-graphics/directfb/directfb_1.7.7.bb   |    8 ++
 ...yptodev-linux_1.6.bb => cryptodev-linux_1.7.bb} |    4 +-
 ...todev-module_1.6.bb => cryptodev-module_1.7.bb} |    1 -
 ...yptodev-tests_1.6.bb => cryptodev-tests_1.7.bb} |    0
 .../{cryptodev_1.6.inc => cryptodev_1.7.inc}       |    4 +-
 ...pile-and-install-rules-for-cryptodev-test.patch |   23 +++---
 ...-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch |   86 --------------------
 .../recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} |   12 +--
 15 files changed, 40 insertions(+), 134 deletions(-)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.104.bb
 rename meta/recipes-devtools/ccache/{ccache_3.1.9.bb => ccache_3.1.11.bb} (45%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.9.2.bb => pax-utils_1.0.3.bb} (83%)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17022.bb => liberror-perl_0.17023.bb} (83%)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.2.bb => cracklib_2.9.3.bb} (90%)
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.7.6.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.7.7.bb
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.6.bb => cryptodev-linux_1.7.bb} (92%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.6.bb => cryptodev-module_1.7.bb} (85%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.6.bb => cryptodev-tests_1.7.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev_1.6.inc => cryptodev_1.7.inc} (66%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0002-In-the-3.13-rc1-Linux-kernel-the-INIT_COMPLETION-mac.patch
 rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (66%)

-- 
1.7.9.5


