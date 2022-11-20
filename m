Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868E8C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:00 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.13267.1668953742754071399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MM3g93A0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id g10so8406027plo.11
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTv2TlgFZevmLIrX+We0aujnFw7GWTVNg4mpdXqAFJs=;
        b=MM3g93A02edHWeqhqJ/MI/1fcp9uhEP90gb41fhRF7d4dBxnLKlfzixd9pvlbmsKTE
         Rm3B8bmIXc/m5qgMVgA9Xb8OeLsbCPySofbg2t4NxPTP/0BdQd0OtV0Y+ovn0qErvpYW
         RQzL0V4k+LfRNPr8INUnN7utP/F2TNsOx2hHf9J75JjuRGKSlWgpuZRrxNeatfOEmsSq
         onEOF/gXpioDaiJ4JHdma8z0FFA7gQF3wOsvVQ5VftNVPGEl9B4vXuM+armsoj3QTd3i
         aXm+klardpI1ic87UGYWhjdgc4cFVtwEkBUkgb3ARSCHvVUMVrxcTZ9YFEwSbsXEehld
         fX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTv2TlgFZevmLIrX+We0aujnFw7GWTVNg4mpdXqAFJs=;
        b=Z6jMP2wk039kucCItNC5eX51uprXn2uUuj4RUfGz5cDyNWxEQF705y+pzyy+xHZhO1
         EAG2L4hUVxDoBnWjjOvvoVEXi6k5BA10LboEKP8bVrGo6lZznKp0mq4QUtHUwyf8L7v1
         fUrjqOS3cyfXg5ZFaTBnO5UB7Sl3s4HgYHqCshtAPEDxqyfbNT7mB4uJI5uT3HwBNYNA
         D/bFJ8UWKacqZFTc+tedHB39A+imGXAFA3i6ex1KztZMNMv5Fjlylz45Fj8auJ10QyBZ
         4lZqn5oeO3YXCp7KexkwjFhlJqL9GnrKlsKNZ9okqZpZupi6OkUH9OYv9oG86tWP8NvA
         s5Jw==
X-Gm-Message-State: ANoB5pmU0/4XpFZVTGmKs32lZZsPbqjMo9lVq+vyXTJ0b//GCPb2dVFT
	lYI94W1kiBLu41+6HzWr7e2zHbOClGTVsQOIDoA=
X-Google-Smtp-Source: AA0mqf5a5mDSChudy9FCtm3JM9eTQZEgMW/6sEvYrc1vMMPhp9IqahYNPCmtmuzmLTNr0fUQZ9kxmA==
X-Received: by 2002:a17:902:d349:b0:189:324:27cc with SMTP id l9-20020a170902d34900b00189032427ccmr7609421plk.70.1668953759106;
        Sun, 20 Nov 2022 06:15:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/35] libxcrypt: upgrade 4.4.28 -> 4.4.30
Date: Sun, 20 Nov 2022 04:15:01 -1000
Message-Id: <061a969a6d7a8d3a7009190a18c1564cae4ad990.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173612

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


