Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 201C46FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 10:03:45 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 03:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="137214637"
Received: from peggleto-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.43.222])
	by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2017 03:03:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 12:03:42 +0200
Message-Id: <cover.1502100124.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/2] A couple of fixes related to the server rework
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
X-List-Received-Date: Mon, 07 Aug 2017 10:03:46 -0000

A couple of fixes for issues I've noticed when working with the newly
reworked server code in bitbake. 

Note: patch 2/2 also requires the revert I just sent to bitbake-devel
in order to fully resolve the issue.


The following changes since commit a5bb13a5d7d7a668ca61da6b17884e3b05b95355:

  python: don't include -tests with modules (2017-08-03 11:14:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/server-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/server-fixes

Paul Eggleton (2):
  bitbake.conf: whitelist BB_SERVER_TIMEOUT from config hash
  devtool: fix handling of errors during task execution

 meta/conf/bitbake.conf          |  2 +-
 scripts/lib/devtool/standard.py | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.9.4


