Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCFA97267D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 02:11:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t042BCkX028215
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Jan 2015 18:11:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 3 Jan 2015 18:11:11 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 10:11:23 +0800
Message-ID: <cover.1420337434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Upgrade util-linux and fix related circular dependencies
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
X-List-Received-Date: Sun, 04 Jan 2015 02:11:14 -0000
Content-Type: text/plain

The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/util-linux-2.25.2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/util-linux-2.25.2

Chen Qi (3):
  util-linux: upgrade to 2.25.2
  systemd: remove util-linux from DEPENDS
  libsm: remove dependency on e2fsprogs

 meta/recipes-core/systemd/systemd_216.bb           |   2 +-
 meta/recipes-core/util-linux/util-linux.inc        |  31 +--
 meta/recipes-core/util-linux/util-linux/MCONFIG    | 223 ---------------------
 meta/recipes-core/util-linux/util-linux/defines.h  |  10 -
 .../util-linux/util-linux/fix-configure.patch      |  20 --
 .../util-linux/util-linux/make_include             |  17 --
 meta/recipes-core/util-linux/util-linux/swapargs.h |   3 -
 ...ensure-the-existence-of-directory-for-PAT.patch |  34 ----
 .../util-linux/util-linux/util-linux-native.patch  |  54 ++---
 .../util-linux-ng-replace-siginterrupt.patch       |  24 ++-
 .../{util-linux_2.24.2.bb => util-linux_2.25.2.bb} |   8 +-
 meta/recipes-graphics/xorg-lib/libsm_1.2.2.bb      |   7 +-
 12 files changed, 60 insertions(+), 373 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/MCONFIG
 delete mode 100644 meta/recipes-core/util-linux/util-linux/defines.h
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix-configure.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/make_include
 delete mode 100644 meta/recipes-core/util-linux/util-linux/swapargs.h
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch
 rename meta/recipes-core/util-linux/{util-linux_2.24.2.bb => util-linux_2.25.2.bb} (76%)

-- 
1.9.1


