Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 15B8975A31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 21:32:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2016 13:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,472,1449561600"; d="scan'208";a="907094748"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.34])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2016 13:32:36 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 15:29:30 -0600
Message-Id: <1455917372-10008-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3 0/2] Coverage filtering and configuration file for sub-process in $HOME
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
X-List-Received-Date: Fri, 19 Feb 2016 21:32:39 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Enables filtering to the files to be measured with coverage and adds temporal file to enable subprocessing

Humberto Ibarra (2):
  scripts/oe-selftest: Add filtering to the coverage data      gathered
    by oe-selftest
  scripts/oe-selftest: Use site.USER_SITE to run coverage     
    configuration code for sub-process

 scripts/oe-selftest | 76 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 18 deletions(-)

-- 
1.9.1


