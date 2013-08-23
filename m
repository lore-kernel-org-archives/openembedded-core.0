Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 051996AF56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:57:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2013 05:57:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="390923671"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 05:57:30 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 15:56:59 +0300
Message-Id: <cover.1377260859.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/1] connman-gnome:fix DHCP segfault
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
X-List-Received-Date: Fri, 23 Aug 2013 12:57:31 -0000

Update older patch for YB3945.

The following changes since commit 199b1a8c7d7109d9b59d67bf4dcfeb03be07587a:

  mkfontscale: This no longer needs a full libx11, xproto suffices (2013-08-22 18:30:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/b3945
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/b3945

Mihai Prica (1):
  connman-gnome: fix DHCP segfault

 .../connman-gnome/null_check_for_ipv4_config.patch |   36 ++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch

-- 
1.7.9.5


