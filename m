Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C469C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:58 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.32848.1635699537513013783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xOe0Y2dD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id r28so15136970pga.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=s34neelAPahGO5jVKggBXTbi6InIVUyICCc4mOwnqPU=;
        b=xOe0Y2dDH9uZ8ni09AcdsxT9qdfi4JUqNuye3bSXCg/Kc/Wpw6y/cI3sS7PxyayMe6
         XnxU2+3s3aKuXnJaxEFQ6WGJz5VqL1H1iSxOQTxy9aqqtZzBwXMEb50we5HDP5gXfHbf
         24qZ+1LkqiQzXfgTyrRbS7MrMmzbfFl4bvYk0oGa5lBy9hgyXqgdEQ8lbaN8w53JDw7v
         qrX1YYSvdPy8fUok/5Yif8X1CVnLnGj+gM1/m6bvysNJOO1qaDNycNHoFGmzuIsRv1pQ
         FJYiQNyvMlxWVppsQqhVb92k4/WsUdwCuF+CpcWuT/ZAy9O4S01Q3cgfl47+hWRiEoij
         GOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s34neelAPahGO5jVKggBXTbi6InIVUyICCc4mOwnqPU=;
        b=brFU71RJ9pkUG4xYIvl9Vgnel5oEXA4Y0P/t+I5GSnxzMXlnj3Qn+OJ6i4cCx5HDiJ
         6yC1y2jkhD/munT3v/o3LgDsvpprS49imk9qV6mZs2tQK7vy0TXElXElwtWFdogXk7UO
         ZdUZxM7jBzeHHC2ciU2ufIbj5Ho84qdoTsiEpD5DWUGr3LTuWtMUDPueibOrlRLfeh3g
         cMIY/Kc6wtH6pw/SriGY2xHDJGEamv5+jBPqhfndfuNK36+qrmtowhS2JVhPWDfVyOt7
         96yqNenEijRqDAS+hyfpP4yUPZfkI/Eavu46kBCu+duU2rpfr+wWZh8SCwz5UOXfwU69
         KOng==
X-Gm-Message-State: AOAM532rX3y5mW9zRwNRLhBxwH72APvwSXvfEReoOfT8G5EhpUY/+Aya
	OBi89L+G6pJ2IvfIVl9JyKCtVqP9NFBijRwUNYQ=
X-Google-Smtp-Source: 
 ABdhPJyeklipohCaz7RIxcvIcDmvGSKX9utaVKq7cc8Ehmhr85FfZ1KzBgUAyDWD2SFy/4A1hJ8YXg==
X-Received: by 2002:a63:834a:: with SMTP id h71mr1902898pge.460.1635699536424;
        Sun, 31 Oct 2021 09:58:56 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/29] ca-certificates: update 20210119 -> 20211016
