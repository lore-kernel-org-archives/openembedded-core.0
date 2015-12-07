Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2F760670
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 21:25:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Dec 2015 13:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,396,1444719600"; d="scan'208";a="836260667"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.171])
	by orsmga001.jf.intel.com with ESMTP; 07 Dec 2015 13:25:34 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 15:26:29 -0600
Message-Id: <cover.1449523356.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com, bjst@enea.com,
	benjamin.esquivel@intel.com
Subject: [PATCH 0/2] ptest-runner
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
X-List-Received-Date: Mon, 07 Dec 2015 21:25:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These two commits adds a new ptest-runner written in python the sh one is conserved
to use in tiny systems.

What's new in ptest runner:

	- Monitor/timeout stdout, stderr of the test suite to avoid block indefinetly.
	- Add option for change ptest root directory.
	- Add option for list available tests.
	- Add option for only run certain tests.

The following changes since commit d9bc1f4b9a8aff859c59dbf9bbdd6b16e99381b2:

  classes/sstate.bbclass: checkhashes modify to take into account siginfo. (2015-12-02 10:55:25 -0600)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/ptest-runner
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/ptest-runner

Aníbal Limón (2):
  ptest-runner: Add version 2.0 re-implementation in python.
  ptest-runner: Add a recipe for install ptest-runner 2.0.

 .../ptest-runner/files/ptest-runner_2.0.py         | 144 +++++++++++++++++++++
 .../ptest-runner/ptest-runner_2.0.bb               |  28 ++++
 2 files changed, 172 insertions(+)
 create mode 100755 meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

-- 
2.1.4


