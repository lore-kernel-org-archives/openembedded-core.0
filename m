Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 92193770F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:30 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id m5-v6so5977941pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z1n0eWV8IXcejJyJjFVApfbsjbSIVqAEO1FpHmsE9bE=;
	b=IJTj7q2GzSUmqvX5gTH1H7wIL6QmrZRUFhn1tgDf1OfG7GfWSoT0PpsGmckj5+t/7e
	NdX+YZ0LIueFcy4HOLpTgakW+u79jhPRHBUvFwQLbS02zw2drXNELsnObwzNXh4a4JL3
	5PdmCHnzmG9KAn0tuAnfD9nFaVrZT04aJ9V4zeg1ccU6YiaRh2C7vLY8FdFfpIvADynR
	jcAtvBA4LIjx/+wTNZHNba8YO/s6xAaejxbELRLEeqe2vlRjSpdMEOCRDal3BEEVd8qH
	7vA1pPgOdelpVDH/aYns/Y9+FoYMlwVxHXBjoNP5JPiyP61XTbzZcQUy1ibCSBuuQzhV
	wnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z1n0eWV8IXcejJyJjFVApfbsjbSIVqAEO1FpHmsE9bE=;
	b=Ppg/UUFTZxXgdARPgh/7toY/KSmtqY7qDHiL5lwe6OU/Ce1jk3hsIvFunHsjEa8zSu
	crY2YF0khDzair1r/aTkSbjPrPmHsg0wDHJ2IGnbxDZtKURid9im/oddTNOkCzsMv6SV
	zVE6mhdaSk8/PQKifYGA0F/80eSMZ4Pl/xeTH277Oc0oe63wYY6K3qu5DSNjrIkqRApP
	8XWIKwdrwB0+LjQFBd9bw4Uz5XmJ7HcWtdeWTV7U7apaAvZ+ZTwbqoOATax8xHW+IC6n
	tfQWS93RZ2KpSnRNRlI4Ru54KKQ92EhRG8pAhskqtOM0eVcU6cxj1z6sgzlWs+tzrA0m
	YY3A==
X-Gm-Message-State: APt69E2BCFSnRczYfN5hend3n+JitavwYG4khUv5a7uIbu8PYutUpY4f
	nJTsThOmkCHuuZeRgFKQrwJUzg==
X-Google-Smtp-Source: ADUXVKI0jp1m1CY8Dk1x+NXvAlYkErcOjcLdcqF4rDPa6281GqNprSGd9BpsN/aHYNBJvpxGZGtgEw==
X-Received: by 2002:a63:b91b:: with SMTP id
	z27-v6mr4249365pge.240.1528442911520; 
	Fri, 08 Jun 2018 00:28:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm33935578pfk.12.2018.06.08.00.28.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:24 -0700
Message-Id: <72b0cbaa3538fae799b63c0c7ab68ac9bcf7fa9f.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528442551.git.raj.khem@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
Subject: [PATCH 4/7] gcc-8: Enabled mspe options for rs6000 ppc backend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2018 07:28:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc         |  1 +
 ...Re-introduce-spe-commandline-options.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index 2b176ac98d..cb0fbd9379 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
            file://0037-sync-gcc-stddef.h-with-musl.patch \
            file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0039-Fix-for-testsuite-failure.patch \
+           file://0040-Re-introduce-spe-commandline-options.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
new file mode 100644
index 0000000000..8afa0102da
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
@@ -0,0 +1,41 @@
+From 8fb8f773e117ee70be00bb0da5f343fe110da5c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Jun 2018 12:10:22 -0700
+Subject: [PATCH 40/40] Re-introduce spe commandline options
+
+This should ensure that we keep accepting
+spe options
+
+Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
+index ace8a477550..d6a8f825d88 100644
+--- a/gcc/config/rs6000/rs6000.opt
++++ b/gcc/config/rs6000/rs6000.opt
+@@ -365,6 +365,18 @@ mdebug=
+ Target RejectNegative Joined
+ -mdebug=	Enable debug output.
+ 
++mspe
++Target Var(rs6000_spe) Save
++Generate SPE SIMD instructions on E500.
++
++mabi=spe
++Target RejectNegative Var(rs6000_spe_abi) Save
++Use the SPE ABI extensions.
++
++mabi=no-spe
++Target RejectNegative Var(rs6000_spe_abi, 0)
++Do not use the SPE ABI extensions.
++
+ mabi=altivec
+ Target RejectNegative Var(rs6000_altivec_abi) Save
+ Use the AltiVec ABI extensions.
+-- 
+2.17.1
+
-- 
2.17.1


