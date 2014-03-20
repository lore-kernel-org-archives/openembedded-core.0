Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 267C96F8EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:20:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="504026374"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2014 12:19:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:19:37 +0000
Message-Id: <cover.1395343129.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH v2 0/2] Misc bugfixes
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
X-List-Received-Date: Thu, 20 Mar 2014 19:20:05 -0000

Since v1, drop the python fix; this will be fixed and sent out in another
series.


The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:

  alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes5

Paul Eggleton (2):
  classes/kernel: move module postinst commands to kernel-base
  x264: add perlnative to inherit

 meta/classes/kernel.bbclass              | 7 +++++--
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.5.3


