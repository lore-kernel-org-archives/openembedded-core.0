Return-Path: <roxana.ciobanu@intel.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Jul 2014 14:27:20 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8557A609AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 14:27:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jul 2014 07:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,581,1400050800"; d="scan'208";a="555840265"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2014 07:16:48 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 17:16:59 +0300
Message-Id: <cover.1404224041.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6491
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
X-List-Received-Date: Tue, 01 Jul 2014 14:27:22 -0000

The following changes since commit 0ed5a13f5f9478e2c22f517fb3504b738422f85c:

  python3: fix builtins imports (2014-06-30 16:36:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6491
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6491

Roxana Ciobanu (1):
  elfutils/elfutils-native: Fix patching generated files

 .../elfutils-0.158/redhat-portability.diff         | 859 ---------------------
 .../elfutils/elfutils/redhat-portability.diff      | 370 +--------
 2 files changed, 1 insertion(+), 1228 deletions(-)

-- 
1.9.1


