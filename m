Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 244406B53B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 14:52:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2013 07:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,833,1367996400"; d="scan'208";a="377525044"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2013 07:52:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 17:53:46 +0300
Message-Id: <cover.1375887108.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] Various PUs
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
X-List-Received-Date: Wed, 07 Aug 2013 14:52:12 -0000

The following changes since commit f63e7f4323368c0d6fe7a1d44393a7e15652d4f2:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/work

Cristian Iorga (2):
  net-tools: upgrade to v1.60-25
  gst-fluendo-mpegdemux: upgrade to v0.10.72

 .../net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.h | 0
 .../{net-tools-1.60-24.2 => net-tools}/net-tools-config.make        | 0
 .../net-tools/{net-tools_1.60-24.2.bb => net-tools_1.60-25.bb}      | 5 ++---
 ...luendo-mpegdemux_0.10.71.bb => gst-fluendo-mpegdemux_0.10.72.bb} | 6 ++----
 4 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.h (100%)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.make (100%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-24.2.bb => net-tools_1.60-25.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.71.bb => gst-fluendo-mpegdemux_0.10.72.bb} (70%)

-- 
1.8.1.2


