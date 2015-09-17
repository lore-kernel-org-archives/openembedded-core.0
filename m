Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE3477003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:41:20 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nH12f650Zz3hj6C;
	Thu, 17 Sep 2015 16:31:54 +0200 (CEST)
X-Auth-Info: oFbAPOoY9sSkj2K2Cjkj828kvzAhOgyRmYAkFdyau2o=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nH12f40ffzvdWt;
	Thu, 17 Sep 2015 16:31:54 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:31:49 +0200
Message-Id: <1442500317-9064-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 0/8] nios2 fixes
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
X-List-Received-Date: Thu, 17 Sep 2015 14:41:20 -0000

This patchset fixes various minor issues found during the process
of getting Yocto working with the Altera NIOS2 soft-processor.

Marek Vasut (8):
  insane: Add nios2 support
  kernel-arch: Add nios2 to valid archs
  linux-yocto: depend on libgcc for nios2
  openssl: Add nios2 configuration
  siteinfo: Add nios2-linux
  libtool: Fix nios2 support
  pixman: Fix missing FE_DIVBYZERO on nios2
  libgpg-error: Add support for nios2

 meta/classes/insane.bbclass                        |   1 +
 meta/classes/kernel-arch.bbclass                   |   3 +-
 .../openssl/openssl/openssl_add_nios2.patch        |  32 ++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
 meta/recipes-devtools/libtool/libtool-2.4.6.inc    |   1 +
 ...1-libtool-Fix-support-for-NIOS2-processor.patch |  67 ++++
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |  65 ++++
 meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |   1 +
 meta/recipes-kernel/linux/linux-yocto.inc          |   4 +
 .../0001-libgpg-error-Add-nios2-support.patch      |  45 +++
 .../libgpg-error/libgpg-error_1.19.bb              |   4 +-
 meta/site/nios2-linux                              | 395 +++++++++++++++++++++
 12 files changed, 617 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
 create mode 100644 meta/site/nios2-linux

-- 
2.1.4


