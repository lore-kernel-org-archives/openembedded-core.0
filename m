Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABCDF3ED6E
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 02:39:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.219450.1775961558182556793
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 19:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dekXgjnm;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so22517695ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 19:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775961557; x=1776566357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfMfPfvUcYsKxVWeIuV3b3IIXC9SPXNXYPY4lHiLR1I=;
        b=dekXgjnmE0Ich3QGhfrGx/E3JFsPSaPPv5JYfjJbpDWpdZrfsmY4wvm8yDXoPSoLMN
         Vg7I+TyWBOydmTBTvcCxoieFXnbRSENoh5kQ67I+cB/KhsLWol4VsqDAkC7nwnzt0JhZ
         LWz2KHC4nvdd8BHYKIDiFnQKvSk3YS+PP1SdY/FXu6nvS7CaK1AafjuSo77SJuvl+/dg
         /X1O8tCaDK3TDJEikJbX3CFey1Jzjm4qulgPTxr2v6EP/mQ+lvGtKmidSEIcCTcSoDIK
         9EXzgJH+3rBq48bPuTRkHdnTVTOsMziwINpIsDEbo6kUzYdd04v1Ks5T2uH8L4q+cto4
         W2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775961557; x=1776566357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfMfPfvUcYsKxVWeIuV3b3IIXC9SPXNXYPY4lHiLR1I=;
        b=hLSqiprmEjtf2SrTwy9EBKzI8uiOKtFOSqWG9G2JacfWvcP2M3BB5yqRV7KCCg+pvi
         n6l9pt2L981Qf6ygS0HxCh0CfVJHxR0aitK1/osezaXes4A+J7L4UKder8hNHSoA8XzO
         B622Zv9WYWgScSquw8BIkrjQpBXdGQRTeF+tKJGpBEKxAwGRBk05XQjgXFF9N3yx0klH
         kjNDsvdalsftUHAd8jpLUoU68EQj/vjUZFFXZ/vjNQmnbCICMTujFZ0lNeeJ2UWr3VB+
         4KO31pHM7EAiWtAw9pIcWck+a7V4zqOvvpwffqYjnGz8dCtzy1I1B1EG6OIsVAy4VcmK
         LSWw==
X-Gm-Message-State: AOJu0YymbaFdVi+6kmYZCVGKK9EjC/qkODT9qH3tnHH8W0nEIrIwsjdN
	FgAX9LYhhOsOPcALpVC/uieqf6nICIKBz2Qnw4PWo8cxOZhpU/m8wRjQ9Z2FEQ==
X-Gm-Gg: AeBDievsyRxuoVZ3Z0a+r95Zhq3VIedwD+OfyTM9auwYt07S+/w/ZcDTsM7uYHTw54B
	YgkR0aIqsbNrl3Mr+UMczbneRDs5gc1LX2YnTsSH+V46KcbSg0IT0ZLVaW/DgHiDiHj1r6m/BiQ
	YYAcXIrVcoYfUXTzp/ixPh4vslC9SXfnQAWw35YcJo1upAnyl2gW2nzBz0n7xoRE6UUQE0c5rRG
	uG9IjvgRrm4RjBilYh/kUPU7n3B5tT7dSaxgBPX1opS1dWcWV8MCnX5Yk08Pnye5DsoXKLirCx2
	ZH93PjX3ssVSdg4SmkJOmcG7v1lXMtxNnfPJibY2BnHoYVE960YFslxDToaAO06n3c+trXBK90/
	8diHc84ECK/qqkFtX5q9QXjH1E13PIcQueuOWLV4SsXBdfZaY5shI2TvXc8ttZjxVeiRYXYJaix
	OaSMIFcICLoqcF2J0BqGxibeWA9wyGD2nd7i53BhZ0oyNXSro=
X-Received: by 2002:a17:902:ce0f:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b2d5a2a1a4mr93926365ad.29.1775961557327;
        Sat, 11 Apr 2026 19:39:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f26cdcsm76956165ad.59.2026.04.11.19.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 19:39:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 2/2] ca-certificates: upgrade 20250419 -> 20260223
Date: Sun, 12 Apr 2026 14:38:57 +1200
Message-ID: <20260412023857.2836123-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412023857.2836123-1-ankur.tyagi85@gmail.com>
References: <20260412023857.2836123-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 02:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235051

From: Andrej Kozemcak <andrej.kozemcak@siemens.com>

Changelog:
 * Update Mozilla certificate authority bundle to version 2.82
    The following certificate authorities were added (+):
    + TrustAsia TLS ECC Root CA
    + TrustAsia TLS RSA Root CA
    + SwissSign RSA TLS Root CA 2022 - 1
    + OISTE Server Root ECC G1
    +  OISTE Server Root RSA G1
    The following certificate authorities were removed (-):
    - GlobalSign Root CA
    - Entrust.net Premium 2048 Secure Server CA
    - Baltimore CyberTrust Root (closes: #1121936)
    - Comodo AAA Services root
    - XRamp Global CA Root
    - Go Daddy Class 2 CA
    - Starfield Class 2 CA
    - CommScope Public Trust ECC Root-01
    - CommScope Public Trust ECC Root-02
    - CommScope Public Trust RSA Root-01
    - CommScope Public Trust RSA Root-02
  * Use dh_usrlocal to create /usr/local/share/ca-certificates

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 738e08718e31de19c1c8db5e162a4a00e2b0c0e6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{ca-certificates_20250419.bb => ca-certificates_20260223.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20250419.bb => ca-certificates_20260223.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
index 01f594095e..9cf6d5afc7 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2"
+SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

