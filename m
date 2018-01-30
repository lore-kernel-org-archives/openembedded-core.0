Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1FD78834
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 13:37:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jan 2018 05:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,435,1511856000"; d="scan'208";a="14561874"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga006.jf.intel.com with ESMTP; 30 Jan 2018 05:37:27 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 15:37:27 +0200
Message-Id: <cover.1517310748.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH v10 00/14] support profile-optimized build for Python
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
X-List-Received-Date: Tue, 30 Jan 2018 13:37:27 -0000

Rebased on latest master. No other changes since v9.


The following changes since commit 1c896b34d2d9fdf941941bd29257a4714795da5a:

  testimage: enable gi test suite (2018-01-29 08:49:52 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338

Markus Lehtonen (14):
  python3-native: support profile optimized build
  python3: fix depends of python3-tests
  python3: add python3-profile-opt recipe
  python3-profile-opt: rename libpython3
  openssh: extend to -native
  iptables: enable native
  iproute2: enable native
  oeqa/targetcontrol: re-introduce get_target_controller()
  oeqa/targetcontrol: add missing arg to SimpleRemoteTarget.__init__
  devtools/images: add python-pgo-image
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python3: add python3-tools subpackage
  oeqa: add selftest for python pgo

 meta/lib/oeqa/selftest/cases/python.py             |  28 ++++++
 meta/lib/oeqa/targetcontrol.py                     |  29 +++++-
 meta/recipes-connectivity/iproute2/iproute2.inc    |   7 +-
 ...1-don-t-use-absolute-path-for-ssh-program.patch |  31 ++++++
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb |   8 +-
 meta/recipes-devtools/images/python-pgo-image.bb   |  92 ++++++++++++++++++
 .../python/python3-native_3.5.3.bb                 |   9 ++
 meta/recipes-devtools/python/python3-profile-opt   |   1 +
 .../python/python3-profile-opt_3.5.3.bb            |  10 ++
 .../python3/0001-cross-compile-support.patch       |   9 --
 ...efile-add-install_generate_profile-target.patch |  25 +++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch |  56 +++++++++++
 .../python/python3/python3-manifest.json           |  14 ++-
 ...name-libpython3-to-libpython-profile-opt3.patch | 108 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  56 ++++++++---
 ...revent-absolute-path-in-installed-symlink.patch |  29 ++++++
 meta/recipes-extended/iptables/iptables_1.6.1.bb   |   3 +
 17 files changed, 487 insertions(+), 28 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/python.py
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-don-t-use-absolute-path-for-ssh-program.patch
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 120000 meta/recipes-devtools/python/python3-profile-opt
 create mode 100644 meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/prevent-absolute-path-in-installed-symlink.patch

-- 
2.13.6


