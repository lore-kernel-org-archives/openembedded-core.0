Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A46CCA47A
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:49:30 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.4580.1655884165348725730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=sbn4rksZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655884163; i=@fujitsu.com;
	bh=ZHojtPW9bqmYmTi4VY+u6hGjuqaSwUIyT3X9dWuRWdA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=sbn4rksZv9i/C3Cfu0NXDLYZ41PNgHnBKhwUAuH0gqGYKyNcHs0DbK4/UjF29e6CY
	 js1ULqcutI0ShEekP66zWdKEZthGn1jS2aQUTEXQFbHnunjRfnF2IJbZJM6v2xkA26
	 W1RM+7fhfv0tWixYA/+gnHYqLPAZPY8rL/uyYV3qF92ZtXulpbpJI2o7LjHIQSLZ2f
	 1dpbHvoopwg2cdZa+dqZr0qZWl6vCEjP0Yv8XyKIN4D0nlHLN62AHC9O4xq8h4O7MF
	 pZHo9Q8IblKgiMIbCX1NdQE0SiY3zCuPUFzq59Ge4+hzy5x78i3ZN2mfEKIFihOAQf
	 zFZiOB1ZbQnyA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42Kxs+FI0m0+uSn
  J4OAbLos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePD1k1sBQcNKv52b2RtYDyg2cXIxSEk8IBR
  4uvN48wQzk0miZ87/zF1MXICOXsYJW7+lwCx2QTUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwFzi4LJDYDaLgKrEnamrmUFsXgEniR8fDrKB2BICChJTHr4Hi3MKOEssvrufGWKVk0
  Tr0gdMEPWCEidnPmGBmK8p0br9NzuELS/RvHU2M8QcRYnZl5tZIOwKiRkztkHNV5O4em4T8wR
  GoVlIRs1CMmoWklELGJlXMVolFWWmZ5TkJmbm6BoaGOgaGprqmukaGRroJVbpJuqlluqWpxaX
  6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhnxKMdulHYxz+37qHWKU5GBSEuWVPLApSYgvKT+lM
  iOxOCO+qDQntfgQowwHh5IEb9xxoJxgUWp6akVaZg4w/mDSEhw8SiK8tieA0rzFBYm5xZnpEK
  lTjN4c+69d2cvM8ffTXyA5dfa//cwcy8HkzK9tB5g5Nu3rOsAsxJKXn5cqJc779SDQCAGQERm
  leXALYGnkEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3mKQQ3gy80rg7ngFdCIT0IlPlm8A
  ObEkESEl1cDEdkpE9kmS7N0p7pKz449dflS+NL7iHcMJDn5bBjn13d4OZrWT2A8vX2rNadQVo
  vPrv2+zS+zsn6vmpy6ccFAn4K3b4+Mby37EcgVZai3ecVFhSVlld/HJj9UX3r26pPTb6uQ/E+
  u3v8P4L/Zsequ5IChnfpMKy9MCzXsp13dP7y6yS+4wq0kOWDpxbfKO7Akl56wqLbPL+WYwsd6
  tf7ZF+3/uynJNllt+jW43jeLEw2437OeNntrB7/TqtMF1TqUz98MEj5k4toTPOvq3r/GCg07y
  mfN1MrNTcx+yn/x803LVDwHhLbZeJa9tD+V+sF/+7L+kC0/SxM6ZYkLHD+YnyPCf08xVXdf8x
  JjhgZoSS3FGoqEWc1FxIgAPEeLbngMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1655884162!401703!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22744 invoked from network); 22 Jun 2022 07:49:23 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:49:23 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B7E5A1AD
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A53961B1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:49:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] strace: upgrade 5.17 -> 5.18
Date: Wed, 22 Jun 2022 15:48:49 +0800
Message-ID: <1655884130-22843-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
References: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167220

0001-landlock-update-expected-string.patch
removed since it's not available in 5.18.

