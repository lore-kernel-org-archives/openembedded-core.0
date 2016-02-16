Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 75608731A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 20:08:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Feb 2016 12:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,456,1449561600"; d="scan'208";a="886325544"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.53])
	by orsmga001.jf.intel.com with ESMTP; 16 Feb 2016 12:08:33 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 14:05:28 -0600
Message-Id: <1455653130-4388-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Coverage filering and configuration file for sub-process in $HOME
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
X-List-Received-Date: Tue, 16 Feb 2016 20:08:40 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Enables filtering to the files to be measured with coverage and adds
temporal file to enable subprocessing

Humberto Ibarra (2):
  scripts/oe-selftest: Add filtering to the coverage data      gathered
    by oe-selftest
  scripts/oe-selftest: Use site.USER_SITE to run coverage     
    configuration code for sub-process

 scripts/oe-selftest | 71 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 55 insertions(+), 16 deletions(-)

-- 
1.9.1


