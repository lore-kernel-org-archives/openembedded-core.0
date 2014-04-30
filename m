Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 870BD65DFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 15:49:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2014 08:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,959,1389772800"; d="scan'208";a="523845866"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2014 08:39:43 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 18:39:30 +0300
Message-Id: <cover.1398871949.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] gnutls: update to 3.2.13
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
X-List-Received-Date: Wed, 30 Apr 2014 15:49:34 -0000

Make sure you merge "wpa-supplicant: add libgcrypt as a dependencie"
and "nettle: add nettle to poky" before you test the new version of
gnutls.

The following changes since commit 17daa2ba6280304771c5fe52b94eb56f0c087490:

  bitbake: bb.utils, bb.codeparser: Add bb.utils.contains_any (2014-04-29 23:38:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib vpopa/gnutls_upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/gnutls_upgrade

Valentin Popa (3):
  nettle: add nettle to poky
  gnutls: update to 3.2.13
  wpa-supplicant: add libgcrypt as a dependencie

 .../wpa-supplicant/wpa-supplicant.inc              |   2 +-
 meta/recipes-support/gnutls/gnutls.inc             |  28 +-
 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    | 636 ---------------------
 .../CVE-2014-0092-corrected-return-codes.patch     | 106 ----
 ...14-1959-rejection-of-v1-intermediate-cert.patch |  33 --
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |  51 --
 .../gnutls/gnutls/configure-fix.patch              |  65 ---
 .../correct_rpl_gettimeofday_signature.patch       |  36 +-
 .../gnutls/gnutls/fix-gettext-version.patch        |  46 --
 .../gnutls/gnutls/gnutls-openssl.patch             | 126 ----
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |  16 -
 meta/recipes-support/gnutls/gnutls_3.2.13.bb       |   7 +
 meta/recipes-support/nettle/nettle_2.7.1.bb        |  22 +
 13 files changed, 65 insertions(+), 1109 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/configure-fix.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.23.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.2.13.bb
 create mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb

-- 
1.9.1


