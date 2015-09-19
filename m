Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 55BB575E80
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 22:43:11 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nJRrZ4wNBz3hjKj;
	Sun, 20 Sep 2015 00:43:10 +0200 (CEST)
X-Auth-Info: csb0jyoGmDPRSjb6GfzH44BmYZPqZadj6lfuJbgBK30=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nJRrZ1hGqzvdWt;
	Sun, 20 Sep 2015 00:43:10 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Sep 2015 00:43:09 +0200
Message-Id: <1442702597-5619-1-git-send-email-marex@denx.de>
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
X-List-Received-Date: Sat, 19 Sep 2015 22:43:14 -0000

This patchset fixes various minor issues found during the process
of getting Yocto working with the Altera NIOS2 soft-processor.

Marek Vasut (8):
  insane: Add nios2 support
  siteinfo: Add nios2-linux
  kernel-arch: Add nios2 to valid archs
  linux-yocto: depend on libgcc for nios2
  openssl: Add nios2 configuration
  libtool: Fix nios2 support
  pixman: Fix missing FE_DIVBYZERO on nios2
  libgpg-error: Add support for nios2

 meta/classes/insane.bbclass                        |   1 +
 meta/classes/kernel-arch.bbclass                   |   3 +-
 .../openssl/openssl/openssl_add_nios2.patch        |  33 ++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
 meta/recipes-devtools/libtool/libtool-2.4.6.inc    |   1 +
 ...1-libtool-Fix-support-for-NIOS2-processor.patch |  68 ++++
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |  65 ++++
 meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |   1 +
 meta/recipes-kernel/linux/linux-yocto.inc          |   4 +
 .../0001-libgpg-error-Add-nios2-support.patch      |  46 +++
 .../libgpg-error/libgpg-error_1.19.bb              |   4 +-
 meta/site/nios2-linux                              | 395 +++++++++++++++++++++
 12 files changed, 620 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl_add_nios2.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-libtool-Fix-support-for-NIOS2-processor.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-libgpg-error-Add-nios2-support.patch
 create mode 100644 meta/site/nios2-linux

-- 
2.1.4


