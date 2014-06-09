Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 41E5D6B8D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:45:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="554540670"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:45:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:45:04 +0100
Message-Id: <cover.1402328640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] OpenSSL upgrade & ptest fix
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
X-List-Received-Date: Mon, 09 Jun 2014 15:45:21 -0000

OpenSSL upgrade for master including a number of CVE fixes, plus a fix
for some of the ptest tests.


The following changes since commit a3ee9cc7aebaecfa2223552a2c1865a9337de664:

  wic: check if BBLAYERS is valid before use (2014-06-06 10:29:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/openssl-upgrade
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssl-upgrade

Paul Eggleton (2):
  openssl: upgrade to 1.0.1h
  openssl: fix ptests

 meta/recipes-connectivity/openssl/openssl.inc      |   3 +-
 .../openssl/heartbeat-test-private-api.patch       |  45 +++
 .../openssl/openssl/openssl-CVE-2010-5298.patch    |  24 --
 .../openssl/openssl-CVE-2014-0198-fix.patch        |  23 --
 .../openssl/openssl/openssl-fix-doc.patch          | 401 ---------------------
 .../openssl/openssl/ptest-deps.patch               |  30 ++
 .../{openssl_1.0.1g.bb => openssl_1.0.1h.bb}       |   9 +-
 7 files changed, 81 insertions(+), 454 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/heartbeat-test-private-api.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2010-5298.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-CVE-2014-0198-fix.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-fix-doc.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1g.bb => openssl_1.0.1h.bb} (86%)

-- 
1.9.3


