Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE0760119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 20:56:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2016 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,321,1464678000"; d="scan'208";a="730561619"
Received: from chiulunr-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.210])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2016 13:55:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 08:55:26 +1200
Message-Id: <cover.1467838464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] gcc-runtime-related fixes
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
X-List-Received-Date: Wed, 06 Jul 2016 20:56:06 -0000

Add some RRECOMMENDS to pull in gcc-runtime library packages when
installing gcc/g++, and also set reasonable per-package SUMMARY values
for gcc-runtime.


The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/gcc-runtime
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gcc-runtime

Paul Eggleton (2):
  gcc: add runtime packages to RRECOMMENDS
  gcc-runtime: add SUMMARY values

 meta/recipes-devtools/gcc/gcc-runtime.inc | 27 +++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-target.inc  | 21 +++++++++++++++++++++
 2 files changed, 48 insertions(+)

-- 
2.5.5


