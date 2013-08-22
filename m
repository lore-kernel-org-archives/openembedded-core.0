Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADF160842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:40:11 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Aug 2013 08:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,934,1367996400"; d="scan'208";a="350210675"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 22 Aug 2013 08:40:10 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 18:41:56 +0300
Message-Id: <cover.1377186027.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] [Patch V2] YB5030: Multiple providers are available for runtime libasound-module-bluez (bluez4, bluez5) warning
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
X-List-Received-Date: Thu, 22 Aug 2013 15:40:12 -0000

V2 has a better commit message.

The following changes since commit 06f1ebf206911ffe223483da945189a287f20b7d:

  poky.conf: add Debian 7.1 to SANITY_TESTED_DISTROS (2013-08-22 12:54:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/bluez5_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/bluez5_fixes

Cristian Iorga (1):
  default-providers: Set the preferred provider for bluez

 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.2


