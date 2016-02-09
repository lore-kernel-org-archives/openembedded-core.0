Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D142970101
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 15:22:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 09 Feb 2016 07:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,421,1449561600"; d="scan'208";a="649581216"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Feb 2016 07:22:07 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	rongqing.li@windriver.com
Date: Tue,  9 Feb 2016 17:27:10 +0200
Message-Id: <cover.1455031114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Openssh test fixes
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
X-List-Received-Date: Tue, 09 Feb 2016 15:22:09 -0000

The following changes since commit 7d5d8d0cd985edf507c8d00e2e162d1b9fff3589:

  scripts/lib/bsp/engine: trailing whitespace cleanup (2016-02-08 10:54:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/openssh-tests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/openssh-tests

Jussi Kukkonen (2):
  openssh: Fix regex that sets sftp-server path for tests
  openssh: Properly skip ptrace test if tools are missing

 meta/recipes-connectivity/openssh/openssh/run-ptest | 6 +++---
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.1.4


