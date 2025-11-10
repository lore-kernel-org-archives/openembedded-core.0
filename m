Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB08CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:13 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45254.1762770123426154973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YP6l/zP9;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-341988c720aso2326529a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770123; x=1763374923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYt5aoqHFChQ1JPmKg3bMBm5uoSKHlvkBu59oz0ljaI=;
        b=YP6l/zP94z13AoO6Soe30N5/2COeFrKkbApUaRaO+0z5aNWOua5S0d4WEjF10x8AQj
         HNDREiCYSqPojvRnKkUVfK6kKOBjrbp1fyQx+IDzCBKP8Kcrkiz14ZEmEtvLE05mHRZN
         K6mSF2xkPSwruQNrwpa6NRb41QH2vh8bpsv3x+4rz7pspUOcHUugZlemQoPNkCE82U38
         I6tlL6U3Ip5/2tjA8TvX70kuqroRzM4qYD3R/9quBPoOhzQBG5C+XpdKJfhqmRl8m+Mp
         gelCzCm3Ig8ugKdvvVY25lE2wYj91TnLAZwYJdMsLY6dUoEPalSTnEcMIaD++SShaVAE
         wpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770123; x=1763374923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYt5aoqHFChQ1JPmKg3bMBm5uoSKHlvkBu59oz0ljaI=;
        b=OPbYf50cFccqJ7Kk3XpkjwO6g4uYtKhl6JIHZQJ+Ff1FRFGjmLhW7mcRZAIC4K52aH
         EIlZGfEOV60YQxJGfsOwLBE74dsRdMQyFXJMOH3Cyvt899rFWGi7pjuDbPwVoUDms6e0
         aoiruN/Ralaryd5l9vzImSKRO7Lxc4Ac58BxEWWwMQOEpcq2uwcswYcAcGhsp5a1Zxix
         ALhqKiNP2uz0uM/nmOqwhUb8vrNyPjNB6OCiLjY2oslz3PrVSbBu16zSFc/iy2WBER9d
         wcQB1SOIdBF6deTKmbPT0myGZ3mmfBWdUeltmSEgisVM5HVFcP7nr9BpIPC84DYFrpfo
         scHQ==
X-Gm-Message-State: AOJu0YyDUbkdS3/XWQOivzoeEDRnhGiTjTaylM78PtOw3XDbi0lceimS
	PvgiaRvrOpPRF5Bh7ZwVOrzvDA/LhpEYOC4JZiYMR6YrA/wGgt2NYhwvxvOz6w==
X-Gm-Gg: ASbGncuSgls2P6vhXl4+yD4Dsf5EkdCCSmkmCHp8MwW/jzKrCuvwsNHax427+bbMWGT
	fnCq5N1j3AX4oR57NQ7G9MBF2cK/zb2rq1UeU00n3bZbicHm7z+72N8tjQDY/+wVkVdN1Ziy89r
	1S9rfJqsR6vSK2KExG6lD5n47yOuJ71scf6FWl4VlAJC09uFVhrtWEdP4+Od3q2k91zEzbRW3mK
	zbc5G6Gi2TAhRg6+NqtSsl8JcuEM3qpkwChyQxwIHn1Q8lP6KoV8z7ik5rTI5HXL+R1t9WNT7/g
	lTxNNxX1w0dW+YpIzrbSVfBzCRWnkwGrbDHd3ZT32d/xCxPu71PDxu6kBGvMUe49K54RUu9DKB+
	E7s3+aguIVV6sOnvRVeDqEkbW4yqXvgLmZXDESDd12N296fX7bBQ2kPilcXtQ8jPDEqKdq/YTCk
	VvlGtST1ukPdGVTpCs9ynFg4pd
X-Google-Smtp-Source: AGHT+IEYZivkbqx23FcHHPo41+U7texPXWPngFrNBbCdTx2Kyj/541ToGUoBkAmvFuIk5mPSTAKx0g==
X-Received: by 2002:a17:90b:3512:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-3436cb91aebmr9605171a91.22.1762770122234;
        Mon, 10 Nov 2025 02:22:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:22:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 3/9] ca-certificates: update 20211016 -> 20240203
Date: Mon, 10 Nov 2025 23:21:41 +1300
Message-ID: <20251110102149.2915435-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
References: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226106

From: "Theodore A. Roth" <troth@openavr.org>

The 20240203 version is the same as used in Ubuntu >= 24.04 and Debian
Trixie (testing).

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce19168885a04b0d77e81c1fd1c4262b195a47d4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...mozilla-certdata2pem.py-print-a-warning-for-e.patch | 10 +++++-----
 ...ca-certificates-don-t-use-Debianisms-in-run-p.patch |  6 +++---
 ...ficates_20211016.bb => ca-certificates_20240203.bb} |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20211016.bb => ca-certificates_20240203.bb} (98%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 5c4a32f526..78898f5150 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -19,7 +19,7 @@ diff --git a/debian/changelog b/debian/changelog
 index 531e4d0..4006509 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -37,7 +37,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -120,7 +120,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
@@ -37,9 +37,9 @@ index 4434b7a..5c6ba24 100644
  Build-Depends: debhelper-compat (= 13), po-debconf
 -Build-Depends-Indep: python3, openssl, python3-cryptography
 +Build-Depends-Indep: python3, openssl
- Standards-Version: 4.5.0.2
+ Standards-Version: 4.6.2
+ Rules-Requires-Root: no
  Vcs-Git: https://salsa.debian.org/debian/ca-certificates.git
- Vcs-Browser: https://salsa.debian.org/debian/ca-certificates
 diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
 index ede23d4..7d796f1 100644
 --- a/mozilla/certdata2pem.py
@@ -66,8 +66,8 @@ index ede23d4..7d796f1 100644
          if not obj['CKA_LABEL'] in trust or not trust[obj['CKA_LABEL']]:
              continue
 -
--        cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
--        if cert.not_valid_after < datetime.datetime.now():
+-        cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
+-        if cert.not_valid_after < datetime.datetime.utcnow():
 -            print('!'*74)
 -            print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
 -            print('!'*74)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 4a8ae5f4b5..1feefeb96a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -21,14 +21,14 @@ Index: git/sbin/update-ca-certificates
 ===================================================================
 --- git.orig/sbin/update-ca-certificates
 +++ git/sbin/update-ca-certificates
-@@ -191,9 +191,7 @@ if [ -d "$HOOKSDIR" ]
+@@ -202,9 +202,7 @@ if [ -d "$HOOKSDIR" ]
  then
  
    echo "Running hooks in $HOOKSDIR..."
 -  VERBOSE_ARG=
 -  [ "$verbose" = 0 ] || VERBOSE_ARG="--verbose"
--  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read hook
-+  eval run-parts --test "$HOOKSDIR" | while read hook
+-  eval run-parts "$VERBOSE_ARG" --test -- "$HOOKSDIR" | while read -r hook
++  eval run-parts --test "$HOOKSDIR" | while read -r hook
    do
      ( cat "$ADDED"
        cat "$REMOVED" ) | "$hook" || echo "E: $hook exited with code $?."
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
similarity index 98%
rename from meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index 99abe60613..b198ea77a9 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
+SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
            file://0002-update-ca-certificates-use-SYSROOT.patch \

