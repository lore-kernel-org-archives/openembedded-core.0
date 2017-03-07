Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id AAD737752E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 08:20:04 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id w189so71822394pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 00:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4lbjIYyJcxh8Rj33G9uHhI7qgnRxQYHRd9hsM+KXb9Y=;
	b=OyhUMDEDBpSkwdIZWZ4vaw4qUWgPcRJXJSjhwIiqEpw66d1Ev2J98RkB1q4bUqYArc
	tPMTEugym5nx0egJPUjEIrbRNKXZiwNzxTzuqAE1oI8n3UzKQry6JoqKirD6JIRDWh4Y
	xq7LNnCiSbuQ9oxFjWblt15ZinVw48qgByqF3DliNyDkH9bJl+fpW6kfU1sGlzJa7mt9
	wJeydU+X1XxMBl5/nZr7UxsHke4AzE+fdNqnMdtocLcy64LiAc3oiW1pgyOKTEpjLisH
	mi0ugv9pY06/hGK8C9faxM/lwXGkSw8e99aKkAsNz518uyLAwQ7hRaqDe3SjkNYmBYnc
	RDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4lbjIYyJcxh8Rj33G9uHhI7qgnRxQYHRd9hsM+KXb9Y=;
	b=Lrrewxfr63RLMX6woa+qFtH1/LZacqyBobNeATgCbQGGq09Y7C/YGxcDaZPBbVgV7f
	rKs2sUAmpwfqnvWBg6QNiWEgRpMzaNL/hNsPdAOnnvJOOk/xeThO+LKLBJGWhYIGupqL
	P2KTvNgDJbUaeJLBfp7BPiijkD2z6EAuKmrWXZTuX3PbuYVNN0W0/IHRmhCijLOrXNB0
	Gv1LuFi9GNvCmYlMVhsh/oOTmbOGQ9vfFaW6ClSmai3AtkHbTE+60jhtbv8Mv2SsPjSq
	B6gLWmpRkb3FLSI2+szkt5lFaNlpA8HxApD8mZXL5yqI2IAkG09l30LtRH0tDy9xrP2+
	81LQ==
X-Gm-Message-State: AMke39ny59Yc/RJuonMHSy85iB91h52XEDNWyG+Afprrdu+rCUTYIfX5aDdgF94pAsFoOQ==
X-Received: by 10.99.121.77 with SMTP id u74mr25928705pgc.200.1488874806316;
	Tue, 07 Mar 2017 00:20:06 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	128sm44026536pfe.23.2017.03.07.00.20.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 00:20:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 00:19:52 -0800
Message-Id: <cover.1488874598.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/2] binutils 2.28 update
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
X-List-Received-Date: Tue, 07 Mar 2017 08:20:05 -0000

musl update needs to go along since it needs a patch to work with binutils 2.28

