Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6126B8C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 11:16:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2014 03:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,667,1384329600"; d="scan'208";a="466056786"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2014 03:16:59 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 13:16:54 +0200
Message-Id: <cover.1389870944.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] SDK build related fixes
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
X-List-Received-Date: Thu, 16 Jan 2014 11:17:00 -0000

The following changes since commit cea75f9c8c083d76ad8c45127be332665ef09d06:

  ltp: fix makefile race (2014-01-15 17:26:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5396_issue_switch_sdk_host
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5396_issue_switch_sdk_host

Laurentiu Palcu (2):
  allarch.bbclass: set SDK_ARCH and SDK_CC_ARCH to "none"
  nativesdk-packagegroup-sdk-host: reverse inherit order

 meta/classes/allarch.bbclass                       |    2 ++
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.9.5


