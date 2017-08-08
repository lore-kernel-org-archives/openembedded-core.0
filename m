Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6213B719C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 12:22:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 05:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,343,1498546800"; d="scan'208";a="121232674"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2017 05:22:33 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 15:22:32 +0300
Message-Id: <cover.1502193976.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v4 0/8] support profile-optimized build for Python
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
X-List-Received-Date: Tue, 08 Aug 2017 12:22:33 -0000

Fourth attempt on enabling profile-guided-optimization (PGO) for Python.

Changes since v3:
- rebased on latest oe-core (with Python v3.5.3)
- typo in assignment of PYTHON3_PROFILE_TASK_DEFAULT fixed
- task dependencies of python-pgo-image altered to allow do_profile task to be
  run

The following changes since commit a5bb13a5d7d7a668ca61da6b17884e3b05b95355:

  python: don't include -tests with modules (2017-08-03 11:14:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338

Markus Lehtonen (8):
  python3-native: support profile optimized build
  python3: fix depends of python3-tests
  python3: add python3-profile-opt recipe
  devtools/images: add python-pgo-image
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python3: add python3-tools subpackage
  python3: remove two setup.py cross-compile hacks

 meta/recipes-devtools/images/python-pgo-image.bb   | 92 ++++++++++++++++++++++
 .../python/python-3.5-manifest.inc                 | 10 ++-
 .../python/python3-native_3.5.3.bb                 |  9 +++
 meta/recipes-devtools/python/python3-profile-opt   |  1 +
 .../python/python3-profile-opt_3.5.3.bb            | 15 ++++
 .../python3/0001-cross-compile-support.patch       |  9 ---
 ...efile-add-install_generate_profile-target.patch | 25 ++++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch | 56 +++++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    | 33 --------
 .../setup.py-find-libraries-in-staging-dirs.patch  | 30 -------
 meta/recipes-devtools/python/python3_3.5.3.bb      | 58 ++++++++++----
 11 files changed, 246 insertions(+), 92 deletions(-)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 120000 meta/recipes-devtools/python/python3-profile-opt
 create mode 100644 meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.12.3


