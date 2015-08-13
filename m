Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0509673905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 13:24:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2015 06:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,670,1432623600"; d="scan'208";a="782948561"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 13 Aug 2015 06:24:56 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2015 16:26:31 +0300
Message-Id: <cover.1439471616.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] screen update, take two
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
X-List-Received-Date: Thu, 13 Aug 2015 13:25:04 -0000

I'm resending only the screen patch as the others are in already.

Changes since v1:
* remove the old GPLv2 version

I'm not taking any stance on tmux vs screen debate: we can still
change to tmux. Just wanted to get rid of some very old and
potentially bit rotted code.

Jussi

The following changes since commit a533776d6ff83b6e3e830137455b8382d002768b:

  perf: fix build breakage on kernels after 4.1 (2015-08-12 11:31:49 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/screen
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/screen

Jussi Kukkonen (1):
  screen: Upgrade 4.0.3 -> 4.3.1

 .../screen/screen-4.0.3/configure.patch            | 979 ---------------------
 .../screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch  |  27 -
 .../screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch  |  86 --
 .../Avoid-mis-identifying-systems-as-SVR4.patch    |  57 ++
 ...cross-compile-alternatives-for-AC_TRY_RUN.patch | 137 +++
 .../Remove-redundant-compiler-sanity-checks.patch  |  65 ++
 ...t-file-system-checks-when-cross-compiling.patch | 135 +++
 .../fix-parallel-make.patch                        |   0
 .../screen/{screen-4.0.3 => screen}/screen.pam     |   0
 .../screen/{screen_4.0.3.bb => screen_4.3.1.bb}    |  34 +-
 10 files changed, 408 insertions(+), 1112 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen-4.0.3/configure.patch
 delete mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
 delete mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch
 create mode 100644 meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
 create mode 100644 meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
 create mode 100644 meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
 create mode 100644 meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/fix-parallel-make.patch (100%)
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/screen.pam (100%)
 rename meta/recipes-extended/screen/{screen_4.0.3.bb => screen_4.3.1.bb} (58%)

-- 
2.1.4