The following changes since commit 784a8379260759700ab8482b1699c9567d6e9f3f:

  tzdata: update to 2017a (2017-03-04 23:18:10 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/binutils-2.28
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.28

Khem Raj (2):
  musl: Update to tip
  binutils: Upgrade to 2.28 release

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-core/musl/musl_git.bb                 |    2 +-
 .../{binutils-2.27.inc => binutils-2.28.inc}       |   33 +-
 ...ian_2.27.bb => binutils-cross-canadian_2.28.bb} |    0
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +-
 ...nutils-cross_2.27.bb => binutils-cross_2.28.bb} |    0
 ...-crosssdk_2.27.bb => binutils-crosssdk_2.28.bb} |    2 +-
 ...utils-crosssdk-Generate-relocatable-SDKs.patch} |   16 +-
 ...01-ppc-apuinfo-for-spe-parsed-incorrectly.patch |   37 -
 ...ss-Do-not-generate-linker-script-directo.patch} |   26 +-
 ...03-gprof-add-uclibc-support-to-configure.patch} |   37 +-
 ...=> 0004-Point-scripts-location-to-libdir.patch} |   12 +-
 ...e-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   12 +-
 ...0006-Explicitly-link-with-libm-on-uclibc.patch} |   12 +-
 ...ibtool-2.4.patch => 0007-Use-libtool-2.4.patch} | 1046 ++++++++++----------
 ...-Add-the-armv5e-architecture-to-binutils.patch} |   10 +-
 ...e-distro-compiler-point-to-the-wrong-ins.patch} |   10 +-
 ...s-of-system-directories-when-cross-linki.patch} |   42 +-
 ...rpath-in-libtool-when-sysroot-is-enabled.patch} |    8 +-
 ...hange-default-emulation-for-mips64-linux.patch} |   14 +-
 ...tch => 0013-Add-support-for-Netlogic-XLP.patch} |   74 +-
 ...correct-assembling-for-ppc-wait-mnemonic.patch} |   12 +-
 ..._sections-check-to-only-consider-compact-.patch |   97 --
 .../0015-binutils-mips-gas-pic-relax-linkonce.diff |   65 --
 ...tch => 0015-sync-with-OE-libtool-changes.patch} |   57 +-
 ...lt-in-ARM-linker-when-trying-to-parse-a-b.patch |   31 -
 ...eration-of-alignment-frags-in-code-sectio.patch |  139 ---
 .../{binutils_2.27.bb => binutils_2.28.bb}         |    0
 28 files changed, 674 insertions(+), 1124 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.27.inc => binutils-2.28.inc} (47%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.27.bb => binutils-cross-canadian_2.28.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.27.bb => binutils-cross_2.28.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.27.bb => binutils-crosssdk_2.28.bb} (80%)
 rename meta/recipes-devtools/binutils/binutils/{0001-Generate-relocatable-SDKs.patch => 0001-binutils-crosssdk-Generate-relocatable-SDKs.patch} (84%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
 rename meta/recipes-devtools/binutils/binutils/{no-tooldirpaths.patch => 0002-binutils-cross-Do-not-generate-linker-script-directo.patch} (75%)
 rename meta/recipes-devtools/binutils/binutils/{0002-configure-widen-the-regexp-for-SH-architectures.patch => 0003-gprof-add-uclibc-support-to-configure.patch} (42%)
 rename meta/recipes-devtools/binutils/binutils/{0003-Point-scripts-location-to-libdir.patch => 0004-Point-scripts-location-to-libdir.patch} (80%)
 rename meta/recipes-devtools/binutils/binutils/{0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch => 0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (79%)
 rename meta/recipes-devtools/binutils/binutils/{0005-Explicitly-link-with-libm-on-uclibc.patch => 0006-Explicitly-link-with-libm-on-uclibc.patch} (84%)
 rename meta/recipes-devtools/binutils/binutils/{0006-Use-libtool-2.4.patch => 0007-Use-libtool-2.4.patch} (97%)
 rename meta/recipes-devtools/binutils/binutils/{0007-Add-the-armv5e-architecture-to-binutils.patch => 0008-Add-the-armv5e-architecture-to-binutils.patch} (83%)
 rename meta/recipes-devtools/binutils/binutils/{0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (82%)
 rename meta/recipes-devtools/binutils/binutils/{0009-warn-for-uses-of-system-directories-when-cross-linki.patch => 0010-warn-for-uses-of-system-directories-when-cross-linki.patch} (90%)
 rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (90%)
 rename meta/recipes-devtools/binutils/binutils/{0011-Change-default-emulation-for-mips64-linux.patch => 0012-Change-default-emulation-for-mips64-linux.patch} (88%)
 rename meta/recipes-devtools/binutils/binutils/{0012-Add-support-for-Netlogic-XLP.patch => 0013-Add-support-for-Netlogic-XLP.patch} (90%)
 rename meta/recipes-devtools/binutils/binutils/{0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (76%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff
 rename meta/recipes-devtools/binutils/binutils/{0014-libtool-remove-rpath.patch => 0015-sync-with-OE-libtool-changes.patch} (72%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
 rename meta/recipes-devtools/binutils/{binutils_2.27.bb => binutils_2.28.bb} (100%)

-- 
2.12.0


