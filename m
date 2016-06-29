Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6386FF6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:12:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 28 Jun 2016 20:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="726582566"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2016 20:12:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:12:02 +1200
Message-Id: <cover.1467169903.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] A couple of fixes for recipetool
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
X-List-Received-Date: Wed, 29 Jun 2016 03:12:11 -0000

The following changes since commit 646c366c2566bd8dd6f73681cea9f5b021589a56:

  gst-player: upgrade to latest HEAD (2016-06-27 14:08:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fixes3

Paul Eggleton (2):
  recipetool: create: avoid decoding errors with Python 3
  recipetool: create: drop unused convert_pkginfo() function

 scripts/lib/recipetool/create.py          | 35 +++----------------------------
 scripts/lib/recipetool/create_buildsys.py | 14 ++++++-------
 scripts/lib/recipetool/create_kernel.py   |  2 +-
 scripts/lib/recipetool/create_kmod.py     |  4 ++--
 scripts/lib/recipetool/create_npm.py      |  2 +-
 5 files changed, 14 insertions(+), 43 deletions(-)

-- 
2.5.5


