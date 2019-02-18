Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 485216D767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 22:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5E4B40B8F;
	Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gIkjzhcAVDMS; Mon, 18 Feb 2019 22:49:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 98A97407F9;
	Mon, 18 Feb 2019 22:49:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 091DB16B4B6;
	Mon, 18 Feb 2019 17:49:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 17:49:01 -0500
Message-Id: <cover.1550529998.git.denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 0/6] Recipe updates
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
X-List-Received-Date: Mon, 18 Feb 2019 22:57:05 -0000

From: Denys Dmytriyenko <denys@ti.com>

Update lz4, lzip, lzop, gzip, grep and hdparm to the latest.

Build-tested against qemu targets, plus x32 and musl.

The following changes since commit 93c6e5023d74bf6fae8e3a70afd9dca6b1ab555a:

  glib-2.0: Improve shared-mime-info dependency handling (2019-02-18 10:33:08 +0000)

are available in the git repository at:

  git://push.openembedded.org/openembedded-core-contrib denix/master

Denys Dmytriyenko (6):
  lz4: upgrade 1.8.2 -> 1.8.3
  lzip: upgrade 1.20 -> 1.21
  hdparm: upgrade 9.56 -> 9.58
  lzop: upgrade 1.03 -> 1.04
  gzip: upgrade 1.9 -> 1.10
  grep: upgrade 3.1 -> 3.3

 ...need_charset_alias-when-building-for-musl.patch |  33 ----
 .../grep/{grep_3.1.bb => grep_3.3.bb}              |  10 +-
 .../{gzip-1.9 => gzip-1.10}/wrong-path-fix.patch   |   0
 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch   | 189 ---------------------
 .../gzip/{gzip_1.9.bb => gzip_1.10.bb}             |   6 +-
 .../hdparm/{hdparm_9.56.bb => hdparm_9.58.bb}      |   4 +-
 .../lzip/{lzip_1.20.bb => lzip_1.21.bb}            |   4 +-
 .../lz4/{lz4_1.8.2.bb => lz4_1.8.3.bb}             |   2 +-
 ...inlines-as-the-external-inline-definition.patch | 100 -----------
 .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch |  37 ----
 .../lzop/lzop/x32_abi_miniacc_h.patch              |  36 ----
 .../lzop/{lzop_1.03.bb => lzop_1.04.bb}            |  11 +-
 12 files changed, 15 insertions(+), 417 deletions(-)
 delete mode 100644 meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-extended/grep/{grep_3.1.bb => grep_3.3.bb} (74%)
 rename meta/recipes-extended/gzip/{gzip-1.9 => gzip-1.10}/wrong-path-fix.patch (100%)
 delete mode 100644 meta/recipes-extended/gzip/gzip-1.9/gnulib.patch
 rename meta/recipes-extended/gzip/{gzip_1.9.bb => gzip_1.10.bb} (88%)
 rename meta/recipes-extended/hdparm/{hdparm_9.56.bb => hdparm_9.58.bb} (90%)
 rename meta/recipes-extended/lzip/{lzip_1.20.bb => lzip_1.21.bb} (88%)
 rename meta/recipes-support/lz4/{lz4_1.8.2.bb => lz4_1.8.3.bb} (94%)
 delete mode 100644 meta/recipes-support/lzop/lzop/0001-use-static-inlines-as-the-external-inline-definition.patch
 delete mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
 delete mode 100644 meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
 rename meta/recipes-support/lzop/{lzop_1.03.bb => lzop_1.04.bb} (66%)

-- 
2.7.4


