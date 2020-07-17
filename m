Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.12676.1594996729919207797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YGSBANQs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id k71so6620985pje.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XI6LZ87iixEq9fuIwg3cvkCE6oDCRvTzM1i/kmPf0MU=;
        b=YGSBANQsLdh/I3SrtRG6ixJJr2l6XJLYH53mEfl7hEovfNyriSOcAOTJdUXu9M5SLq
         GIetjkeUAFLW9P7ghPJWxYl7OZiD4h/y3oubeO0Y8sC8QOqJYtCvr79OyGNhMlCwBvZB
         af7Edu/TNU/OQvesn4KcgtRSpGthO9QnjZRpZzxXLAzl/xzuPhDuF8aJeLq65VcGfzt7
         phVtSZBC5bkXa8RhXhBtr3lKsP0XUfU1Fb+OYSWFQ578K+wPhg7eig3767GjbBKsQMvl
         vzaq9/HE7av4ZvrGGm1R+2EOBFdO9qr+neFpeL0F5KhpWyXp/vhXfOKvOal1N8trMZQb
         z2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XI6LZ87iixEq9fuIwg3cvkCE6oDCRvTzM1i/kmPf0MU=;
        b=RcXcsehHO6YOzCx68X8T6XDmw62Nmk73KcEO52GN8F+VYZmpbnfVVB6v0mHatLLZ9/
         OjSLDr+x8LUuKRfKGksYbGHOD4RkESriVB6KbOkZz25tCgam0X/asU8UA/Pil0u/R2U2
         jur68bGEdCQIOKtwbExJEEvP3kKMxVTi+7IDTQemW8jyUzkLiw3d9O/iESpBPCIwELJS
         lLOG0Ypz/XunCBstMsm5wUQsTCFAYLEN8wZ+X4F160Rtend6ta3ivoFOB6HATVh7u4+F
         kP2f4O53x9nw4pAKq/hE8qFmL8LquLhFEP2fiOswHiuq9SNGmhDY4XJBd6kHd45LruSZ
         cXOw==
X-Gm-Message-State: AOAM533J9RA3wqJkEJVcblg/2S+5alwIPVurmJ/9BOZSzxJ8WqQb5W96
	cIKH3JBJ+9t4QjZTtCpyKNT8+hgdSdc=
X-Google-Smtp-Source: ABdhPJxmwPcLC43DvNO54ht7fANr3cNvC/OqlLOCUYClgXad3eKEnbl1eAqui9FsQ2bnAl/rpb1ofQ==
X-Received: by 2002:a17:902:9683:: with SMTP id n3mr7816014plp.65.1594996728978;
        Fri, 17 Jul 2020 07:38:48 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/20] ptest: append to FILES
Date: Fri, 17 Jul 2020 04:37:17 -1000
Message-Id: <1a52f9ec394ec2ce9899543c1b9ef95e926ebf14.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

as ptest FILES could be determined before or after the classes was
inherited, if is much safer to append to the setting of
FILES_${PN}-ptest

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 419ad35ffe7f5199e49a246ef9854f0810ca1d6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/ptest.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index fa4c36ec76..47611edea2 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -6,7 +6,7 @@ PTEST_PATH ?= "${libdir}/${BPN}/ptest"
 PTEST_BUILD_HOST_FILES ?= "Makefile"
 PTEST_BUILD_HOST_PATTERN ?= ""
 
-FILES_${PN}-ptest = "${PTEST_PATH}"
+FILES_${PN}-ptest += "${PTEST_PATH}"
 SECTION_${PN}-ptest = "devel"
 ALLOW_EMPTY_${PN}-ptest = "1"
 PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
-- 
2.17.1

