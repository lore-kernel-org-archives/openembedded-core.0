Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E3333610C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 06:26:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 22:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,541,1384329600"; d="scan'208";a="454942789"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.16])
	by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2013 22:26:48 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 22:26:47 -0800
Message-Id: <cover.1387866355.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 0/8] Patches and updates
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
X-List-Received-Date: Tue, 24 Dec 2013 06:26:48 -0000


The following changes since commit 421e927bd453259f4b3cdbd1676f6e12f97bf34f:

  openssl: use PACKAGECONFIG to disable perl bits (2013-12-21 09:09:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  image.bbclass: add ability to set systemd default target

Corneliu Stoicescu (1):
  oe-selftest: New tests for sstate related operations

Joao Henrique Ferreira de Freitas (1):
  boot-directdisk: fix the support of vmdk

Saul Wold (5):
  util-linux: remove non PN based -dev packages
  sqlite: remove unrecognised options: --enable-tempstore
  python: fix unrecognised options: --without-cxx --with-cyclic-gc
  tzdata: Update to 2013i
  tzcode: Update to 2013i

 meta/classes/boot-directdisk.bbclass               |  18 +-
 meta/classes/image.bbclass                         |  10 +
 meta/lib/oeqa/selftest/sstate.py                   | 226 +++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc        |  10 +-
 meta/recipes-devtools/python/python.inc            |   3 +-
 ...code-native_2013h.bb => tzcode-native_2013i.bb} |  10 +-
 .../tzdata/{tzdata_2013h.bb => tzdata_2013i.bb}    |   6 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   2 +-
 8 files changed, 258 insertions(+), 27 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/sstate.py
 rename meta/recipes-extended/tzcode/{tzcode-native_2013h.bb => tzcode-native_2013i.bb} (59%)
 rename meta/recipes-extended/tzdata/{tzdata_2013h.bb => tzdata_2013i.bb} (97%)

-- 
1.8.3.1


