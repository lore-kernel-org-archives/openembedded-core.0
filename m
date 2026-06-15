Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A778FCD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:20:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123684.1781504397154565819
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 23:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rQWoMQ0u;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf125989f2so21311565ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 23:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504396; x=1782109196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqDPaSziQX2vBlJynQ5aAiajsXqQXDz+0kk+30LBEqE=;
        b=rQWoMQ0uWT8jznQl1BFtnXIsz/bjkww0kSacSMYO3Zl0awuGJd9VIFTJzA1CDZ3Rkq
         TUmcyWmDU5PymsGPcyQPs/yoV3CpSXG4XFZZr3J5+g5l+XitzfhzIwF0UIXDk52Q3AJ2
         AuOb2BhL2A33f2qb9eSWN8zo+lRo4PzBAnDO0t+ekhqUBq+XW7Z7q22jAxTKhwwZADc2
         tYZHfHk/Wj22QF5wKuCw+tF+VCVf70BO1rdyI8RY9vqLTSosEYKJi7vqvBVdqpF+K04C
         8F6vwSxU75sshqW6ex7HOKt21j7iv+mGTRWes1iuykVffFiN6v6g97Fh0O6qNQ8T7XMb
         dcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504396; x=1782109196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqDPaSziQX2vBlJynQ5aAiajsXqQXDz+0kk+30LBEqE=;
        b=CbeDB+qwbC20NurjXLd3z4wDlCIRHKB/E1bIHZjzhjkwO57UQcHBae+kHCNjq27IZX
         uRNToECLzBWJbao+/RfjgsGhJkE6QQq51gHIPwgouk5C6fbKgpud8b/YuPMK8qMaYeY4
         BvM4uBuvLoi7r+ROG513qg4wSCLHjhNNECWH7TYJXGjPOGGF4igUx/cmb2v93KSYEMnE
         slU0rAV77gFTVPYDkMXbp6tXO32f+K7DOENqnLbaMXKCRZzipwlskvD8WS/4B6IxLG37
         0GF8LQrvTvJnRxUouVGo4vcOW3dK0d/K8hUX/Tlqlx/IcW15ilTlWQk7SrOsLDmPIGIM
         tVvw==
X-Gm-Message-State: AOJu0YyirhJlNAC2gXjUkK5k/+s7yFQI5m4GPRGTfbTpPM1Pood2aDX2
	BADsOiPaT4MTPIyIZ2diEOFaC2npRMvg/f72CVA22DyWbQoMK5kROSoxw5XlaQ==
X-Gm-Gg: Acq92OF9epwDyzbbKsK3j8aezcNhemuNYNz2nwX114bdpwKGSW8Tn/OdWc6sV7sKRoM
	1EBo+WWyyd9P2Qi4FfJnNCvEGPelWGUPw34tYLs1faBjFCriry4XXgHsn3BkasSahTAPbKFv3Xb
	ajZFDBVl5ucFWqXaUYcIBhQ8lTofLrl2PT+Fc74E3vqSjU+jNa5wnOMOmDhXm4aJJEyZtDCS9/H
	/rar5yOsE7cP9Ua5FYtoeUG/GnWFyJLM1i/6xniq6QhBfP1/jIjJJnqQMWS2SWgOSSJaHtVZAOr
	G3mvcce44nsW5q2LbHMsHyehCx4W9rJ2MzbDLzPIPU5Pnqr8oRx2JXNDpIEglGKvViKPv6bMZLl
	TdNOcw5372HjGAIxOF77tW3FWtQHPADPrzmHui8nKi7vj6txR28BdvuDvVmXvoyJ/wl/sgE7m2u
	8aV/jS2eLUkUgGcAPXMC3OwMBxqwyW1eRgKokTQmv8YM45HcNisT/C+g8=
X-Received: by 2002:a17:903:240a:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2c411697a64mr162442185ad.9.1781504396379;
        Sun, 14 Jun 2026 23:19:56 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.4.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb50fbsm87812445ad.34.2026.06.14.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:19:55 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: nisha.m.parrakat@bmw.de,
	ashishkumar.mishra@bmwtechworks.in,
	suresh.ha@bmwtechworks.in,
	nikhil.r@bmwtechworks.in,
	Sai Sneha <saisneha196@gmail.com>,
	Sai Sneha <sai.sneha@bmwtechworks.in>
Subject: [PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Date: Mon, 15 Jun 2026 11:49:38 +0530
Message-Id: <20260615061938.1285933-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 06:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238813

Fixes the following CVEs:
  - CVE-2026-45447 (High): heap use-after-free in PKCS7_verify()
  - CVE-2026-7383: heap buffer overflow in ASN.1 multibyte string
  - CVE-2026-9076: OOB read in CMS password-based decryption
  - CVE-2026-34180: heap buffer over-read in ASN.1 content parsing
  - CVE-2026-42764: NULL ptr deref in QUIC server packet handling
  - CVE-2026-45445: AES-OCB IV ignored on EVP_Cipher() path

Changelog:
https://github.com/openssl/openssl/blob/openssl-3.5.7/NEWS.md

Reference: https://openssl-library.org/news/secadv/20260609.txt

Signed-off-by: Sai Sneha <saisneha196@gmail.com>
Signed-off-by: Sai Sneha <sai.sneha@bmwtechworks.in>
---
 .../openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 3bf78eff5c..8adbe43c56 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
+SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


