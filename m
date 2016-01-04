Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 512D0731BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:27:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2016 10:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,521,1444719600"; d="scan'208";a="874414276"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2016 10:27:42 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 12:29:14 -0600
Message-Id: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com,
	poky@yoctoproject.org, benjamin.esquivel@intel.com
Subject: [PATCH v3 0/3] ptest-runner 2.0
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
X-List-Received-Date: Mon, 04 Jan 2016 18:27:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The whole set is sent to two ML for reviewing purposes the first two patches are for
oe-core and the last one for poky.

The first two commits (oe-core) adds a new ptest-runner written in python the sh one is conserved
to use in tiny systems.

What's new in ptest runner:

	- Monitor/timeout stdout, stderr of the test suite to avoid block indefinetly.
	- Add option for change ptest root directory.
	- Add option for list available tests.
	- Add option for only run certain tests.

The last commit (meta-yocto) sets ptest-runner to 1.0 in poky-tiny systems due to python dependency.

The changes are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/ptest-runner
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner

Aníbal Limón (3):
  ptest-runner: Add version 2.0 re-implementation in python.
  ptest-runner: Add a recipe for install ptest-runner 2.0.
  conf/distro/poky-tiny.conf: Add default install of ptest-runner 1.0

 meta-yocto/conf/distro/poky-tiny.conf              |   4 +
 .../ptest-runner/files/ptest-runner_2.0.py         | 162 +++++++++++++++++++++
 .../ptest-runner/ptest-runner_2.0.bb               |  27 ++++
 3 files changed, 193 insertions(+)
 create mode 100755 meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

-- 
2.1.4


