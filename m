Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web12.12518.1631112147059339136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kDl4fnF2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112144; i=@fujitsu.com;
	bh=valNiEiRpuIbvSIos8iDaofXJm/RWy66PxuPYFDkTYw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kDl4fnF2Co6bfq7F1cHYQp8FMObMGhZgLRDkP7tKjxM5EKMik+eh1HQ7H8pi1xA60
	 U8qQ4/K/nzjA3AajsjENwX6MykO+2cBY5FNDWgGC1TYo7rq09DTCPyhdgUqekGHa1m
	 6ZXHhWKmXAazq4oIanEmU9S/AzmvAYgT+HB5oVutVvGvN2wsm08qRM7tyZuOk1HOjM
	 ESmRQUWrndrymksdOmgwKuY8pgEO/iJzoa/MtVVgfi6V9LJyAR4DDEej9eqBe9zhzy
	 9h7Loz1CnDmILteJB5AlwqAOQe8TTMFzQsnS0zNOima/1x4U5ZLSgQBqB5/cnSBLth
	 LIs6t/m0LhxDw==
Received: from [100.113.2.146] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id BC/30-32481-0DBC8316; Wed, 08 Sep 2021 14:42:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRqnvhtEW
  iQc8hTos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNS12v2gtfiFU+O7mFpYJwm2sXIySEkMJNJ
  4nMbcxcjF5B9nFHi9u+pbCAJNgE1iem3brB2MXJwiAjoSVz9B1bPLKAi8eJ3DzuILSxgIXGz6
  TQjiM0CFP90awYLiM0r4CSxfm8b2BgJAQWJKQ/fM4PYnALOEqsvrmcEGSkEVNPzCKpcUOLkzC
  csEOMlJA6+eMEM0aooMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0SKpKDM9oyQ3MTNH19D
  AQNfQ0FjXUNfUUC+xSjdRL7VUNzk1r6QoESipl1herFdcmZuck6KXl1qyiREYiimFjMY7GA++
  /qB3iFGSg0lJlHfXbotEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8mqeAcoJFqempFWmZOcC4g
  ElLcPAoifA6HQFK8xYXJOYWZ6ZDpE4xKkqJ864B6RMASWSU5sG1wWLxEqOslDAvIwMDgxBPQW
  pRbmYJqvwrRnEORiVhXiuQKTyZeSVw018BLWYCWtz20ARkcUkiQkqqgYmxQ0vEbsEtUcW3PE3
  Lmn3cCvi2/8teqnT0rOlO+bA1nzgEb3tetpZvitoVIf1yjvXXoqAzWoFas/zO7PANqF2mXHbo
  w27vkPfK34Msqv42sPN4s11aqBy+d/+cr3v+hO48ojZpfZtj6YHNshWcs07Wf6iyK5rfcd40v
  CdydXFDyISay9Gtb7sb9kgt+lJ/bo6FmuNKoyTNPv+L3lf+/xSPs1nt+qL2R7W05LeOpPxHG1
  RrQ35u2KOxd2OKKsOhUqMWJr8dpY+f3H20fcc/j4Pt9++aHnhgmOn44IO4ZPbOiELmRqa8rXK
  b7D5wL/9zIHHvm1uz+t/9txOS37mpkztahelOuv9NzbZt+qtatyqxFGckGmoxFxUnAgDYgXIu
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-228.messagelabs.com!1631112143!53704!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18630 invoked from network); 8 Sep 2021 14:42:24 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:42:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EgKaR026178
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 15:42:23 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:42:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] inetutils: upgrade 2.1 -> 2.2
Date: Wed, 8 Sep 2021 22:42:00 +0800
Message-ID: <1631112120-19285-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631112120-19285-1-git-send-email-wangmy@fujitsu.com>
References: <1631112120-19285-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh inetutils-only-check-pam_appl.h-when-pam-enabled.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ils-only-check-pam_appl.h-when-pam-enabled.patch | 13 ++++++++-----
 .../{inetutils_2.1.bb => inetutils_2.2.bb}          |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/inetutils/{inetutils_2.1.bb => inetutils_2.2.bb} (99%)

diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
index 7d5c087c9d..d3ac512769 100644
--- a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 86136fb..b220319 100644
+index 5e16c3a..18510a8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -183,6 +183,19 @@ AC_SUBST(LIBUTIL)
+@@ -182,6 +182,19 @@ AC_SUBST(LIBUTIL)
  
  # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
  if test "$with_pam" = yes ; then
@@ -38,12 +38,15 @@ index 86136fb..b220319 100644
    AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
    AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
    if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
-@@ -620,7 +633,7 @@ AC_HEADER_DIRENT
- AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h errno.h fcntl.h features.h \
+@@ -617,7 +630,7 @@ AC_HEADER_DIRENT
+ AC_CHECK_HEADERS([arpa/nameser.h arpa/tftp.h fcntl.h features.h \
  		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
  		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
 -		  security/pam_appl.h shadow.h \
 +		  shadow.h \
- 		  stdarg.h stdlib.h string.h stropts.h sys/tty.h \
+ 		  stropts.h sys/tty.h \
  		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
  		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
similarity index 99%
rename from meta/recipes-connectivity/inetutils/inetutils_2.1.bb
rename to meta/recipes-connectivity/inetutils/inetutils_2.2.bb
index 0cf73cdb24..3bab137eb4 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.1.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
 
-SRC_URI[sha256sum] = "01b9a4bc73a47e63f6e8a07b76122d9ad2a2e46ebf14870e9c91d660b5647a22"
+SRC_URI[sha256sum] = "d547f69172df73afef691a0f7886280fd781acea28def4ff4b4b212086a89d80"
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
            file://inetutils-1.8-0003-wchar.patch \
-- 
2.25.1

