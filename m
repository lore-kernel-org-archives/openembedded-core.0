Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 692DC6B5C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 23:00:32 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l7so4926034ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 16:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BycP/zu+7OF6knf4SvPqrNRz59cn11dngC8oLFCy8/I=;
	b=HbFbMgde8gO7kaPODbpqY/YSytpO1p08HKCk+cdcXAhOmW0GRXUHsnAwVyScczhaMx
	5yPWA5emVe2APrwCsG7zdWpHHUJbhoY9qh8+VE726WmQyD3vyi0PxWl4Cf7tLC1Vn2Lc
	xRyDhrwLI2cs6Tt6gBuoKfXEUAtPYQK1PxClzViVMnrfmL870xKqoVHxJIdXqvMynbMj
	MWI7wIbkkMwdhAnidZeD/eyEKpu7hZnMYxJpt8clKxLLwpCyDyak1SdIzJVQDDgsX4rX
	1odf2vnZHLuqE42PyZw7j6uE6iW3wY/OjuOCaSNFec3Drb7D0oqsUlUKaJ8NUzg3j/fh
	e6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BycP/zu+7OF6knf4SvPqrNRz59cn11dngC8oLFCy8/I=;
	b=WD3pWfDQ6WHZP5RtaSQK5c4uMV7L85TYC6/8DVKyPz1c/xopMlzl7UrqO8GoHRLpSa
	Jlpv70RIQ6E4v4tyAsKhyduIxaLr3XKP8Ge+AliHEQV5PaNRGYI5o7RpK/wPUJekWqp0
	sB85I0P7no+d1K2+9sxprcK7ZI4ZLAIeMIXBCctZpdqBPKQ06ZCrd5Gu9YK+sFKfOVJ3
	GgM0VillrjnnA8ArANH/76I1OAl0sOgMWDC5/MynWolOV81v2Z6bPJ06akumOQQWBzcm
	GeB+6gIkIFkaSzJsWjKGWhH61U7H7r00G4aQkiYkgszeB0ZnKuKrtjWNih+/Ub1+bgzC
	rYYg==
X-Gm-Message-State: APjAAAVfLG/RA3UqMcoqfSsdoQCm52vyaCJR4xujm1YEs81eP0rfL3JA
	KotSOck5hohcKnuzly1GF6KYFxiJo6s=
X-Google-Smtp-Source: APXvYqxnLBx5mW6G6Df/z+U6fJD8IPuuvPvaoO+SEqrl2z17D8+Q1G7MeHuDx/OYk3z8Ec1MUenzdg==
X-Received: by 2002:a2e:89c7:: with SMTP id c7mr2499362ljk.187.1553986832664; 
	Sat, 30 Mar 2019 16:00:32 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id o3sm1000863lfd.53.2019.03.30.16.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Mar 2019 16:00:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 00:00:29 +0100
Message-Id: <20190330230029.8442-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ethtool: update to 5.0
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
X-List-Received-Date: Sat, 30 Mar 2019 23:00:32 -0000

Changelog:
- Feature: don't report UFO on kernels v4.14 and above
- Fix: zero initialize coalesce struct
- Feature: dsa: add pretty dump
- Feature: dsa: mv88e6xxx: add pretty dump
- Feature: dsa: mv88e6xxx: add pretty dump for 88E6185
- Feature: dsa: mv88e6xxx: add pretty dump for 88E6161
- Feature: dsa: mv88e6xxx: add pretty dump for 88E6352
- Feature: dsa: mv88e6xxx: add pretty dump for 88E6390
- Feature: dsa: mv88e6xxx: add pretty dump for others

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch                | 2 +-
 .../ethtool/{ethtool_4.19.bb => ethtool_5.0.bb}               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.19.bb => ethtool_5.0.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index beae5f98c3..b145188d7f 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index e891d91..600f8a8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 4.19, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.0, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_4.19.bb b/meta/recipes-extended/ethtool/ethtool_5.0.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.19.bb
rename to meta/recipes-extended/ethtool/ethtool_5.0.bb
index 74e255c24b..76cdf9c4e7 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.19.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "a533db1d202724822c4ef297643fac12"
-SRC_URI[sha256sum] = "e8e88f5a79c78e542cd84fee60b67dbf29cee63e4760e8d61544fea74c761ad1"
+SRC_URI[md5sum] = "8998c9eb7e491b0aec420a807ce52ba6"
+SRC_URI[sha256sum] = "cc53a6d4d5643f8993ef20d6b638f88d9035529a9e777e222073c3a5b9237178"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.17.1


