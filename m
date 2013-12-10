Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 47B9760FD3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:16:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2013 11:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,866,1378882800"; d="scan'208";a="450036629"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.207])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2013 11:16:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 11:16:05 -0800
Message-Id: <cover.1386650569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Tue, 10 Dec 2013 19:16:12 -0000

Did a build with debian packaging and tested dpkg lightly on the target.

Sau!

The following changes since commit 315367ea9526186d5836c64867ce0cd40d9d8412:

  nativesdk.bbclass: support nativesdk to override with the PACKAGES_DYNAMIC statement (2013-12-09 21:36:30 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (3):
  util-macros: upgrade to 1.18.0
  dpkg: upgrade to 1.17.4
  cracklib: upgrade to 2.9.1

 meta/recipes-devtools/dpkg/{dpkg_1.17.1.bb => dpkg_1.17.4.bb}         | 4 ++--
 .../cracklib/{cracklib_2.9.0.bb => cracklib_2.9.1.bb}                 | 4 ++--
 .../xorg-util/{util-macros_1.17.1.bb => util-macros_1.18.0.bb}        | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.17.1.bb => dpkg_1.17.4.bb} (75%)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.0.bb => cracklib_2.9.1.bb} (84%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.17.1.bb => util-macros_1.18.0.bb} (75%)

-- 
1.8.3.1


