Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0FC60D83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 18:47:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2013 10:47:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,522,1384329600"; d="scan'208";a="453473386"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2013 10:47:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 10:47:25 -0800
Message-Id: <1387565248-18457-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] openssl v2 with other unrecognised option patches
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
X-List-Received-Date: Fri, 20 Dec 2013 18:47:28 -0000

Round 2 of the openssl patch

Saul Wold (3):
  openssl: use PACKAGECONFIG to disable perl bits
  sqlite: remove unrecognised options: --enable-tempstore
  python: fix unrecognised options: --without-cxx --with-cyclic-gc

 meta/recipes-connectivity/openssl/openssl.inc | 17 +++++++++++------
 meta/recipes-devtools/python/python.inc       |  3 +--
 meta/recipes-support/sqlite/sqlite3.inc       |  2 +-
 3 files changed, 13 insertions(+), 9 deletions(-)

-- 
1.8.3.1


