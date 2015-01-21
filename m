Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7E260DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 17:23:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 21 Jan 2015 09:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,442,1418112000"; d="scan'208";a="640509441"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.5.201])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2015 09:14:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 17:14:05 +0000
Message-Id: <cover.1421860276.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] Fix gcc for including omp.h in target sysroot
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
X-List-Received-Date: Wed, 21 Jan 2015 17:23:38 -0000

The following change since commit eaea05c88661a88a89fa6b139f7e6b243155d492:

  depmodwrapper-cross: Update to use STAGING_KERNEL_BUILDDIR (2015-01-17 17:05:25 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/gcc-omp-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gcc-omp-fix

Paul Eggleton (1):
  gcc: ensure target gcc headers can be included

 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc/gcc-4.9/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch

-- 
1.9.3


