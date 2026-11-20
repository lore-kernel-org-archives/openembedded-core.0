Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7812.1795217362847369319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 15:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N2XctRhI;
 spf=pass (domain: konsulko.com, ip: 209.85.216.43, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso166061a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795217362; x=1795822162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJrp/ZP1ztEt/sxKx8wNnzdxjLdy9lvbVbPAbQ6i/XA=;
        b=N2XctRhIcAEeL4ZQmS4x4gpOpiYNo+ufgbTTCZEIei+UxggKO3vx97tZGCEGDi8q8w
         xw49FGwtYHI8m9TBfrjLGmkNUcSlRwjBGsvmtqNTr1eHAh3Jq8d/RmVXjvqOG2OAOsEY
         YHQEToE5sxjJsWWMBRZWUhqZEAiGrI7xkBeNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217362; x=1795822162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJrp/ZP1ztEt/sxKx8wNnzdxjLdy9lvbVbPAbQ6i/XA=;
        b=vepPFM74PtiBJh9i+4s+xg2zPLDHhLVs9+8Zh+ZpsT9caxwBucfFRSDCbxl2ifyHix
         tCfyG4/QR+PblZr+hSxf5EGis9/9ySuaxicFc/Uj0+0muo/INf+0RvCJ49wFka3zlSvp
         dV1pg0jOACQACrCmMxR0/7WgVS8taCnm1YjEy66Ed+JfLW2YJ8sT2pflhrSDlRBQpr6K
         +c2hCBGZ2InEs3kLGJdRn5+t5IYwZ5jnp0zfGl51jUZR1JgRadnrXNNBnZL3SIPo0M7i
         QsDj11R1Jh7x1sMtxtdLMhJXFWlKclkeEgArSNAQpAiemAnabkGG2KnFBJp9mFg/cVCA
         9bFw==
X-Gm-Message-State: APuU4Z/vZE8e5718MotF/8pPuV201Chq1DFL5KeBkksVoaWMu0B+b4D1
	PpBi4uPccYEw4p1sZJAufE92JcmC2WyQDw4WNnt6qAAV/t7j163NVBbYjmpy8jnHwyUEko97CP3
	Swadz
X-Gm-Gg: AZFdTZdO5DFBLkvn1wCl0f7Y4FOuMgVIesCUlxGapqK/r2ZP6qUlD7dWruLZ0vt6yPe
	I1mniteXyxirP58e1BflJZ+H99nlEtFg05MDVHCa7hdKabf/qW7/R5KORSjxDgYDCA/95EcSIn1
	QZJ033uFfyaYIt5jFJVcj0YrEtIBl+Szg+rSzliPwySXYpSLMup+Z7IyR/+/+cSHG2xNKQUDA0S
	3hRqXQ9hVAo9Z7eCsml9t1km3u/+0ZxXhZTQHapDCPuTQygjfPfRwfDmJ2CYcKVFr92n4m3uyRC
	rTmOB23GbOslAev2+Es79TzQJCjyV7r+zvjhLbNcq2Nyq1czzXh1fvD2Z3QwfSd5qnVftnVpZHt
	6fZPbWbr6HvSJVZzCgjwTQOdyQyQIlJS7kM/qWvNtU3yNIWorB8L12GG/snutAtua6Dsw8LGb//
	IQKU3NvabnSxt4oPPCK4LqpImE94pjJ6hZhwHewKakvhcHZPqnJZ7fqkMLg4Yay8UQ3223+3/Mz
	4HihoN7CQXCeq2VcVW77lMFeyOj9xDZ6E3fcSxyKb5/zkUn9kMWlMNUZFzYAug1XgELe6EZTT8v
	CSz4FQlTeFtf3EK962NtahLzkqP6r2nF8RuPOfFt6kTBIgWfkSnN1tUUzKGQSngxJy2aoiCjpSk
	T3OT//Ii6X50mvxul8U9UgXdgnrU=
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr3150842a91.0.1795217362014;
        Fri, 20 Nov 2026 15:29:22 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:469f:1416:a3fd:1a92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm620500a91.2.2026.11.20.15.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:29:21 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] libconvert-asn1-perl: upgrade 0.36 -> 0.37
Date: Fri, 20 Nov 2026 15:28:58 -0800
Message-ID: <20261120232857.2340898-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 23:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250828
Content-Type: text/plain; charset="utf-8"

0.37 is a security release:

  * CVE-2026-126540: cap INTEGER/ENUMERATED decode size to prevent quadratic cost
  * CVE-2026-126568: fix asn_recv OOM on truncated header or huge declared length
  * CVE-2026-126576: bounds-check REAL exponent length; fix long-form mantissa size
  * CVE-2026-126682: cap INTEGER/ENUMERATED encode size to prevent quadratic cost
  * CVE-2026-126819: fix zero-length BIT STRING reading past end of buffer
  * CVE-2026-126956: add configurable decode depth limit to prevent stack exhaustion
  * CVE-2026-131868: prevent huge allocations in asn_read and asn_get
  * CVE-2026-131877: limit OBJECT IDENTIFIER arc size to prevent quadratic cost

It also discards invalid datagrams so SOCK_DGRAM sockets do not wedge.
New default limits reject INTEGER/ENUMERATED values over 1025 bytes,
nesting deeper than 99 levels and OID arcs over 32 bytes; configure()
can raise or disable them.

https://metacpan.org/dist/Convert-ASN1/changes

The new tests "use lib", so add perl-module-lib to the ptest RDEPENDS.
Tested with core-image-ptest-libconvert-asn1-perl on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-asn1-perl_0.36.bb => libconvert-asn1-perl_0.37.bb} | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.36.bb => libconvert-asn1-perl_0.37.bb} (76%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.37.bb
similarity index 76%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.37.bb
index 6cb3ce9fd9..7ff7263c22 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "50439aedff4b403f24c9373eefd3c25770e33a9190d93a331e7a744f8b4e7cd3"
+SRC_URI[sha256sum] = "012b90bbb931e049340a114dbc510f845309d9ca76cc6c4fad751d317b4bf0fa"
 
 S = "${UNPACKDIR}/Convert-ASN1-${PV}"
 
@@ -17,6 +17,12 @@ EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
 RDEPENDS:${PN} += "perl-module-exporter perl-module-constant perl-module-encode perl-module-encode-encoding perl-module-utf8 \
                    perl-module-socket perl-module-time-local perl-module-posix perl-module-scalar-util perl-module-test-more"
-RDEPENDS:${PN}-ptest += "perl-module-math-bigint perl-module-io-socket perl-module-data-dumper perl-module-math-bigint-calc"
+RDEPENDS:${PN}-ptest += "\
+    perl-module-data-dumper \
+    perl-module-io-socket \
+    perl-module-lib \
+    perl-module-math-bigint \
+    perl-module-math-bigint-calc \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.47.3

