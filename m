Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4EBCD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:36:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123209.1781501772456441459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FLSYnn4T;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: nmjain23@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36da151a152so2015534a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 22:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781501772; x=1782106572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4muR/9+q0HbXZepChJoOjv7DURZWX0fVBFOzj/iN50=;
        b=FLSYnn4Tgfc25X0HfnvuKQ3ptdnyUDYX6DbKzPvoFdlQFu0Od5oZtxU/HWu7n4/Dx0
         oX9Phvlu88uqdEBMFYN3R10YlqYeNGyCgRtJdS+DqA9bn1Ak6kn4w9Couoob2EG+CDRS
         IB1cYHT64H7BneyXB/rxHRHnrec6+vztWL76z8Lvp9GqP7lR1PajGviqi7LK98p+7RHf
         oEZoHYSErzKYW1Qacwq/BtvZHatbCtI3aOOltKv9sx/kIvCBYrKYsg2+6O+2x/cx8Zcx
         0en/0saez39amKxTR4Dc1tfXsbPp7Le6LvfE7GlccnDPLZofB9qnIBDtND+W1yQYg718
         vIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501772; x=1782106572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4muR/9+q0HbXZepChJoOjv7DURZWX0fVBFOzj/iN50=;
        b=i4ePfGpc5u4k8aPVSoWz++sQ+NOXhJZi8Be7T7mxxRCVCrWSovFzazCXKMwErQVBVA
         ZnXZW2VhvLD87QWNni+meU8vUhUZKOKX0haaK0Fb/xJJpBYiY43qj6e490Ggro4TQD7E
         2nrHtVQ35s7qx/GsUJiKI9Rod06IdEf0DrNNY5A3Y6F4mKkiFIDDZ0JKsoEAizgHy+wg
         KPVxUElJLRLUtgPF+nOmcJk7D5KwsYaYOQEWrEQ0Qt6Xk2npvJno60PRZS8fNFEQEGVn
         UTqiIXII9uktoS63MVXi6fx/8zT7rRQzlNc9AE/WnvWP9+SW9+LHahHFsej5pt5nPRDU
         3Bhg==
X-Gm-Message-State: AOJu0Yy7H2MkW4yjCnFHVcMQg7NYpQB7lPphZxoZ3KqKZ+kQ1z4t7rja
	hhHM83uL2PCxsQr9tVJ2+D9dwTuokwxvTY60agab/5A9JbcedyOA1ZbXfiYx9g==
X-Gm-Gg: Acq92OHDB7Ed+34fo1bOTNSTG4sZPPEdbXgPMrqgzkmwiPVvOhFPrrxacrPuk2Kbkzw
	GoEx6kcllRDpTFDW3GZBdg8AFIiSBvN7m+2Mvuxilf50Fu4+3LrE0j1dn9y43HD8mk4oWhCMaib
	ho8yQ3yYh4idlaiqVlksQBlHKVt/kOQXGQR0Cf3TFxBHnQzaGA5T6YyEUw70miCMy3yFE8VFTtg
	yZhc4ANLHp7YSPgDDihBrUlGhdxS3Ec+On+U9+3t12F/G1/x4/yqPIo0v26pJqwlrlim28X7sKW
	CGiYKwxY1ftA42vB25cT/JX4bf8Pn9pRpyQcyFsLzg+kcGC7dSJHsiCzTQqxxXwLOarQvJ7WqC2
	d0vgxpFzfmLjy6vvAAjJBvS+IskEoeNmBmfrJjm/Vw7t3m03D/gvuRAV9ca58rKOqwhElDyGKbs
	OUwptQkSgQlQiHw28H7WoS/XGlDtrT/avb7/pRkpn/i52awCwjb1dHJLRNaA38sp5+q1FUCsPn
X-Received: by 2002:a17:90b:580c:b0:36c:e254:4db with SMTP id 98e67ed59e1d1-37c2bc71ddemr9376479a91.6.1781501771583;
        Sun, 14 Jun 2026 22:36:11 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a23caf41dsm9752235a91.7.2026.06.14.22.36.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:36:11 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-core@lists.openembedded.org
Subject: [master][meta][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Date: Mon, 15 Jun 2026 11:06:01 +0530
Message-Id: <20260615053601.1110782-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238810

From: Naman Jain <namanj1@kpit.com>

OpenSSL 3.5.7 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed heap use-after-free in PKCS7_verify(). (CVE-2026-45447)
* Fixed possible heap buffer overflow in ASN.1 multibyte string conversion. (CVE-2026-7383)
* Fixed out-of-bounds read in CMS password-based decryption. (CVE-2026-9076)
* Fixed heap buffer over-read in ASN.1 content parsing. (CVE-2026-34180)
* Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys. (CVE-2026-34181)
* Fixed CMS AuthEnvelopedData processing may accept forged messages. (CVE-2026-34182)
* Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler. (CVE-2026-34183)
* Fixed NULL pointer dereference in QUIC server initial packet handling. (CVE-2026-42764)
* Fixed AES-OCB IV ignored on EVP_Cipher() path. (CVE-2026-45445)

[1] https://openssl-library.org/news/secadv/20260609.txt

Reference: [https://github.com/openssl/openssl/releases/tag/openssl-3.5.7]

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 6685654472..6d864e0746 100644
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


