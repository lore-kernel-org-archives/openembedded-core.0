Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E443965DAB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 21:33:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2014 11:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,819,1389772800"; d="scan'208";a="489410051"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.244])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2014 11:37:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 19:37:36 +0100
Message-Id: <cover.1396982039.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [dylan][PATCH 0/4] OpenSSL CVE fixes for the dylan branch
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
X-List-Received-Date: Tue, 08 Apr 2014 21:33:39 -0000

Three backports for CVE fixes from master, plus one new fix for the 
latest CVE (CVE-2014-0160). The latter is not needed for master with
Cristiana's upgrade to version 1.0.1g sent out today, and see my other
series for dora.


The following changes since commit 58b479f4d4d283e590a55a71151fca481fbe3c24:

  packagegroup-self-hosted: Add missing python code (2014-03-20 22:43:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/openssl-cves-dylan
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/openssl-cves-dylan

Paul Eggleton (1):
  openssl: backport fix for CVE-2014-0160

Yue Tao (3):
  Security Advisory - openssl - CVE-2013-4353
  Security Advisory - openssl - CVE-2013-6450
  Security Advisory - openssl - CVE-2013-6449

 ...DTLS-retransmission-from-previous-session.patch |  81 ++++++++++++++
 ...or-TLS-record-tampering-bug-CVE-2013-4353.patch |  31 ++++++
 ...e-version-in-SSL_METHOD-not-SSL-structure.patch |  33 ++++++
 .../openssl/openssl-1.0.1e/CVE-2014-0160.patch     | 118 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   4 +
 5 files changed, 267 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/CVE-2014-0160.patch

-- 
1.9.0


