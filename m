Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2A9C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.30654.1668892542616571244
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AByGland;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso8076065pjc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTv2TlgFZevmLIrX+We0aujnFw7GWTVNg4mpdXqAFJs=;
        b=AByGlandygkuASCQwnxu6dqdkkoBVwe7zy+esgNeFov89uWlqGTKty69LFxOLGbdoN
         /02VXLGWmJz5oRGEG7ULU3u1bguHjWQfWGVEYHLx3ohgZq+o5uGfdABBJOJRmyl6OFQf
         I0CZvLTU7Al61Uyo/2q7D8OZogCy2inQLNNCPLU589qfeJFiawsQNI5in+f6ii23ziuB
         Os9G0sAALH/ro4Sydvrg5rUUIeLGAIMM6PECadOzEdGBMBj3buz/UZNrwAfRLFu0UMlk
         g7ysf6Va7RAvUc9VWNKoclRNYOdF2HfWCkuxpj6iE6UcHX/fSM0Y7uaBYMPFcHj0+1Da
         Evrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTv2TlgFZevmLIrX+We0aujnFw7GWTVNg4mpdXqAFJs=;
        b=kwNiIYX8IBAjxxEurMyj7i6Vad1LlIJDgLTHP3/72xYPbj92bJwfQXhTeCfE5/eUJW
         kbC1IbKQl0nm7HZ5ONeDgSQmdPZEgZhGLUr+Dxmlsja1xSIFlkrNRwtjquD+UnG7xMXq
         oMNFbuB6QMKDaTDy5bhy+rwb67DTNdXuzWHLdb5FhPJQK0ns68iFnUbRg4nQHoKO5gU7
         1GjFDAjI+8HmC5dzokB3qpiWYc8uXm+gSXfoYs42JnIImoFganijvXK+dhCzzkH7CKs9
         3oXgyggRQ3zQ3+g1jsybOZdnpkHvSoq5B2nbveQLrHzjn0Hj6nkgaQkeQzzdOIvPNTCQ
         uaDA==
X-Gm-Message-State: ANoB5pm7AlUVVhZrRjjcYkYBZiSHj0V2ka4YhHPkayqTvRxrcAmzgZib
	pnglUtUolg5bG9KE184ArHD4FefW/d1xm/TXHus=
X-Google-Smtp-Source: AA0mqf76H4m4h03ztdC5KYeyXMrwfsZq0M3pH7ZUuJwmbK5k42nItoR9Go5VoSr/ostLpoqgcLt9uQ==
X-Received: by 2002:a17:902:b283:b0:179:fe08:48da with SMTP id u3-20020a170902b28300b00179fe0848damr1705902plr.154.1668892541633;
        Sat, 19 Nov 2022 13:15:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/35] libxcrypt: upgrade 4.4.28 -> 4.4.30
Date: Sat, 19 Nov 2022 11:14:49 -1000
Message-Id: <9f78a2b3fd16c8aee398ad95a0fdbb412ac031fd.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173550

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* configure: Restore ucontext api functionality check.
  In c3f01c72b303cbbb0cc8983120677edee2f3fa4b the use of the ucontext api
  in the main program was removed, and with it the configure check for it.
  However, the ucontext api is still used in the "explicit_bzero" test and
  thus this test still needs to be in place.
  See also: https://bugs.gentoo.org/838172
* configure: Restore the functionality of the '--disable-symvers' switch.
  Without this fix the build was simply broken, if symbol versioning was
  disabled for any reason, e.g. whether the compiler nor the linker
  supporting it, or if disabled on purpose by the user (issue #142).
* Fix variable name in crypt(3) for a datamember of 'struct crypt_data'
  (issue #153).
* Add glibc-on-loongarch-lp64 (Loongson LA464 / LA664) entry to
  libcrypt.minver.  This was added in GNU libc 2.36.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7da5dd3b43718b876645602b1a23c739cbe8016d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.28.bb => libxcrypt-compat_4.4.30.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.28.bb => libxcrypt_4.4.30.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.28.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 39ba2636ff..2bdedcba6d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "50cf2b6dd4fdf04309445f2eec8de7051d953abf"
+SRCREV = "fee2687bad66e351a3dcc963a34ae80125923ff8"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.30.bb
-- 
2.25.1


