Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514C7C35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 13:01:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.36254.1741784467552351654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 06:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HZWw467p;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso7147987a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741784466; x=1742389266; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GNYrSHe6bcaa3yIMeds4psdenBqjFUJ660LrJ9iawM=;
        b=HZWw467pYMRwXUDwfU9GGAGZMFGvwqZvZU2MienM1uzFfflqZPlrzCjuhJAFSymCVe
         vHBlrzdpQmZ9izo09S8cL2jaqLkKwD8dPaqEI33QV1bFg02uT7+aEe3UMuPwtJ8x7R3D
         AULVJqjW1U85wNAJ3VKPUdYDfE6L85fUvgX7at08/igfqyxEiI9uqDf+6PAMqw/YwLWA
         dLHX3Ywu8D5Nydq2k2LBfjaG3xqu2ZfxTvc/HMWKqybsbKAYjeCfALJ0MIJfIg/1/USD
         SEAeJKlRX4Yl7+nCPFqePNqJKgC065AGx+Sjzop+cD/xF5NvDTg004oxWn3jwkEfABmq
         8DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741784466; x=1742389266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GNYrSHe6bcaa3yIMeds4psdenBqjFUJ660LrJ9iawM=;
        b=NccieLivTbtUuV2EAVGydXDojaWfB1E5GhzsXOcKZ6ZtNwJzffIE9eUX+ej2Px+lM5
         xsYnO3fIFWhWPjUTOuIOHNRlOyzioZzCbdo3IBOpBDCi0FCsng/MZPc+5GASA6JOuboU
         FWvkExAAencJwf+WwxTSF4uc3YQ4W/TIUPdRq5A8BER7RltQp6X+VbUer7ETht2ZnSLe
         a6j3qIJWwWAx1DEXM4bX/u19iFeReuRmw57VvwVYGLaBA0NLHKK4trIU8H/zehc9E2MO
         YR1K7VuqVXgzr7uTtTheorTVyovyUFc0F3f058YaxI1SBEs2Ix71HHieokN4BpSidu8N
         GAjA==
X-Gm-Message-State: AOJu0YyyDTuXf6cp8tgloQd/1f5j+WhMauHAGXbQxb77RiHMu2dcc+Oo
	/mF8Tj3s30aCKyklgNgFe30KQ0w0T4gyhUGqysku0I6BTnI+S1IK
X-Gm-Gg: ASbGnctZkJfgfT1/XvfF1yw0TC7SlNIgLys739Gkd84cLhN4Bga++0+Lg9IhrjyGL+o
	UUj5ngZOkRS+rdqMxlyTZpEwazFqc6MFOjSTWDPzemBQCzwCI+4oQvjyPeMOiWD+n7lJLVA/sBi
	VG2spscesIpUeDoOaCT2aSyRsqZJ93ekOzcWsx1rqsIiXHrtmVceGGIrwQlNAHTqtRGHFUtd6gN
	h5IuJ3QZZLzIcqBqV7aMp7DAe18c+DY5+G9ZN6JTKNXMIFWhWtRR+QCNKYZ30f+ILhjdxYNqOUw
	BM1dvIYYCnTqTg89SdNynuC/DizY/faeyiesSjvnkeMpaEhogsYIwjGVAmBYfos04jJzcQBYIq7
	z/uaBOFa63ls=
X-Google-Smtp-Source: AGHT+IFZKu3S7a37Xw+Y4LIJXpV7UdLm9PiDpPtLQsA3y5BspwIT0aKWXgxB4PAFGqtUzUNVhrPSuA==
X-Received: by 2002:a17:907:dac:b0:ac2:baab:681c with SMTP id a640c23a62f3a-ac2baab6a4fmr918151166b.28.1741784463495;
        Wed, 12 Mar 2025 06:01:03 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988b64asm1068306266b.155.2025.03.12.06.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:01:03 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Mar 2025 13:00:45 +0000
