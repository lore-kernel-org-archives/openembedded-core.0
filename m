Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D22CCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.31067.1654516906654903212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hTZAQc+0;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id p10so19549890wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=60NLNuD+oId00XF/smJzULO4DFEtndCZELVE7v0SpsM=;
        b=hTZAQc+0o3Ji+iqgwJHhGXtIDEPYPitKM4eCCUyZqcxvWJuU6fdmxIrXLVG5bxDsbF
         I70zatEoU388/jLSu0wrd6uZw5AGh/coiY0wZX1x1Br7BDRJc24sNMIHM6kvICgatobD
         7eGcoO6XPPUGmn3NA5mBlpa1lNxYS31ngrDoG0vFAhi9FaA+WllLIP9comVZ3J71qDl1
         ccEMMg9nKFct2fqWfJ2D6XcS3nymt15UeuK7yMoEm+NpfMxNe1FxazHmbIwLB9pa6NNv
         W58Bw/epoXkHD+HNFU0tqE44oYJtiYWqFb5sBncssPe/mg/v5CUzFuPjbVp59WnnHwbi
         PQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=60NLNuD+oId00XF/smJzULO4DFEtndCZELVE7v0SpsM=;
        b=aDYkEd/fmTGDUAwRX20WhTOtTveXPAcWZaARdBg+YIR5rHO2R2mxGB37b4M1Zpteu2
         xYuujPRC/wogHFAvU+62RhpnfNHKG8doE2EklPqAV4H/7fK+642HjN7vjJQXIgamIntL
         XECp40U/32mpGkCyc+cdzQ40Ec55BIs/iI1s+Dy0aNskCiYXgjSY8qbuhqDeTfvA9heX
         tMccROGfzmlAWcTpK/aBw5l7tZioHLHmFoQJGPF1pPeV5ySs5S0haAwDcAlC4K3larGC
         cCqO6tnoeO63KpNK/cl9Cq2L2zVygJl9H3nP1recD92gWjIIaIqvTRBnTBEsWBYTYmL1
         8sSg==
X-Gm-Message-State: AOAM5311cdORmIL341VMHC5NcpR/5qFDIB1VKXi/c3OqQa/cgXJ3h6d5
	qAt0SMPt3As9E9BaB4eTJmepsWkyOcv8uA==
X-Google-Smtp-Source: 
 ABdhPJwN1ikDBy7kRo+WiAICNfTcsk4ANLU3pdHVxqu6igun/I6kpnMXRuSdEedzlNCn8JcL62K7QA==
X-Received: by 2002:adf:f842:0:b0:213:5c4b:981d with SMTP id
 d2-20020adff842000000b002135c4b981dmr19865170wrq.694.1654516905220;
        Mon, 06 Jun 2022 05:01:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/21] perl: update 5.34.1 -> 5.36.0
Date: Mon,  6 Jun 2022 14:01:23 +0200
Message-Id: <20220606120126.3381438-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166612

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{perlcross_1.3.7.bb => perlcross_1.4.bb}  |  2 +-
 .../perl/files/perl-configpm-switch.patch     |  2 +-
 .../perl/files/perl-dynloader.patch           |  2 +-
 .../perl/files/perl-rdepends.txt              | 49 ++++++++++++-------
 .../perl/{perl_5.34.1.bb => perl_5.36.0.bb}   |  2 +-
 5 files changed, 35 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.7.bb => perlcross_1.4.bb} (92%)
 rename meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.36.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb b/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.4.bb
index 99a9ca1027..1329306b0e 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.7.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "77f13ca84a63025053852331b72d4046c1f90ded98bd45ccedea738621907335"
+SRC_URI[perl-cross.sha256sum] = "be9d9f9f7148edff7a2f9695ba3cb7e3975eff6b25a9a81dd311725fd757aa91"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 15189a0c04..f80de88974 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 1f7cc5db2ca549c37c6a7923368e1a0104f31b99 Mon Sep 17 00:00:00 2001
+From 055d4c31f41611b7d7fb6b0e38b3818a053de38d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/files/perl-dynloader.patch b/meta/recipes-devtools/perl/files/perl-dynloader.patch
index b49e6e4066..887f7c0f7f 100644
--- a/meta/recipes-devtools/perl/files/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/files/perl-dynloader.patch
@@ -22,7 +22,7 @@ Index: perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
 +        my $hostlib = $ENV{PERLHOSTLIB};
 +        my $hostarchlib = $ENV{PERLHOSTARCHLIB};
 +        print STDERR "*** Module name IN: $modlibname\n";
