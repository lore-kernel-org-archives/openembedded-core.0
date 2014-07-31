Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 136ED701E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 10:29:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2014 03:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,771,1400050800"; d="scan'208";a="551757051"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2014 03:29:05 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 13:29:23 +0300
Message-Id: <cover.1406802531.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6562
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
X-List-Received-Date: Thu, 31 Jul 2014 10:29:17 -0000

The following changes since commit 2d1660112e54653f7bb763939d0416472c49fe01:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:58:27 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6562
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6562

Roxana Ciobanu (1):
  SRC_URI parameter: "subdir" does not work for local files

 bitbake/lib/bb/fetch2/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
1.9.1


