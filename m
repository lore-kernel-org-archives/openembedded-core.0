Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B3A156F589
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 15:26:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 07:22:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="495217415"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 07:26:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 15:25:59 +0000
Message-Id: <cover.1394119524.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/2] Recipe removals
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
X-List-Received-Date: Thu, 06 Mar 2014 15:26:56 -0000

The following changes since commit c6825ec6e92e20bb64a051d1576f363c16e98d68:

  recipes: bump PRs (2014-03-05 17:26:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/cleanup5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/cleanup5

Paul Eggleton (2):
  zaurusd: remove
  js: remove

 meta/recipes-bsp/zaurusd/zaurusd_git.bb           | 20 ------
 meta/recipes-support/js/files/buildcc.patch       | 22 -------
 meta/recipes-support/js/files/configure.ac        | 28 ---------
 meta/recipes-support/js/files/jsautocfg.h         | 74 -----------------------
 meta/recipes-support/js/files/link_with_gcc.patch | 15 -----
 meta/recipes-support/js/files/usepic.patch        | 26 --------
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb      | 51 ----------------
 7 files changed, 236 deletions(-)
 delete mode 100644 meta/recipes-bsp/zaurusd/zaurusd_git.bb
 delete mode 100644 meta/recipes-support/js/files/buildcc.patch
 delete mode 100644 meta/recipes-support/js/files/configure.ac
 delete mode 100644 meta/recipes-support/js/files/jsautocfg.h
 delete mode 100644 meta/recipes-support/js/files/link_with_gcc.patch
 delete mode 100644 meta/recipes-support/js/files/usepic.patch
 delete mode 100644 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb

-- 
1.8.5.3


