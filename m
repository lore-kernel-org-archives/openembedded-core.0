Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4284560589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661843"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:05 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:20 +0200
Message-Id: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 00/10] Recipe version updates
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:06 -0000

This patchset contains various version updates and upstream check updates for
recipes with Unknown upstream status. I wanted to handle those before updating
out-of-date recipes where upstream version is known (which I'll be dong next).

The following changes since commit 7e8ff7b9d793b7be106415c3c80b687977217566:

  bitbake: toaster: toasterui Add ParseStarted/ParseProgress events to mask (2015-12-09 09:03:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (10):
  openssl: update to 1.0.2e
  gnutls: update to 3.4.7
  python-setuptools: update to 18.7.1
  nspr: update to 4.11
  mobile-broadband-provider-info: update to current commit
  puzzles: update to current commit
  mirrors: replace references to archive.apache.org
  json-c: add manual upstream version check
  subversion: update to 1.9.2
  slang: update upstream URI to (official) jedsoft.org

 meta/classes/mirrors.bbclass                       |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 .../mobile-broadband-provider-info_git.bb          |    4 +-
 .../{openssl_1.0.2d.bb => openssl_1.0.2e.bb}       |    4 +-
 meta/recipes-devtools/json-c/json-c_0.12.bb        |    3 +
 ...uptools_18.2.bb => python-setuptools_18.7.1.bb} |    5 +-
 ...ptools_18.2.bb => python3-setuptools_18.7.1.bb} |    5 +-
 .../subversion/subversion-1.8.13/libtool2.patch    |   15 -
 .../subversion-CVE-2015-3184.patch                 | 2094 --------------------
 .../subversion-CVE-2015-3187.patch                 |  346 ----
 .../0001-Fix-libtool-name-in-configure.ac.patch    |   29 +
 .../disable_macos.patch                            |    0
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |   14 +-
 .../{subversion_1.8.13.bb => subversion_1.9.2.bb}  |   12 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 .../fix-compiling-failure-with-option-g-O.patch    |    9 -
 meta/recipes-sato/puzzles/puzzles_git.bb           |    6 +-
 meta/recipes-support/gnutls/gnutls.inc             |    3 +-
 ...tch => 0001-configure.ac-fix-sed-command.patch} |   29 +-
 .../gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} |    6 +-
 .../nspr/{nspr_4.10.8.bb => nspr_4.11.bb}          |    9 +-
 21 files changed, 86 insertions(+), 2514 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb} (94%)
 rename meta/recipes-devtools/python/{python-setuptools_18.2.bb => python-setuptools_18.7.1.bb} (84%)
 rename meta/recipes-devtools/python/{python3-setuptools_18.2.bb => python3-setuptools_18.7.1.bb} (91%)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-Fix-libtool-name-in-configure.ac.patch
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/serf.m4-Regex-modified-to-allow-D-in-paths.patch (59%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.13.bb => subversion_1.9.2.bb} (90%)
 rename meta/recipes-support/gnutls/gnutls/{configure.ac-fix-sed-command.patch => 0001-configure.ac-fix-sed-command.patch} (40%)
 rename meta/recipes-support/gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} (42%)
 rename meta/recipes-support/nspr/{nspr_4.10.8.bb => nspr_4.11.bb} (93%)

-- 
2.6.2


