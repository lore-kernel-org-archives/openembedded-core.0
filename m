Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 186AA6E374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:18:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2014 08:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,695,1389772800"; d="scan'208";a="502841074"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2014 08:15:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 15:15:08 +0000
Message-Id: <cover.1395328478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/3] Misc bugfixes
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
X-List-Received-Date: Thu, 20 Mar 2014 15:18:10 -0000

The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:

  alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes5

Paul Eggleton (3):
  classes/kernel: move module postinst commands to kernel-base
  python: add python-mmap to python-multiprocessing RDEPENDS
  x264: add perlnative to inherit

 meta/classes/kernel.bbclass                          | 7 +++++--
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 meta/recipes-multimedia/x264/x264_git.bb             | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

-- 
1.8.5.3


