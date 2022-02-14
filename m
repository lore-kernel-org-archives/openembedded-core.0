Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7EAC433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:28:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.34114.1644848898621026771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kF8GtESF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848896; i=@fujitsu.com;
	bh=F3HQh7oe+7SL6/LXiyWQSzlHTpXloyF4h6L4frIZPME=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kF8GtESFZAIxtsAjkyMCA9m2qJUcpo1iImG0y9o0BzLJK2kPZ6p+qsduAXSddyScZ
	 EOw/0e6EC1lrAfj1HLt+GKmcaLPUDMWeezhbhILq5y9OSvOPiEAQQEG73Ge1Go8Xs2
	 q40U4Gs2r7ENOX7F4t0HubbfBE+zGi2WnHwUg3GIhb8wzK7wa/ebtGk1bQzoZsZjlW
	 QPRaH7N0VS7NPy8usSqY8xTRn98xQcUAnIK4eKYyshQq0L/DuyTOCcL6tM+sB/FuY1
	 rrxWYmrkFnmwiKSponu3KMq6Bh5McQHcUpq7DTbE8Miw48l0uwKcEeLwPOsLxIh9As
	 aBnPJFdDLi8tg==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 60/23-00700-0076A026;
 Mon, 14 Feb 2022 14:28:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqMuQzpV
  ksP0Mj8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvH4/G6mgj+aFY1Pu9gaGDtUuhi5OIQEHjNK
  zL9+lgXCOc8k0bvrDTuEc4JR4urUOUAOJwebgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdA
  1YiLGAlsWX3EVYQm0VAVeLTjU9gcV4BR4mml5/YQGwJAQWJKQ/fM4PYnAJOEqd6pzKB2EJANc
  vevYCqF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKoLJE1N9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAoM4pZhh1g7GWX0/9Q4xSnIwKYnydttzJQnxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4N2RApQTLEpNT61Iy8wBRhRMWoKDR0mENzUUKM1bXJCYW5yZDpE6xagoJc77PhUoIQCSyC
  jNg2uDRfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK830Gm8GTmlcBNfwW0mAlocVoPG8j
  ikkSElFQD0xrO5J2bD6/pEt54+qHQ35ctq8t1+jrk67iXbezLLnoktP2imXvb4oCcWwxGQYrn
  mSLXBQU3L/ueaVEbXFF12vWv5/2J7yNeycZPadyz/yP3cd5LCUu/qC0L2NwZIVe65qhYSP3Po
  nXWj2+0mObmbNcoW3JlZaDjjoUKc5bpaUpl/jY6L8fbnv5/m+8vvyPrxRWSi7Wc96Q2qRZM77
  AU3nRTuCmT0dP8xrpOk4O8vqujJoZcL5/2Sm/LJ5XNfduLPsvMeMQSPrf18QLFHevKhefkTEq
  1yHKf0TPnVE9r6infb+UuCmfrUgSY9znIzz977uCuepdDdxvuOzzjX6wjciyi7Om+0q1dSQWG
  0+Y9UGIpzkg01GIuKk4EADmphR5dAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1644848895!200486!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11652 invoked from network); 14 Feb 2022 14:28:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:28:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AE93E10019D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A1ADD100197
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:27:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.16.0 -> 1.17.0
Date: Mon, 14 Feb 2022 22:27:27 +0800
Message-ID: <1644848847-3331-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
References: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161706

The following patches refreshed for 1.17.0
0001-pkgconfig.patch
0001-use-closefrom-on-linux-and-glibc-2.34.patch

Changelog:
=========
qt: Fix build for older Qt versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gpgme/gpgme/0001-pkgconfig.patch          | 25 ++++++++++---------
 ...se-closefrom-on-linux-and-glibc-2.34.patch | 10 ++++++--
 .../{gpgme_1.16.0.bb => gpgme_1.17.0.bb}      |  2 +-
 3 files changed, 22 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.16.0.bb => gpgme_1.17.0.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 827d95a151..35c6b4056c 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -12,22 +12,23 @@ RP 2015/4/17
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Rebase to 1.13.0
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Rebase to 1.17.0
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  configure.ac            |   1 +
  src/Makefile.am         |   4 +-
- src/gpgme-pthread.pc.in |  15 +++++++
- src/gpgme.m4            | 114 ++++--------------------------------------------
+ src/gpgme-pthread.pc.in |  15 ++++++
+ src/gpgme.m4            | 114 +++-------------------------------------
  src/gpgme.pc.in         |   4 +-
  5 files changed, 28 insertions(+), 110 deletions(-)
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 25184f4..1c0a386 100644
+index 80ce79c..d7c0ac1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -899,6 +899,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -905,6 +905,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -36,7 +37,7 @@ index 25184f4..1c0a386 100644
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index d85a85c..d942f3e 100644
+index 39c341f..3aca716 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -75,7 +76,7 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 6c2be44..d8a75cb 100644
+index 71b0010..30ec151 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -79,7 +79,7 @@ dnl config script does not match the host specification the script
@@ -274,18 +275,18 @@ index 6c2be44..d8a75cb 100644
 -  AC_SUBST(GPGME_GLIB_LIBS)
  ])
 diff --git a/src/gpgme.pc.in b/src/gpgme.pc.in
-index be288b8..16f56ac 100644
+index 80d59de..932645b 100644
 --- a/src/gpgme.pc.in
 +++ b/src/gpgme.pc.in
 @@ -9,6 +9,6 @@ Name: gpgme
  Description: GnuPG Made Easy to access GnuPG
- Requires: gpg-error, libassuan
+ Requires.private: gpg-error, libassuan
  Version: @PACKAGE_VERSION@
--Cflags: @GPGME_CONFIG_CFLAGS@
--Libs: @GPGME_CONFIG_LIBS@
+-Cflags: -I${includedir} @GPGME_CONFIG_CFLAGS@
+-Libs: -L${libdir} @GPGME_CONFIG_LIBS@
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index 1c46684c6d..f3de55f7b3 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -5,20 +5,26 @@ Subject: [PATCH] use closefrom() on linux and glibc 2.34+
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Rebase to 1.17.0
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  src/posix-io.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/posix-io.c b/src/posix-io.c
-index e712ef2..ab8ded9 100644
+index 5c6cf1d..52e513a 100644
 --- a/src/posix-io.c
 +++ b/src/posix-io.c
 @@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
                if (fd_list[i].fd > fd)
                  fd = fd_list[i].fd;
              fd++;
--#if defined(__sun) || defined(__FreeBSD__)
+-#if defined(__sun) || defined(__FreeBSD__) || defined(__GLIBC__)
 +#if defined(__sun) || defined(__FreeBSD__) || (defined(__GLIBC__) && __GNUC_PREREQ(2, 34))
              closefrom (fd);
              max_fds = fd;
  #else /*!__sun */
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.16.0.bb b/meta/recipes-support/gpgme/gpgme_1.17.0.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.16.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.17.0.bb
index d31e1b3132..6a201789e1 100644
--- a/meta/recipes-support/gpgme/gpgme_1.16.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.17.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            "
 
-SRC_URI[sha256sum] = "6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0"
+SRC_URI[sha256sum] = "4ed3f50ceb7be2fce2c291414256b20c9ebf4c03fddb922c88cda99c119a69f5"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS:${PN}-cpp += "libstdc++"
-- 
2.25.1


