Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 614D7736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 07:01:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Nov 2015 23:01:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,274,1444719600"; d="scan'208";a="833905810"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2015 23:01:48 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 06:57:29 +0000
Message-Id: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/1] python3: Upgrade from 3.4.3 to 3.5
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
X-List-Received-Date: Wed, 11 Nov 2015 07:01:51 -0000

Upgrades from python 3.4.3 to python 3.5, rebases some patches, 
modifies the related classes accordingly and also fixes
an issue with python3-pip

The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/py35upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/py35upgrade

Alejandro Hernandez (1):
  python3: Upgrade from 3.4.3 to 3.5

 meta/classes/distutils3-base.bbclass               |   2 +-
 meta/classes/distutils3-native-base.bbclass        |   2 +-
 meta/classes/python3native.bbclass                 |   2 +-
 ...on-3.4-manifest.inc => python-3.5-manifest.inc} | 126 +++++++++----------
 ...on3-native_3.4.3.bb => python3-native_3.5.0.bb} |   7 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  |   8 +-
 .../python/python3/000-cross-compile.patch         |  36 +++---
 .../python3/020-dont-compile-python-files.patch    |  19 ++-
 .../python/python3/04-default-is-optimized.patch   |  38 +++---
 .../recipes-devtools/python/python3/makerace.patch |  28 -----
 .../python/python3/python-3.3-multilib.patch       | 140 +++++++++------------
 .../python/{python3_3.4.3.bb => python3_3.5.0.bb}  |   7 +-
 ...te-manifest-3.4.py => generate-manifest-3.5.py} |   2 +-
 13 files changed, 190 insertions(+), 227 deletions(-)
 rename meta/recipes-devtools/python/{python-3.4-manifest.inc => python-3.5-manifest.inc} (51%)
 rename meta/recipes-devtools/python/{python3-native_3.4.3.bb => python3-native_3.5.0.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 rename meta/recipes-devtools/python/{python3_3.4.3.bb => python3_3.5.0.bb} (97%)
 rename scripts/contrib/python/{generate-manifest-3.4.py => generate-manifest-3.5.py} (99%)

-- 
1.8.4.5


