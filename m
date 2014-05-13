Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D77F366070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531049994"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:00:58 +0100
Message-Id: <cover.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/6] Recipe upgrades
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
X-List-Received-Date: Tue, 13 May 2014 11:02:40 -0000

Recipe upgrades plus a couple of tidy-up patches.


The following changes since commit 23521fccb122b64f3469d46176f73fe476b0dfc5:

  gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11 depends (2014-05-11 13:07:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/upgrades

Paul Eggleton (6):
  openssh: update to 6.6p1
  openssh: move packaging definitions to the end
  ethtool: upgrade to 3.14
  nfs-utils: upgrade to 1.3.0
  dropbear: add missing patch header
  libsdl2: upgrade to 2.0.3

 .../{nfs-utils_1.2.9.bb => nfs-utils_1.3.0.bb}         |  7 +++----
 .../openssh/{openssh_6.5p1.bb => openssh_6.6p1.bb}     | 18 +++++++++---------
 .../dropbear/dropbear/0003-configure.patch             |  4 +++-
 .../ethtool/{ethtool_3.13.bb => ethtool_3.14.bb}       |  4 ++--
 .../libsdl2/{libsdl2_2.0.1.bb => libsdl2_2.0.3.bb}     |  6 +++---
 5 files changed, 20 insertions(+), 19 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.9.bb => nfs-utils_1.3.0.bb} (95%)
 rename meta/recipes-connectivity/openssh/{openssh_6.5p1.bb => openssh_6.6p1.bb} (97%)
 rename meta/recipes-extended/ethtool/{ethtool_3.13.bb => ethtool_3.14.bb} (87%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.1.bb => libsdl2_2.0.3.bb} (91%)

-- 
1.9.0


