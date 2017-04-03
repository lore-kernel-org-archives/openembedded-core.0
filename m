Return-Path: <yin.thong.choong@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8973577D1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 02:52:14 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 02 Apr 2017 19:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,267,1486454400"; d="scan'208";a="83488918"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2017 19:52:13 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Apr 2017 19:51:39 -0700
Message-Id: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/8] Remove all use of fedorahosted SRC_URI [YOCTO #11226]
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
X-List-Received-Date: Mon, 03 Apr 2017 02:52:15 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Fedorahosted.org was retired on March 1st, 2017.
Replace all fedorahosted.org SRC_URI with source
yoctoproject.org, pagure.io and github.com.

Choong YinThong (8):
  selftest/recipetool: replace fedorahosted.org SRC_URI with
    yoctoproject.org source
  xmlto: replace fedorahosted.org SRC_URI with pagure.io source
  libuser: replace fedorahosted.org SRC_URI with pagure.io source
  logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org
    source
  libnewt: replace fedorahosted.org SRC_URI with pagure.io source
  liberation-fonts: replace fedorahosted.org SRC_URI with pagure.io
    source
  chkconfig: replace fedorahosted.org SRC_URI with github.com source
  cronie: replace fedorahosted.org SRC_URI with github.com source

 meta/lib/oeqa/selftest/recipetool.py                     | 4 ++--
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb              | 4 ++--
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb      | 4 ++--
 meta/recipes-extended/cronie/cronie_1.5.1.bb             | 6 ++++--
 meta/recipes-extended/libuser/libuser_0.62.bb            | 6 +++---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb       | 4 ++--
 meta/recipes-extended/newt/libnewt_0.52.19.bb            | 4 ++--
 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb | 4 ++--
 8 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.7.4


