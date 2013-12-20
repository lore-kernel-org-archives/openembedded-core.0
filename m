Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E14B160DBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 06:41:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 22:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,518,1384329600"; d="scan'208";a="455317856"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 22:41:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 22:41:04 -0800
Message-Id: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Misc Fixes
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
X-List-Received-Date: Fri, 20 Dec 2013 06:41:10 -0000

Fix up build time with PACKAGECONFIG for perl in openssl, found some non-overridable
PACKAGECONFIGs so fix them and clean up util-linux-dev issue

Sau!

Saul Wold (4):
  harfbuzz: Allow PACKAGECONFIG to be overridden
  beecrypt: Allow PACKAGECONFIG to be overridden
  openssl: use PACKAGECONFIG to disable perl bits
  util-linux: remove non PN based -dev packages

 meta/recipes-connectivity/openssl/openssl.inc     | 16 +++++++++++-----
 meta/recipes-core/util-linux/util-linux.inc       | 10 ++++------
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb |  2 +-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb   |  2 +-
 4 files changed, 17 insertions(+), 13 deletions(-)

-- 
1.8.3.1


