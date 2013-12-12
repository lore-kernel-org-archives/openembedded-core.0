Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3997F6BEFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 16:07:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2013 08:03:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,878,1378882800"; d="scan'208";a="423648550"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.252])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2013 08:07:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 16:07:03 +0000
Message-Id: <cover.1386864323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2 0/2] A couple of removals
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
X-List-Received-Date: Thu, 12 Dec 2013 16:07:37 -0000

Since v1, extended the external-sourcery-toolchain change to update
documentation.conf and local.conf.sample.extended to match up with the
change.


The following changes since commit 8505f0fa48cc79d51616b923c6e2c778c4b46a44:

  libmatchbox: use PACKAGECONFIG (2013-12-10 14:13:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/cleanup2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/cleanup2

Paul Eggleton (2):
  classes/module_strip: remove
  external-sourcery-toolchain: remove

 meta/classes/kernel.bbclass                        |   2 +-
 meta/classes/module-base.bbclass                   |   2 -
 meta/classes/module_strip.bbclass                  |   0
 meta/conf/distro/include/csl-versions.inc          | 107 ---------
 meta/conf/distro/include/tcmode-external-csl.inc   |   2 -
 .../distro/include/tcmode-external-sourcery.inc    | 128 ----------
 meta/conf/documentation.conf                       |   2 +-
 meta/conf/local.conf.sample.extended               |  20 +-
 .../meta/external-sourcery-toolchain.bb            | 149 ------------
 .../meta/external-sourcery-toolchain/SUPPORTED     | 257 ---------------------
 10 files changed, 17 insertions(+), 652 deletions(-)
 delete mode 100644 meta/classes/module_strip.bbclass
 delete mode 100644 meta/conf/distro/include/csl-versions.inc
 delete mode 100644 meta/conf/distro/include/tcmode-external-csl.inc
 delete mode 100644 meta/conf/distro/include/tcmode-external-sourcery.inc
 delete mode 100644 meta/recipes-core/meta/external-sourcery-toolchain.bb
 delete mode 100644 meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED

-- 
1.8.1.2


