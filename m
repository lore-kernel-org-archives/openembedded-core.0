Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 08B7865D89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 11:54:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2014 04:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,817,1389772800"; d="scan'208";a="516833258"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2014 04:49:01 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 14:49:47 +0300
Message-Id: <cover.1396957462.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] openssl upgrade
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
X-List-Received-Date: Tue, 08 Apr 2014 11:54:35 -0000

The trigger for the upgrade was the serious "heartbleed" vulnerability (CVE-2014-0160). 
More information: http://www.itnews.com.au/News/382068,serious-openssl-bug-renders-websites-wide-open.aspx
Tested locally on a core-image-sato. Tested with  openssl speed benchmark and
commands like version and help.
I am currently building on localautobuilder on major archs, but this will take some time.
I will announce in case of failure.

The following changes since commit bb66113bde5361b869dce2bdaece5b938f077ea8:

  bitbake: fetch2: Fix bug in file checksum generation (2014-04-06 11:31:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/openssl-upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/openssl-upgrade

Cristiana Voicu (1):
  openssl: Upgrade to v1.0.1g

 ...DTLS-retransmission-from-previous-session.patch |   81 ------
 ...or-TLS-record-tampering-bug-CVE-2013-4353.patch |   31 ---
 ...e-version-in-SSL_METHOD-not-SSL-structure.patch |   33 ---
 meta/recipes-connectivity/openssl/openssl.inc      |    3 -
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../{openssl-1.0.1e => openssl}/debian/ca.patch    |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../{openssl-1.0.1e => openssl}/debian/pic.patch   |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../openssl/{openssl-1.0.1e => openssl}/find.pl    |    0
 .../fix-cipher-des-ede3-cfb1.patch                 |    0
 .../initial-aarch64-bits.patch                     |  108 ++++----
 .../{openssl-1.0.1e => openssl}/oe-ldflags.patch   |    0
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |    0
 ...NULL-pointer-dereference-in-dh_pub_encode.patch |    0
 .../openssl-fix-des.pod-error.patch                |    0
 .../openssl-fix-doc.patch                          |  280 +++++++++-----------
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../{openssl-1.0.1e => openssl}/shared-libs.patch  |    0
 .../{openssl_1.0.1e.bb => openssl_1.0.1g.bb}       |    9 +-
 28 files changed, 183 insertions(+), 362 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/fix-cipher-des-ede3-cfb1.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/initial-aarch64-bits.patch (43%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-fix-doc.patch (47%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1e.bb => openssl_1.0.1g.bb} (81%)

-- 
1.7.9.5


