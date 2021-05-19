Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web10.1454.1621468469791684270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 16:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ciWpqjj6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621468467; i=@fujitsu.com;
	bh=K7ENaKZgpOwX0H1/jUTuafcEYGnc5iY2mY0wUp3Frq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ciWpqjj68TA3HMwsA6EUcwTC0rlmbgzrj/JnL9NqesR6vGCN7sDrJuD4c62eVhaZd
	 f73HEolNL7l8EHSQ5cM9Ls0pI9nyQqOUR2vL3UOLIDIOsFFog3rUNWcV4we00LQ+Be
	 SIqegUKVoBcmdk4Yz1cH0BY5UTH90ztpjM//343BvwKwBREmP4LiCDdTEocPvqRmbR
	 9MJJs78X2sP41KNTJs3Mfd+jDcQHDOZos+/2ao/Hpkgf0xO/pEOldXMbye40qwzrbA
	 kcFpyiXtLgoThp02rYqTdopchIzckckG78aAMH66Rn3jdOLcw1lSTRiUjp8oA/r7U3
	 16AhGPV5JcZvQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 4D/42-55921-235A5A06; Wed, 19 May 2021 23:54:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MRqmu0dGm
  CwddXihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bklmMsBY95Kua//c/awDiDu4uRi0NIYBaT
  xLJ7r5khnBOMEvsfdjN1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sILawgK3E6
  dOfmUFKWARUJe71OoGYvAJOEnu/p4BUSAgoSEx5+J4ZxOYUcJZY1/4KrFMIqGTNqi1gcV4BQY
  mTM5+wQEyXkDj44gUzRK+ixOzLzSwQdoXE68OXmCcw8s9C0jILScsCRqZVjOZJRZnpGSW5iZk
  5uoYGBrqGhka6hpZmumYmeolVukl6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiBgZhScMRh
  B+P91x/0DjFKcjApifKa3V+UIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd9ripQlCgkWp6akVa
  Zk5wKiASUtw8CiJ8GpMAUrzFhck5hZnpkOkTjEqSonz+i4CSgiAJDJK8+DaYJF4iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5Iw72eQKTyZeSVw018BLWYCWvy/cRHI4pJEhJRUA9P0hzdXbD6
  r8eKc4beyk//W1ynVWZxL1tqnfvRGmVjnLvbcT30M9wufbYpLnrJ7+aQO3YLUwvfM9cdKwnlr
  dSW8Ii5ysIfNY97ibbo2Rbi+/2RI/ooEK6aY9b7HVWIyzjRO3bsizOG+Zjj754bitZ8177D+a
  dm8esrWzrX+213lYhj4WR3Y5+cs6Fqp92TCgsql06I3XTStmnkhQMps1YaX7xPWCl2MyRTbwa
  Xa6LTtb/0Utw6zpBdv5C4/WP1/uXfGtv1OHTJrmVdeEVNQCLAq4ClT95k9d/nmYiVL7aSSmN+
  bZvbf6DH4wphjphzM0ibkLGHcz918Z4nnnJtursrNU6cmeSjet0+7yLt7lxJLcUaioRZzUXEi
  ADWfUbg/AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-291.messagelabs.com!1621468466!177730!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30545 invoked from network); 19 May 2021 23:54:26 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 23:54:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14JNsQG4018737
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 00:54:26 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 00:54:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libtasn1: upgrade 4.16.0 -> 4.17.0
Date: Thu, 20 May 2021 07:53:54 +0800
Message-ID: <1621468435-21509-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
References: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

file LICENSE renamed to COPYING.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnutls/{libtasn1_4.16.0.bb => libtasn1_4.17.0.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.16.0.bb => libtasn1_4.17.0.bb} (77%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb b/meta/recipes-support/gnutls/libtasn1_4.17.0.bb
similarity index 77%
rename from meta/recipes-support/gnutls/libtasn1_4.16.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.17.0.bb
index 21ef5c3de4..64e798b188 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.17.0.bb
@@ -8,7 +8,7 @@ LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN} = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE;md5=75ac100ec923f959898182307970c360"
+                    file://COPYING;md5=75ac100ec923f959898182307970c360"
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
@@ -16,8 +16,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "531208de3729d42e2af0a32890f08736"
-SRC_URI[sha256sum] = "0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8d4329d"
+SRC_URI[md5sum] = "c46f6eb3bd1287031ae5d36465094402"
+SRC_URI[sha256sum] = "ece7551cea7922b8e10d7ebc70bc2248d1fdd73351646a2d6a8d68a9421c45a5"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.25.1

