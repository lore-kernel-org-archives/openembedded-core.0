Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C773460043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:49:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 04:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="549519141"
Received: from njackson-mobl1.amr.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.25.89])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2015 04:49:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 14:49:47 +0300
Message-Id: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] devtool: improvements to kernel support
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
X-List-Received-Date: Thu, 27 Aug 2015 11:49:55 -0000

This patchset contains few patches to slightly improve the support for kernel
packages in devtool. The last of which is an ugly hack - to be removed after a
future tinfoil rewrite when running arbitrary bitbake task functions becomes
possible.

Markus Lehtonen (3):
  devtool: make required tasks be run in kernel build
  devtool: extract: correct initial rev for kernel packages
  devtool: run kernel dependencies

 scripts/lib/devtool/standard.py | 54 +++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

-- 
2.1.4


