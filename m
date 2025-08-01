Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603DAC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 18:46:17 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.95373.1754073966983219331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 11:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QV/U1HV6;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6157b5d0cc2so1660511a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754073965; x=1754678765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DeF/LvRqJIA/cMOJVVDZyEkvvoYgb1YpQK/sm1xZEE=;
        b=QV/U1HV6LjhiofH3pIA66/AEgxiHqdytz+/irbcsqk8idmPemz1c3WvvOsBNIEtq5E
         JK8GmBVhyqlJXH4GeyPIhJiGHfn1/p0Xbw/jEyZkJsXCw04MOna1XsoQ2e2/pMpMGkpP
         N2e6YzTdj9SvJxozGtihq/vknaVEBXiEJ6mTeA5VGuXWrg3vvo5K1+kOcaa2tC4XYO7U
         WrZYcJ9qORw+O4tMciBfpueu2/UUpGQLDJ7B7KwMfoiS2hVQLE8h+3CyPNx5NoJICJjx
         CXolFDDd6rC5ZK/UvnZE8weIPUxdE21IBtxBbJ6+GLOlOklqGW4bBYT+K0Ob1Rzn3fK2
         EmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754073965; x=1754678765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DeF/LvRqJIA/cMOJVVDZyEkvvoYgb1YpQK/sm1xZEE=;
        b=Vca9ICId7TUdqTiyTbi+PaWVe3MEsX6OgBg+EBBJMjPn9aKScrcj2oHR3xtS/Beq/f
         W7wzgofSLl60ENiFINCr7lwUUBS8Ui6jgmOHrQRXg7sVzQ/j192NzFMHW1m49ZL5wfNs
         MFOXRbgHJIwb6e2EMK6w/r4vRftxgAWMZDKKgyfVALvSSdyVSJoc1GufStuPzwL286sJ
         /IOO4nTXFQYch00pyrBP7D7GbhaK2WWH1zWDLstGOLiKCs1oMhfT0VOXIBlZ3vb2OAjU
         Xah1D31tTVoKKGZB8Z3VOgY66wTtEIO65KNkc7aaqX2j9n+Mgx7yfowxBTbl4kOBIblc
         GF+A==
X-Gm-Message-State: AOJu0YzRM+v9Jz1LLTClSr63QRnPZITuxrx2W4Kp5r1aiO8DG8o8dERd
	XQL3EX1u8kzgEF3ySb3KmOQf7LIjZTybKhSyBl+YNguU1To/Y2QC0Qfxkd5EDA==
X-Gm-Gg: ASbGnctItMFY8c2YPgNxvwVK6E2JjUs1jVZIwRyEA9snx8sdEtPMvYDcud7X31xVPFe
	mqf4Jrmo0t+AaYjVb4XqdIgLFB3kPtCQS23T35tq+UBxBGCe8aRAekB2aJpBifcy7nMuPXc5Jh3
	ajwk0U3OWheDrF5sTh/G4TWXpAGHr5nJHVGFEOjgJiPH1ZAaHg/0L/NYfHtk70rT03wA4DlokJV
	LeFDuJNugttdGLJC9ivasFPYY9zLZ9IZAMJtP19mlA07tSPCh/LNymkZHnV8tr29Mc6w1Mz9Y5Y
	LVLO+oTEi35iENe9XvyLNMuEpAjPSMDP8t3KilsfIAAxOQH1qFfV5IjnkiL1PYVm7D24eNGd4p6
	7inSIZ5AwC6/CjhNJk19TV6WTnYFLAA==
X-Google-Smtp-Source: AGHT+IF4pI2Z5Jm4UDSsqGF7WsItgbvUyuztqZmKJUOff520leDZXD3eGdol8vj0v//l3wqk59iWvg==
X-Received: by 2002:a17:907:1c0c:b0:af9:14cf:d808 with SMTP id a640c23a62f3a-af94021f289mr104217066b.55.1754073964776;
        Fri, 01 Aug 2025 11:46:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c039sm322599966b.110.2025.08.01.11.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 11:46:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdbm: upgrade 1.24 -> 1.26
Date: Fri,  1 Aug 2025 20:46:03 +0200
Message-ID: <20250801184603.301140-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 18:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221371

Removed c11 flag, as it seems to build fine now with default flags.

ptests passed:

All 38 tests were successful.
DURATION: 11
END: /usr/lib/gdbm/ptest
2025-08-01T18:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Changelog:

1.26:
- Fixed build with musl libc
- Fixed build on MacOS
- Improved testsuite

1.25:
- New function: gdbm_open_ext
This function provides a general-purpose interface for opening and
creating GDBM files.  It combines the possibilities of gdbm_open and
gdbm_fd_open and provides detailed control over database file locking.

- New gdbmtool command: collisions
The command prints the collision chains for the current bucket, or for
buckets identified by its arguments.

- Pipelines in gdbmtool
The output of a gdbmtool command can be connected to the input of a
shell command using the traditional pipeline syntax.

- Fix a bug in block coalescing code

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-support/gdbm/files/ptest.patch           |  8 ++++----
 .../gdbm/{gdbm_1.24.bb => gdbm_1.26.bb}               | 11 +++--------
 2 files changed, 7 insertions(+), 12 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.24.bb => gdbm_1.26.bb} (83%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 989f9524bc..5f4078101b 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -28,10 +28,10 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index eb071ac..9d14fe8 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -145,3 +145,15 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
- t_wordwrap_LDADD = ../tools/libgdbmapp.a
+@@ -150,3 +150,15 @@
+ t_wordwrap_LDADD = ../tools/libgdbmapp.a @LTLIBINTL@
  
- SUBDIRS = gdbmtool
+ SUBDIRS = dejagnu
 +
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
 +
@@ -42,5 +42,5 @@ index eb071ac..9d14fe8 100644
 +			$(INSTALL_PROGRAM) .libs/$$file $(DESTDIR)/$$file; \
 +		else \
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
-+		fi \
++ 		fi \
 +	done
diff --git a/meta/recipes-support/gdbm/gdbm_1.24.bb b/meta/recipes-support/gdbm/gdbm_1.26.bb
similarity index 83%
rename from meta/recipes-support/gdbm/gdbm_1.24.bb
rename to meta/recipes-support/gdbm/gdbm_1.26.bb
index f400462a7a..0c8c7ec690 100644
--- a/meta/recipes-support/gdbm/gdbm_1.24.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.26.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[sha256sum] = "695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf"
+SRC_URI[sha256sum] = "6a24504a14de4a744103dcb936be976df6fbe88ccff26065e54c1c47946f4a5e"
 
 inherit autotools gettext texinfo lib_package ptest
 
@@ -22,9 +22,6 @@ EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
-# Not yet ready for C23
-CFLAGS += "-std=gnu11"
-
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {
@@ -41,7 +38,5 @@ do_compile_ptest() {
     oe_runmake -C tests buildtests
 }
 
-PACKAGES =+ "${PN}-compat \
-            "
-FILES:${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
-                     "
+PACKAGES =+ "${PN}-compat"
+FILES:${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS}"

