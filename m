Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 822C770600
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:58:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jul 2014 06:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="459959278"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2014 06:58:20 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 16:58:40 +0300
Message-Id: <cover.1406037471.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6217
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
X-List-Received-Date: Tue, 22 Jul 2014 13:58:21 -0000

The following changes since commit 8b7116d25ed6255a03895d835e5a0560858ab496:

  bitbake: Updated the the example 'bitbake -h' output to match the actual output, which has been recently patched to fix the '-S SIGNATURE_HANDLER, --dump-signatures=SIGNATURE_HANDLER' option. (2014-07-22 08:33:25 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6217
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6217

Roxana Ciobanu (1):
  bitbake.conf: move BB_NUMBER_THREADS and PARALLEL_MAKE to bitbake.conf

 meta-yocto/conf/local.conf.sample          | 22 ----------------------
 meta-yocto/conf/local.conf.sample.extended | 23 +++++++++++++++++++++++
 meta/conf/bitbake.conf                     |  4 ++++
 3 files changed, 27 insertions(+), 22 deletions(-)

-- 
1.9.1


