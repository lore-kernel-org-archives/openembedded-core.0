Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7367404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 16:02:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 09:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="575499553"
Received: from cestaunt-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.15.40])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 09:02:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 17:02:03 +0100
Message-Id: <cover.1432310410.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [daisy][PATCH 0/1] Backport of gcc header fix from master/dizzy
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
X-List-Received-Date: Fri, 22 May 2015 16:02:49 -0000

I made this backport earlier but missed actually sending it.


The following change since commit 5a577ec878a15f3caaf4893b819825ffb8c81266:

  build-appliance-image: Update to daisy head revision (2015-05-13 13:27:45 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/gcc-omp-fix-daisy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gcc-omp-fix-daisy

Paul Eggleton (1):
  gcc: ensure target gcc headers can be included

 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/target-gcc-includedir.patch        | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/target-gcc-includedir.patch

-- 
2.1.0


