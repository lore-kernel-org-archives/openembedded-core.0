Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D725E773BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 03:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="820115322"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Jun 2016 03:13:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id ACB5A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:00:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:46 +0300
Message-Id: <cover.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/16] porting scripts to python3
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:12 -0000

Hi,

Please review set of python3 fixes for oe scripts.

As most of the scripts are not covered by tests it was quite hard
to test them. I tested only those which I know how to work with.
It would be greate to have any help with testing.

The following changes since commit dcbfc72303d6782d9108538c830cf2ee7849bf59:

  poky: Add Ubuntu 16.04 to tested/supported list since I run it myself (2016-06-02 10:37:05 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/oe/python3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/oe/python3

Ed Bartosh (16):
  scripts: python3: convert iterables to lists
  scripts: python3: use new style except statement
  scripts: python3: rename raw_input to input
  scripts: python3: fix urllib imports
  ksize.py: python3: get rid of strings.join
  scripts: python3: get rid of __future__ imports
  scripts: python3: use new metaclass syntax
  combo-layer: python3: import reduce
  engine.py: python3: rename sys.maxint to sys.maxsize
  scripts: python3: use explicit relative imports
  scripts: python3: replace exec statement with builtin
  engine: python3: replace iteritems() -> items()
  dirsize: python3: fix TypeError: unorderable types
  scripts: python3: decode subprocess output
  combo-layer: python3: use tempfile.TemporaryFile
  scripts: python3: change python to python3 in shebang

 scripts/bitbake-whatchanged                      |  9 +++----
 scripts/buildhistory-collect-srcrevs             |  2 +-
 scripts/cleanup-workdir                          |  4 +--
 scripts/combo-layer                              | 15 ++++++-----
 scripts/contrib/bbvars.py                        | 16 +++++------
 scripts/contrib/devtool-stress.py                |  2 +-
 scripts/contrib/list-packageconfig-flags.py      |  2 +-
 scripts/contrib/verify-homepage.py               |  6 ++---
 scripts/cp-noerror                               | 10 +++----
 scripts/gen-lockedsig-cache                      |  2 +-
 scripts/lib/bsp/engine.py                        | 34 +++++++++++-------------
 scripts/lib/bsp/kernel.py                        | 25 +++++++++--------
 scripts/lib/devtool/__init__.py                  |  2 +-
 scripts/lib/devtool/build.py                     |  2 +-
 scripts/lib/devtool/standard.py                  |  4 +--
 scripts/lib/recipetool/create_buildsys.py        |  2 +-
 scripts/lib/recipetool/create_buildsys_python.py |  6 ++---
 scripts/oe-pkgdata-util                          |  2 +-
 scripts/oe-publish-sdk                           |  2 +-
 scripts/oe-selftest                              |  2 +-
 scripts/oe-trim-schemas                          |  2 +-
 scripts/oepydevshell-internal.py                 |  4 +--
 scripts/opkg-query-helper.py                     |  2 +-
 scripts/pybootchartgui/pybootchartgui/main.py.in |  2 --
 scripts/pybootchartgui/pybootchartgui/parsing.py |  3 ---
 scripts/pythondeps                               |  2 +-
 scripts/relocate_sdk.py                          |  2 +-
 scripts/send-error-report                        | 22 +++++++--------
 scripts/swabber-strace-attach                    |  2 +-
 scripts/sysroot-relativelinks.py                 |  2 +-
 scripts/test-remote-image                        | 10 +++----
 scripts/tiny/dirsize.py                          | 16 +++++------
 scripts/tiny/ksize.py                            |  8 +++---
 scripts/wic                                      |  2 --
 scripts/yocto-bsp                                |  2 +-
 scripts/yocto-kernel                             |  2 +-
 scripts/yocto-layer                              |  2 +-
 37 files changed, 107 insertions(+), 127 deletions(-)

--
Regards,
Ed

