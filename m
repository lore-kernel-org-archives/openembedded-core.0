Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QmOj9-0005Zk-66
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 13:26:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jul 2011 04:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="33256543"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2011 04:21:49 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 19:24:00 +0800
Message-Id: <cover.1311851957.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fix bug #1299 for meta-environment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2011 11:26:07 -0000

Using recipe-scope variable REAL_MULTIMACH_TARGET_SYS instead of the unavailable
OLD_MULTIMACH_TARGET_SYS to generate meta-environment files for ADT installer.

The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
  Bruce Ashfield (1):
        poky.conf: explicitly referenced preferred linux-yocto version

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/bug1299
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/bug1299

Lianhao Lu (1):
  meta-environment: set correct *MULTIMACH_TARGET_SYS.

 meta/classes/toolchain-scripts.bbclass     |    7 ++++---
 meta/recipes-core/meta/meta-environment.bb |    9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)



