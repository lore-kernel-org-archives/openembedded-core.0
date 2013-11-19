Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 547D261957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 15:42:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2013 07:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,729,1378882800"; d="scan'208";a="430301083"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2013 07:43:00 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id B798E6A4009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 07:42:58 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:43:33 +0200
Message-Id: <cover.1384874570.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [RFC PATCH 0/4] Script and layer for running tests
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
X-List-Received-Date: Tue, 19 Nov 2013 15:42:59 -0000


Hello,

This series adds an oe-selftest script, some modules and a new layer meta-selftest.
which are meant to help in writing tests (using python unittest) for various
bitbake tools/scripts as well as simple output checks or do 
complete builds with different options (with the emphasis that everything checked
is done outside of bitbake context, just like a human would do.) For more details,
please see YOCTO #4740.

Cheers,
Stefan


The following changes since commit e15893adf9268b2920b24c52d5c2bb777c6f778e:

  bitbake: serv.py: Give pr-server up to 5 seconds to commit data (2013-11-18 17:19:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/testme4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/testme4

Alexandru Palalau (1):
  scripts/lib/selftest: add more simple build tests

Corneliu Stoicescu (2):
  meta-selftest: create a new test layer to be used by oe-selftest
    script
  scripts/lib/selftest: add a new module for bitbake output tests

Stefan Stanacar (1):
  scripts/oe-selftest: script to run builds as unitests against bitbake
    or various scripts

 .gitignore                                         |   1 +
 meta-selftest/COPYING.MIT                          |  17 +++
 meta-selftest/README                               |   2 +
 meta-selftest/classes/test_events.bbclass          |  16 +++
 meta-selftest/conf/layer.conf                      |  10 ++
 .../recipes-test/aspell/aspell_0.0.0.1.bb          |  28 ++++
 .../recipes-test/man/man/man-1.5h1-make.patch      |  16 +++
 meta-selftest/recipes-test/man/man_1.6g.bbappend   |   2 +
 .../xcursor-transparent-theme_0.1.1.bbappend       |   3 +
 scripts/lib/selftest/__init__.py                   |   0
 scripts/lib/selftest/base.py                       |  54 ++++++++
 scripts/lib/selftest/tests/__init__.py             |   2 +
 scripts/lib/selftest/tests/bboptions.py            |  39 ++++++
 scripts/lib/selftest/tests/bboutput.py             |  86 ++++++++++++
 scripts/lib/selftest/utils/__init__.py             |   0
 scripts/lib/selftest/utils/commands.py             | 146 +++++++++++++++++++++
 scripts/lib/selftest/utils/ftools.py               |  27 ++++
 scripts/oe-selftest                                | 130 ++++++++++++++++++
 18 files changed, 579 insertions(+)
 create mode 100644 meta-selftest/COPYING.MIT
 create mode 100644 meta-selftest/README
 create mode 100644 meta-selftest/classes/test_events.bbclass
 create mode 100644 meta-selftest/conf/layer.conf
 create mode 100644 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
 create mode 100644 meta-selftest/recipes-test/man/man/man-1.5h1-make.patch
 create mode 100644 meta-selftest/recipes-test/man/man_1.6g.bbappend
 create mode 100644 meta-selftest/recipes-test/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bbappend
 create mode 100644 scripts/lib/selftest/__init__.py
 create mode 100644 scripts/lib/selftest/base.py
 create mode 100644 scripts/lib/selftest/tests/__init__.py
 create mode 100644 scripts/lib/selftest/tests/bboptions.py
 create mode 100644 scripts/lib/selftest/tests/bboutput.py
 create mode 100644 scripts/lib/selftest/utils/__init__.py
 create mode 100644 scripts/lib/selftest/utils/commands.py
 create mode 100644 scripts/lib/selftest/utils/ftools.py
 create mode 100755 scripts/oe-selftest

-- 
1.8.3.1


