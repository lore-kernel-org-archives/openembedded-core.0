Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id CB3BB6DEE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:41:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2013 08:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,825,1378882800"; d="scan'208";a="438491174"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2013 08:40:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:40:25 +0000
Message-Id: <cover.1386175183.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/4] Warning fixes and related cleanups
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
X-List-Received-Date: Wed, 04 Dec 2013 16:41:19 -0000

The following changes since commit 64f0a0bc408d8e32d5e795aeb9fffee0539f5e22:

  ptest: ensure do_install_ptest_base task runs in fakeroot context (2013-12-03 17:35:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes2

Paul Eggleton (4):
  gpgme: remove pth handling
  openssh: remove unrecognised configure option
  libarchive: add e2fsprogs to DEPENDS
  libarchive: add SUMMARY and fix HOMEPAGE

 meta/recipes-connectivity/openssh/openssh_6.4p1.bb   |  3 +--
 meta/recipes-extended/libarchive/libarchive_2.8.5.bb |  5 ++++-
 meta/recipes-support/gpgme/gpgme_1.4.3.bb            | 10 +++-------
 3 files changed, 8 insertions(+), 10 deletions(-)

-- 
1.8.1.2


