Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CF90673176
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 13:18:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 11 May 2016 06:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,608,1455004800"; d="scan'208";a="950947399"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.9.63])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2016 06:18:07 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 14:18:03 +0100
Message-Id: <cover.1462972531.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [fido][PATCH 0/1] Fido OpenSSL security upgrade
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
X-List-Received-Date: Wed, 11 May 2016 13:18:22 -0000

Backport a patch from jethro for an OpenSSL upgrade to ensure recent CVE
fixes are included.

The following changes since commit fd27f8620ae4d95dfe07b27eee4256b0a128348a:

  gtk+_2.24.25: backport a fix for building with newer host perl (2016-05-06 15:51:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Robert Yang (1):
  openssl: 1.0.2d -> 1.0.2h (mainly for CVEs)

 .../openssl/0001-Add-test-for-CVE-2015-3194.patch  |  66 ---
 ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 ----
 .../CVE-2015-3194-1-Add-PSS-parameter-check.patch  |  45 --
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  66 ---
 .../openssl/openssl/CVE-2015-3197.patch            |  63 ---
 .../openssl/openssl/CVE-2016-0701_1.patch          | 102 ----
 .../openssl/openssl/CVE-2016-0701_2.patch          | 156 ------
 .../openssl/openssl/CVE-2016-0800.patch            | 198 -------
 .../openssl/openssl/CVE-2016-0800_2.patch          | 592 ---------------------
 .../openssl/openssl/CVE-2016-0800_3.patch          | 503 -----------------
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |  14 +-
 .../openssl/debian1.0.2/block_diginotar.patch      |  17 +-
 .../{debian => debian1.0.2}/version-script.patch   |  35 +-
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  14 +-
 .../{openssl_1.0.2d.bb => openssl_1.0.2h.bb}       |  18 +-
 15 files changed, 40 insertions(+), 1950 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Add-test-for-CVE-2015-3194.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-1-Add-PSS-parameter-check.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
 rename meta/recipes-connectivity/openssl/openssl/{debian => debian1.0.2}/version-script.patch (99%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2h.bb} (67%)

-- 
2.5.5


