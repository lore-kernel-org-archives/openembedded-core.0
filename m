Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.9773.1602538303938829348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 14:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dVDqDGmC;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1018; q=dns/txt; s=axis-central1;
  t=1602538304; x=1634074304;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DFBvG8vu6lHkrAHFEtSqRDK8QgNL0xuuz+qF4ZGWY/s=;
  b=dVDqDGmC3QJ9FfrNQSysA+kd80391PyzZBS6paMLRgtHZOXTbVRAhj2Z
   jRE7C6F1tcoTxexS/HHTMntnGPC+FlBN0+PEWW4+9aKX7kidYR2HBonyt
   DDROha2sVkn+7XiJ67Ka8e+ZVT3ZFoYxaWF9U4m5AG+THWiG8PacsujjM
   uLADtGH66ZenucGr/F9lAm4gXTSlvdRKQk7Ru+FD4fKaR3bk47MfEEb0e
   vWkibjC5KN+VSnAYukfuQpKpHrHSPQ3B2/vwX+mTlXwK5pGhpUVbYb1QH
   D8+16U6TNm9Z49YejGkwhsPPtoJY/fOD977j93xYt/1bJs4saCHkwT4Xd
   Q==;
IronPort-SDR: 29gdyUBo65h0J2wEqCj8+ch1cJ2r/7zMjP9Z8MkK9Z+lbrQARnJxUdC8UvAc4xoYIYvnXC6Qmg
 pgTfwDYgNW8QDs+X6DCOfjF8nVLFzARNZ0q8myNha8R0Vhq/VOTdR3+G1Qaiy7chsknmBWSKUy
 HmxHWlbU/dnS+OW8ukR0ck16xDYy0lepEvVkWtqPIEdnLyfyXS4MVsDEdkvTLkezyJMe+/QozF
 68OhFSvTQolftfeMueKllwraIXDP5wEqtiYb0Q2EBpdcpU3hGSYh9qh7MCR2knYE1pPq1cRbVA
 gjM=
X-IronPort-AV: E=Sophos;i="5.77,368,1596492000"; 
   d="scan'208";a="13901215"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: Jon Mason <jdmason@kudzu.us>
Subject: [PATCH] tune-cortexa65.inc: Correct TUNE_FEATURES_tune-cortexa65
Date: Mon, 12 Oct 2020 23:31:37 +0200
Message-ID: <20201012213137.15179-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It incorrectly specified "cortexa55" instead of "cortexa65".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
index ecf17fbbe7..427e58947f 100644
--- a/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
@@ -11,6 +11,6 @@ require conf/machine/include/arm/arch-armv8-2a.inc
 # Little Endian base configs
 AVAILTUNES                                         += "cortexa65"
 ARMPKGARCH_tune-cortexa65                           = "cortexa65"
-TUNE_FEATURES_tune-cortexa65                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa55"
+TUNE_FEATURES_tune-cortexa65                        = "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa65"
 PACKAGE_EXTRA_ARCHS_tune-cortexa65                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa65"
 BASE_LIB_tune-cortexa65                             = "lib64"
