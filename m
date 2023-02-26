Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3BBC7EE2E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.69588.1677430958605866462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bFTy3xCY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id u10so3783044pjc.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6CpYrgRpdgo5ezRESaNZPoLxcrp7nizqzXKvPJbtAU=;
        b=bFTy3xCY/tJ9XfbiiDyVc0LCFmVZCYH+rXLzqJ15jEJyIg26Q4CtsI13WajqtPay/S
         kbgf2NTaF8lwxaZ92dkT+RoebgPN1hEI7Ro+lfwogYZRD652Loo9fW8+1i42Ra4JBzrs
         3+iPA6KkSDGy7hofpJZ/t82fT0VG9YknYie9GqY7W/rUP94t9+Z92NphwSGDq33JRJZD
         PJUb4jCfZHOIdsbQfN1p5356dgvDeAhJFNdSMas08FTkelg+rRRcuaqoP2OENsUsRdeY
         SyqRZo4WccUv/Yp9XaqmWXc+K9ykbTpSemwnh9bUKJ725GXqIpZf2XfwG/g/C9abwnyM
         7NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6CpYrgRpdgo5ezRESaNZPoLxcrp7nizqzXKvPJbtAU=;
        b=q9oRgz0FOO5PbRf1nOdKL69kdvwyTcoBQBPXigjtVimQ0YPvMuPhjFjZ+q9RDyYoDa
         S/D8usWt0tpgma5kwDI7HjqvHsbkSX16Zoi7C6IjlJHQ5P3Tm0PrSCIoUoqzb6s8j9It
         jcFdRTICCVfnOrrRB6woOpHjoZ1303Y16YOQRFy6jk7kUhQpI40vLYrUdChTexVKsfWi
         JBQdmMLkX6FAIk6SGVl0jTKmmYHOpDRGxtZ2Wur3U5exNZ7cCgaO97rZeD5PPeGVQz5p
         spWdyyqBqfGjk0EviNY4LqC/rs0cBmhclRjX9OGvvHkZ0h1b6Fuhk2brJ9lnkYxEEV3E
         gOZQ==
X-Gm-Message-State: AO0yUKWoJiiH4sj7V3+TqnUDOs5b2Jh0wnkr3NX2xmlL8I8h85s3us+9
	RFLYErS0BswsmxJtmSY3MoHqg/P1lsmykUUUM28=
X-Google-Smtp-Source: AK7set/13EViJ4SkYndSYQY2zKuEdZJ+zM4Xx1TuTsRckMsr3pmZRf3GaF9ikuz5qJy0Euw931GRQg==
X-Received: by 2002:a05:6a20:1453:b0:bc:32ff:9afb with SMTP id a19-20020a056a20145300b000bc32ff9afbmr19028445pzi.44.1677430957650;
        Sun, 26 Feb 2023 09:02:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/28] libjpeg-turbo: upgrade 2.1.5 -> 2.1.5.1
Date: Sun, 26 Feb 2023 07:02:00 -1000
Message-Id: <d57de2a7169de369105ed9bce19a43dad68f350a.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177742

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
1. The SIMD dispatchers in libjpeg-turbo 2.1.4 and prior stored the list of
supported SIMD instruction sets in a global variable, which caused an innocuous
race condition whereby the variable could have been initialized multiple times
if 'jpeg_start_*compress()' was called simultaneously in multiple threads.
libjpeg-turbo 2.1.5 included an undocumented attempt to fix this race condition
by making the SIMD support variable thread-local.  However, that caused another
issue whereby, if 'jpeg_start_*compress()' was called in one thread and
'jpeg_read_*()' or 'jpeg_write_*()' was called in a second thread, the SIMD
support variable was never initialized in the second thread.  On x86 systems,
this led the second thread to incorrectly assume that AVX2 instructions were
always available, and when it attempted to use those instructions on older x86
CPUs that do not support them, an illegal instruction error occurred.  The SIMD
dispatchers now ensure that the SIMD support variable is initialized before
dispatching based on its value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 009a1b0390d791d614b8d4a1407e7479c261f60d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
index 4d21ca1e1d..e086830c02 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf"
+SRC_URI[sha256sum] = "2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf8486844ca22207bf"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.34.1


