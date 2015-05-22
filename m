Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 090FC609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:26:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2015 06:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="497044406"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 06:26:34 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 16:26:37 +0300
Message-Id: <cover.1432300539.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Point upgrades for both libpngs
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
X-List-Received-Date: Fri, 22 May 2015 13:26:34 -0000

The following changes since commit decb28f9bce307d40466171c66a216fef22c59d7:

  genericx860common.inc: Enable using the 3.19 kernel (2015-05-22 13:30:08 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/png
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/png

Jussi Kukkonen (2):
  libpng12: Upgrade 1.2.52 -> 1.2.53
  libpng: Upgrade 1.6.16 -> 1.6.17

 .../libpng/{libpng12_1.2.52.bb => libpng12_1.2.53.bb}         |  8 ++++----
 .../libpng/{libpng_1.6.16.bb => libpng_1.6.17.bb}             | 11 +++++------
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.52.bb => libpng12_1.2.53.bb} (70%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.16.bb => libpng_1.6.17.bb} (62%)

-- 
2.1.4


