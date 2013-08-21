Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDF86B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 13:06:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2013 06:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,928,1367996400"; d="scan'208";a="384330564"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2013 06:06:57 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:08:44 +0300
Message-Id: <cover.1377090473.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] YB5030: Multiple providers are available for runtime libasound-module-bluez (bluez4, bluez5) warning
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
X-List-Received-Date: Wed, 21 Aug 2013 13:06:58 -0000

The following changes since commit b2ff1add530b1fec2fb7f385227a03db47015c37:

  poky.conf: Don't force the addition of extra DISTRO_FEATURES (2013-08-20 22:58:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/bluez5_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/bluez5_fixes

Cristian Iorga (1):
  default-providers: Set the preferred provider for bluez

 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.1.2


