Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3086BB02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 12:16:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Aug 2013 05:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,958,1367996400"; d="scan'208";a="351674308"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2013 05:16:52 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 8574B6A4092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 05:16:50 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 15:16:46 +0300
Message-Id: <cover.1377519067.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/2] Some tests fixes
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
X-List-Received-Date: Mon, 26 Aug 2013 12:16:55 -0000

Hello,

These should fix two of AB fails for RunSanity:
http://autobuilder.yoctoproject.org:8011/builders/nightly-x86/builds/269/steps/Running%20Sanity%20Tests/logs/stdio
and http://autobuilder.yoctoproject.org:8011/builders/nightly-multilib/builds/266/steps/Running%20Sanity%20Tests_3/logs/stdio

Cheers,
Stefan


The following changes since commit d80a715e3763a0e2bea5c84a4132d70dceaa2044:

  python-2.7-manifest: Add missing python-ctypes dependency to python-multiprocessing (2013-08-26 12:15:49 +0100)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib stefans/test-fixes1

for you to fetch changes up to 215b28dcd8c0b11f63c151bb217e81188c595a91:

  lib/oeqa/runtime: multilib: fix typo (2013-08-26 14:55:37 +0300)

----------------------------------------------------------------
Stefan Stanacar (2):
      lib/oeqa/runtime: smart: add checks for smart output
      lib/oeqa/runtime: multilib: fix typo

 meta/lib/oeqa/runtime/multilib.py |  2 +-
 meta/lib/oeqa/runtime/smart.py    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

Stefan Stanacar (2):
  lib/oeqa/runtime: smart: add checks for smart output
  lib/oeqa/runtime: multilib: fix typo

 meta/lib/oeqa/runtime/multilib.py |  2 +-
 meta/lib/oeqa/runtime/smart.py    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.8.3.1


