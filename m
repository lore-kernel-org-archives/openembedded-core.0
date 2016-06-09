Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ACF2060762
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 17:06:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2016 10:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="994444700"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.152])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 10:05:59 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:07:36 -0500
Message-Id: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH 0/3] Fixed yocto-bsp create after python3 failures
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
X-List-Received-Date: Thu, 09 Jun 2016 17:06:28 -0000

Python3 introduced a few errors that avoided yocto-bsp from being
able to create a BSP. This patch set solves these issues.

[YOCTO #9723]

Humberto Ibarra (3):
  scripts/lib/bsp/engine.py: Rename raw_input commands to input
  scripts/lib/bsp/kernel.py: python3: use explicit relative imports
  scripts/lib/bsp/engine.py: Added missing parentheses to string
    formatting

 scripts/lib/bsp/engine.py | 6 +++---
 scripts/lib/bsp/kernel.py | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.4.11