Subject: [PATCH OE-Core 2/4] scdoc: Upgrade 1.11.2 -> 1.11.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-upgrade-kmod-v1-2-4de94f131b64@gmail.com>
References: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
In-Reply-To: <20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212652

Drop "dont add -static to LDFLAGS" patch as this is now upstream.

Changes:
	Dimitry Andric (1):
	      Fix clang 15 -Wstrict-prototypes warnings

	Drew DeVault (3):
	      README.md: mention system packages
	      Update version to 1.11.3
	      Makefile: drop -static

	Eli Schwartz (2):
	      remove useless re-declarations of standard functions
	      get rid of some unused includes

	Humm (3):
	      use .PP for paragraph breaks
	      scdoc(1), scdoc(5): follow conventions more closely
	      simplify list output

	Kirill Chibisov (1):
	      Emit \(ti and \(ha instead of ~ and ^

	Max Schillinger (1):
	      fix formatting of escaped backticks

	Nico Wagner (1):
	      Makefile: remove unnecessary path separator

	Simon Branch (2):
	      scdoc.5: fix capitalization of subsection headers
	      scdoc.5: fix formatting in the preamble

	Simon Ser (1):
	      man: add section about SOURCE_DATE_EPOCH

	Viacheslav Kruglov (1):
	      Fix logical error in comparison with ULONG_MAX

	elij (1):
	      strip indentation after a hard line break `++`

	jturtle (1):
	      Emit '\e' instead of '\\'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../0001-Makefile-dont-add-static-to-LDFLAGS.patch | 27 ----------------------
 .../scdoc/{scdoc_git.bb => scdoc_1.11.3.bb}        | 21 ++++++++---------
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
deleted file mode 100644
index b520e949c0b31c0908118cba4f6c2b6ea26f5a26..0000000000000000000000000000000000000000
--- a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-dont-add-static-to-LDFLAGS.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2cac433806d9622dbc005fe5738f1ae8c33a98cb Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Thu, 13 Jul 2023 19:26:40 +0200
-Subject: [PATCH] Makefile: dont add -static to LDFLAGS
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Inappropriate [oe-specific]
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 60a80b8..49021fa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,7 +1,6 @@
- VERSION=1.11.2
- CFLAGS?=-g
- MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
--LDFLAGS+=-static
- INCLUDE+=-Iinclude
- PREFIX?=/usr/local
- BINDIR?=$(PREFIX)/bin
--- 
-2.39.3
-
diff --git a/meta/recipes-extended/scdoc/scdoc_git.bb b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
similarity index 54%
rename from meta/recipes-extended/scdoc/scdoc_git.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.3.bb
index 224e5417342e9db820456ec54476a1e3cac0e4e4..330d4e426f6e552e37214fffea244659eb8e4dcf 100644
--- a/meta/recipes-extended/scdoc/scdoc_git.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
@@ -5,21 +5,18 @@ SECTION = "base/doc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 
-SRC_URI = " \
-	git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
-	file://0001-Makefile-dont-add-static-to-LDFLAGS.patch \
-"
-
 DEPENDS = "scdoc-native"
 
-S = "${WORKDIR}/git"
-PV = "1.11.2"
-SRCREV = "afeda241f3f9b2c27e461f32d9c2a704ab82ef61"
+PV .= "+git"
 
-EXTRA_OEMAKE:class-native = "PREFIX=${prefix}"
-EXTRA_OEMAKE:class-target = "PREFIX=${prefix} HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
+SRCREV = "29306d8dde650f5ac2bcc067f3c1d3bcfcac7a1d"
+
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
-	
-BBCLASSEXTEND = "native"
 
+EXTRA_OEMAKE = "PREFIX=${prefix}"
+EXTRA_OEMAKE:append:class-target = " HOST_SCDOC=${STAGING_BINDIR_NATIVE}/scdoc"
+
+BBCLASSEXTEND = "native"

-- 
2.25.1


