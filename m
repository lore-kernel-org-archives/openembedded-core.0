Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4823B60E01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 00:29:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 16:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,539,1384329600"; d="scan'208";a="454819333"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2013 16:29:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 16:29:05 -0800
Message-Id: <1387844949-23516-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] Configure options clean up and 2 updates
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
X-List-Received-Date: Tue, 24 Dec 2013 00:29:09 -0000

Richard,

V2 of the config options clean-up with better commit messages and a couple
of package updates

Saul Wold (4):
  sqlite: remove unrecognised options: --enable-tempstore
  python: fix unrecognised options: --without-cxx --with-cyclic-gc
  tzdata: Update to 2013i
  tzcode: Update to 2013i

 meta/recipes-devtools/python/python.inc                        |  3 +--
 .../tzcode/{tzcode-native_2013h.bb => tzcode-native_2013i.bb}  | 10 +++++-----
 .../tzdata/{tzdata_2013h.bb => tzdata_2013i.bb}                |  6 +++---
 meta/recipes-support/sqlite/sqlite3.inc                        |  2 +-
 4 files changed, 10 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013h.bb => tzcode-native_2013i.bb} (59%)
 rename meta/recipes-extended/tzdata/{tzdata_2013h.bb => tzdata_2013i.bb} (97%)

-- 
1.8.3.1


