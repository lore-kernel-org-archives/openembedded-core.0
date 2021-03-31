Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.7337.1617200572826927063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ufrkTWnJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617200571; i=@fujitsu.com;
	bh=liiR6E1RLDeFs+V2yUa+AzNW5fIzqteV0bxLFw5j4m0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ufrkTWnJbMAR2J+69mKefP28z1IxrucM5PN8vw2SMrvJV2iazoIGmVGfz5/o+fJKD
	 fg0mmJUbS7aU0XutuBRLA219wVkZq2Xpg8H9saiTbSz9z7q/jGhA4Ma07dRWW7fdut
	 CHuFyheO7S0NhdHpEWc/EjBcYxHz9wEh/O50gmTxYQTrgGPgnlM6LIMtJS3X4Aju//
	 e95Ja+KoAGihYfrxWFVNdNdcCKLQI4z8coH+3+JHEPQy8fwJ18e2b/VBE0NbJYlmYj
	 7nwe2GT9ehudIHIHE/nh082PtIHSC7loscghl6Ej615HBYQYUpTe1/xKJ5VLJ56ZI7
	 wFNdflIDyegsA==
Received: from [100.113.7.82] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 12/E8-38008-BB584606; Wed, 31 Mar 2021 14:22:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRqrurNSX
  BYPZVQ4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaP3Zzt7wSb+itXfljE1MB7n7WLk4hAS2Mok
  8fdnByOEc4JRYum192xdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0sYCNx4
  vkfRhCbRUBV4t+jNWBxXgEniRmTHoKNkRBQkJjy8D0ziM0p4Cxx/NUCsLgQUM30BTvZIOoFJU
  7OfMICMV9C4uCLF8wQvYoSsy83s0DYVRKdH46zTWDkn4WkZRaSlgWMTKsYLZOKMtMzSnITM3N
  0DQ0MdA0NjXVNdQ1NjfUSq3ST9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBAZlSyDpz
  B+On1x/0DjFKcjApifI+sk9JEOJLyk+pzEgszogvKs1JLT7EKMPBoSTBu6AFKCdYlJqeWpGWm
  QOMDpi0BAePkgivBzBChHiLCxJzizPTIVKnGBWlxHnVQBICIImM0jy4NlhEXmKUlRLmZWRgYB
  DiKUgtys0sQZV/xSjOwagkzLsRZDtPZl4J3PRXQIuZgBZfeZQIsrgkESEl1cDk86y++aJHwf0
  O1Sl6DAviL1tfN6/60XR2Z7CLzL9rFQ57Vnlkan6YsCbj3+EOZwf12+uMp69e8+/JwRlLYv1m
  37uuvnbKHAvWJW+v6zF4vQhRau1qV4qcUDV1afbcPh5miUjxXouDM+cYMbDetfpplKEQonz16
  1a95wWbN8g1r3il39az7k1k/NJVSuv/pXRc2VvyYfYcrvRtV/6myv43mcn/3OLpNgZT2TKpxb
  5M0xSYj7+/fldY90v3yvaJwgGXnNennr258uKrM6xBPM8rzaPPbrdrrDW+ut83JVvJ6NRCoft
  iV/detrG4/++q2oMyt+ebzzPXq8kc6DVk0k1ojpW58nVGukfR1N53MyOSlViKMxINtZiLihMB
  sgz9mkMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-248.messagelabs.com!1617200570!12516!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1457 invoked from network); 31 Mar 2021 14:22:50 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Mar 2021 14:22:50 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12VEMk4X004354
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:22:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 15:22:44 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dbus-glib: upgrade 0.110 -> 0.112
Date: Wed, 31 Mar 2021 22:22:26 +0800
Message-ID: <1617200547-62088-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

License-Update:add the following information of license
     SPDX-License-Identifier: AFL-2.1 OR GPL-2.0-or-later

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dbus/{dbus-glib_0.110.bb => dbus-glib_0.112.bb}       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/dbus/{dbus-glib_0.110.bb => dbus-glib_0.112.bb} (84%)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.112.bb
similarity index 84%
rename from meta/recipes-core/dbus/dbus-glib_0.110.bb
rename to meta/recipes-core/dbus/dbus-glib_0.112.bb
index 0b45805cf4..003c3accc3 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.112.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
 HOMEPAGE = "https://www.freedesktop.org/Software/dbus"
 LICENSE = "AFL-2.1 | GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
-                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=7755c9d7abccd5dbd25a6a974538bb3c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c31c73c1d8f5d06784b2ccd22e42d641 \
+                    file://dbus/dbus-glib.h;beginline=7;endline=21;md5=c374833bd817988323f3a8fda0dc7f48"
 SECTION = "base"
 
 DEPENDS = "expat glib-2.0 virtual/libintl dbus-glib-native dbus"
@@ -14,8 +14,8 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-${PV}.tar.g
            file://no-examples.patch \
            file://test-install-makefile.patch \
 "
-SRC_URI[md5sum] = "d7cebf1d69445cbd28b4983392145192"
-SRC_URI[sha256sum] = "7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825"
+SRC_URI[md5sum] = "021e6c8a288df02c227e4aafbf7e7527"
+SRC_URI[sha256sum] = "7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a"
 
 inherit autotools pkgconfig gettext bash-completion gtk-doc
 
-- 
2.25.1

