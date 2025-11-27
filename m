Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587C2D111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:37:18 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22591.1764261437213164899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dzUGiU5E;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b98983bae80so960666a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 08:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764261436; x=1764866236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DwIox8bocq4uDT6ToNLkQ6FsjAMEG5Dqg0y33t6WnFY=;
        b=dzUGiU5Excpwsjp6monyNmtxjWTKwzoTPoptpPkj0i9cnXmNm41fr4nOaesYtlf9v2
         zj/uzcbN78MDi6AelxfJjZce9ouEx2hAgMX+eSmwoMQQ5KhK9ZNDI9FCDBepnO1KBcB4
         MpYrT5W9iEkL6EOjjDchts0Whl0vAfScDGMPbyiYZRnjeS+fLtcVmQEAw4hVBJxta+ea
         QM1CMfki2+IP4Qs2trvgyabBxvh3xlvcoKnrLItW3Uf8w5GnlSQp4H4plWhGw7TdqdG9
         2jVHmHVJpwKaz18/8FQ6JNpOppASoyBpekilrz93nyPVCwZt1JO+/1xy//JaGS1Z5Nps
         aA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764261436; x=1764866236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwIox8bocq4uDT6ToNLkQ6FsjAMEG5Dqg0y33t6WnFY=;
        b=tnoDBxp841MVryRqeml+zfQh64IHZjQBGcezHc2l2izprI8HYYCuB/f63Qn3cNLb5Y
         wRuipaO7rF8lDPQQKHyjFOQbK0jkCB1xjRu2Vsx17FZqlLBIgiOkI0elXf9CYYngwzEf
         zZENgh8YDf0x2hfzNV2a01Eysls6G2POXnRRiimfjcNRLNQvAWTljyWRgatxUmh8YQgG
         EO1NQeaYftijheCU0rrADGt015M8GsPx7+clEJ5YUIaGdvmgfxoApVB6E/+PDQjnqxxV
         9yuZmhSeqlQwGe2KECFLsrBE6W2Mk8TAVtDk9dSCMfycM7IgkPrpU1n0lwp0Koz1PTfr
         W+nw==
X-Gm-Message-State: AOJu0YzxUHRG40d6qEcJQtBS2ZMz5IeQxEn+NEGWWpHWeN+y1+/9dlNG
	XYFjn01N17ALaEg4HU4wIwADRIZDYbU5h7Px6jJXF1s4/40XU9qTdwb9VDQYtSbN
X-Gm-Gg: ASbGncvMiD5GoFPuOIRu1+CQEByZn/b2DELO/xzaaK8F4upwEGZAkpagY1fqiHvdepR
	cpubq81qBRtkR3nmu9o30r3muiDFBapwGpKnv6XG0q+I6AiisZ2CAm6mR5v58tEpmdBw9Y+usaQ
	FRIy13d/oGJI00PzOcFYzdKPO26kivQpRUaji+aXVzZHYdq2LeLwKdNPZEHagR7A2rtaj1dGLD/
	/lGU93Q96baawZkcSEc9iCvLDip+E1yVXOvAZ6IkAPkq3Ix6KezBpTKxqSuBZYy2jj6oQ6Qr+Qf
	amej54ICGSN2HHNbwpyfbgmP0q4KyioEV3BSN2srqpj1p3jF8ZABAuMeaRCj8sH7Xz394uMhJmU
	N0iNaijuvd/eweKN2q5paNiNP/gP4RENEMvIVFWe67oOvL2aLeZCMvrUBiAgMpGcYkHzI4WmDzA
	bTSLLjISytQCRWjhP2QVVANyHdKzRcbTdnZTbaiLu1ayLAsFelzwabEZ1CGbLWgiw4Kx/R7q+p3
	DcycjDyOqXz9+qX7UNgkKWCowIL+JgF
X-Google-Smtp-Source: AGHT+IGjhB1hCXhGzo+CZ/69/25uN8xmEbmsifc5msGW+RznltVEqNy8BRRscRh/Vsor00S9P5+yNg==
X-Received: by 2002:a05:7301:3c0e:b0:2a4:87e2:bc8c with SMTP id 5a478bee46e88-2a719d5a9eemr16297572eec.24.1764261436037;
        Thu, 27 Nov 2025 08:37:16 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b1ceeesm7297977eec.5.2025.11.27.08.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:37:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libxcrypt-compat,libxcrypt: upgrade 4.4.38 -> 4.5.0
Date: Thu, 27 Nov 2025 08:37:13 -0800
Message-ID: <20251127163713.2275519-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 16:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226849

Remove branch variable and add tag in SRC_URI

License-Update: New source files added under 0-BSD and BSD-3-Clause licenses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add 0-BSD and 3-BSD to LICENSE

 ...rypt-compat_4.4.38.bb => libxcrypt-compat_4.5.0.bb} |  1 -
 meta/recipes-core/libxcrypt/libxcrypt.inc              | 10 ++++------
 .../{libxcrypt_4.4.38.bb => libxcrypt_4.5.0.bb}        |  0
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.38.bb => libxcrypt-compat_4.5.0.bb} (99%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.38.bb => libxcrypt_4.5.0.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
similarity index 99%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
index bb4e2032dd6..30ec6a4674e 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.5.0.bb
@@ -16,4 +16,3 @@ do_install:append () {
 	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
-
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index da515d19270..bef40b0ae64 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -2,17 +2,15 @@ SUMMARY = "Extended cryptographic library (from glibc)"
 DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
+LICENSE = "LGPL-2.1-only & 0BSD & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSING;md5=b65434749329c34b5d32c2df3f1b4112 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "

 inherit autotools pkgconfig

-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
-           "
-SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
-SRCBRANCH ?= "master"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "096296cb6fbecd9ad46c93a410d76c752a5d6206"

 PROVIDES = "virtual/crypt"

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.5.0.bb

