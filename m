Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7125665C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:50:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jan 2015 06:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,449,1418112000"; d="scan'208";a="641046072"
Received: from psroczyn-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.156])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2015 06:50:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 14:49:59 +0000
Message-Id: <cover.1421938154.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH v2 0/1] Fix gcc for including omp.h in target sysroot
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
X-List-Received-Date: Thu, 22 Jan 2015 14:50:12 -0000

Changes since v1: apply patch to gcc 4.8 as well.

The following changes since commit eaea05c88661a88a89fa6b139f7e6b243155d492:

  depmodwrapper-cross: Update to use STAGING_KERNEL_BUILDDIR (2015-01-17 17:05:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/gcc-omp-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gcc-omp-fix

Paul Eggleton (1):
  gcc: ensure target gcc headers can be included

 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc/gcc-4.9/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/target-gcc-includedir.patch

-- 
1.9.3


