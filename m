Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 397166E614
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 03:28:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1I3ShUw018558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:28:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 17 Feb 2015 19:28:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 19:28:39 -0800
Message-ID: <cover.1424230079.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: 4 fixes
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
X-List-Received-Date: Wed, 18 Feb 2015 03:28:43 -0000
Content-Type: text/plain

The following changes since commit 2bb8b2abb689d91b7b7e28e6bd528747bde94dd2:

  license.bbclass: fix unexpected operator for LICENSE values with space (2015-02-17 22:29:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  meta: fix build with gettext 0.16.1
  gettext 0.16.1: disable native
  btrfs-tools: fix for parallel build
  bind: fix paralle issue

 .../bind/bind/bind-confgen-build-unix.o-once.patch |   44 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |    1 +
 .../connman/connman-gnome_0.7.bb                   |    2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    4 +-
 .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   32 ++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |    5 ++-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb   |    2 +-
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-support/atk/at-spi2-core_2.14.1.bb    |    2 +-
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_1.2.3.bb          |    2 +-
 meta/recipes-support/pinentry/pinentry_0.9.0.bb    |    2 +
 17 files changed, 95 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-parallel.patch

-- 
1.7.9.5


