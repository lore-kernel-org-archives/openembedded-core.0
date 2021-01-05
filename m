Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web08.3453.1609841890543111176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 02:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kwjPh-0002t7-UX; Tue, 05 Jan 2021 12:18:06 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1kwjPh-000BNw-T3; Tue, 05 Jan 2021 12:18:05 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [dunfell][PATCH] glibc: update to 2.31 stable tree head
Date: Tue,  5 Jan 2021 12:17:52 +0200
Message-Id: <20210105101752.41854-1-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Rspam-Score: 2.3 (++)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(2.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: BROKEN_CONTENT_TYPE(1.50)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20210105101752.41854-1-mikko.rapeli@bmw.de
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Content-Transfer-Encoding: 8bit

Includes fixes:

$ git log --format="%h %s" 6fdf971c9dbf7dac9bea552113fe4694015bbc4d..df31c7ca927242d5d4eee97f93a01e23ff47e332
df31c7ca92 iconv: Accept redundant shift sequences in IBM1364 [BZ #26224]
7df507808c sh: Add sh4 fpu Implies folder
8dc7605665 aarch64: Fix DT_AARCH64_VARIANT_PCS handling [BZ #26798]
48cf525f4b x86: Optimizing memcpy for AMD Zen architecture.
8d730cb25a Reversing calculation of __x86_shared_non_temporal_threshold
4bc9918c99 AArch64: Use __memcpy_simd on Neoverse N2/V1
4722d1fb9d [AArch64] Improve integer memcpy
bea507a3f5 AArch64: Rename IS_ARES to IS_NEOVERSE_N1
d0a5b76902 AArch64: Improve backwards memmove performance
24a30c5959 AArch64: Add optimized Q-register memcpy
88db98fa6e AArch64: Align ENTRY to a cacheline
32965a46ce intl: Handle translation output codesets with suffixes [BZ #26383]

Tested on aarch64 target with CI and long running tests.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 3bcd336de4..5f726537ff 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "6fdf971c9dbf7dac9bea552113fe4694015bbc4d"
+SRCREV_glibc ?= "df31c7ca927242d5d4eee97f93a01e23ff47e332"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.20.1

