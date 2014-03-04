Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 75E036EA1C
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 23:33:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2014 15:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,589,1389772800"; d="scan'208";a="494133818"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 04 Mar 2014 15:33:05 -0800
From: nitin.a.kamble@intel.com
To: pb@pbcl.net, saul.wold@intel.com, Openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 15:28:32 -0800
Message-Id: <cover.1393975557.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [Patch v2 0/1] A fix for QA_check
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
X-List-Received-Date: Tue, 04 Mar 2014 23:33:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This v2 fix is improved as per feedback from Phil Blundell <pb@pbcl.net>

Thanks,
Nitin

The following changes since commit 83b3e3e8e34a2512bcb1fe298715ece58c83dca3:

  package_manager.py: RpmPM: don't add smart channel if already added (2014-03-03 15:05:32 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/fix1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/fix1

Nitin A Kamble (1):
  QA_check: special case kernel modules for x32 targets

 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.1.4


