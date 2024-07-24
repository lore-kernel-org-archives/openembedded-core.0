Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1AEC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 14:53:40 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.12668.1721832813181736602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 07:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=0xX22ayM;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.160.44, mailfrom: troth@openavr.org)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-260f057aa9bso3690240fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1721832811; x=1722437611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ3PJUQa3tqKtJV4JH8/opk1G91vhFJMFnMU8l4Gy/s=;
        b=0xX22ayMYqaEEaVUkvKlxzjZepa65bIGo855+OEjTiJ6OezWl6IbKqwpfNPhS/xNfl
         LrLeOooljY677s1bixlFwniqjBtLOk+kkYm5I5FX6L5YwUUwN/UX14KniAk2wItc0AE9
         6+h/3vOd+/z1XPU7Kb5QjCclUGXu0OyHAuAH9i+tkYhyiwUs77/gfSVi4dtiRMEJTXxi
         4K5aTmcBVLcYNhqct/QY2HwgYzEJey3+EXi2lkxy7xnYZr9FS33XdtK+18vTHNlbOomy
         t4s16kFcw0xcu3yoIdQjQSrAWJSliAVUdpLvfGmcVPoDBwEjWvPZkm7hsk37re5+kjkj
         gLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721832811; x=1722437611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQ3PJUQa3tqKtJV4JH8/opk1G91vhFJMFnMU8l4Gy/s=;
        b=ACQNRX2sx9oY7KnNVamPJaLBB075qmn9Ft6c07GGwt8IGCM7JcL8RmoUO5t+ywZouB
         rvC1g220eKojSz1P8sFe8RMePaoj0TVkPDLQMqSraSnvNW3IDdbDx8yVv1EC/A7QMHJD
         c1ljl9EsLZ0eo1qS1l2Q4wLknfH0B6OAKsf5tYGPXO+E8fiwyjrApdKxoklrJGIfeBub
         o9TUPr3bVtsxw0e4EFcxTdHLiQ/uz+0BZKVGwE0lplyOCGsqNOz3rfOJ+jCSFxTZmE7A
         Vc/ZclW2KfX4ayTypXUQLznJJYXSBGyFBQZSgTaca3hWMFdJq7SQdsZ2TaTZ+0IPsdCR
         3NPg==
X-Gm-Message-State: AOJu0YwMJkRuXzd/Va5/Xek3WYH4k1JAUZD0ZhMu5Jw5OUISliHsvLNY
	7aQqaP07Iuoef6eYbcFGoDhTjGEGsvDTiUOv0FbYafcnPM9aKsVr/vr8i+L2QBHa7KScJwNPqaP
	y7zw=
X-Google-Smtp-Source: AGHT+IG+m3eWiyJeQEKUR8cRariAwQq9fm0ESqo+Rf/7iydGKdBFUN1TEAXtSPLIcOC4q2EofHIenQ==
X-Received: by 2002:a05:6870:ac2c:b0:260:3fb2:b724 with SMTP id 586e51a60fabf-2648cd4a7dcmr2340486fac.46.1721832811524;
        Wed, 24 Jul 2024 07:53:31 -0700 (PDT)
Received: from tas-troth.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610ca48140sm2622978fac.41.2024.07.24.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:53:31 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	"Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [PATCH] ca-certificates: update 20211016 -> 20240203
Date: Wed, 24 Jul 2024 08:53:19 -0600
Message-Id: <20240724145319.1619444-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 14:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202446

The 20240203 version is the same as used in Ubuntu >= 24.04 and Debian
Trixie (testing).

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
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
-- 
2.34.1


