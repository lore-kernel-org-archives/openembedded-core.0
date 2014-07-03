Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1A360CEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 12:57:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2014 05:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,595,1400050800"; d="scan'208";a="556936191"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2014 05:57:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jul 2014 15:57:31 +0300
Message-Id: <cover.1404392064.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Partial fix for YB6495
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
X-List-Received-Date: Thu, 03 Jul 2014 12:57:44 -0000

For YB6495 to be completely fixed, source poky commit for Build Appliance
needs to be advanced to this patch after integration.
As such, this is a partial fix.

The following changes since commit 0ed5a13f5f9478e2c22f517fb3504b738422f85c:

  python3: fix builtins imports (2014-06-30 16:36:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB6495
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB6495

Cristian Iorga (1):
  qemu: fix qemu-native pkg-config paths

 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1


