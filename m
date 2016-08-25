Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Aug 2016 21:09:23 UTC
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 54C726E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 21:09:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 25 Aug 2016 13:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,577,1464678000"; d="scan'208";a="871144484"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga003.jf.intel.com with ESMTP; 25 Aug 2016 13:59:49 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2016 14:01:17 -0700
Message-Id: <1472158878-25011-1-git-send-email-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth][PATCH 0/1] another gcc-6 backport for Fedora-24 host
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
X-List-Received-Date: Thu, 25 Aug 2016 21:09:25 -0000

[YOCTO #10167]

Khem Raj (1):
  lzop: Fix build with gcc-6

 .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch | 37 ++++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |  6 ++--
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch

-- 
2.7.4


