Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC82CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:10:36 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web11.7552.1712311831400606496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 03:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=hkr3p3r3;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=886; q=dns/txt; s=iport;
  t=1712311831; x=1713521431;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AGcSltSkTnxNAdNnK1YQLgIFeFBs9EjezX9m8kFhEYU=;
  b=hkr3p3r3gCoUp9d/wXwSk5lBcME22H8uuSA7qHHi0eokrqM4pfcaYVCa
   pM3e4w2h/8yiETAWKEsdpqohCN3Nb87Gjg4t8tPbC7GKe2+BaZIP+csSI
   UXyQGificV0eG9Ifio5nNCoka2LzmB3JnjKBKQee9N4/wEdEHk+K3recS
   w=;
X-CSE-ConnectionGUID: qQbaHdEUQMWiuAmIXnkXwg==
X-CSE-MsgGUID: c+Rt1iihQVKivlrYWLum/A==
X-IPAS-Result: =?us-ascii?q?A0CKAQCLzQ9mmIUNJK1agliDQFZBSJQagiKLc5IXgSUDV?=
 =?us-ascii?q?g8BAQEPMRMEAQGNFwImNQgOAQIEAQEBAQMCAwEBAQEBAQEBBgEBBQEBAQIBB?=
 =?us-ascii?q?wUUAQEBAQEBAQEeGQUOECeFeocSARgBgX2DAAGCXwIBr1mCLIEBgyYBgVHZN?=
 =?us-ascii?q?oFqgUiMe4VhJxuBSUSEB3aECoEGhXYEmQCGSkqBIwNZIREBVRUyGRgJPA8MG?=
 =?us-ascii?q?gIbFA0kIwIsPgMJChACFgMdFAQwEQkLJgMqBjYCEgwGBgZbIBYJBCMDCAQDU?=
 =?us-ascii?q?AMgcBEDBBoECwd2gz0EE0QDEIEyihaDP4IggRGDI06DPwMJAwcFSUADCxgNS?=
 =?us-ascii?q?BEsNRQbBiIfbwebeAGCc4EOAYFGYkDFc4QdjA6VHRozqjOYYqQihGOBZQE4g?=
 =?us-ascii?q?VtNIxWDIglJGQ+OOZ0PQzUCOQIHCwEBAwmIboF6AQE?=
IronPort-Data: A9a23:PBfNCq5L/O3pCqEnKkMiIwxRtDDHchMFZxGqfqrLsTDasY5as4F+v
 jdNUTrVPKyNNmbyKtxyb4y190NQvZ7UydJiSlFpqihjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyKa/lH1dOG58RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wq/KUzBHf/g2Qoaj5MtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0SoPe5Y5gXBYUQR8/ZzxkBLmdw
 v0V3XC7YV9B0qEhBI3xXjEAexySM5Gq95feGHK2kcC+8nTjTHrx6vBPPEc1DZIXr7Mf7WFmr
 ZT0KRgEahSFwumx2r/+E7AqjcU4J86tN4Qa0p1i5WiGVrB9H9aaGOOTvoQwMDQY3qiiGd7ZY
 sMFaCd0bDzLYgZEPREcD5dWcOKA3CWiK20F8QrKzUYxy2OQ9hAo0bntCeT2e8KOX/Rqulud4
 UuTqgwVBTlBaYTAkmDamp62vcfIhS79VYcYGbG0+/Ivi1qJy0QXCQYKTh28ufS/h0u0Vt5TJ
 kBS/TAhxZXe72SiSt37Gha/unPB50daUNtLGOp84waIokbJ3+qHLnE9RDdhZPEbjeoJRCED0
 365mdDZGjM65dV5Vkmh3ruTqDqzPw0cImkDeTIIQGM5Dz/L/thbYvXnEI8LLUKlsuAZDw0c1
 NxjkcTTr7wXichO3KKh8BWe2nSnp4PCSUg+4QC/soOZAuFROtPNi2+AsASzARN8wGCxFQfpU
 J8swJf20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN8JumsjeRs2aZtbJ1cFh
 XM/XysMtPe/21P3PMdKj36ZWqzGMIC5TIu1CKqIBjawSsEhKVPvEN5Sib64hD21zxN2zsnTy
 L+QcN2nCj4BGL97wT+tD+Yb2vlD+8zN7T27eHwP9Dz+ieD2TCfMEd8taQLSBshnt/nsiFuOr
 L5i2z6ilk83vBvWOHeHqOb+7DkicBAGOHwBg5UKJr7cflE5RzlJ5j246epJRrGJVp99zo/gl
 kxRkGcBoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:XE/I86CY2wn2uXHlHem/55DYdb4zR+YMi2TDsHoBKiC9Hfb2qy
 nDpp4mPHzP6Ar5JktPpTnoAsDpKk80nqQY3WB+B9qftXHd2VdB6OpZnO7fK/qKIVydytJg
X-Talos-CUID: 9a23:dKTdlmMirzc5U+5DQRBt/W4YN/0cV0Lc0V7VAn++ClZ2R+jA
X-Talos-MUID: 9a23:pGw8HwRscjt5Skc4RXTnxwt+bcZp452QK0ETlY83hO2ZMGtZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.07,181,1708387200"; 
   d="scan'208";a="245085107"
Received: from alln-core-11.cisco.com ([173.36.13.133])
  by alln-iport-7.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:10:30 +0000
Received: from sjc-ads-4348.cisco.com (sjc-ads-4348.cisco.com [171.70.55.119])
	by alln-core-11.cisco.com (8.15.2/8.15.2) with ESMTP id 435AAUvf007790
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Apr 2024 10:10:30 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] curl: improve reproducibility
Date: Fri,  5 Apr 2024 10:10:30 +0000
Message-Id: <20240405101030.3291928-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.55.119, sjc-ads-4348.cisco.com
X-Outbound-Node: alln-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 10:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197979

nativesdk-curl package contains host references in output files.
remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
v2
 - moved common code to separate function 
v3
 - absolute path cleanup for all classes
---
---
 meta/recipes-support/curl/curl_8.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.6.0.bb b/meta/recipes-support/curl/curl_8.6.0.bb
index ea69164d76..003f3edf3f 100644
--- a/meta/recipes-support/curl/curl_8.6.0.bb
+++ b/meta/recipes-support/curl/curl_8.6.0.bb
@@ -79,7 +79,7 @@ EXTRA_OECONF = " \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
 "
 
-do_install:append:class-target() {
+do_install:append() {
 	# cleanup buildpaths from curl-config
 	sed -i \
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-- 
2.33.0


