Return-Path: <brendan.le.foll@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1E4E473A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:15:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2015 11:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,459,1422950400"; d="scan'208";a="703524751"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by orsmga002.jf.intel.com with ESMTP; 24 Mar 2015 11:15:17 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2015 18:14:57 +0000
Message-Id: <1427220898-30834-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.3.2
Subject: [PATCH][daisy] Update openssl to 1.0.1m
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
X-List-Received-Date: Tue, 24 Mar 2015 18:15:17 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Due to recent security fixes it's advisable to update to the latest openssl
version. I propose an update to 1.0.1m rather than simply patching the
individual CVEs which is much more time consuming/error prone

Brendan Le Foll (1):
  openssl: Upgrade to 1.0.1m

 .../openssl/openssl/configure-targets.patch        | 28 +++----
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 17 +++--
 .../openssl/openssl/initial-aarch64-bits.patch     | 87 ++++++++++++++--------
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 19 +++--
 ...NULL-pointer-dereference-in-dh_pub_encode.patch | 39 ----------
 .../openssl/openssl/openssl_fix_for_x32.patch      | 83 ++++++++-------------
 .../recipes-connectivity/openssl/openssl_1.0.1j.bb | 57 --------------
 .../recipes-connectivity/openssl/openssl_1.0.1m.bb | 56 ++++++++++++++
 8 files changed, 175 insertions(+), 211 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.1m.bb

-- 
2.3.2


