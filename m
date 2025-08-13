Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB85DC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 06:24:39 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.94886.1755066270530078199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 23:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ai9U6NzY;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7682560a2f2so605837b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 23:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755066269; x=1755671069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EwpiPJoKzez7LsPqxO9CvA64e9uNstb+hlk+/l26FF0=;
        b=Ai9U6NzYpHkqMmWDGv+K+R6jN7oXLUIctFEKwoLZLqNba5v9M/n9eMNSb66MhBv+1S
         +9Hhuw4586YjbrEX+p8sTv5W56wJ8oliNbjjFsSDoEF7UEhLkuMgRRHGSl5dtgyTJLoI
         ATDKGHsPEcdfqdjeTMrfXIq/QD6pTCAV0/h7PYj7zStzkzLmYocd3G8edKq75f01j1CM
         Fhaaq22M6a2v/7AD+o7byPfXus/VQduHkuEuC4zA/7TLoio9rj5AJTb8oxqnW9g5uc8W
         e//Qng8ENex4UISGoHHnPTxgNlQOaoJ0lwQbx7SrfrmJiTdfWHQZJ2nO/CU60GAoaWM6
         RgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755066269; x=1755671069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwpiPJoKzez7LsPqxO9CvA64e9uNstb+hlk+/l26FF0=;
        b=vvHL8xl4+0UurxBcINhQQ5MwbyQ7QueHxCXgMGXxgJGfg2zMf1NHFCChMoxEwZUVL8
         LcgDVFe1RBXiCjzKhFe8AGbBUFCKtC13brSzTYDs8flY658mZwHkWEt0CVePEnpfrG3L
         31fv4Z+wtsACBWi8/PbnFlly6fXUgooqO71j99NXddssSwC4flBzwUvT+Tv+DXBFqi06
         pszF1fP5ih6O0CsTNJgWJLFrRP46W6+FgZyg3XcxpaLLncmceJsmuLlho+r9IhvcXLGP
         8UQU3GwIYPCnckD78nKIfkFkCNX5F+Qt1dOAz3joGt1BHCrD4Clv5JwLRRncB1pjQ5DD
         J4CQ==
X-Gm-Message-State: AOJu0YwqBaQbqLssR4xrvUCSbDZQyZ086P2cv55zXjnXBrsrQAnGNScL
	op+zpj1Xjp5J8bqyvMrNpyCjZ4C4iiBMEj187dLuKb6R+/2o7q2UPUWnV8EY2kmfSkU=
X-Gm-Gg: ASbGnct1Jr6UV3wFlT29zSvzLaw70uU8FGey12azvXeSfBz6hc5LurZO9KQk0vzx5W/
	336xZ09BsqOvNs/wfLof/q8dxqzbFZKuwHE9JHX9xAYUYjmG+oJ0RW8R1Zf7Bt8YU+OdG6aqfEa
	oWYWTyNkyty9RaAoWTDCE/AVFztx1FOHa/8zRezeZ/ccm0adZC2mSvR+rwzZMfkxrfSvAFNsca2
	34KPboTOJLKtdb7Pa92xiltkuGPiSJROPpnSR6D32M2a47hGo5i2fab/KLm+elgqJY33ctQnPLu
	9F46jfuvKIRozxwqguXtLZNdfYqzfDwH4z2ZO+vmaKe7GnUHX7P5JvD93WXorjE2oxZQ1m2FwIK
	NJgJeGRbWbIpeXx5KoJbIQg==
X-Google-Smtp-Source: AGHT+IEV9D1cyy+O8uyx4eTx9ovH7Ypxiy5lGv4zLIgwAbDCbCqK/YJtKjA6AEnyQEGV+L8p8iRwyQ==
X-Received: by 2002:a05:6a00:2789:b0:76b:fdac:d884 with SMTP id d2e1a72fcca58-76e229845c9mr1943047b3a.3.1755066269324;
        Tue, 12 Aug 2025 23:24:29 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b44f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfcf523sm31004004b3a.90.2025.08.12.23.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:24:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] elfutils: Add provisions for marking XFAILS in ptests
Date: Tue, 12 Aug 2025 23:24:26 -0700
Message-ID: <20250813062427.884193-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 06:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221788

elfuitls testsuites do not pass on all kind of distro features e.g.
with musl there are failures and with ld-is-lld less numer but it shows
failures too. Make run-ptest treat these as known failures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.193.bb | 5 +++++
 meta/recipes-devtools/elfutils/files/run-ptest   | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
index 4ccea2bea3b..e700c415be9 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -63,6 +63,10 @@ do_compile_ptest() {
 }
 PTEST_PARALLEL_MAKE = ""
 
+PTEST_XFAILS ?= ""
+# See - https://sourceware.org/bugzilla/show_bug.cgi?id=32232
+PTEST_XFAILS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-reverse-sections-self.sh', '', d)}"
+
 do_install_ptest() {
 	# copy the files which needed by the cases
 	TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
@@ -100,6 +104,7 @@ do_install_ptest() {
 	cp -r ${B}/debuginfod                   ${D}${PTEST_PATH}
 	sed -i '/^Makefile:/c Makefile:'        ${D}${PTEST_PATH}/tests/Makefile
 	find ${D}${PTEST_PATH} -type f -name *.[hoc] | xargs -i rm {}
+	sed -i -e 's|@XFAIL_TESTS@|${PTEST_XFAILS}|' ${D}${PTEST_PATH}/run-ptest
 }
 
 EXTRA_OEMAKE:class-native = ""
diff --git a/meta/recipes-devtools/elfutils/files/run-ptest b/meta/recipes-devtools/elfutils/files/run-ptest
index d5776fdb538..3c6c14e47f9 100644
--- a/meta/recipes-devtools/elfutils/files/run-ptest
+++ b/meta/recipes-devtools/elfutils/files/run-ptest
@@ -3,4 +3,4 @@
 #This script is used to run elfutils test suites
 cd tests
 
-make -k installcheck-local CC=gcc abs_srcdir=$PWD abs_builddir=$PWD srcdir=$PWD top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed elfutils_tests_rpath=no program_transform_name=s,^,eu-,
+make -k installcheck-local CC=gcc abs_srcdir=$PWD abs_builddir=$PWD srcdir=$PWD top_srcdir=$PWD/../ abs_top_builddir=$PWD/../ elfutils_testrun=installed elfutils_tests_rpath=no program_transform_name=s,^,eu-, XFAIL_TESTS="@XFAIL_TESTS@"

