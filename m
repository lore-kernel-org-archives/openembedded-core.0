Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56C157646E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 20:57:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Aug 2015 13:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,625,1432623600"; d="scan'208";a="779303138"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2015 13:57:19 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:49:04 +0000
Message-Id: <1438865345-39231-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] Creates manifest/license files for deployed packages not in rootfs
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
X-List-Received-Date: Thu, 06 Aug 2015 20:57:22 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>


The current license manifest creation behavior is to include
only packages that were installed. This beahvior excludes 
packages that were deployed but not installed in the rootfs.
An example would be the bootloader.

This patch adds support for packages deployed but not installed
in the rootfs.

Please note this patch DEPENDS on:

http://lists.openembedded.org/pipermail/bitbake-devel/2015-August/006130.html

Mariano Lopez (1):
  license.bbclass: Add support for deployed packages not in rootfs

 meta/classes/license.bbclass | 126 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 113 insertions(+), 13 deletions(-)

-- 
1.8.4.5


