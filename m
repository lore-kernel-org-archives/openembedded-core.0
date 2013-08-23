Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAD06065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:39:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 07:39:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="285865682"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 07:39:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 17:41:35 +0300
Message-Id: <cover.1377268510.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2 0/1] YB5030: Multiple providers are available for runtime libasound-module-bluez (bluez4, bluez5) warning
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
X-List-Received-Date: Fri, 23 Aug 2013 14:39:48 -0000

Patch V2:
Better commit message;
Opened a bug on the rather puzzling PREFERRED_PROVIDER fix,
that is refferenced in the commit message.

The following changes since commit 199b1a8c7d7109d9b59d67bf4dcfeb03be07587a:

  mkfontscale: This no longer needs a full libx11, xproto suffices (2013-08-22 18:30:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/bluez5_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/bluez5_fixes

Cristian Iorga (1):
  default-providers: Set the preferred provider for bluez

 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.2


