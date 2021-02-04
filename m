Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.2120.1612470929645492387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 12:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HOITiZ9W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id w14so2855337pfi.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 12:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nEcQRTcmBdIPMW5G1T8VBQTihudnFy8CnCY1hz/IXzw=;
        b=HOITiZ9Wm1oSrjwr6XjeDaF7O7Ur3CZq1DxRCTtoktCq5N4r8AcEf/xPn7jjvADRAC
         XNaz+dCikroKMUz4rEtZTV0mFzMoJc7IjaSynDRZSnIQMAJ1QvYJoD8RFfpYSwJV7nFN
         bBURypK0iS5Iom/Gmq+tI0RxYxNbHtLJJMPq2EH805qeKROT594txK/5zxxf19UogYvB
         qjq15lZ7ZNufo/xpku33rkVA11hwEDSrvhQeHTN/zNaki7hhZ8WNqSHSM5N0B4RDKdfq
         1s3YJHdg+F4UkluTviX9LKG5vLSdPce4lFSwCJ1ZpnCDPXV59UDpsOtX4Amwuu+yOu1a
         Iy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nEcQRTcmBdIPMW5G1T8VBQTihudnFy8CnCY1hz/IXzw=;
        b=QlRe5sssF7eIRKDAzw6Sc3AYdJd51vOT6XgQIM4Jrv0VyKWbmZa0dCUUhGv5pJVNbu
         qZT0KT+4HSLzbqBldrIjRP7aVQ/L6i4GwGLQrM6hG52PSzhGdf8mc42MhW5NxjnCcHCF
         DzekQCV44Bvxc2bDDbUbvTL2CH48b+WoLXKUDDaTyqCt+KYtz+cFV/UCuuYLjG5yRW+w
         xKCgloEufM7OBuhh6FytJI6RykIT40y6TXNwN53bVHTsLbfYsDsLFKR0r3QNLmXNYLQD
         eOPDqWJ4M0b2iYqUKkkU7XVNrvfSMllj1V1JgTgIY2OepszuVsLqpFYK6Fd6mv8vgdMF
         mqGg==
X-Gm-Message-State: AOAM5310iYNMiFHSFOtPuAFL8ihSohdYGVgB8TZANezGfROIOsyFSwUQ
	GXNwITGHknZ00CB+oOB16Jcb5EZoZp7MD3KVQFg=
X-Google-Smtp-Source: ABdhPJxpnIx/Nl5NZkh0NETgmQhOMGFj1aMSlZl2NDJtubp5xVYjtZGk0QcVoko06YSo0xoNrZyCVA==
X-Received: by 2002:a63:705c:: with SMTP id a28mr798011pgn.402.1612470928381;
        Thu, 04 Feb 2021 12:35:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id m27sm7432104pgn.62.2021.02.04.12.35.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:35:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master] glibc: update to latest release/2.32/master branch
Date: Thu,  4 Feb 2021 10:34:51 -1000
Message-Id: <20210204203451.2143587-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patches for CVE-2019-25013 and CVE-2020-27618 since they are
present in the branch now. Add both CVEs to CVE_CHECK_WHITELIST.

760e1d28782 gconv: Fix assertion failure in ISO-2022-JP-3 module (bug 27256)
d3cb8f6222a aarch64: fix static PIE start code for BTI [BZ #27068]
082798622d8 __vfscanf_internal: fix aliasing violation (bug 26690)
33dc30bc838 aarch64: Use mmap to add PROT_BTI instead of mprotect [BZ #26831]
46e1e64fe3e elf: Pass the fd to note processing
b6eae83717d elf: Move note processing after l_phdr is updated
c6090dcebd1 aarch64: align address for BTI protection [BZ #26988]
610e2c51504 aarch64: Fix missing BTI protection from dependencies [BZ #26926]
4c619b3eed5 x86: Check IFUNC definition in unrelocated executable [BZ #20019]
87450ecf8a8 x86: Set header.feature_1 in TCB for always-on CET [BZ #27177]
2b4f67c2b33 Update for [BZ #27130] fix
1a24bbd43e4 x86-64: Avoid rep movsb with short distance [BZ #27130]
0d9793e82a1 Fix buffer overrun in EUC-KR conversion module (bz #24973)
1d49bede4d8 tests-mcheck: New variable to run tests with MALLOC_CHECK_=3
050022910be iconv: Accept redundant shift sequences in IBM1364 [BZ #26224]
ac0a6929c5d sh: Add sh4 fpu Implies folder
3ea24955bff struct _Unwind_Exception alignment should not depend on compiler flags
5c36293f067 resolv: Serialize processing in resolv/tst-resolv-txnid-collision
2dfa659a66f resolv: Handle transaction ID collisions in parallel queries (bug 26600)
05c025abca1 support: Provide a way to clear the RA bit in DNS server responses
f688bcd83de support: Provide a way to reorder responses within the DNS test server
eba0ce60588 Remove __warndecl
5337b2af4b8 Remove __warn_memset_zero_len [BZ #25399]
c6e794640c3 aarch64: Add unwind information to _start (bug 26853)
70ee5e8b573 aarch64: Fix DT_AARCH64_VARIANT_PCS handling [BZ #26798]
8813b2682e4 x86: Optimizing memcpy for AMD Zen architecture.
e61a8fd8fad Reversing calculation of __x86_shared_non_temporal_threshold
0b9460d22e2 sysvipc: Fix IPC_INFO and SHM_INFO handling [BZ #26636]
c4aeedea598 sysvipc: Fix IPC_INFO and MSG_INFO handling [BZ #26639]
9b139b6b81a sysvipc: Fix SEM_STAT_ANY kernel argument pass [BZ #26637]
81c5484d93a AArch64: Use __memcpy_simd on Neoverse N2/V1
0f8f0ed25c1 AArch64: Improve backwards memmove performance
23482f78866 Set version.h RELEASE to "stable" (Bug 26700)
69beb5cbf85 string: Fix strerrorname_np return value [BZ #26555]
fe62c4d173f intl: Handle translation output codesets with suffixes [BZ #26383]
386543bc449 NEWS: Update for [BZ #26534] fix
cebc01cbfd6 x86-64: Fix FMA4 detection in ifunc [BZ #26534]

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.32.bb     | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1566056297..586b2e207e 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.32/master"
 PV = "2.32"
-SRCREV_glibc ?= "3de512be7ea6053255afed6154db9ee31d4e557a"
+SRCREV_glibc ?= "760e1d287825fa91d4d5a0cc921340c740d803e2"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index 2d9c707a0b..249f59176e 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -1,7 +1,8 @@
 require glibc.inc
 require glibc-version.inc
 
-CVE_CHECK_WHITELIST += "CVE-2020-10029"
+# whitelist CVE's with fixes in latest release/2.32/master branch
+CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618"
 
 DEPENDS += "gperf-native bison-native make-native"
 
@@ -45,8 +46,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch \
            file://CVE-2020-29562.patch \
            file://CVE-2020-29573.patch \
-           file://CVE-2019-25013.patch \
-           file://CVE-2020-27618.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1