skip-load.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-landlock-update-expected-string.patch | 67 -------------------
 .../strace/strace/skip-load.patch             | 40 +++++------
 .../strace/{strace_5.17.bb =3D> strace_5.18.bb} |  3 +-
 3 files changed, 18 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch
 rename meta/recipes-devtools/strace/{strace_5.17.bb =3D> strace_5.18.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch b/meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch
deleted file mode 100644
index 9d67d68331..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-landlock-update-expected-string.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From d0dae2fb30b907bc9bf70382f37c9e00207ae036 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Sat, 30 Apr 2022 01:09:42 -0400
-Subject: [PATCH] landlock: update expected string
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Kernel commit:
-
-  commit 3d4b396a616d0d67bf95d6823ad1197f6247292e
-  Author: Christian Brauner <christian.brauner@ubuntu.com>
-  Date:   Mon Oct 11 15:37:04 2021 +0200
-
-      landlock: Use square brackets around "landlock-ruleset"
-
-      commit aea0b9f2486da8497f35c7114b764bf55e17c7ea upstream.
-
-      Make the name of the anon inode fd "[landlock-ruleset]" instead of
-      "landlock-ruleset". This is minor but most anon inode fds already
-      carry square brackets around their name:
-
-          [eventfd]
-          [eventpoll]
-          [fanotify]
-          [fscontext]
-          [io_uring]
-          [pidfd]
-          [signalfd]
-          [timerfd]
-          [userfaultfd]
-
-      For the sake of consistency lets do the same for the landlock-ruleset anon
-      inode fd that comes with landlock. We did the same in
-      1cdc415f1083 ("uapi, fsopen: use square brackets around "fscontext" [ver #2]")
-      for the new mount api.
-
-      Cc: linux-security-module@vger.kernel.org
-      Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
-      Link: https://lore.kernel.org/r/20211011133704.1704369-1-brauner@kernel.org
-      Cc: stable@vger.kernel.org
-      Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
-      Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-
-Changed the format of the landlock tracing. We need to update the strace
-expected string to match.
-
-Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2022-April/011064.html]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- tests/landlock_create_ruleset-y.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/landlock_create_ruleset-y.c b/tests/landlock_create_ruleset-y.c
-index a30966b..50e19c2 100644
---- a/tests/landlock_create_ruleset-y.c
-+++ b/tests/landlock_create_ruleset-y.c
-@@ -1,4 +1,4 @@
--#define FD_PATH "<anon_inode:landlock-ruleset>"
-+#define FD_PATH "<anon_inode:[landlock-ruleset]>"
- #define SKIP_IF_PROC_IS_UNAVAILABLE skip_if_unavailable("/proc/self/fd/")
- 
- #include "landlock_create_ruleset.c"
--- 
-2.19.1
-
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index fa3ddb8ddc..b1acfda5d8 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -4,6 +4,12 @@ care about timing.
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
+---
+ tests/clock_nanosleep.gen.test | 1 +
+ tests/delay.test               | 1 +
+ tests/strace-r.test            | 1 +
+ 3 files changed, 3 insertions(+)
+
 diff --git a/tests/clock_nanosleep.gen.test b/tests/clock_nanosleep.gen.test
 index 7a6025b..f0e6dbb 100755
 --- a/tests/clock_nanosleep.gen.test
@@ -15,41 +21,29 @@ index 7a6025b..f0e6dbb 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -e trace=3Dclock_nanosleep,clock_gettime
 diff --git a/tests/delay.test b/tests/delay.test
-index f74e27f..328087e 100755
+index f74e27f..6172c04 100755
 --- a/tests/delay.test
 +++ b/tests/delay.test
-@@ -9,6 +9,8 @@
+@@ -8,6 +8,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
  
  . "${srcdir=3D.}/init.sh"
- 
 +skip_ "Test not reliable under load"
-+
+ 
  while read -r denter dexit denter_us dexit_us; do
  	[ -n "$denter" ] || continue
- 
-diff --git a/tests/strace-T.test b/tests/strace-T.test
-index adca3e8..d4acfe9 100755
---- a/tests/strace-T.test
-+++ b/tests/strace-T.test
-@@ -9,6 +9,8 @@
- 
- . "${srcdir=3D.}/init.sh"
- 
-+skip_ "Test not reliable under load"
-+
- T_opt=3D"${1:--T}"
- 
- run_prog ../sleep 0
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 8299737..c360344 100755
+index 8299737..d89c7df 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
-@@ -9,6 +9,8 @@
+@@ -8,6 +8,7 @@
+ # SPDX-License-Identifier: GPL-2.0-or-later
  
  . "${srcdir=3D.}/init.sh"
- 
 +skip_ "Test not reliable under load"
-+
+ 
  r_opt=3D"${1:--r}"
  
- run_prog ../sleep 0
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/strace/strace_5.17.bb b/meta/recipes-devtools/strace/strace_5.18.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_5.17.bb
rename to meta/recipes-devtools/strace/strace_5.18.bb
index c7fd9edf40..3164ebca51 100644
--- a/meta/recipes-devtools/strace/strace_5.17.bb
+++ b/meta/recipes-devtools/strace/strace_5.18.bb
@@ -13,9 +13,8 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            file://skip-load.patch \
-           file://0001-landlock-update-expected-string.patch \
            "
-SRC_URI[sha256sum] =3D "5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f"
+SRC_URI[sha256sum] =3D "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db3d1187"
 
 inherit autotools ptest
 
-- 
2.25.1


