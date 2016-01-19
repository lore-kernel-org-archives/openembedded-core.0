Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C33886FFEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2016 13:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="730623073"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2016 13:55:38 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:26 +0000
Message-Id: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/9] Several upgrades
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:40 -0000

The following changes since commit a2f23fa62858b89850aab339ddec16dcf6026b37:

  openssh: CVE-2016-1907 (2016-01-18 11:47:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/upgrades

Alejandro Hernandez (9):
  python3-setuptools: upgrade to 19.2
  python-setuptools: Upgrade to 19.2
  python-mako: upgrade to 1.0.3
  python-pycurl: upgrade to 7.21.5
  python-nose: upgrade to 1.3.7
  python-scons: upgrade to 2.4.1
  python-numpy: upgrade to 1.10.4
  swig: upgrade to 3.0.8
  python3: Minor upgrade 3.5.0 -> 3.5.1

 .../python/python-2.7-manifest.inc                 | 12 ++++++---
 .../{python-mako_1.0.1.bb => python-mako_1.0.3.bb} |  4 +--
 .../{python-nose_1.3.6.bb => python-nose_1.3.7.bb} |  8 ++++--
 ...thon-numpy_1.10.1.bb => python-numpy_1.10.4.bb} |  6 +++--
 ...-pycurl_7.19.5.2.bb => python-pycurl_7.21.5.bb} |  8 +++---
 ...ative_2.3.6.bb => python-scons-native_2.4.1.bb} |  0
 ...python-scons_2.3.6.bb => python-scons_2.4.1.bb} |  9 +++++--
 ...uptools_18.7.1.bb => python-setuptools_19.2.bb} | 12 +++++++--
 ...on3-native_3.5.0.bb => python3-native_3.5.1.bb} |  4 +--
 ...ptools_18.7.1.bb => python3-setuptools_19.2.bb} |  4 +--
 .../python/python3/000-cross-compile.patch         | 30 +++++++++++-----------
 .../python/{python3_3.5.0.bb => python3_3.5.1.bb}  |  4 +--
 .../swig/{swig_3.0.6.bb => swig_3.0.8.bb}          |  4 +--
 scripts/contrib/python/generate-manifest-2.7.py    |  3 +++
 14 files changed, 67 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/python/{python-mako_1.0.1.bb => python-mako_1.0.3.bb} (80%)
 rename meta/recipes-devtools/python/{python-nose_1.3.6.bb => python-nose_1.3.7.bb} (75%)
 rename meta/recipes-devtools/python/{python-numpy_1.10.1.bb => python-numpy_1.10.4.bb} (92%)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.2.bb => python-pycurl_7.21.5.bb} (77%)
 rename meta/recipes-devtools/python/{python-scons-native_2.3.6.bb => python-scons-native_2.4.1.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.3.6.bb => python-scons_2.4.1.bb} (69%)
 rename meta/recipes-devtools/python/{python-setuptools_18.7.1.bb => python-setuptools_19.2.bb} (79%)
 rename meta/recipes-devtools/python/{python3-native_3.5.0.bb => python3-native_3.5.1.bb} (94%)
 rename meta/recipes-devtools/python/{python3-setuptools_18.7.1.bb => python3-setuptools_19.2.bb} (91%)
 rename meta/recipes-devtools/python/{python3_3.5.0.bb => python3_3.5.1.bb} (98%)
 rename meta/recipes-devtools/swig/{swig_3.0.6.bb => swig_3.0.8.bb} (58%)

-- 
1.8.4.5


