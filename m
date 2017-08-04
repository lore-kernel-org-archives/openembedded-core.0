Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48C836076F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 22:40:54 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2017 15:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,322,1498546800"; d="scan'208";a="115783360"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 04 Aug 2017 15:40:56 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 15:40:53 -0700
Message-Id: <1501886454-36442-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] GCC segmentation fault fix
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
X-List-Received-Date: Fri, 04 Aug 2017 22:40:55 -0000

This is a reasonably clean fix for the GCC segmentation fault as reported
in https://bugzilla.yoctoproject.org/show_bug.cgi?id=11738

There should be no danger of any regressions.

I reported the issue to GCC bugzilla, so eventually they may have a better fix.
FWIW, I believe this bug is not GCC7 specific, it goes back to previous versions.


Juro Bystricky (1):
  gcc7: fix potential segmentation fault

 meta/recipes-devtools/gcc/gcc-7.1.inc              |  1 +
 .../fix-segmentation-fault-precompiled-hdr.patch   | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/fix-segmentation-fault-precompiled-hdr.patch

-- 
2.7.4


