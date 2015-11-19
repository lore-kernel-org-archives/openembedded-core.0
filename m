Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 983BE6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 18:00:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 10:00:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,318,1444719600"; d="scan'208";a="824292629"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 19 Nov 2015 10:00:53 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:56:16 +0000
Message-Id: <cover.1447955485.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH v2 0/1] python3: Upgrade from 3.4.3 to 3.5
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
X-List-Received-Date: Thu, 19 Nov 2015 18:00:56 -0000

Upgrades from python 3.4.3 to python 3.5, rebases some patches, 
modifies the related classes accordingly and also fixes
an issue with python3-pip, and importlib when cross-compiling

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
 .../python/python3/use_packed_importlib.patch      |  31 +++++
 .../python/{python3_3.4.3.bb => python3_3.5.0.bb}  |   8 +-
 ...te-manifest-3.4.py => generate-manifest-3.5.py} |   2 +-
 14 files changed, 222 insertions(+), 227 deletions(-)
 rename meta/recipes-devtools/python/{python-3.4-manifest.inc => python-3.5-manifest.inc} (51%)
 rename meta/recipes-devtools/python/{python3-native_3.4.3.bb => python3-native_3.5.0.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 create mode 100644 meta/recipes-devtools/python/python3/use_packed_importlib.patch
 rename meta/recipes-devtools/python/{python3_3.4.3.bb => python3_3.5.0.bb} (97%)
 rename scripts/contrib/python/{generate-manifest-3.4.py => generate-manifest-3.5.py} (99%)

-- 
1.8.4.5


