Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5D87773289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:57:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Feb 2016 13:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,462,1449561600"; d="scan'208";a="905538162"
Received: from humberto-desktop.zpn.intel.com ([10.219.5.173])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2016 13:57:02 -0800
From: humberto.ibarra.lopez@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 15:53:59 -0600
Message-Id: <1455746041-4482-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/2] Coverage filtering and configuration file for sub-process in $HOME
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
X-List-Received-Date: Wed, 17 Feb 2016 21:57:29 -0000

From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

Enables filtering to the files to be measured with coverage and adds temporal file to enable subprocessing

Humberto Ibarra (2):
  scripts/oe-selftest: Add filtering to the coverage data      gathered
    by oe-selftest
  scripts/oe-selftest: Use site.USER_SITE to run coverage configuration 
       code for sub-process

 scripts/oe-selftest | 76 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 58 insertions(+), 18 deletions(-)

-- 
1.9.1


