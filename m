Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B229DC77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 12:48:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.6896.1682513289904583781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 05:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XoNaJThA;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b70f0b320so9061878b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682513289; x=1685105289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kc8ED+cbxSggFFtY9R1LPaxU/UwKHWHxKEgPfiCvi8A=;
        b=XoNaJThAmN+pLRR5H6qp7OlEkM9/7q+ba7wOXcYwZeyibFikDD2nFTgLjcc8pnCsGb
         +HwnBQK/J8/1GWCrSCDjr6aAdTwQu1haN1OODDuTJ1jEpP51BmEHu69C2n5O7nkTTdpH
         +n0fCmvO78b/uqVkHU+iEh9cHgjcNcHL8/9EzuJZ7jarCWFRxPHJgLGOWb9FcY7z7vzc
         hkj2MaXCYuh43FwOO8Ebcdp1qzDAvC8Kr0amPqGjspGgYvmSK6QqfEG3p5YJVjiHx4J2
         UBzgOIWljyaEq/Oy+zwWnEz1LvEg9g0Iy+qCVShzoFCS70Uz9yQBa+PAINmTW4U384tH
         cW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682513289; x=1685105289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc8ED+cbxSggFFtY9R1LPaxU/UwKHWHxKEgPfiCvi8A=;
        b=IW/rY0hrKumohiefACaVgN/9aR/TMRT3pQTsCpVFJhptKl30hqJVLJrQLAMyfOvVUS
         NIxNGyZQl/FieMg2vtmJgnM426eBBj7N1MDL/g+8ptCRURllhfCrKZ9BPVVQ2LQbzeM0
         gPcF740rBtRuKI+sPy1OfKVBgcafCIddr5F5CTCdIKB3LIEk/acl2nHtwBjGXSrPuXUF
         uTaGOTLePh31xCFdFRxypyMzMdBVPsjTDjU+y5XYBNj/AQawLesHPUZ1rtu+cTo6Ce21
         kXwHFJW/9zdbDaHcE6UUN75oXztr+HtE0W8f1UWOm3Q+zY7XbVMAY2TdwVQTQtx08zhn
         oJ6w==
X-Gm-Message-State: AAQBX9cLz0RpE/6gMwT7fg5ljFwV0s/2bqjDk7E3TpZghcpoRtT9jOay
	ZfXH3D/pKs5l6AQnYdZryfdMwSWmdDFz8HdJ
X-Google-Smtp-Source: AKy350YYbvSYFQhFLv3oGUJhnZehAN4E4fJrkBdwwLkgzwV7gS+8O4kIP9vJxH2wgVcXc1RE+0VTHw==
X-Received: by 2002:a05:6a00:1796:b0:634:7ba3:d140 with SMTP id s22-20020a056a00179600b006347ba3d140mr30376051pfg.15.1682513288983;
        Wed, 26 Apr 2023 05:48:08 -0700 (PDT)
Received: from bft-2.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id r78-20020a632b51000000b00520f316ebe3sm9577631pgr.62.2023.04.26.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 05:48:08 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [mickledore][PATCH V2] binutils: stable 2.40 branch updates
Date: Wed, 26 Apr 2023 18:17:47 +0530
Message-Id: <20230426124747.2326016-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 12:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180441

Below commits on binutils-2.40 stable branch are updated.
4671be001eb Updated Hungarian translation for the gprof directory
ded035f913e lto: Don't add indirect symbols for versioned aliases in IR
74cb2ddeabc gas: arm: Change warning message to not reference specific A-class architecture revision
570b9c09bbf gas: arm: Fix a further IT-predicated vcvt issue in the presense of MVE vcvtn
bddd62e188c libctf: get the offsets of fields of unnamed structs/unions right
7aa47eafcce libctf: fix assertion failure with no system qsort_r
165accf0752 coff_get_normalized_symtab bfd_release
af35798e957 PR30217, dynamic relocations using local dynamic symbols
18bb604f1e1 PR30198, Assertion and segfault when linking x86_64 elf and coff
34a2b4a0e21 PR30155, ld segfault in _bfd_nearby_section
3d0046f39aa PR30046, power cmpi leads to unknown architecture
5c87fb1d59b ppc32 and "LOAD segment with RWX permissions"
11f5c1ebf14 Updated Serbian translations for gold, gprof and opcodes sub-directories
38e455b1d9a Updated translations for the bfd and gprof directories.
b2bc62b7b4e gas: correct symbol name comparison in .startof./.sizeof. handling
17294931e3e configure: remove dependencies on gmp and mpfr when gdb is disabled
1fc096a4c59 Regen config files
e1815414077 Pass $JANSSON_LIBS and $ZSTD_LIBS to ld-bootstrap/bootrap.exp
3e888977f16 bpf: fix error conversion from long unsigned int to unsigned int [-Werror=overflow]
65dbb942145 Updated Swedish translation for the binutils sub-directory
27f59ec47a1 RISC-V: make C-extension JAL available again for (32-bit) assembly
edd36b26f35 gprofng: PR30043 libgprofng.so.* are installed to a wrong location
c6e269febbc gprofng: PR29521 [docs] man pages are not in the release tarball
bcea253f5fa toplevel: Makefile.def: add install-strip dependency on libsframe

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.40.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index 93631ca3d7..5c0df06208 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "ffb83e32fc11f36b7b82b876c14888f82cd983b3"
+SRCREV ?= "4671be001eb5a899ecac3e2686a92934000f8262"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


