Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84885C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 22:28:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7049.1788820112296301325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 15:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AN4ExxbC;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3770443a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 15:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788820111; x=1789424911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv4yhVKay33/Mvp4J36z8oj2Q5yNtSiQ7bsgWMeSlAw=;
        b=AN4ExxbCzG0fdTJ3gsDRj5k903z3NWAV5txkyIMOkY0GQwna+eol/3/KhzCGSD+a4P
         +YC/OQk9r0BzLzxBII0Wyhtv6qWbSjd594NowoXYf4h0HjXiY41FygFWXCf5JfI8WLPb
         Z5x2SzLEuizk61rvMO2WP1+8GEzYJmjuZtYePC0v6DI0PdFvCE5inD5eIaG+xkauUu6n
         O9jv7OUkHJ8/m7YKmZOhyn8SGV1adj/NoSfYstVhKzWYvCoduXCaZw9mYHSWDzgc8bAH
         bXg/EMydruYY+PmRNoVYktjoMVn9oThKjCNBVYWV8KgHS0g+MUYL+bS59v6h9muSVl5q
         p2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820111; x=1789424911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv4yhVKay33/Mvp4J36z8oj2Q5yNtSiQ7bsgWMeSlAw=;
        b=Sf9GMTPajKnWN6/Iq2qJQ2g8aPVG3yzE/eplKl2uLRF9jHQFV0TcfY2z53Mrj2oiHM
         me4xOX5IRG52l6F4Yf0H51OcX+nyubMeAmiyczeWK5Y1wXjVTP9bu2xPccGrUKA84WA3
         5f/G3ofg7JewKbTSSZBZAgJi/B3bACfElk5C7EvRWTXLSj9RaXPYkMwTyyE2bgQ5T/uB
         DFPqFMTXDvmJy+gpOXJa/RcZvIoDj5wLkyNfklH7q7NZp+3kSxMYaP8e40Jn6JCNdM8c
         LzuJA9hdvaLH5vvMKDkp970UC9e3kR2aW+dktwHjx2e2+wFeTxtHivMIU9mqfls6Y/i3
         jYDw==
X-Gm-Message-State: AFuF++lhSuWEDvv1r3HqQoLX+RlyDbG9/MewhPLqf0Y4jfZi5+D5G48I
	UKqJcYPTx4jwFOBeR+5ySdL/zxviCqScyb34z7ZFJQipkA1j/k3VKVi62YM5DFxJ
X-Gm-Gg: AYBFou2zTsy5x3rbH+Kftvn6Hi5/PVE77CwiGF3IW6hxbPdhKurfeFzXVj1giZnWbGx
	quvp7qIP5DIRA2W6Lqu231E+GCuurv4XwcFhsOuBTYYBuiMBKXnPkjLxofOlAg22BwVtepEkHVj
	gTNoV5QEAuX1QW+AWpRemCI1WBhK2/r1GgcaJIeMDktcmbZbw6OSv+enIyyF1oopLAwec5GzdzO
	0dJHiuJlfu9nSyro99Na+iNmYRbJnsupYIdYK6ebY3GorZ04yucFodK+xNiGcFWovgwznuw49yC
	WKtS///KHRs/SvRLBdWS36akGyP3ZRW8cfaNN8hbGF/5+TCnnx9xw0HMgYhnKUULABA0UuqxN0m
	mxiJVl/STGoPhfsc53m0QDC3St+/l4Jov7qkezUcHuteQ1Db6w5Yx5Gv46+mLhM4QSI9lYacDJH
	GuYGhxpyWUa0PzvmbWBdqZs5I+vw6rXLv9vlXQ9K10DEbePIPiYBjSb14wnUqF8abfb3pV521f
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr38351350a91.9.1788820111477;
        Mon, 07 Sep 2026 15:28:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm30022489eec.17.2026.09.07.15.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:28:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 1/2] wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
Date: Tue,  8 Sep 2026 10:28:18 +1200
Message-ID: <20260907222819.410906-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 22:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245310

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e92e1fe36a5767a7b31d96b9897357e0aa28cec)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
index e544b72965..ad84208f6e 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
+SRC_URI[sha256sum] = "b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d"
 
 inherit bin_package allarch
 

