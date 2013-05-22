Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 077E660420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405589"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:18 -0700
Message-Id: <cover.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/7] Package Updates
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
X-List-Received-Date: Wed, 22 May 2013 00:40:38 -0000

Updates for Milestone 1


Sau!

The following changes since commit f45aa6e07318f22ede4614b28ea15cd48f5e4095:

  packagegroup-core-clutter: use clutter-1.0 packages (2013-05-21 09:14:38 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (7):
  gnupg: Update to 2.0.20
  desktop-file-utils: Update to 0.21
  mklibs: Update to 0.1.37
  libnl: Update to 3.2.22
  mc: Update to 4.8.8
  resolvconf: Update to 1.72
  cmake: Update to 2.8.11

 .../{resolvconf_1.71.bb => resolvconf_1.72.bb}     |  4 +-
 .../cmake/cmake-native_2.8.10.2.bb                 |  7 ---
 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb |  5 ++
 meta/recipes-devtools/cmake/cmake.inc              |  2 -
 .../cmake/cmake/support-oe-qt4-tools-names.patch   | 70 +++++-----------------
 .../cmake/{cmake_2.8.10.2.bb => cmake_2.8.11.bb}   |  6 +-
 ...e_0.15.bb => desktop-file-utils-native_0.21.bb} | 10 ++--
 ...bs-native_0.1.35.bb => mklibs-native_0.1.37.bb} |  4 +-
 .../mc/{mc_4.8.7.bb => mc_4.8.8.bb}                |  6 +-
 .../gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch  | 63 -------------------
 .../gnupg/{gnupg_2.0.19.bb => gnupg_2.0.20.bb}     |  8 +--
 .../libnl/{libnl_3.2.21.bb => libnl_3.2.22.bb}     |  5 +-
 12 files changed, 37 insertions(+), 153 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.71.bb => resolvconf_1.72.bb} (88%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.10.2.bb => cmake_2.8.11.bb} (86%)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.15.bb => desktop-file-utils-native_0.21.bb} (57%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.35.bb => mklibs-native_0.1.37.bb} (80%)
 rename meta/recipes-extended/mc/{mc_4.8.7.bb => mc_4.8.8.bb} (81%)
 delete mode 100644 meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch
 rename meta/recipes-support/gnupg/{gnupg_2.0.19.bb => gnupg_2.0.20.bb} (80%)
 rename meta/recipes-support/libnl/{libnl_3.2.21.bb => libnl_3.2.22.bb} (90%)

-- 
1.8.1.4


