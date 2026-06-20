Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E0ECDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 11:30:43 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1084.1781930898285126667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 21:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IA5j9dUm;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: adityags2004@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bcf74e617so5726956eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 21:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781930898; x=1782535698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAm3lCSS8sjkkaFG1gll6DXchHwZ3hQZIzzxwDHzCUc=;
        b=IA5j9dUmk38AV6uL+IekOeYsZ/fVysYghBBapePLU4GH9uDzFpenxn9184AEwU5tc/
         vNjrVXzQl+ffAuJQx0W+7ZXcnARkWvZNGhB9bDzMZWMSS8bTdS9oyVrsqwuRAogWg2XI
         WXCOfbLemBu3ewXw4XjlRI9av1L+oPMlLwzUTirRKW1pcIfNRWLq9OdxySayKl2CEAL3
         HgSQRDgfGdMJra0/gbbxJQsYpAbaJci3iJGk0B3pj3SeuyipWc+ln9Bmyeie6F/tU4T+
         zAPrdJDRkRfZM08o1BouVRfXouBOpqtWfZuzTS2g4sidmYYldB8kyInqMYzRQORDXyh+
         zmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781930898; x=1782535698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAm3lCSS8sjkkaFG1gll6DXchHwZ3hQZIzzxwDHzCUc=;
        b=TTl8LdRzSi+l0EpiVCa80Pry0DVuo2cB6apzE0nRWW1TKtm9oXFGLReiDFCqwOLIYn
         HfjDmuArcFZKPKl6LxZiUvSNAGS8Qtc5TJta2IG7UTsLaLp7KTRdjXBC/QwEm9IEHotx
         6YYHJJ44d2UIK5jUl575dE5gec1uYXQaEEaDmzUD4tzbz0FpA7YA5B+clGEJLx6yjYn8
         R1SJ1fbGIG7J/oa3IcsiZcPqBfLED0ZGzy5aXDQ6oKSPUNongDzvlGcOG16t/XeL7tSi
         wZeEwxBdfZpttM/hzlDatzH3ZdTEzjYIGgBDxm4FsI9q4bBoGMCqQCC3b1Dsl/4oQyj9
         ChHQ==
X-Gm-Message-State: AOJu0Yy5DYK6RznTEb6iOvtZDJTHQP7Vf1w5kEZ5gPrnaIyhvUsxjrqm
	wuAkWMCX+iTcTT0TK/+tHlIy68NlzTuKRUaNR1tAgRHqi4DQNV/ux/nJwAwDk7Ee
X-Gm-Gg: AfdE7ckTkfNV8tdyChaoKbDVZvZYfBstvzRL+t/2JNPaF/bty8Mc7Ai5SQbFERqwR0g
	vq2vDkJMaUlb8/YHyEcyfAcFJin1OH7wgQx9qr5RmEqo/TAc6y4pW9GGJGKDF0qVmlZdS67ZoXV
	t1YX1b1+J7A0NWlK5+27QM36S5ysBt9JqKW40EuA33/xLAXhTK02gyjGvMo8aSpraa6BMQPHeoZ
	I2x01SKQ5QUyZaFXUe6zkaBb7u1ONjExkY+72MCmJWcY80b//s8X0XaZm29QFFKinyG5Rj2g9mU
	sFyVldruYykBSaZ2Q5gOAF/lqules4+LE2C0JKZiWHPjqjTyktnfNy9IKgsBm8fdrdiv2XKBMJa
	WaoWtkGNApBqco33fWIs8Qn8IO6Y7fVL7+VgRyycApTl32R5h/+e9j1W6k6BVjBJUKK8YoHNNUM
	PgpAKw3xORvbWQ2LT7tb0/jiBkyqBDb3Y4F8W69aVb4DIzqmZoo1OFna+UpnKtYMk=
X-Received: by 2002:a17:902:d504:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c7425d58aamr18241395ad.14.1781930409299;
        Fri, 19 Jun 2026 21:40:09 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([27.61.47.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c74478ff1csm9967405ad.83.2026.06.19.21.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 21:40:08 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Aditya GS <adityags2004@gmail.com>,
	Aditya GS <aditya.gs@bmwtechworks.in>
Subject: [PATCH] [Kirkstone][meta-lts-collab] openssl: upgrade 3.0.20 -> 3.0.21
Date: Sat, 20 Jun 2026 10:09:20 +0530
Message-Id: <20260620043921.514-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 11:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239206

Upgrade OpenSSL from 3.0.20 to 3.0.21.

This upgrade brings in upstream fixes for multiple CVEs:

  - CVE-2026-45447 (High): heap use-after-free in PKCS7_verify()
  - CVE-2026-7383: heap buffer overflow in ASN.1 multibyte string
  - CVE-2026-9076: out-of-bounds read in CMS password-based decryption
  - CVE-2026-34180: heap buffer over-read in ASN.1 content parsing
  - CVE-2026-42764: NULL pointer dereference in QUIC server packet handling
  - CVE-2026-45445: AES-OCB IV ignored on EVP_Cipher() path
  - CVE-2026-34182: CMS AuthEnvelopedData may accept forged messages
  - CVE-2026-42766: NULL pointer dereference in password-based CMS decryption
  - CVE-2026-42770: FFC-DH peer validation uses attacker-supplied q
  - CVE-2026-45446: incorrect tag processing for empty messages in AES-GCM-SIV and AES-SIV modes

As a result of this upgrade, the following CVEs are already fixed in the
upstream version and no longer require local patches:

  - CVE-2024-41996: vulnerability that could lead to denial of service
  - CVE-2023-50781: fixes related to certificate validation and memory handling

Upstream changelog:
https://github.com/openssl/openssl/blob/openssl-3.0.21/NEWS.md

Signed-off-by: Aditya GS <adityags2004@gmail.com>
Signed-off-by: Aditya GS <aditya.gs@bmwtechworks.in>
---
 .../openssl/{openssl_3.0.20.bb => openssl_3.0.21.bb}     | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)
 rename meta-core/recipes-connectivity/openssl/{openssl_3.0.20.bb => openssl_3.0.21.bb} (96%)

diff --git a/meta-core/recipes-connectivity/openssl/openssl_3.0.20.bb b/meta-core/recipes-connectivity/openssl/openssl_3.0.21.bb
similarity index 96%
rename from meta-core/recipes-connectivity/openssl/openssl_3.0.20.bb
rename to meta-core/recipes-connectivity/openssl/openssl_3.0.21.bb
index d33874e..fffe303 100644
--- a/meta-core/recipes-connectivity/openssl/openssl_3.0.20.bb
+++ b/meta-core/recipes-connectivity/openssl/openssl_3.0.21.bb
@@ -12,20 +12,13 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2024-41996.patch \
-           file://CVE-2023-50781-1.patch \
-           file://CVE-2023-50781-2.patch \
-           file://CVE-2023-50781-3.patch \
-           file://CVE-2023-50781-4.patch \
-           file://CVE-2023-50781-5.patch \
-           file://CVE-2023-50781-6.patch \
           "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "c80a01dfc70ece4dc21168932c37739042d404d46ccc81a5986dd75314ecda6f"
+SRC_URI[sha256sum] = "617e29af8e421f46649484a4937e48c685e47f46488167c982f88bc4ec1d522f"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


