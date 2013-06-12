Return-Path: <kevin.strasser@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 069DD6A9FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:47:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2013 10:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="352392154"
Received: from wrk.jf.intel.com ([10.7.202.76])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2013 10:47:20 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 10:40:29 -0700
Message-Id: <cover.1371058261.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Drop unnecessary dhcp patches
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
X-List-Received-Date: Wed, 12 Jun 2013 17:47:20 -0000

The following changes since commit fe744381e8844ad17dcc6e036650a442dbc9575d:

  buildtools-tarball: add difflib and pprint python modules (2013-06-11 21:53:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib strassek/patch-cleanup
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=strassek/patch-cleanup

Kevin Strasser (2):
  dhcp: drop fixincludes.patch
  dhcp: drop noattrmode.patch

 .../dhcp/dhcp/fixincludes.patch                    |   12 -----------
 .../dhcp/dhcp/noattrmode.patch                     |   21 --------------------
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb    |    3 +--
 3 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch

-- 
1.7.9.5


