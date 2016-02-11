Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 451DB6612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900461975"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:25 +1300
Message-Id: <cover.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/11] Fixes/enhancements for devtool/recipetool/externalsrc
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:13 -0000

Note in particular patch 6/11 which changes the behaviour of devtool
modify without -x to extract by default which is a bit more logical (I'd
been thinking about this for a while, but Khem suggested it most
recently).


The following changes since commit 4bd658f7dae76ae8790fd1dfdd89fa58a456a0a4:

  pseudo: uprev to 1.7.5 (2016-02-10 17:37:36 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool13
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool13

Paul Eggleton (11):
  classes/externalsrc: disable rm_work when active
  classes/externalsrc: create symlinks for workdir and logs
  devtool: commit for extra tasks that modify source when extracting
  recipetool: create: support cmake find_library directive
  recipetool: create: determine name/version from github/bitbucket URLs
  devtool: modify: make -x the default behaviour
  devtool: add: fix adding from a local source directory
  recipetool: create: ensure URL parameters don't make it into the name
  recipetool: create: convert http git URLs that don't end in .git but contain /git/
  recipetool: create: set S when we set SRC_URI from local git repo
  oe-selftest: devtool: add another devtool add test

 meta/classes/externalsrc.bbclass          | 23 +++++++++++
 meta/lib/oe/patch.py                      |  3 ++
 meta/lib/oeqa/selftest/devtool.py         | 40 ++++++++++++++++++-
 scripts/lib/devtool/standard.py           | 64 +++++++++++++++++++++----------
 scripts/lib/recipetool/create.py          | 55 +++++++++++++++++++-------
 scripts/lib/recipetool/create_buildsys.py | 10 +++++
 6 files changed, 161 insertions(+), 34 deletions(-)

-- 
2.5.0


