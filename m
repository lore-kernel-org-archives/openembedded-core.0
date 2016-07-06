Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7403160119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 23:49:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jul 2016 16:49:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="990392890"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2016 16:49:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:48:33 +1200
Message-Id: <cover.1467848566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH v2 0/2] gcc-runtime-related tweaks
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
X-List-Received-Date: Wed, 06 Jul 2016 23:49:31 -0000

Add some RRECOMMENDS to pull in gcc-runtime library packages when
installing gcc/g++, and also set reasonable per-package SUMMARY values
for gcc-runtime. 

Changes since v1:
* Drop libgomp and libitm from RRECOMMENDS for gcc since they aren't
  commonly used
* Move libquadmath from the RRECOMMENDS for gcc to gfortran since it
  appears to be primarily used in conjunction with the latter (and in
  any case we don't actually enable building it unless fortran is
  enabled when building gcc).
* Adjust SUMMARY values in 2/2 to reflect that most of the libs aren't
  specific to gcc

The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/gcc-runtime
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gcc-runtime

Paul Eggleton (2):
  gcc: add runtime packages to RRECOMMENDS
  gcc-runtime: add SUMMARY values

 meta/recipes-devtools/gcc/gcc-runtime.inc | 27 +++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-target.inc  | 19 +++++++++++++++++++
 2 files changed, 46 insertions(+)

-- 
2.5.5


