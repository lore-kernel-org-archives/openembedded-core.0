Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DB7CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.3227.1755758732704771716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxF7WLkm;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24457fe9704so5848915ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758732; x=1756363532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7fpfqRpHE2OWvwpOoM/ieBRPndYsRBlmSmH6ZvEQ78=;
        b=SxF7WLkmetgRLYkl+C06MjVvx4fBG81liJoBOeTHGVEW+jo4vaWX6aPzBQLQAvAXy6
         4w0/BHyV3xZSlVpJpv76sFZ4k1pbThUjnccpYki9TC+1b3ysF6qo6JdE228uNRzHTlqD
         drA0+6xd6zhvtSwH04cVlvus+L3Kn9ixtmOIvkNIVQDItmyarauDI6kCnz5yw/HrDHnr
         3KpvtZbDESqQZUMRgxaoCkhkKs8rliKkXybPEBzGkH+uwLZjXyWyeUjnqMHhcSpXTIUc
         8JmS71AVvuuRsJwQjyE6a5z6ewqXnL4nNA4Y3iXA9OZNdBO9OIQRucFTypoxAEbDMZ5R
         zkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758732; x=1756363532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7fpfqRpHE2OWvwpOoM/ieBRPndYsRBlmSmH6ZvEQ78=;
        b=eVw6sLmioJvCW0xblC1LQQ/XKvva6bonWD4Jg5oEBwDBb4Oto2qIC0KhaRa4bPJ52/
         A0MWPvopKEeEf9TG87rk3bIQB9Qx7xD7cMVtrkBOSRzXuQEj0KGgz9A8dRjDoK2ld2jQ
         Utz7aX9hekI/IfnhsXlGJxp+w3HEve9rnHNLHmPE0wO6448SHUvoXpk8wPg26Hz4HC2W
         UVDQZ5iWvbdgjv/PA8l/T1UDIDzdYbhV6baXVl1CnhwzPiftd32p3YVemlM7z3jkO8GJ
         c0p2SHY0EBwKwGt4wXPfJOTPpayxGbfsikMVFxlM7YDGLMCsd1jDEgNE3otC/kzb9Lfv
         ylEQ==
X-Gm-Message-State: AOJu0YzGt5lE5zMrQn23VtEdLnIurai4uDyI9BJwXmG8+vfb8YgDCVsF
	R2FsPWXuAIL8+iq5OxGl6hEB39NpwY5BXzkRk14DdGhxcySXQrjMICXfKQUR6R/F
X-Gm-Gg: ASbGncupDOIKkeRnwPk5QHKWbCFQJAiU8EEhQVpGYyBqq1HOYgSupOVaVVhD6/dlhMw
	2avRp3RqEW6VLy0q+6Wfmx0zVvIsIgPujUFhWfV9JFl4rvQxsNv+3E8Hdcfne2r+ytwAdLmQhpg
	LWi8F3e/N1qsvbi7wOtJ2p0Ps+Dd00q7qysGOzvwjytqWhSpkZttZt/+/4EsBq8TT/atvmVMDVk
	ZSq8SMLjAY1gKPOgyv7LnD3wAw1XVNo3LexqJNaUY0CQZhf3UlGGMbQ/HcgIIKYf01Dkd0zaBCx
	xMW7pymImP6OSTS58yLHR3pEGXgDpntglZYV/ov4j0bofAmG6udHc9/m2xexqOIDePO0q1IMGa/
	YCOz6WvORP68OfvEkGjMOR0Pus3AJZ5zn
X-Google-Smtp-Source: AGHT+IG0PS8qIj+NVbSeUFRlF9U9kuY2r+1xc7ZxcmaxzB6ZCWcKbnROIjJ2H0p/NJVrnNTA0Csdlg==
X-Received: by 2002:a17:903:4b03:b0:244:7bce:9530 with SMTP id d9443c01a7336-245fec081d6mr16170935ad.18.1755758731415;
        Wed, 20 Aug 2025 23:45:31 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/9] m4: Fix ptest on musl
Date: Wed, 20 Aug 2025 23:45:18 -0700
Message-ID: <20250821064528.754633-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222209

Fixes
../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion 'is == 0' failed
./test-c32ispunct.sh: line 36:   402 Aborted
(core dumped) LC_ALL="$testlocale" ${CHECKER} ./test-c32ispunct${EXEEXT} 3

FAIL: test-c32ispunct.sh

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: apply the patch only for the target case

 meta/recipes-devtools/m4/m4-1.4.20.inc        |  1 +
 ...unct-Check-for-musl-along-with-glibc.patch | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.20.inc b/meta/recipes-devtools/m4/m4-1.4.20.inc
index aad57b8b649..5c4ba09288c 100644
--- a/meta/recipes-devtools/m4/m4-1.4.20.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.20.inc
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://0001-gettext-h-Avoid-gcc-Wformat-security-warnings-with-d.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
+                                file://0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch \
                                 file://serial-tests-config.patch \
                               "
 
diff --git a/meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch b/meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch
new file mode 100644
index 00000000000..fb03e94c52d
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch
@@ -0,0 +1,26 @@
+From 761aa7fab4a82dc01daa28799f4f1d6ae17a4c26 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 11:31:32 -0700
+Subject: [PATCH] test-c32ispunct: Check for musl along with glibc
+
+This check crashes on musl based locales, other libcs
+e.g. glibc ignore it too.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/m4-patches/2025-08/msg00000.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-c32ispunct.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/tests/test-c32ispunct.c
++++ b/tests/test-c32ispunct.c
+@@ -255,7 +255,7 @@ main (int argc, char *argv[])
+           is = for_character ("\360\235\204\200", 4);
+           ASSERT (is != 0);
+         #endif
+-        #if !(defined __GLIBC__ || (defined __APPLE__ && defined __MACH__) || defined __FreeBSD__ || defined __NetBSD__ || defined __OpenBSD__ || defined _AIX || defined __sun || defined __CYGWIN__ || (defined _WIN32 && !defined __CYGWIN__) || defined __ANDROID__)
++        #if !(defined __GLIBC__ || defined MUSL_LIBC || (defined __APPLE__ && defined __MACH__) || defined __FreeBSD__ || defined __NetBSD__ || defined __OpenBSD__ || defined _AIX || defined __sun || defined __CYGWIN__ || (defined _WIN32 && !defined __CYGWIN__) || defined __ANDROID__)
+           /* U+E003A TAG COLON */
+           is = for_character ("\363\240\200\272", 4);
+           ASSERT (is == 0);

