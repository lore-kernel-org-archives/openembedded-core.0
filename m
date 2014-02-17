Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68A186E7CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 15:08:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 07:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,861,1384329600"; d="scan'208";a="456901743"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2014 07:08:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 15:08:42 +0000
Message-Id: <cover.1392649689.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH 0/1] Dylan backport from master
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
X-List-Received-Date: Mon, 17 Feb 2014 15:08:52 -0000

The following change since commit 1aeab422006c5e5b1bffa3fa05669fcb01d7ffdf:

  guile: fix the depends for target recipes (2014-02-09 10:05:08 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Chen Qi (1):
  subversion: fix build problem when sysroot contains '-D' or '-I'

 .../neon.m4-fix-includes-and-cflags.patch          | 32 ++++++++++++++++++++++
 .../subversion/subversion_1.7.8.bb                 |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.8/neon.m4-fix-includes-and-cflags.patch

-- 
1.8.5.3


