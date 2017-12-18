Return-Path: <amanda.r.brindle@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E5FC260079
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 22:12:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 14:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,423,1508828400"; 
   d="scan'208";a="3860559"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga008.jf.intel.com with ESMTP; 18 Dec 2017 14:12:50 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 14:12:08 -0800
Message-Id: <cover.1513634861.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH 0/2]
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
X-List-Received-Date: Mon, 18 Dec 2017 22:12:50 -0000

The following changes since commit b73e96e7f3f5d1ba3a221d99792a7a3c7ef42c21:

  python-scons: upgrade to v3.0.1; use pypi.bbclass (2017-12-13 14:00:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/rprovides
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/rprovides

Amanda Brindle (2):
  oe-pkgdata-util: Refactor functions for consistency
  oe-pkgdata-util: Add support for RPROVIDES

 scripts/oe-pkgdata-util | 173 +++++++++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 76 deletions(-)

-- 
2.7.4


