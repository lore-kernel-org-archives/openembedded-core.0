Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7919.1795060431402844995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 19:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Jl4S30b9;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2106; q=dns/txt;
  s=iport01; t=1795060431; x=1796270031;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qE/U1sY90CiQ8vykKNli5qxNuXEbkUhtw4zBNvacpZI=;
  b=Jl4S30b96oBliqKp5XVY5nXRJ6w+aHwEFqCPZMmIa5axXTqzZBEqYH1P
   RwC13odf+rJ6P489XmmHFZSKHutGcnq6y30L2/HuIU3LZbKQ44aklc7CB
   Hk69bwGEInT+bGt23ykN+eb68I2I4mlunZ9Znoav5tbOxmLUBz0GMIiLR
   8RVDZvSjgqadE6+V4iXv3aL6FRbMt4ySGiR+f7m9YmRlDMsyZRRlCO9g0
   RA9aiUvSQFqvp2DijG7sF9XCqNqdfaFmDwglswheAuSelGbXGd0LaYJP7
   4H0Rn7h9npkoTgfguJMaHuxM6cKAMopOKuQfT1jBETrTam90zQ9kuR0NA
   w==;
X-CSE-ConnectionGUID: AyJ4udquRlGCgg0fMb0MuQ==
X-CSE-MsgGUID: KBH5xVo6TX+eDHz0NNKJQQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgBjcf5q/9FK/pBQCoJZgld1YENJk1oBT4IhniyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGTJwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QSwF2XESDAgGCdAMRuTOCLIEBhH7bMwELFAGBOIVCiCR1AYR9J?=
 =?us-ascii?q?xsbgXKEf4JhBBiBDQx6hXkEgiJ6Eo5riVtIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bC?=
 =?us-ascii?q?oEMJx8eGw4CDhgNSBEsNxUZBD5uB5NRgxiBDxMYgWymNaERCiiDeYwklToaM?=
 =?us-ascii?q?4QEgVelF5kIglmLMZZRhGqBaDyBWXAVgyIJShkPji0XiHPHKyYyCzIBAQcCB?=
 =?us-ascii?q?w4DC4FokACBfgEB?=
IronPort-Data: A9a23:ewLheaukfO6SEIcot2+2UusyrefnVANfMUV32f8akzHdYApBsoF/q
 tZmKWmGOP7ZYTOjfdgjaITk/B4AuMXRy4djSgpo+38zHiISgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva+Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0/dVXXxC7
 OEiLB8mYR/bice8mJemc7w57igjBJGD0II3s3x6iDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgZ/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKLI43XGJ0Iwy50o
 Erl1USkEi8dauCvijep0mD0oMnsvxrCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:QpdAwqOosPazoMBcTvGjsMiBIKoaSvp037BN7TESdfU7SKKlfq
 yV8cjztiWE6wr5JktApTnoAsDpKhnhHPVOjrX5U43PYOCfgguVBbAny5f+yDv9HCC73Otc2a
 B8N5VaMrTLfD1HZQKQ2njeLz7mq+P3lJyVuQ==
X-Talos-CUID: 9a23:5ySvbmC1A2TqhlL6EwB21hIJFtk4SHny53jfe0GdAz5MVYTAHA==
X-Talos-MUID: 9a23:tg56rgqYB14wyc9zUZMezxJIFJp43aPwNHBOnLkmqZGiEw9SAg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61955055"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 03:53:47 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 3740C18000181
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 03:53:47 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id DC9DBCC1611; Wed, 18 Nov 2026 19:53:45 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] glibc: stable 2.43 branch updates to 124e9adcd4
Date: Wed, 18 Nov 2026 19:53:45 -0800
Message-Id: <20261119035345.3136238-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 03:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250607
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

Update SRCREV from 562cd7badd to 124e9adcd4 on release/2.43/master.
This pulls eight stable maintenance commits, including fixes for:

  CVE-2026-84243: LANGUAGE directory traversal in gettext
  CVE-2026-100290: double free after regex allocation failures
  CVE-2026-115819: extra NUL byte in wide scanf conversions

Record these CVEs as stable backports because the recipe version remains
2.43+git and version-based matching cannot identify the fixes.

Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=124e9adcd407737f0462aa4ba38a37678e8941ec

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.43.bb     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index e8e6bb665a..ec079d9127 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "562cd7badd3f9edd74b68316439f910f6f7c4c1f"
+SRCREV_glibc ?= "124e9adcd407737f0462aa4ba38a37678e8941ec"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index c962171cf3..5d2344389f 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -25,6 +25,7 @@ CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-20
     CVE-2026-5435 CVE-2026-5450 CVE-2026-5928 CVE-2026-6238 CVE-2026-6791 \
     CVE-2026-6368 CVE-2026-19499 CVE-2026-77117 CVE-2026-80489 CVE-2026-18374 CVE-2026-8674 \
     CVE-2026-89092 CVE-2026-97399 CVE-2026-19542 CVE-2026-86805 CVE-2026-95818 \
+    CVE-2026-84243 CVE-2026-100290 CVE-2026-115819 \
 "
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
-- 
2.35.6

