Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25D2076E04
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 17:53:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 07 Nov 2015 09:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,258,1444719600"; d="scan'208";a="814235968"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2015 09:53:45 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Nov 2015 09:46:41 -0800
Message-Id: <1446918402-432-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B610D4B8C6@ORSMSX110.amr.corp.intel.com>
References: <6E51916E4A1F32428260031F4C7CD2B610D4B8C6@ORSMSX110.amr.corp.intel.com>
Cc: richard.purdie@intel.com
Subject: [PATCH 0/1] gcc-4.9: Fix various _FOR_BUILD and related variables
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
X-List-Received-Date: Sat, 07 Nov 2015 17:53:49 -0000

This is a patch by Peter Seebach and Mark Hatle (commit 41cbfd7af60f93a4bd496b7b6bf477215a286950)
except it is applied against gcc-4.9 instead of gcc-5.2.

Tested with local.conf:

SDKMACHINE="i686-mingw32"
SDKTAROPTS_append=" -h --hard-dereference"
GCCVERSION="4.9.3"

$ bitbake nativesdk-gcc

There are some additional minor fixes needed for meta-mingw to build successfully,
but that should be a separate meta-mingw specific patch.


Juro Bystricky (1):
  gcc-4.9: Fix various _FOR_BUILD and related variables

 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 .../gcc/gcc-4.9/0066-cxxflags-for-build.patch      | 123 +++++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch

-- 
1.9.1


