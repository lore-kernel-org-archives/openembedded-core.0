Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1C46AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:26:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2015 08:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="497089526"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 08:26:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:26:44 -0700
Message-Id: <cover.1432308259.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] More package upgrades
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
X-List-Received-Date: Fri, 22 May 2015 15:26:48 -0000

Richard, Ross:


Another set of package upgrades, tested locally

Sau!


The following changes since commit c78eb923c20533a1b9fbab462c809b2652fac425:

  xvinfo: upgrade to 1.1.3 (2015-05-21 10:48:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (3):
  boost/bjam-native: Upgrade to 1.58.0
  libassuan: Upgrade to 2.2.1
  npth: Upgrade to 1.2

 .../boost/{bjam-native_1.57.0.bb => bjam-native_1.58.0.bb}            | 0
 meta/recipes-support/boost/{boost-1.57.0.inc => boost-1.58.0.inc}     | 4 ++--
 meta/recipes-support/boost/{boost_1.57.0.bb => boost_1.58.0.bb}       | 0
 .../libassuan/{libassuan_2.2.0.bb => libassuan_2.2.1.bb}              | 4 ++--
 meta/recipes-support/npth/{npth_1.1.bb => npth_1.2.bb}                | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.57.0.bb => bjam-native_1.58.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.57.0.inc => boost-1.58.0.inc} (83%)
 rename meta/recipes-support/boost/{boost_1.57.0.bb => boost_1.58.0.bb} (100%)
 rename meta/recipes-support/libassuan/{libassuan_2.2.0.bb => libassuan_2.2.1.bb} (86%)
 rename meta/recipes-support/npth/{npth_1.1.bb => npth_1.2.bb} (79%)

-- 
2.1.0


