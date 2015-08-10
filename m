Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91EE47685E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:06:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2015 05:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="781156018"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2015 05:06:32 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 15:07:05 +0300
Message-Id: <cover.1439204506.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] More recipe version upgrades
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
X-List-Received-Date: Mon, 10 Aug 2015 12:06:32 -0000

The screen upgrade is worth a good look: First of all the new GPLv3
version required quite a bit of build system patching. Also as far
as I can tell the existing recipe contains a debian patch which itself
contains 40 patches that are never applied to the actual sources.
My patch removes this unnecessary download and does not try to apply
the 40 patches (with the logic that 19000 lines of patch should be
done in separate commits _if_ they are necessary): the functionality
of screen 4.0.3 should not change with this commit.

Suggestions for other solutions are welcome as well.


Cheers,
 Jussi

The following changes since commit a8b723498c9a7106210db140452886894494b4d6:

  bitbake: cooker: Resolve file monitoring race issues when using memres bitbake (2015-08-03 07:36:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/more-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/more-upgrades

Jussi Kukkonen (5):
  texinfo: Upgrade 5.2 -> 6.0
  screen: Add version 4.3.1
  resolvconf: Upgrade 1.76 -> 1.77
  qmmp: Upgrade 0.8.5 -> 0.8.6
  libepoxy: Upgrade 1.2 -> 1.3.1

 .../{resolvconf_1.76.bb => resolvconf_1.77.bb}     |   6 +-
 meta/recipes-extended/screen/screen.inc            |  39 ++++++
 .../Avoid-mis-identifying-systems-as-SVR4.patch    |  57 ++++++++
 ...cross-compile-alternatives-for-AC_TRY_RUN.patch | 137 ++++++++++++++++++
 .../Remove-redundant-compiler-sanity-checks.patch  |  65 +++++++++
 ...t-file-system-checks-when-cross-compiling.patch | 135 ++++++++++++++++++
 .../fix-parallel-make.patch                        |   0
 .../screen/{screen-4.0.3 => screen}/screen.pam     |   0
 meta/recipes-extended/screen/screen_4.0.3.bb       |  55 +-------
 meta/recipes-extended/screen/screen_4.3.1.bb       |  13 ++
 .../texinfo/texinfo/dont-depend-on-help2man.patch  |  47 ++++---
 .../texinfo/texinfo/texinfo-4.12-zlib.patch        | 156 +++++++++++++--------
 .../texinfo/texinfo/texinfo-4.13a-powerpc.patch    |  14 --
 .../texinfo/{texinfo_5.2.bb => texinfo_6.0.bb}     |   5 +-
 meta/recipes-graphics/libepoxy/libepoxy_git.bb     |   4 +-
 .../qt-apps/{qmmp_0.8.5.bb => qmmp_0.8.6.bb}       |   7 +-
 16 files changed, 595 insertions(+), 145 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb} (89%)
 create mode 100644 meta/recipes-extended/screen/screen.inc
 create mode 100644 meta/recipes-extended/screen/screen/Avoid-mis-identifying-systems-as-SVR4.patch
 create mode 100644 meta/recipes-extended/screen/screen/Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch
 create mode 100644 meta/recipes-extended/screen/screen/Remove-redundant-compiler-sanity-checks.patch
 create mode 100644 meta/recipes-extended/screen/screen/Skip-host-file-system-checks-when-cross-compiling.patch
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/fix-parallel-make.patch (100%)
 rename meta/recipes-extended/screen/{screen-4.0.3 => screen}/screen.pam (100%)
 create mode 100644 meta/recipes-extended/screen/screen_4.3.1.bb
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/texinfo-4.13a-powerpc.patch
 rename meta/recipes-extended/texinfo/{texinfo_5.2.bb => texinfo_6.0.bb} (93%)
 rename meta/recipes-qt/qt-apps/{qmmp_0.8.5.bb => qmmp_0.8.6.bb} (93%)

-- 
2.1.4