Date: Sun, 31 Oct 2021 06:57:46 -1000
Message-Id: 
 <ecc6cfe41ad2d1e6fd08771474558372b0fa8b0b.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157685

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c479b8a810d966d7267af1b4dac38a46f55fc547)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ertdata2pem.py-print-a-warning-for-e.patch | 80 +++++++++++++++++++
 .../ca-certificates/sbindir.patch             | 26 ------
 ...pdate-ca-certificates-support-Toybox.patch | 33 --------
 ...0210119.bb => ca-certificates_20211016.bb} |  5 +-
 4 files changed, 82 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20210119.bb => ca-certificates_20211016.bb} (95%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
new file mode 100644
index 0000000000..5c4a32f526
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -0,0 +1,80 @@
+From cb43ec15b700b25f3c4fe44043a1a021aaf5b768 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 18 Oct 2021 12:05:49 +0200
+Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
+ certificates."
+
+This avoids a dependency on python3-cryptography, and only checks
+for expired certs (which is upstream concern, but not ours).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ debian/changelog        |  1 -
+ debian/control          |  2 +-
+ mozilla/certdata2pem.py | 11 -----------
+ 3 files changed, 1 insertion(+), 13 deletions(-)
+
+diff --git a/debian/changelog b/debian/changelog
+index 531e4d0..4006509 100644
+--- a/debian/changelog
++++ b/debian/changelog
+@@ -37,7 +37,6 @@ ca-certificates (20211004) unstable; urgency=low
+     - "Trustis FPS Root CA"
+     - "Staat der Nederlanden Root CA - G3"
+   * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
+-  * mozilla/certdata2pem.py: print a warning for expired certificates.
+ 
+  -- Julien Cristau <jcristau@debian.org>  Thu, 07 Oct 2021 17:12:47 +0200
+ 
+diff --git a/debian/control b/debian/control
+index 4434b7a..5c6ba24 100644
+--- a/debian/control
++++ b/debian/control
+@@ -3,7 +3,7 @@ Section: misc
+ Priority: optional
+ Maintainer: Julien Cristau <jcristau@debian.org>
+ Build-Depends: debhelper-compat (= 13), po-debconf
+-Build-Depends-Indep: python3, openssl, python3-cryptography
++Build-Depends-Indep: python3, openssl
+ Standards-Version: 4.5.0.2
+ Vcs-Git: https://salsa.debian.org/debian/ca-certificates.git
+ Vcs-Browser: https://salsa.debian.org/debian/ca-certificates
+diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
+index ede23d4..7d796f1 100644
+--- a/mozilla/certdata2pem.py
++++ b/mozilla/certdata2pem.py
+@@ -21,16 +21,12 @@
+ # USA.
+ 
+ import base64
+-import datetime
+ import os.path
+ import re
+ import sys
+ import textwrap
+ import io
+ 
+-from cryptography import x509
+-
+-
+ objects = []
+ 
+ # Dirty file parser.
+@@ -121,13 +117,6 @@ for obj in objects:
+     if obj['CKA_CLASS'] == 'CKO_CERTIFICATE':
+         if not obj['CKA_LABEL'] in trust or not trust[obj['CKA_LABEL']]:
+             continue
+-
+-        cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
+-        if cert.not_valid_after < datetime.datetime.now():
+-            print('!'*74)
+-            print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
+-            print('!'*74)
+-
+         bname = obj['CKA_LABEL'][1:-1].replace('/', '_')\
+                                       .replace(' ', '_')\
+                                       .replace('(', '=')\
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
deleted file mode 100644
index f343ebf16e..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-sbin/Makefile: Allow the sbin path to be configurable
-
-Some project sharing ca-certificates from Debian allow configuration
-of the installation location. Make the sbin location configurable.
-
-Also ensure the target directory exists
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
-
---- ca-certificates-20130119.orig/sbin/Makefile
-+++ ca-certificates-20130119/sbin/Makefile
-@@ -3,9 +3,12 @@
- #
- #
-
-+SBINDIR = /usr/sbin
-+
- all:
-
- clean:
-
- install:
--	install -m755 update-ca-certificates $(DESTDIR)/usr/sbin/
-+	install -d $(DESTDIR)$(SBINDIR)
-+	install -m755 update-ca-certificates $(DESTDIR)$(SBINDIR)/
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
deleted file mode 100644
index f78790923c..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir
-
-According to coreutils docs, mktemp -t is deprecated, switch to the
---tmpdir option instead.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
-
-[This was originally for compatibility with toybox but toybox now
-supports -t]
----
- sbin/update-ca-certificates | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 79c41bb..ae9e3f1 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -113,9 +113,9 @@ trap cleanup 0
- 
- # Helper files.  (Some of them are not simple arrays because we spawn
- # subshells later on.)
--TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
--ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
--REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
-+TEMPBUNDLE="$(mktemp --tmpdir "${CERTBUNDLE}.tmp.XXXXXX")"
-+ADDED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
-+REMOVED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
- 
- # Adds a certificate to the list of trusted ones.  This includes a symlink
- # in /etc/ssl/certs to the certificate file and its inclusion into the
--- 
-2.1.4
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
similarity index 95%
rename from meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
index 7dcc86fdc1..214bad4ae3 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
@@ -14,15 +14,14 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "181be7ebd169b4a6fb5d90c3e6dc791e90534144"
+SRCREV = "07de54fdcc5806bde549e1edf60738c6bccf50e8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
-           file://update-ca-certificates-support-Toybox.patch \
            file://default-sysroot.patch \
-           file://sbindir.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
+           file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
 
-- 
2.25.1


