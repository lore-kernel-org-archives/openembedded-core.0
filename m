Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96.1795101866086687166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jaKUF/CD;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so18394555e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101864; x=1795706664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zAjBvmWi/e57XFPKovvqQpO8GW1wh3/5IWwNEB/fZ3w=;
        b=jaKUF/CDlNvV7f0rdqKlv/ost7XzwKlUoj0XVERBvRWP05iwdyGUvqfBQGMypjpb0H
         eFOG0hHAECwF7pDpeKEwX46D7sh6tCXx/swbtwz8wwyRG/38ifkhvW98cE4K2L1KIqeX
         wN8KKVDB4rhRVP+BfmsMkcOtnGbaBBeLs51J3hFehExIdAyCnf4vzAofwRPcaOWb0Hjx
         Op9qs42u+5FYmD+bi+UlPiTdz3msIh/mkYZD0cB+oDYN8El1Jtxqm+R/Jv++ShnxyOtH
         Ma+Le9+zf5VBXwFglQciLG6Okfa4dfGBrMM/oLWl3bZeuH62hsDxAlpXp45xA8OQaBKQ
         WdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101864; x=1795706664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zAjBvmWi/e57XFPKovvqQpO8GW1wh3/5IWwNEB/fZ3w=;
        b=CZGB+BsTXzn2+akLBis830C1TDNEMxjMc6TrIly059s7GHo2Dida/QU6kdYH12d0Tp
         YXqXEoVsrJ2XYT2lVTTGmFcWokryPcDu8h6abHWyGUM52DLVTSh8DWt+ilM8d+3H4GMU
         GdtVkFZxmDCRYuBCJ8sJscRgQD610kNWVlyNoYLib97QaUiIebnp1EnB4AFZVUi8y3jF
         3LvBwidhw+FmBbgwmPqqiaewoVid41Hxqgaxdpyy0BGwNXmB0tOo/Kd2hHC/deYWMQC/
         tUuZQ0DlSvYaXbwFS6ROX/os7UalCfhsNMYBTVvanzYk5taf4Gcz3gldZDBmOm5quaUl
         qnZQ==
X-Gm-Message-State: APuU4Z8rpiKenhGGKCtBhgFvT9sbhITN9CMZZiYCI0hQatw4l3OTjWWS
	8hvLsK1I4JhdFu+SzLlGOeeC9x5iEuF73MtDq6im4E+ElsLmGj+hYE2V9CY7E7H1s9l8ole9ft+
	Xj3TQ+nw=
X-Gm-Gg: AYBFou0XYzmyvF78hha60URJmI1abr+ZxyC9A0j1wk6c5Kl0gzmAuzJQkhJfELR/TWI
	MQizyl0OmdzTxAANFoDxsazeVOkCMaRIQV3h8+rYqli+hKaVlmacL6Y8CY+4vQIr8GsdKIQV9Xf
	20h9ndCuTJH9y1iUym43LE4fYpBksQJedLKOHjRjsvUgOXjrGwtiLbUBMEW8WpZa35xCgQGtqgK
	AAyk6HGr6Z1dKCUeqsvBmcerPQ3kqOzD4WjhvTHTje802HKOF3XFCLjM21x7rt4lNiA0JBAZIa6
	67t0jMUri79ewjy5IZdTt1Mp4XjcsYDkdCCL7rNYjTQgZrXTYxj90iyyQGjnuU24OBhQnoY5/D1
	ITx9113Y8B0/x76Hf3dgiQAXc2FKAlKJfmn2Q03K8nh0bBR4eCuB44uDYoSAGdM2JK5Zji5hRjP
	Yyj/BZFo1Xs/x+GQ6E6J8McCFI7kMYslA7WX504zEuorS8YvCBmlJ2SEVWgxcc1Rqf1GTfiutSC
	K+9YfETW+gopLWpvI0KnNA4B52J6a8Q9WUfXTi3MOryrtWxrEENUY5qDyOjOS6oCHh+h40w7ONT
	kfxxkAqW2vU7wgJbTGscEFDH0kF0seRd90Q2VMSvlSdzn4I/J24iYIR/LVicgi+EcMo4uBv5ETN
	yR0wv10N3M9pmhLPJQza1BhrF0nYzoxsEe/0q69yOhqTIZRF4XcEYLTZ5Xf7jgFb1h2fz/DxYzf
	BV
