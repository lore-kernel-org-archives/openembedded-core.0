Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3D1F6EEF5
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 18:32:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2014 10:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,586,1389772800"; d="scan'208";a="485984409"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2014 10:32:24 -0800
From: nitin.a.kamble@intel.com
To: saul.wold@intel.com,
	Openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 10:27:54 -0800
Message-Id: <cover.1393957379.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A QA_check fix for x32 kernel module packages
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
X-List-Received-Date: Tue, 04 Mar 2014 18:32:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


The kernel modules for x32 target are 64bit, but the QA_check was expecting
them to be 32bit. The QA_check is fixed in this commit to avoid false errors.

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
 meta/classes/module.bbclass | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.8.1.4


