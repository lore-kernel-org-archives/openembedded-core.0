Return-Path: <yin.thong.choong@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BE7C0775FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 08:39:39 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 06 Apr 2017 01:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,283,1488873600"; d="scan'208";a="85137658"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2017 01:39:40 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 01:35:22 -0700
Message-Id: <1491467730-8418-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 0/8] Remove all use of fedorahosted SRC_URI [yocto #11226]
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
X-List-Received-Date: Thu, 06 Apr 2017 08:39:39 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Fedorahosted.org was retired on March 1st, 2017.
Replace all fedorahosted.org SRC_URI with source pagure.io and github.com.

Choong YinThong (8):
  selftest/recipetool: replace fedorahosted.org SRC_URI with github.com
    source
  xmlto: replace fedorahosted.org SRC_URI with pagure.io source
  libuser: replace fedorahosted.org SRC_URI with pagure.io source
  logrotate: replace fedorahosted.org SRC_URI with github.com source
  libnewt: replace fedorahosted.org SRC_URI with pagure.io source
  liberation-fonts: replace fedorahosted.org SRC_URI with pagure.io
    source
  chkconfig: replace fedorahosted.org SRC_URI with github.com source
  cronie: replace fedorahosted.org SRC_URI with github.com source

 meta/lib/oeqa/selftest/recipetool.py                  |  8 ++++----
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb           |  4 ++--
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb   | 14 ++++++++++----
 meta/recipes-extended/cronie/cronie_1.5.1.bb          |  6 ++++--
 meta/recipes-extended/libuser/libuser_0.62.bb         |  6 +++---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb    | 19 +++++++++++++++----
 meta/recipes-extended/newt/libnewt_0.52.19.bb         |  4 ++--
 .../ttf-fonts/liberation-fonts_1.04.bb                |  4 ++--
 8 files changed, 42 insertions(+), 23 deletions(-)

-- 
2.7.4