X-Received: by 2002:a05:600c:310e:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb7da4372dmr129483455e9.27.1795101863641;
        Thu, 19 Nov 2026 07:24:23 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:23 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/19] popt: patch CVE-2026-18739
Date: Thu, 19 Nov 2026 16:22:34 +0100
Message-ID: <dfb24545d8e4b23c45e506eb0188f8dffc4aa3c4.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250690
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.
Convert change in cmake file to autotools/makefile.
Install the new test in recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
[fatho: fix CVE metadata]
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  2 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
new file mode 100644
index 0000000000..94366f6343
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -0,0 +1,92 @@
+From 14c42b415ba0c11640f7d4ee80920452d0287058 Mon Sep 17 00:00:00 2001
+From: Yao Zhang <294772273@qq.com>
+Date: Wed, 5 Aug 2026 14:52:10 +0800
+Subject: [PATCH] Fix CVE-2026-18739: off-by-one error in poptStuffArgs()
+
+The poptStuffArgs function only checks whether (con->os - con->optionStack)
+is equal to POPT_OPTION_DEPTH (10) before incrementing con->os, and does
+not increment the value by 1 to perform boundary pre-checking, as
+handleAlias does.
+
+Add a new test program as a reproducer for this case.
+
+Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
+
+Fixes: CVE-2026-18739
+
+CVE: CVE-2026-18739
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/popt.c        |  2 +-
+ tests/Makefile.am |  5 ++++-
+ tests/testit.sh   |  2 ++
+ tests/tstuff.c    | 17 +++++++++++++++++
+ 4 files changed, 24 insertions(+), 2 deletions(-)
+ create mode 100644 tests/tstuff.c
+
+diff --git a/src/popt.c b/src/popt.c
+index 9ea3dfe..458aadc 100644
+--- a/src/popt.c
++++ b/src/popt.c
+@@ -1668,7 +1668,7 @@ int poptStuffArgs(poptContext con, const char ** argv)
+     int argc;
+     int rc;
+ 
+-    if ((con->os - con->optionStack) == POPT_OPTION_DEPTH)
++    if ((con->os - con->optionStack + 1) == POPT_OPTION_DEPTH)
+ 	return POPT_ERROR_OPTSTOODEEP;
+ 
+     for (argc = 0; argv[argc]; argc++)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index c410389..99fbf64 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -11,7 +11,10 @@ EXTRA_DIST = testit.sh \
+ 
+ AM_CPPFLAGS = -I. -I$(top_srcdir)/src
+ 
+-noinst_PROGRAMS = test1 test2 tdict test3
++noinst_PROGRAMS = test1 test2 tdict test3 tstuff
++tstuff_SOURCES = tstuff.c
++tstuff_LDFLAGS =
++tstuff_LDADD = $(top_builddir)/src/libpopt.la
+ test1_SOURCES = test1.c
+ test1_LDFLAGS = 
+ test1_LDADD = $(top_builddir)/src/libpopt.la
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 4078f51..d26be3a 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -172,6 +172,8 @@ run test1 "test1 - 61" "" -x=f1
+ 
+ run test1 "test1 - 62" "arg1: 0 arg2: (none) aInt: 1" --randint=-1
+ 
++run tstuff "tstuff - 1" "-13"
++
+ if ! [ -e test3-data ]; then
+   # create symlink for running during 'make distcheck'
+   ln -s "${srcdir}/test3-data" test3-data
+diff --git a/tests/tstuff.c b/tests/tstuff.c
+new file mode 100644
+index 0000000..b820c7b
+--- /dev/null
++++ b/tests/tstuff.c
+@@ -0,0 +1,17 @@
++#include <stdio.h>
++#include <popt.h>
++
++int main(int argc, char *argv[])
++{
++    poptContext ctx = poptGetContext(argv[0], argc, (const char **)argv, NULL, 0);
++    int rc = 0;
++    for (int i = 0; i < 100; ++i) {
++	const char *ea[] = { "a", NULL };
++	if ((rc = poptStuffArgs(ctx, ea)))
++	    break;
++    }
++    printf("%d\n", rc);
++
++    poptFreeContext(ctx);
++    return rc;
++}
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index c8b4875c1b..18cc4f2867 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -11,6 +11,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-18743.patch \
+           file://CVE-2026-18739.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
@@ -25,6 +26,7 @@ do_compile_ptest() {
 do_install_ptest() {
     install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
     install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
+    install ${B}/tests/.libs/tstuff ${D}/${PTEST_PATH}
     install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
     install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
 }
