Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357EBC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:26:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14965.1634671591688186925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1573BD6E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3A293F694
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:26:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] strace: remove obsolete patch
Date: Tue, 19 Oct 2021 20:26:12 +0100
Message-Id: <20211019192614.153903-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:26:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157203

This patch isn't needed with strace 5.14, which includes stdint.h
centrally.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../strace/strace/uintptr_t.patch             | 27 -------------------
 meta/recipes-devtools/strace/strace_5.14.bb   |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/uintptr_t.patch

diff --git a/meta/recipes-devtools/strace/strace/uintptr_t.patch b/meta/r=
ecipes-devtools/strace/strace/uintptr_t.patch
deleted file mode 100644
index 088d685af0..0000000000
--- a/meta/recipes-devtools/strace/strace/uintptr_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a6c9366bfbcef6f3f4bb068b1f1a5623935b5013 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 5 Nov 2019 20:05:08 -0800
-Subject: [PATCH] include stdint.h for getting uintptr_t definition
-
-fixes do_compile_ptest_base
-tests/fanotify_mark.c:191:23: error: 'uintptr_t' undeclared (first use i=
n this function); did you mean 'intptr_t'?
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- tests/fanotify_mark.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/fanotify_mark.c b/tests/fanotify_mark.c
-index aade643..de579f3 100644
---- a/tests/fanotify_mark.c
-+++ b/tests/fanotify_mark.c
-@@ -18,6 +18,7 @@
-=20
- # include <limits.h>
- # include <stdio.h>
-+# include <stdint.h>
- # include <unistd.h>
- # include <sys/fanotify.h>
-=20
diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-d=
evtools/strace/strace_5.14.bb
index 02a4843edf..a81bda04ba 100644
--- a/meta/recipes-devtools/strace/strace_5.14.bb
+++ b/meta/recipes-devtools/strace/strace_5.14.bb
@@ -12,7 +12,6 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://ptest-spacesave.patch \
-           file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
 SRC_URI[sha256sum] =3D "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3=
141b7cb307b11e73"
--=20
2.25.1


