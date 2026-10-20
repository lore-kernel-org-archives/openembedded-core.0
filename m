Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4763.1792538576206233866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=jiOyggQY;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4649b35bso99447f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538574; x=1793143374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6V0xn0Wp8ZTPk82YtEnJCeLZNuboaF2a1CCN5mxH1U0=;
        b=jiOyggQY7vYPYW8gXkV527WrPDB1XxiI+3JltbtyhlsCK9m2qzbDqi+xwUPU91fxHo
         85zVvB7UcG+8FmecIVVwFJzQgd6ncvfjz5UNhDlw23vl2CKityoYaDQFqMTx6n7st8px
         BpGSm2iZcLwkI1ZXUnDJDn4kEEukGLCeWhfRMfwrtHh1gUdumFhyvmcQewjH1NihmGXc
         xSsN2+pLNoxdb2XP/A1/oQid16f56n4fCytnb1fJqK9ij/qepavFghrzjTGSHUbGkMCQ
         i7swbiDpYxfnjli/vJMWLJy4XZbiMprlKpmECLQLPjDLPR8U3k0c6qdfd7bPByDBl1uj
         w4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538574; x=1793143374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6V0xn0Wp8ZTPk82YtEnJCeLZNuboaF2a1CCN5mxH1U0=;
        b=OzI1xI2XyJ8aSxdD+OE41lTv8esnUwFrg5p0DLq7rEUt876VDteXylFGoEBgZSdp6n
         8JuusZ3OktPitZSffuH0Hu4YGkkfhMI1BNmHpawf2CgG5M6979c7xxvTHDbmLEhemSzb
         DS48c+QYTueDQDAINa2NmXwkmUynXw2Mcagq2BRqwpAzmOYlvt8b7jm2ZmUqvrK5IUg6
         oH80Ub0E2dppdTVkFGIE0dfe8OPbCNPhj5xAl4OZJtGacOZkWIgGFoNETA865f7H5ZBv
         s/Ocz/9DFz2VnQlZronuAIQjA+rpkx1LGt2h4aHmyic0lQa1my7mF1NZI4CKiwkWpG+x
         JWSw==
X-Gm-Message-State: AFq9FYK70Jf17F40cEAkiiUOs863WC5XY+LdDRpFDQYdXbKyEp/6ZFLE
	y2zNOnIKKVZednP3pskQSdkmGojcNhUVV2xA6ztilxMJ/AdteEIOIWUpULrbx+IaaWM5N3XQyqT
	zIxt2jMI=
X-Gm-Gg: AYBFou3QzmIxFZHUi6RHkZcnoySKHdgEFFsfMIY8Kdg3mQPfEDDwU3a/sfLGoKQIwAD
	s87mbuyeF97Y1B31Cmc8QlAV09kgHzlvn8SecV8YbO1ZGQVO7PqXsfeok5bvd+N5BGWE+ThrbzG
	FMrczKcusafnnv3NNzoLMY6IADtN85NDkmitDsFGSF4Kv1Ys6gu25HJpTK/K4qfpwVuKynASK7W
	ZNPXYlX9gpobEP+RKgWVyfN9wOf/x5tDVtbiSMUIxRco5seGImABzVHO0Ix62qVxSWRDvvit1tX
	BnLj0FsQg0G2GELvI7bS3puJW5aTLkS5x60eJJVx+ryqhEKJSauUdYNI/kXnwv97eLDFlXmJsb2
	exF2kOSdjmsX95ZG1qDwSlGdhmBpYCZfe86OjRdtp2C8a5d9fHotrwNc7k/JIqV2HWgIeqjEISi
	dR7Ng7QC23KuQrgDElMvTZ2eJtPe4sh5UbULGomVJNnybW+SZkL9ZgkKMHpaeNzCII9mCqZBrqn
	mnJ9RIIbWAZ8zlLbnMuChSVBY5IAQhcaSLeDNAYoWQMjwHnCaUjkP4jT0StBlTPIkCrAW4alg==
X-Received: by 2002:a05:6000:2003:b0:48d:ff71:dd97 with SMTP id ffacd0b85a97d-48e26427986mr416567f8f.7.1792538574079;
        Tue, 20 Oct 2026 16:22:54 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/25] popt: patch CVE-2026-18739
Date: Wed, 21 Oct 2026 01:22:14 +0200
Message-ID: <abaa5f37f2c14f14392735a978b2a3e672747551.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248322
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
 meta/recipes-support/popt/popt_1.19.bb        |  3 +-
 2 files changed, 94 insertions(+), 1 deletion(-)
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
index 3e9137c156a..10c4b4b0af7 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -11,6 +11,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-18743.patch \
+           file://CVE-2026-18739.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
@@ -23,7 +24,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    for f in test1 test2 tdict test3 testit.sh test-poptrc; do
+    for f in test1 test2 tdict test3 tstuff testit.sh test-poptrc; do
         ${B}/libtool --mode=install install ${B}/tests/$f ${D}/${PTEST_PATH}
     done
 }
