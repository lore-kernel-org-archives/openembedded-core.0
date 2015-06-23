Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBD260557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:48:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2015 09:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,666,1427785200"; d="scan'208";a="593327623"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2015 09:48:01 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 11:49:52 -0500
Message-Id: <cover.1435078109.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] oe/utils.py: ThreadPool fixes and improvements
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
X-List-Received-Date: Tue, 23 Jun 2015 16:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6f4304e36df7e416643dd4a7ee3de096f21f1020:

  bitbake: runqueue: Sanity check BB_NUMBER_THREADS (2015-06-23 11:57:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oe-utils
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oe-utils

Aníbal Limón (2):
  oe/utils.py: Fix thread leakage in ThreadPool
  oe/utils.py: Add support for init/end helper functions in
    ThreadWorker.

 meta/classes/sstate.bbclass |  5 +++--
 meta/lib/oe/utils.py        | 39 +++++++++++++++++++++++++++++++--------
 2 files changed, 34 insertions(+), 10 deletions(-)

-- 
1.9.1


