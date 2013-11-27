Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C01286D87D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:08:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2013 09:08:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,783,1378882800"; d="scan'208";a="441131512"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2013 09:08:11 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 8FE4F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:08:09 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 19:08:49 +0200
Message-Id: <cover.1385571298.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Script and layer for running tests
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
X-List-Received-Date: Wed, 27 Nov 2013 17:08:30 -0000


Hello,

This series adds an oe-selftest script, some modules and a new layer meta-selftest.
which are meant to help in writing tests (using python unittest) for various
bitbake tools/scripts as well as simple output checks or do
complete builds with different options (with the emphasis that everything checked
is done outside of bitbake context, just like a human would do.) For more details,
please see YOCTO #4740.

Cheers,
Stefan

Changes since the RFC:
 - more tests added
 - tests are now in meta/lib/oeqa/selftest instead of scripts/lib/selftest/tests
 - small changes to some of the files in the meta-selftest layer
 - more cleanups done by default in the base class


The following changes since commit 32adaac34a614d106e6dd3e9f1130f4e94ff39ae:

  libpng: set reasonable SUMMARY (2013-11-27 11:51:25 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/selftest
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/selftest

Alexandru Palalau (1):
  lib/oeqa/selftest: buildoptions.py: add simple image build tests

Corneliu Stoicescu (2):
  meta-selftest: create a new test layer to be used by oe-selftest
    script
  lib/oeqa/selftest: add test modules for expected bitbake output and
    bitbake-layers

Stefan Stanacar (1):
  scripts/oe-selftest: script to run builds as unittest against bitbake
    or various scripts

 .gitignore                                         |   1 +
 meta-selftest/COPYING.MIT                          |  17 +++
 meta-selftest/README                               |   3 +
 meta-selftest/classes/test_events.bbclass          |  16 +++
 meta-selftest/conf/layer.conf                      |  10 ++
 .../recipes-test/aspell/aspell_0.0.0.1.bb          |  28 ++++
 .../recipes-test/aspell/aspell_0.60.6.1.bbappend   |   2 +
 meta-selftest/recipes-test/m4/m4_1.4.17.bbappend   |   2 +
 .../recipes-test/man/man/man-1.5h1-make.patch      |  16 +++
 meta-selftest/recipes-test/man/man_1.6g.bbappend   |   2 +
 .../xcursor-transparent-theme_0.1.1.bbappend       |   2 +
 meta/lib/oeqa/selftest/__init__.py                 |   2 +
 meta/lib/oeqa/selftest/base.py                     |  98 ++++++++++++++
 meta/lib/oeqa/selftest/bblayers.py                 |  37 ++++++
 meta/lib/oeqa/selftest/bbtests.py                  |  97 ++++++++++++++
 meta/lib/oeqa/selftest/buildoptions.py             |  86 ++++++++++++
 meta/lib/oeqa/utils/commands.py                    | 137 +++++++++++++++++++
 meta/lib/oeqa/utils/ftools.py                      |  27 ++++
 scripts/oe-selftest                                | 148 +++++++++++++++++++++
 19 files changed, 731 insertions(+)
 create mode 100644 meta-selftest/COPYING.MIT
 create mode 100644 meta-selftest/README
 create mode 100644 meta-selftest/classes/test_events.bbclass
 create mode 100644 meta-selftest/conf/layer.conf
 create mode 100644 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
 create mode 100644 meta-selftest/recipes-test/aspell/aspell_0.60.6.1.bbappend
 create mode 100644 meta-selftest/recipes-test/m4/m4_1.4.17.bbappend
 create mode 100644 meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
 create mode 100644 meta-selftest/recipes-test/man/man_1.6g.bbappend
 create mode 100644 meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend
 create mode 100644 meta/lib/oeqa/selftest/__init__.py
 create mode 100644 meta/lib/oeqa/selftest/base.py
 create mode 100644 meta/lib/oeqa/selftest/bblayers.py
 create mode 100644 meta/lib/oeqa/selftest/bbtests.py
 create mode 100644 meta/lib/oeqa/selftest/buildoptions.py
 create mode 100644 meta/lib/oeqa/utils/commands.py
 create mode 100644 meta/lib/oeqa/utils/ftools.py
 create mode 100755 scripts/oe-selftest

-- 
1.8.3.1


