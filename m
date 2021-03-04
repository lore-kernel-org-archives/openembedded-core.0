Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.4440.1614852046294162903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 02:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id A0/CA-23163-CCFA0406; Thu, 04 Mar 2021 10:00:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxVff0eoc
  Eg9VTzSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyju9ewFEyXqnjyT6aB8YNYFyMXh5DAJiaJ
  xU++MUM4xxkl2u43sHQxcnKwCWhK9G7ZwtjFyMEhIqAncfWfKEiYWUBd4tK6FrASYQE7iSvvL
  rCC2CwCKhILF7wHs3kFXCX+dB0DsyUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXjBD1ChKzL7czA
  JhV0ms6ZjGNoGRdxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11TUyttBLrNJN0ks
  t1U1OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEhldKIeu7HYzPXn/QO8QoycGkJMqrkuGQIMSX
  lJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV2EdUE6wKDU9tSItMwcY6jBpCQ4eJRHevyBp3uKCxNziz
  HSI1CnGcI43a5csYuZ4Cybb7t0Fku1gcuaCg6uZOWaByfvth4DkAxApxJKXn5cqJc4rBTJOAG
  RcRmke3DJYLF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx7DGQKT2ZeCdxNr4DOZQI6d5a
  bHci5JYkIKakGJsvj9c8t1Weq+84OM1jQXx1i/ulh8jGTfrVDC561rwwrfL3k1b/fPMu/1B1b
  2LGIa6r6rZRSzr+T7xS4iEZ96TyxKPus1JSJzl9tDiccErpS8WzF/MMB6lwyF7LCm7/tOK4mJ
  eicIrJ24dyZ2jnLju2ZO7MzbFvaFItjDawSRm8Y0m4UzbWJCeL+Zdhgwq9e/e7KGdnVm9+tkt
  wp5nbli8JijVcWmhGNB3df/x2+9Xj2PZuLHzrdYv2m7T92eKobh0+w8cu1pv9mGJ4quGKc9dR
  3y8aOunnTZbcKRpkL8Hxl/TYn9KDvgjV/Ha4/8GTY19p7X2jy4byVW5fefjA/8dX7q3/Dzk3h
  L3YM4ngeUZKoxFKckWioxVxUnAgA0/Z8+WADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-30.tower-245.messagelabs.com!1614852043!1242507!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13220 invoked from network); 4 Mar 2021 10:00:43 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-30.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 10:00:43 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 124A0ali005649
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 10:00:43 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 10:00:35 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] procps: upgrade 3.3.16 -> 3.3.17
Date: Thu, 4 Mar 2021 18:00:25 +0800
Message-ID: <1614852025-42153-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Add patch to fix bug of compile under musl:
0001-Fix-compile-bug-of-musl.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../procps/0001-Fix-compile-bug-of-musl.patch | 52 +++++++++++++++++++
 .../{procps_3.3.16.bb => procps_3.3.17.bb}    |  5 +-
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
 rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb} (95%)

diff --git a/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch b/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
new file mode 100644
index 0000000000..98186c7d78
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-Fix-compile-bug-of-musl.patch
@@ -0,0 +1,52 @@
+From 4ceaef8b624042d510492864cb5ee0179452312b Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Thu, 4 Mar 2021 17:16:03 +0900
+Subject: [PATCH] Fix compile bug of musl
+
+It solves the problem that the variable definition cannot be found because the header file cannot be included under musl
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ proc/escape.c |  2 +-
+ w.c           | 12 ++++++++----
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/proc/escape.c b/proc/escape.c
+index 2e8fb7d..21ccdc6 100644
+--- a/proc/escape.c
++++ b/proc/escape.c
+@@ -25,7 +25,7 @@
+ #include "escape.h"
+ #include "readproc.h"
+ 
+-#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__))
++#if (__GNU_LIBRARY__ >= 6) && (!defined(__UCLIBC__) || defined(__UCLIBC_HAS_WCHAR__)) || (DEFAULT_LIBC == LIBC_UCLIBC)
+ # include <wchar.h>
+ # include <wctype.h>
+ # include <stdlib.h>  /* MB_CUR_MAX */
+diff --git a/w.c b/w.c
+index 9d07ac9..722b612 100644
+--- a/w.c
++++ b/w.c
+@@ -56,10 +56,14 @@
+ #include <time.h>
+ #include <unistd.h>
+ #ifdef HAVE_UTMPX_H
+-#	include <utmpx.h>
+-#else
+-#	include <utmp.h>
+-#endif
++#  if HAVE_UTMP_H
++   /* needs utmp.h, for the definition of e.g., UT_HOSTSIZE.  */
++#   include <utmp.h>
++#  endif
++#  include <utmpx.h>
++#elif HAVE_UTMP_H
++#  include <utmp.h>
++#endif
+ #include <arpa/inet.h>
+ 
+ static int ignoreuser = 0;	/* for '-u' */
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
similarity index 95%
rename from meta/recipes-extended/procps/procps_3.3.16.bb
rename to meta/recipes-extended/procps/procps_3.3.17.bb
index ef3ac86e97..c1d3fee4d2 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -14,8 +14,9 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
            file://sysctl.conf \
+           file://0001-Fix-compile-bug-of-musl.patch \
            "
-SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
+SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
 S = "${WORKDIR}/git"
 
@@ -98,4 +99,4 @@ ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
 
 ALTERNATIVE_${PN}-sysctl = "sysctl"
 ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
-ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
\ No newline at end of file
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
-- 
2.25.1

