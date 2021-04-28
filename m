Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.3955.1619649674438969935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 15:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=itDRZgQo;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id lp8so3527501pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A6vB1nWvA7odPR1KQRzI+8h3E3lOVN/7BKMqUcP1QP0=;
        b=itDRZgQoH1/fFB6NMSSOKUR8KXsyc6k/WZVG/pfvjMsZOXear4+pV++Od0kpNAqK1I
         opnVpVI27BHQJd4SmCQzY7/fwFzNLpY/UZQOCNP+p4BK5i75mUVbRq44/gW/QV4zG91S
         Qj3Upm3VjNiL3Q9ZlgBzzK5AOO06nFLN0EYfVWHqk/DbjdOiVqrHcjoq5kJNvyK+X8Rz
         eHVUNsAvtiwIhhNM9MIozZp/3cku6KO105zviUnF9X/jOMuiyHHy/XsREEQEQgsc+WQY
         S2tIfj8bzJg5vcCB3cA0K+tIPe1uyRzbwZN4mlzlAJj07QGbpJuxViCCdT8I2fb56Hi6
         a6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A6vB1nWvA7odPR1KQRzI+8h3E3lOVN/7BKMqUcP1QP0=;
        b=kg+6ge57MalTNW/9H+KjYnDDUGLUHnmDzuzdLy0akOr8dfUV4nTc1bxxDLCeV5pRof
         8WDaPPixcYA9nzNlu9HD15yTgTwgGslAQ9/7ry33dnFVy8GWrqMHPZLCdE5aTcgnb52y
         UGOaPY2F0/GwJrseysF6qGJm3+XEV1+xvCXtX+tbQS5Y0JSgrQkQ71w/D0WlPcDmGrCv
         T+QsgcRacMxlH+v/IGvV/K1sDvWbG7v+Bn3t1T5hrcbEM/OUc42rIf8dC0H6/wF+mRxu
         M+WtjeX8y4kobE0CSoCN+DYoq4pffdUiUR+P4uPOsG7xP+8y9i98oYKxdLJPvivKKNC7
         8YVg==
X-Gm-Message-State: AOAM531DdwawC9Gw0ZAfbaWnervBabX5CXijqigGOIGWqF1NE9reONuE
	o23MLpoEZKIKwurguCKTH4FfdaXW7L5C4A==
X-Google-Smtp-Source: ABdhPJwNv9yhmf9P2i6pDT/GQcmz1K80HRJuqK0M++lIQ9RkdxFGOIORd0vCQ9TR4gtHQmWZpdGE7g==
X-Received: by 2002:a17:90a:d18b:: with SMTP id fu11mr4629046pjb.129.1619649673771;
        Wed, 28 Apr 2021 15:41:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id w123sm598444pfb.109.2021.04.28.15.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 15:41:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] openssl: Filter out -ffile-prefix-map as well
Date: Wed, 28 Apr 2021 15:41:10 -0700
Message-Id: <20210428224110.3511598-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428224110.3511598-1-raj.khem@gmail.com>
References: <20210428224110.3511598-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...p-sysroot-and-debug-prefix-map-from-co.patch | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 949c788344..003cfbc8d8 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -25,16 +25,19 @@ Signed-off-by: Martin Hundebøll <martin@geanix.com>
 Update to fix buildpaths qa issue for '-fmacro-prefix-map'.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Update to fix buildpaths qa issue for '-ffile-prefix-map'.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Configurations/unix-Makefile.tmpl | 10 +++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 10 insertions(+), 2 deletions(-)
 
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index 16af4d2087..54c162784c 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -317,13 +317,22 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -420,13 +420,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -49,6 +52,7 @@ index 16af4d2087..54c162784c 100644
 +CFLAGS_Q={- for (@{$config{CFLAGS}}) {
 +              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
 +              s|-fmacro-prefix-map=[^ ]+|-fmacro-prefix-map=|g;
++              s|-ffile-prefix-map=[^ ]+|-ffile-prefix-map=|g;
 +            }
 +            join(' ', @{$config{CFLAGS}}) -}
 +
@@ -58,11 +62,9 @@ index 16af4d2087..54c162784c 100644
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-diff --git a/crypto/build.info b/crypto/build.info
-index b515b7318e..8c9cee2a09 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -10,7 +10,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
+@@ -10,7 +10,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink
          ppccpuid.pl pariscid.pl alphacpuid.pl arm64cpuid.pl armv4cpuid.pl
  
  DEPEND[cversion.o]=buildinf.h
@@ -71,6 +73,3 @@ index b515b7318e..8c9cee2a09 100644
  DEPEND[buildinf.h]=../configdata.pm
  
  GENERATE[uplink-x86.s]=../ms/uplink-x86.pl $(PERLASM_SCHEME)
--- 
-2.19.1
-
-- 
2.31.1

