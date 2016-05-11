Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 917456E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:43:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4B7hTaK006862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 00:43:29 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 May 2016 00:43:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 00:43:27 -0700
Message-ID: <cover.1462952554.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] [jethro] openssl: 1.0.2d -> 1.0.2h (mainly for CVEs)
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
X-List-Received-Date: Wed, 11 May 2016 07:43:30 -0000
Content-Type: text/plain

The following changes since commit 69b49e8dc45cf60defba547d93e663df42c92127:

  boot-directdisk.bbclass: remove HDDIMG before create (2016-05-09 14:37:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/openssl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/openssl

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
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2h.bb} (73%)

-- 
2.8.0