-+        ($p1, $p2, $p3, $p4, $p5, $p6, $p7) = $modlibname =~ m/(^(.*lib\w*\/)?)((perl5\/[0-9\.]*\/)?)(([^\/]*)\/)?(.*)$/;
++        my ($p1, $p2, $p3, $p4, $p5, $p6, $p7) = $modlibname =~ m/(^(.*lib\w*\/)?)((perl5\/[0-9\.]*\/)?)(([^\/]*)\/)?(.*)$/;
 +        print STDERR "*** p1: $p1  p3: $p3  p5: $p5 p7: $p7\n";
 +        if ( $p1 ne "" ) {
 +            $modlibname = $hostlib.$p7;
diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index 74c24c3bb5..e5f45bf291 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -131,28 +131,23 @@ RDEPENDS:perl-module-b-concise += "perl-module-strict"
 RDEPENDS:perl-module-b-concise += "perl-module-warnings"
 RDEPENDS:perl-module-benchmark += "perl-module-exporter"
 RDEPENDS:perl-module-benchmark += "perl-module-strict"
+RDEPENDS:perl-module-bigfloat += "perl-module-constant"
+RDEPENDS:perl-module-bigfloat += "perl-module-exporter"
+RDEPENDS:perl-module-bigfloat += "perl-module-overload"
+RDEPENDS:perl-module-bigfloat += "perl-module-strict"
+RDEPENDS:perl-module-bigfloat += "perl-module-warnings"
 RDEPENDS:perl-module-bigint += "perl-module-constant"
 RDEPENDS:perl-module-bigint += "perl-module-exporter"
-RDEPENDS:perl-module-bigint += "perl-module-math-bigint"
-RDEPENDS:perl-module-bigint += "perl-module-math-bigint-trace"
 RDEPENDS:perl-module-bigint += "perl-module-overload"
 RDEPENDS:perl-module-bigint += "perl-module-strict"
 RDEPENDS:perl-module-bigint += "perl-module-warnings"
-RDEPENDS:perl-module-bignum += "perl-module-bigint"
+RDEPENDS:perl-module-bignum += "perl-module-constant"
 RDEPENDS:perl-module-bignum += "perl-module-exporter"
-RDEPENDS:perl-module-bignum += "perl-module-math-bigfloat"
-RDEPENDS:perl-module-bignum += "perl-module-math-bigfloat-trace"
-RDEPENDS:perl-module-bignum += "perl-module-math-bigint"
-RDEPENDS:perl-module-bignum += "perl-module-math-bigint-trace"
 RDEPENDS:perl-module-bignum += "perl-module-overload"
 RDEPENDS:perl-module-bignum += "perl-module-strict"
 RDEPENDS:perl-module-bignum += "perl-module-warnings"
-RDEPENDS:perl-module-bigrat += "perl-module-bigint"
+RDEPENDS:perl-module-bigrat += "perl-module-constant"
 RDEPENDS:perl-module-bigrat += "perl-module-exporter"
-RDEPENDS:perl-module-bigrat += "perl-module-math-bigfloat"
-RDEPENDS:perl-module-bigrat += "perl-module-math-bigint"
-RDEPENDS:perl-module-bigrat += "perl-module-math-bigint-trace"
-RDEPENDS:perl-module-bigrat += "perl-module-math-bigrat"
 RDEPENDS:perl-module-bigrat += "perl-module-overload"
 RDEPENDS:perl-module-bigrat += "perl-module-strict"
 RDEPENDS:perl-module-bigrat += "perl-module-warnings"
@@ -166,6 +161,8 @@ RDEPENDS:perl-module-b-showlex += "perl-module-strict"
 RDEPENDS:perl-module-b-terse += "perl-module-b"
 RDEPENDS:perl-module-b-terse += "perl-module-b-concise"
 RDEPENDS:perl-module-b-terse += "perl-module-strict"
+RDEPENDS:perl-module-builtin += "perl-module-strict"
+RDEPENDS:perl-module-builtin += "perl-module-warnings"
 RDEPENDS:perl-module-b-xref += "perl-module-b"
 RDEPENDS:perl-module-b-xref += "perl-module-config"
 RDEPENDS:perl-module-b-xref += "perl-module-strict"
@@ -257,7 +254,6 @@ RDEPENDS:perl-module-cwd += "perl-module-errno"
 RDEPENDS:perl-module-cwd += "perl-module-exporter"
 RDEPENDS:perl-module-cwd += "perl-module-strict"
 RDEPENDS:perl-module-cwd += "perl-module-xsloader"
-RDEPENDS:perl-module-data-dumper += "perl-module-config"
 RDEPENDS:perl-module-data-dumper += "perl-module-constant"
 RDEPENDS:perl-module-data-dumper += "perl-module-exporter"
 RDEPENDS:perl-module-data-dumper += "perl-module-strict"
@@ -313,6 +309,8 @@ RDEPENDS:perl-module-digest-sha += "perl-module-vars"
 RDEPENDS:perl-module-digest-sha += "perl-module-warnings"
 RDEPENDS:perl-module-digest-sha += "perl-module-xsloader"
 RDEPENDS:perl-module-dynaloader += "perl-module-config"
+RDEPENDS:perl-module-dynaloader += "perl-module-strict"
+RDEPENDS:perl-module-dynaloader += "perl-module-vars"
 RDEPENDS:perl-module-encode-alias += "perl-module-constant"
 RDEPENDS:perl-module-encode-alias += "perl-module-encode"
 RDEPENDS:perl-module-encode-alias += "perl-module-exporter"
@@ -796,11 +794,12 @@ RDEPENDS:perl-module-file-basename += "perl-module-warnings"
 RDEPENDS:perl-module-filecache += "perl-module-parent"
 RDEPENDS:perl-module-filecache += "perl-module-strict"
 RDEPENDS:perl-module-file-compare += "perl-module-exporter"
-RDEPENDS:perl-module-file-compare += "perl-module-strict"
 RDEPENDS:perl-module-file-compare += "perl-module-warnings"
+RDEPENDS:perl-module-file-copy += "perl-module-builtin"
 RDEPENDS:perl-module-file-copy += "perl-module-config"
 RDEPENDS:perl-module-file-copy += "perl-module-exporter"
 RDEPENDS:perl-module-file-copy += "perl-module-file-basename"
+RDEPENDS:perl-module-file-copy += "perl-module-overload"
 RDEPENDS:perl-module-file-copy += "perl-module-strict"
 RDEPENDS:perl-module-file-copy += "perl-module-warnings"
 RDEPENDS:perl-module-file-dosglob += "perl-module-strict"
@@ -887,10 +886,12 @@ RDEPENDS:perl-module-getopt-long += "perl-module-warnings"
 RDEPENDS:perl-module-getopt-std += "perl-module-exporter"
 RDEPENDS:perl-module-getopt-std += "perl-module-strict"
 RDEPENDS:perl-module-getopt-std += "perl-module-warnings"
+RDEPENDS:perl-module-hash-util-fieldhash += "perl-module-builtin"
 RDEPENDS:perl-module-hash-util-fieldhash += "perl-module-exporter"
 RDEPENDS:perl-module-hash-util-fieldhash += "perl-module-strict"
 RDEPENDS:perl-module-hash-util-fieldhash += "perl-module-warnings"
 RDEPENDS:perl-module-hash-util-fieldhash += "perl-module-xsloader"
+RDEPENDS:perl-module-hash-util += "perl-module-builtin"
 RDEPENDS:perl-module-hash-util += "perl-module-exporter"
 RDEPENDS:perl-module-hash-util += "perl-module-hash-util-fieldhash"
 RDEPENDS:perl-module-hash-util += "perl-module-strict"
@@ -1258,6 +1259,7 @@ RDEPENDS:perl-module-math-bigint-calc += "perl-module-integer"
 RDEPENDS:perl-module-math-bigint-calc += "perl-module-math-bigint-lib"
 RDEPENDS:perl-module-math-bigint-calc += "perl-module-strict"
 RDEPENDS:perl-module-math-bigint-calc += "perl-module-warnings"
+RDEPENDS:perl-module-math-bigint-fastcalc += "perl-module-config"
 RDEPENDS:perl-module-math-bigint-fastcalc += "perl-module-math-bigint-calc"
 RDEPENDS:perl-module-math-bigint-fastcalc += "perl-module-strict"
 RDEPENDS:perl-module-math-bigint-fastcalc += "perl-module-warnings"
@@ -1278,9 +1280,15 @@ RDEPENDS:perl-module-math-bigint-trace += "perl-module-strict"
 RDEPENDS:perl-module-math-bigint-trace += "perl-module-warnings"
 RDEPENDS:perl-module-math-bigrat += "perl-module-math-bigfloat"
 RDEPENDS:perl-module-math-bigrat += "perl-module-math-bigint"
+RDEPENDS:perl-module-math-bigrat += "perl-module-math-complex"
 RDEPENDS:perl-module-math-bigrat += "perl-module-overload"
 RDEPENDS:perl-module-math-bigrat += "perl-module-strict"
 RDEPENDS:perl-module-math-bigrat += "perl-module-warnings"
+RDEPENDS:perl-module-math-bigrat-trace += "perl-module-exporter"
+RDEPENDS:perl-module-math-bigrat-trace += "perl-module-math-bigrat"
+RDEPENDS:perl-module-math-bigrat-trace += "perl-module-overload"
+RDEPENDS:perl-module-math-bigrat-trace += "perl-module-strict"
+RDEPENDS:perl-module-math-bigrat-trace += "perl-module-warnings"
 RDEPENDS:perl-module-math-complex += "perl-module-config"
 RDEPENDS:perl-module-math-complex += "perl-module-exporter"
 RDEPENDS:perl-module-math-complex += "perl-module-overload"
@@ -1665,6 +1673,7 @@ RDEPENDS:perl-module-socket += "perl-module-strict"
 RDEPENDS:perl-module-socket += "perl-module-warnings-register"
 RDEPENDS:perl-module-socket += "perl-module-xsloader"
 RDEPENDS:perl-module-sort += "perl-module-strict"
+RDEPENDS:perl-module-sort += "perl-module-warnings"
 RDEPENDS:perl-module-storable += "perl-module-exporter"
 RDEPENDS:perl-module-storable += "perl-module-io-file"
 RDEPENDS:perl-module-subs += "perl-module-strict"
@@ -1697,6 +1706,7 @@ RDEPENDS:perl-module-tap-base += "perl-module-constant"
 RDEPENDS:perl-module-tap-base += "perl-module-strict"
 RDEPENDS:perl-module-tap-base += "perl-module-warnings"
 RDEPENDS:perl-module-tap-formatter-base += "perl-module-base"
+RDEPENDS:perl-module-tap-formatter-base += "perl-module-config"
 RDEPENDS:perl-module-tap-formatter-base += "perl-module-posix"
 RDEPENDS:perl-module-tap-formatter-base += "perl-module-strict"
 RDEPENDS:perl-module-tap-formatter-base += "perl-module-tap-formatter-color"
@@ -1770,6 +1780,7 @@ RDEPENDS:perl-module-tap-parser-iterator-stream += "perl-module-strict"
 RDEPENDS:perl-module-tap-parser-iterator-stream += "perl-module-warnings"
 RDEPENDS:perl-module-tap-parser-multiplexer += "perl-module-base"
 RDEPENDS:perl-module-tap-parser-multiplexer += "perl-module-constant"
+RDEPENDS:perl-module-tap-parser-multiplexer += "perl-module-errno"
 RDEPENDS:perl-module-tap-parser-multiplexer += "perl-module-io-select"
 RDEPENDS:perl-module-tap-parser-multiplexer += "perl-module-strict"
 RDEPENDS:perl-module-tap-parser-multiplexer += "perl-module-warnings"
@@ -1947,6 +1958,7 @@ RDEPENDS:perl-module-test2-api += "perl-module-test2-hub-interceptor-terminator"
 RDEPENDS:perl-module-test2-api += "perl-module-test2-hub-subtest"
 RDEPENDS:perl-module-test2-api += "perl-module-test2-util"
 RDEPENDS:perl-module-test2-api += "perl-module-test2-util-trace"
+RDEPENDS:perl-module-test2-api += "perl-module-time-hires"
 RDEPENDS:perl-module-test2-api += "perl-module-warnings"
 RDEPENDS:perl-module-test2-api-stack += "perl-module-strict"
 RDEPENDS:perl-module-test2-api-stack += "perl-module-test2-api"
@@ -2197,14 +2209,11 @@ RDEPENDS:perl-module-text-balanced += "perl-module-strict"
 RDEPENDS:perl-module-text-balanced += "perl-module-vars"
 RDEPENDS:perl-module-text-parsewords += "perl-module-exporter"
 RDEPENDS:perl-module-text-parsewords += "perl-module-strict"
-RDEPENDS:perl-module-text-tabs += "perl-module-exporter"
+RDEPENDS:perl-module-text-parsewords += "perl-module-warnings"
 RDEPENDS:perl-module-text-tabs += "perl-module-strict"
-RDEPENDS:perl-module-text-tabs += "perl-module-vars"
-RDEPENDS:perl-module-text-wrap += "perl-module-exporter"
 RDEPENDS:perl-module-text-wrap += "perl-module-re"
 RDEPENDS:perl-module-text-wrap += "perl-module-strict"
 RDEPENDS:perl-module-text-wrap += "perl-module-text-tabs"
-RDEPENDS:perl-module-text-wrap += "perl-module-vars"
 RDEPENDS:perl-module-text-wrap += "perl-module-warnings-register"
 RDEPENDS:perl-module-thread += "perl-module-config"
 RDEPENDS:perl-module-thread += "perl-module-exporter"
@@ -2246,6 +2255,8 @@ RDEPENDS:perl-module-tie-scalar += "perl-module-warnings-register"
 RDEPENDS:perl-module-tie-stdhandle += "perl-module-strict"
 RDEPENDS:perl-module-tie-stdhandle += "perl-module-tie-handle"
 RDEPENDS:perl-module-tie-substrhash += "perl-module-integer"
+RDEPENDS:perl-module-tie-substrhash += "perl-module-strict"
+RDEPENDS:perl-module-tie-substrhash += "perl-module-warnings"
 RDEPENDS:perl-module-time-gmtime += "perl-module-exporter"
 RDEPENDS:perl-module-time-gmtime += "perl-module-strict"
 RDEPENDS:perl-module-time-gmtime += "perl-module-time-tm"
@@ -2295,6 +2306,7 @@ RDEPENDS:perl-module-unicode-collate += "perl-module-constant"
 RDEPENDS:perl-module-unicode-collate += "perl-module-strict"
 RDEPENDS:perl-module-unicode-collate += "perl-module-warnings"
 RDEPENDS:perl-module-unicode-collate += "perl-module-xsloader"
+RDEPENDS:perl-module-unicode-normalize += "perl-module-bytes"
 RDEPENDS:perl-module-unicode-normalize += "perl-module-exporter"
 RDEPENDS:perl-module-unicode-normalize += "perl-module-strict"
 RDEPENDS:perl-module-unicode-normalize += "perl-module-warnings"
@@ -2323,3 +2335,4 @@ RDEPENDS:perl-module-version += "perl-module-version-regex"
 RDEPENDS:perl-module-version += "perl-module-warnings-register"
 RDEPENDS:perl-module-version-regex += "perl-module-strict"
 RDEPENDS:perl-module-xsloader += "perl-module-dynaloader"
+RDEPENDS:perl-module-xsloader += "perl-module-strict"
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.34.1.bb
rename to meta/recipes-devtools/perl/perl_5.36.0.bb
index 4b9d2e2c50..9f7ce15f84 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "357951a491b0ba1ce3611263922feec78ccd581dddc24a446b033e25acf242a1"
+SRC_URI[perl.sha256sum] = "e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.30.2


