Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 18C9E6B7D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:53:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="554544776"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:53:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:53:42 +0100
Message-Id: <cover.1402329156.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dora][PATCH 0/6] OpenSSL CVE fixes for the dora branch
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
X-List-Received-Date: Mon, 09 Jun 2014 15:53:57 -0000

The following changes since commit 68da848e0f7f026bf18707d8d59143177ff66f9b:

  gnutls: patch for CVE-2014-3466 backported (2014-06-06 10:27:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/openssl-dora
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssl-dora

Paul Eggleton (5):
  openssl: fix CVE-2014-0195
  openssl: use upstream fix for CVE-2014-0198
  openssl: fix CVE-2014-0221
  openssl: fix CVE-2014-0224
  openssl: fix CVE-2014-3470

Yue Tao (1):
  openssl: fix for CVE-2010-5298

 .../openssl-1.0.1e-cve-2014-0195.patch             |  40 ++++++++
 .../openssl-1.0.1e-cve-2014-0198.patch             |  38 ++++++++
 .../openssl-1.0.1e-cve-2014-0221.patch             |  38 ++++++++
 .../openssl-1.0.1e-cve-2014-0224.patch             | 103 +++++++++++++++++++++
 .../openssl-1.0.1e-cve-2014-3470.patch             |  31 +++++++
 .../openssl-1.0.1e/openssl-CVE-2010-5298.patch     |  24 +++++
 .../openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch |  23 -----
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   7 +-
 8 files changed, 280 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0195.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0198.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0221.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0224.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-3470.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2010-5298.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-CVE-2014-0198-fix.patch

-- 
1.9.3


