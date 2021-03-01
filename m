Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.1925.1614617130013712452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 08:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DqT7o8tI;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id y22-20020a1c4b160000b029010b2094f5deso3286296wma.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 08:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cdhhcdL5Pn2mldNmp/D4bbrBLW13UlP4JMJDopXy1Ng=;
        b=DqT7o8tIt7VZFKViTDHT3QH6BkiAsrtSyas1VqFL1wa/aFGR3mK5Gjv7PCSvwVuOFT
         15xTRPo+Pj7lcl56RpyImxS/4S7vM1FuzL5/+zj7UX/alljlbuj62gerQwRr/w7PI3Q1
         sf5R3uvFdwuTWckx+X2E9gcXxN1Ud0z/8KLUUHNAayjfmZj9zATd2LNF2Kgi89yehyZ1
         R2pSHmLP/0v/ADSh+Yx9cK1Dj2aXsf+EqlN+Brw5qNz7QZnKvQQ1gQIoKWawX5pckAeJ
         P4XKjKW1B7tRA5o5+1Cvvo7nGGat5wiLPSrh6VUiLhHfnQ5Jpk7VnKasqrhChaZ8c/vJ
         xCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cdhhcdL5Pn2mldNmp/D4bbrBLW13UlP4JMJDopXy1Ng=;
        b=Vtx3wzxwP2Z1VcnNVc9LfdlI7kXdObRYy2nS6AKeIo9IktPk4eqcEDOIO9p2k/WXNH
         IXnturKdVnGX7BOD2G+8vTnOAdlyh1ZP0aNidyVgjKeCxpIT2/EWpxlUl95YHj+Y6mYa
         YejOyf9M/ObAd3kyyGSCh1nfWB61R9hNUqGMbleWmbVhNFLFKooMh6Z9CQ5I60QXE74w
         rb6woMjkPblv1zkTS+oyjdNJotsgY0L8W/ll6wwuqYSDFDAPUtbdQgQczqIzzyNWXSy7
         J8qFDKDkPR406QcyiSNYgkIdTA8rW6daPojUH7StNHwq7mnsIJWH39ODtbG1DXw71fS7
         MmMA==
X-Gm-Message-State: AOAM531gcgO5uhNkzfCwitB/H+tiBv8b1mSSkWn6/0TXTspvL0RSYUkP
	628CbE6zCHQMY7rSdEF3hoENOhhghuc=
X-Google-Smtp-Source: ABdhPJyiMvsokiazk4g6rIt7Gc69jvGcYhL089mrbIIjNxMoGKQ1oQh0OnPmXYwc6VMCkk1OWAtDng==
X-Received: by 2002:a05:600c:290a:: with SMTP id i10mr9057082wmd.91.1614617128206;
        Mon, 01 Mar 2021 08:45:28 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.145.200])
        by smtp.gmail.com with ESMTPSA id y205sm11855571wmc.18.2021.03.01.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 08:45:27 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH] binutils: add PACKAGECONFIG for debuginfod
Date: Mon,  1 Mar 2021 17:45:17 +0100
Message-Id: <20210301164517.13666-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

Added PACKAGECONFIG for debuginfod

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/binutils/binutils_2.36.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.36.bb b/meta/recipes-devtools/binutils/binutils_2.36.bb
index f316eb8d1c..a50d2ee7ee 100644
--- a/meta/recipes-devtools/binutils/binutils_2.36.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.36.bb
@@ -25,6 +25,8 @@ EXTRA_OECONF_class-native = "--enable-targets=all \
                              --disable-sim \
                              --disable-werror"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 # gcc9.0 end up mis-compiling libbfd.so with O2 which then crashes on target
 # So remove -O2 and use -Os as workaround
 SELECTED_OPTIMIZATION_remove_mipsarch = "-O2"
-- 
2.17.1

