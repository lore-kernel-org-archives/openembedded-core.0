Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id BFA227D253
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 21:28:25 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id f1so9474264lfl.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 14:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NvQvc807hVrfkQWJscxBCnaU7gxEqsAMqvsgfs5FCHk=;
	b=zlSLrWcm3zqj8So4B+eZbwzxFKIWydlKyc8FUhqRmvHTJkBizK+mGJN0vzDgpaHkx2
	DOGLC6+VmgD7MgPModhSEMgrdns34dOq4XIGYkRZi5mPU0G+7bbzdv5uVx5Gtjkf+Tt4
	032fgG4syxp8mnomHlz6tvcYcNj17X/OGDhh6YUCuvAnTWjQlRg+Q1V90tSZOedvdX9f
	KlBay/GsxLZ5fBD2hREEyy8wNIy06NEFQ3ZDxS3rKfAWd24Vs/mLNGKXDp3ku0poSX4M
	VgbFgm/oOm/mDE8l/m4k0HrQC3IqAg/bX8VdxrJfnYns0zzpEkAhJ/09yfeCE3xX2dNH
	Lz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NvQvc807hVrfkQWJscxBCnaU7gxEqsAMqvsgfs5FCHk=;
	b=BOsmOR+10sL7Zkg4bzZ8KUjbp6f4nUxZsQ09cuCyhK5bCR67pW/eCyO1DlQpaTvgKj
	HaetABxHjZc+Yv2Uju1S51ogsYIpmKAJdsXkceZKTn4QH2knytvnzO1jlh9OZZn+d9ek
	c0ObOYlHjZh004iSZ4rBODSNFa+HoXSHhg9jWCMHD8yQ8kawm0v+6eauy/mEvcrGUys6
	poormg0ihv6c8yHr0mTjc2zHVibY2kVGh7NAiqOpgZ6iZFBrzr57aAvQQJfXfugb63IN
	rN96EpdmsMl5s/ky7dFXchu35QVzWAcNxQggiiNVEcmZUUO8RB8gZzU6MgbgXgA9l0Um
	VGjA==
X-Gm-Message-State: APjAAAVCCt7xHiPQnQktc8IVTnaEbSV0tSeS9st0vM3XJ4lMoo9jQTSL
	CkHXSzGjScHAx6oOHmkcwqxBVDyOtcc=
X-Google-Smtp-Source: APXvYqxwP7eH/6blI9J625oFYFhiADWShxjo2Sjb+Id89iGw0fyPMIV7Zted1o0vboPub3MfXb8DtQ==
X-Received: by 2002:a19:d106:: with SMTP id i6mr4386261lfg.8.1558819705634;
	Sat, 25 May 2019 14:28:25 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	i14sm1284823ljj.57.2019.05.25.14.28.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 May 2019 14:28:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 May 2019 23:28:20 +0200
Message-Id: <20190525212820.21618-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ethtool: update to 5.1
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
X-List-Received-Date: Sat, 25 May 2019 21:28:26 -0000

Changelog:
* Feature: Add support for 200Gbps (50Gbps per lane) link mode
* Feature: simplify handling of PHY tunable downshift
* Feature: add support for PHY tunable Fast Link Down
* Feature: add PHY Fast Link Down tunable to man page
* Feature: Add a 'start N' option when specifying the Rx flow hash indirection table.
* Feature: Add bash-completion script
* Feature: add 10000baseR_FEC link mode name
* Fix: qsfp: fix special value comparison
* Feature: move option parsing related code into function
* Feature: move cmdline_coalesce out of do_scoalesce
* Feature: introduce new ioctl for per-queue settings
* Feature: support per-queue sub command --show-coalesce
* Feature: support per-queue sub command --coalesce
* Fix: fix up dump_coalesce output to match actual option names
* Feature: fec: add pretty dump

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch         | 10 ++++++----
 .../ethtool/{ethtool_5.0.bb => ethtool_5.1.bb}         |  7 ++++---
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.0.bb => ethtool_5.1.bb} (84%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index b145188d7f..7a0e38a394 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 1484545a150de79483b6e2a74be02ebd030f1920 Mon Sep 17 00:00:00 2001
+From 2ca4c2492c4a06b28012e3e1033d10aa48f153b4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -9,17 +9,16 @@ serial-tests is required to generate those targets.
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
 (default automake behavior incompatible with ptest)
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e891d91..600f8a8 100644
+index 2941a65..b0a1896 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.0, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.1, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
@@ -27,3 +26,6 @@ index e891d91..600f8a8 100644
  AC_CONFIG_HEADERS([ethtool-config.h])
  
  AM_MAINTAINER_MODE
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ethtool/ethtool_5.0.bb b/meta/recipes-extended/ethtool/ethtool_5.1.bb
similarity index 84%
rename from meta/recipes-extended/ethtool/ethtool_5.0.bb
rename to meta/recipes-extended/ethtool/ethtool_5.1.bb
index 76cdf9c4e7..d379d93bcf 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.0.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.1.bb
@@ -11,10 +11,11 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "8998c9eb7e491b0aec420a807ce52ba6"
-SRC_URI[sha256sum] = "cc53a6d4d5643f8993ef20d6b638f88d9035529a9e777e222073c3a5b9237178"
+SRC_URI[md5sum] = "5d3aad86aec055348a37e867695a744a"
+SRC_URI[sha256sum] = "4edb1fa4d7cf5667a5958d4213f61609f96d02cda90d2b6ec440561f8f8ffbf2"
+
+inherit autotools ptest bash-completion
 
-inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
 
 do_compile_ptest() {
-- 
2.17.1


