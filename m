Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 613C6782E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:01:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 10:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97608065"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 10:01:25 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 12:01:24 -0500
Message-Id: <cover.1497027624.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/4] eSDK support runs of compatibility SDK tests
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
X-List-Received-Date: Fri, 09 Jun 2017 17:01:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b1d5267f0e31605b346af40778da0ac1ff298b78:

  README.hardware: update flashing instructions for MPC8315 (2017-06-09 17:13:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib fjpedraz/emptyManifests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=fjpedraz/emptyManifests

Aníbal Limón (1):
  oeqa/sdk/cases: Fix skip of buildgcalculator test

Francisco Pedraza (3):
  lib/oe/sdk: Adds get_extra_sdk_info to reuse code in buildhistory
  meta/classes/populate_sdk: Adds support for generating eSDK manifest
    files
  oeqa/sdk/cases: Added validation for SDK compatibility tests with eSDK

 meta/classes/buildhistory.bbclass          | 19 ++++---------
 meta/classes/populate_sdk_base.bbclass     | 44 +++++++++++++++++-------------
 meta/classes/populate_sdk_ext.bbclass      | 33 ++++++++++++++++++++++
 meta/lib/oe/sdk.py                         | 19 +++++++++++++
 meta/lib/oeqa/sdk/cases/buildgalculator.py |  2 +-
 meta/lib/oeqa/sdk/cases/buildiptables.py   |  3 +-
 meta/lib/oeqa/sdk/cases/gcc.py             |  3 +-
 meta/lib/oeqa/sdk/cases/perl.py            |  3 +-
 meta/lib/oeqa/sdk/cases/python.py          |  3 +-
 9 files changed, 92 insertions(+), 37 deletions(-)

-- 
2.1.4


