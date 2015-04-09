Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB0173C48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 20:41:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2015 13:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,552,1422950400"; d="scan'208";a="479061446"
Received: from carloses-mobl.amr.corp.intel.com (HELO
	aehernan-DevStation.lar.corp.intel.com) ([10.252.254.35])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2015 13:41:34 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:41:35 -0500
Message-Id: <cover.1428611618.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] python3: Upgrade from 3.3.3 to 3.4.2 rebase
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
X-List-Received-Date: Thu, 09 Apr 2015 20:41:40 -0000


Rebased the previous submitted patch to upgrade Python from 3.3.3 to 3.4.2



The following changes since commit 7fb6a6e907e5803597b2e12ba7047c46e57dba26:

  upstream_tracking.inc: Add no-update reason for gdk-pixbuf (2015-04-09 10:01:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/py3upRebasedApril
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/py3upRebasedApril

Alejandro Hernandez (1):
  python3: Upgrade from 3.3.3 to 3.4.2

 ...on-3.3-manifest.inc => python-3.4-manifest.inc} | 126 +++++++--------
 ...on3-native_3.3.3.bb => python3-native_3.4.2.bb} |  17 +-
 .../python/python3/04-default-is-optimized.patch   |  39 ++---
 ...2-distutils-prefix-is-inside-staging-area.patch |  29 ++--
 .../python3/avoid-ncursesw-include-path.patch      |  30 ++--
 .../python/python3/python-3.3-multilib.patch       | 180 +++++++++++----------
 .../python/{python3_3.3.3.bb => python3_3.4.2.bb}  |  21 ++-
 ...te-manifest-3.3.py => generate-manifest-3.4.py} |   8 +-
 8 files changed, 222 insertions(+), 228 deletions(-)
 rename meta/recipes-devtools/python/{python-3.3-manifest.inc => python-3.4-manifest.inc} (50%)
 rename meta/recipes-devtools/python/{python3-native_3.3.3.bb => python3-native_3.4.2.bb} (80%)
 rename meta/recipes-devtools/python/{python3_3.3.3.bb => python3_3.4.2.bb} (93%)
 rename scripts/contrib/python/{generate-manifest-3.3.py => generate-manifest-3.4.py} (98%)

-- 
1.9.1


