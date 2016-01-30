Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id CCD90771A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 06:28:34 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id 6so82538989qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=su9MEJuogQAjQHTyZzCuCxkteW5l1bGAaY2VBzxlFRI=;
	b=Mgezr/ya3EtSS889rcYRvjAtv+dKQjMRQl+eCTUWmz2vxfNOHWE4yKJyB+ngt17IPp
	aBcCEf+6SqgDz3jzzaNixi3PYnifG6QBby82SLXgBYq7LtMMk9jv+Fr6xjpUM/V8Cnxx
	p4ybhGeuTS79hMhZnj/M8aEOAHO2OuJcbcgzuwMUcFeKs5A8LJgrpHhCGUHThPP9m8gb
	bxNcQx9QLxrW+snA1UXSTAV/XEkF0GaU543LsCaJPtJtTLVPYXC+Bkp5Cuddyg8qlmKe
	EtfsL8NXpn4mVstTSEkL55Wk3Evu/e0ddFLX6IdUoCYSsfNh3HwGqD+z3DsdkXKLINCp
	jl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=su9MEJuogQAjQHTyZzCuCxkteW5l1bGAaY2VBzxlFRI=;
	b=RK6Uh6TE6Sze34uH54waeNmWJKWAjWBa1zlfiEFxxIuEgkSf3gIqtu+3VZl5FlN7zU
	yqJUYXj674oNvByyjAZh6d9xQq26uzvictS76amXCnmtFgtvu67Vc2MnF0wBJGvqVcq8
	8wvcjQX1m7U1taBTMskSojhnUjSWy+28wez65Q6GNSQqEQ6GC9pQJrS3A+qLajY0wSov
	D77aYFm6is9ETjJ35IY1JWf6RMyBNzuN+2boMK8q9Jyb8E4o8XCsG6gk40HgZsleO4xc
	vSE1VdEwS13atK8AsHKYywdOywBqhqRybO9oM34K4fzKQQs3ViXh0V4FVVZD3yyYtMx8
	rvJw==
X-Gm-Message-State: AG10YOSEGRrHvNxJl8nIKgL/2TWyVD3ICkJMkEHidfaU9l1w8qAf44GHfACsg8cWwMp9vA==
X-Received: by 10.140.226.8 with SMTP id w8mr16589552qhb.83.1454135315140;
	Fri, 29 Jan 2016 22:28:35 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm8615688qge.7.2016.01.29.22.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 22:28:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jan 2016 06:28:29 +0000
Message-Id: <cover.1454135035.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 0/2] binutils 2.26 upgrade
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
X-List-Received-Date: Sat, 30 Jan 2016 06:28:35 -0000

Upgrade binutils to 2.26
Fix gcc for ppc to not enforce spe by default to assembler
use -mno-spe for 74xx

Khem Raj (2):
  gcc,qemuppc: Explicitly disable forcing SPE flags
  binutils: Upgrade to 2.26

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/conf/machine/include/tune-ppc7400.inc         |    2 +-
 meta/conf/machine/qemuppc.conf                     |    2 +
 .../{binutils-2.25.1.inc => binutils-2.26.inc}     |   10 +-
 ...n_2.25.1.bb => binutils-cross-canadian_2.26.bb} |    0
 ...tils-cross_2.25.1.bb => binutils-cross_2.26.bb} |    0
 ...rosssdk_2.25.1.bb => binutils-crosssdk_2.26.bb} |    0
 .../binutils/0001-Generate-relocatable-SDKs.patch  |   12 +-
 ...ure-widen-the-regexp-for-SH-architectures.patch |   14 +-
 .../0003-Point-scripts-location-to-libdir.patch    |   14 +-
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   12 +-
 .../0005-Explicitly-link-with-libm-on-uclibc.patch |   10 +-
 .../binutils/binutils/0006-Use-libtool-2.4.patch   | 2916 ++++++++++++++++----
 ...7-Add-the-armv5e-architecture-to-binutils.patch |   10 +-
 ...he-distro-compiler-point-to-the-wrong-ins.patch |   10 +-
 ...s-of-system-directories-when-cross-linki.patch} |   93 +-
 ...-rpath-in-libtool-when-sysroot-is-enabled.patch |    6 +-
 ...Change-default-emulation-for-mips64-linux.patch |   14 +-
 .../0012-Add-XLP-instructions-support.patch        |  146 +-
 ...rnal-error-in-do_print_to_mapfile-seen-wi.patch |   35 -
 ...4-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch |   25 -
 ...-list-so-that-symbols-not-in-the-list-are.patch |  131 -
 ...h-adds-IFUNC-support-for-arm-gold-backend.patch | 1004 -------
 .../binutils/add-thunderx-support-for-gas.patch    |   33 -
 .../binutils/binutils/binutils-octeon3.patch       |  272 --
 .../{binutils_2.25.1.bb => binutils_2.26.bb}       |    0
 ...AltiVec-generation-on-powepc-linux-target.patch |   24 +-
 27 files changed, 2606 insertions(+), 2191 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.25.1.inc => binutils-2.26.inc} (76%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.25.1.bb => binutils-cross-canadian_2.26.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.25.1.bb => binutils-cross_2.26.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.25.1.bb => binutils-crosssdk_2.26.bb} (100%)
 rename meta/recipes-devtools/binutils/binutils/{0009-Upstream-Status-Inappropriate-distribution-codesourc.patch => 0009-warn-for-uses-of-system-directories-when-cross-linki.patch} (82%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support-for-arm-gold-backend.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
 rename meta/recipes-devtools/binutils/{binutils_2.25.1.bb => binutils_2.26.bb} (100%)

-- 
2.7.0


