Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3728.1793405752602013862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=O8BUTfkA;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so12080795e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405751; x=1794010551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IEoqv/flZTgcJrHxa8wd0QKNRtqfCcxDu7Q2ziNK6Js=;
        b=O8BUTfkAwKkGyCBex+jtkyrxb40WqSuIgXPAdQCz/OqCtrCu8tBn0MwvuefndUOq5o
         P7ja43YN8rcwxt9szJBym0GaXduu5CTdyM5RQ4IwlRE830WcaqPTIWsgCgxv2057QNwl
         8G/zCudzyqsCz3rGgOm+vqsHosM/xgTkBMAvypaNU95zYKOxzwebMKCLhua4ax6y6DWa
         jg/eYTzsHEvu6qinJw4/rsRttOy/TnboyeWbOQkeoNsgeN6i0DFVn111w/mPYrPOUFPP
         oBjX18vnrSFXc0tFbOCi3kxrOzaF4VjDKLCLM86MaBso9xkANAsrphsd3gaRDMXhtT+3
         TGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405751; x=1794010551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IEoqv/flZTgcJrHxa8wd0QKNRtqfCcxDu7Q2ziNK6Js=;
        b=TFt2p6q2jNAhByjqI5K+yVFYPAozyMsmHTwVtq5pJzL2eC6wvFiHoJ87qpXV01gP4V
         gMh7O1wHrohUtvh2sbUdQt9yzSzZBBD6fGFxIg6ZuS+Hb2dh6OdMd0vGwn7CvRe94q3J
         eoapJrd17Vq+Qv7kztNw6u/UtG0qFPP2l5E0K3c9cJV1iPg3ADepQttUlSilpIICynxR
         JmcPfAVEw7ZLW67pqva7dLa7eHsxJxT6/OQhiju75Ht3UUYYfv1gyari3aKDopTMMDLV
         WkXD+izbhm0TUBld/QOAx4uolQydLv9fwo7M1vaRaG9GSDv2yNx7724pXG+ZIb/3pNqt
         EPkA==
X-Gm-Message-State: AFq9FYIJB1zCRyYlWEQvMNtUg+MB0v/+re/n+lruWEblLOyhe6TCNh6i
	pDBbf/4X41vKr0k53xPvEQBUP2Dq+j9oNKY217yvNsKg1aJyqwbFTSbUc6KN9o3zEZlHJfiODFt
	J0KOAj6I=
X-Gm-Gg: AYBFou35esNaInoOcvEG75uyZgDzDj6qw4N2sjRzCAaVoB49kdILYgaBVoA7F9mdpsP
	SjMt3KVn6k957FflK2+OTZRN9GdiYQFG+cg3DAEUWtpNc+OUpLDb3LkZk9jQE+VrsBjRfKAR3EZ
	Vj9U/xmpy6c+H2U2KBzCjf6Sw5amG5516Dh+SdraUJcRLfARG7G6Md/fFUS+PanpMSzJ/WBahCN
	zaV9qkBQRKrh+u+F6a7ur+K/x4/GcFTRxJJnh0wOr37Qk/ssJZIIpi2/iYY9C81BahVe+s5z+Lu
	dO1Ul7AGuV/ZvZEwZzwEYflR0TQbwSqCJQ9jHbJ+sbdZVDhZ6nEIjRzc1ikWFhHa8YBRrBtrRlP
	GKcvbMjeZOWllPrK9M2xPDTicBs1PRzjpRJ0bZvQBy4qoyciSiWYykvxXV8aNdu/fdBUoh+jlXi
	HZJsZ4I2GDDJGsAeav6gnV9dL9pLHQxusrMCDZ98pOVO1E5h7iGRalSvpGFSEzRMQHtCfNd/FAR
	M2MsGS4ePM/vRV7ff2UeQWJ4LAQ7pq84wGdkUx82IBeyvrSvx8cFARz/kRLZ6o9ScBTsuDZyBIC
	SNv70leUJ2c2JYhJ/efSkUse8dpWylAes/xbdnH7po+R/WP67YuRMvcUkkUS+752Qn8TVD65HyS
	kymc3wkuV4bu5INnfVw1oodch0i8M
X-Received: by 2002:a05:600c:1c0f:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4ac19233381mr84069795e9.26.1793405750822;
        Fri, 30 Oct 2026 17:15:50 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/55] popt: patch CVE-2026-18739
Date: Sat, 31 Oct 2026 01:14:34 +0100
Message-ID: <c048b4a6a3c798afa662049c2a31db077e0a4444.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249088
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.
Convert change in cmake file to autotools/makefile.
Install the new test in recipe.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c211972ad21e1801abc7dd15951093316c5528f4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: backport translated cmake to automake
     (the project migrated in between) ]
---
 .../popt/popt/CVE-2026-18739.patch            | 92 +++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |  2 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
new file mode 100644
index 00000000000..0a1e8f35907
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
+CVE: CVE-2026-18743
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
index c8b4875c1b7..18cc4f2867d 100644
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
