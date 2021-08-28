Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web12.154.1630174335466446149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jEqy52sB;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.170, mailfrom: steve@sakoman.com)
Received: by mail-il1-f170.google.com with SMTP id y3so10886979ilm.6
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ogwCL+YPbKoP5SQV93rjUe8l3WHNNkXtYlI8CqeF008=;
        b=jEqy52sBEfntdFBIDPoA8g0kTtg8jbe0ByE2Gz4WrtgSps1yys7TiLy8qPzz3oiVV4
         LD46c5sbZQk1AyljKaUxmETSC8HL0ZnUbAZ3AyXY5h05FPg536PZBuUfe80lTPPogSTX
         5axcbhrR85IMxXxQdxvRJCqxdEt9aBc1rAhqlUvEBB+5NZgKN6Cq0/0jZxGn7sqhfrTg
         TuVRkOFF6Ql3YQnhz9+wm+Wo0smHfD4+sJPXKfH0HP/YEyT6Ms9ZZoqNrHJ5+Ld6PNyP
         aEMTHMJetWrP1NZf5zXXOROeuSczeOta1LnrbAxsfuUk3Ka4h42XLnh9uIOTpTmE+tHh
         o0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ogwCL+YPbKoP5SQV93rjUe8l3WHNNkXtYlI8CqeF008=;
        b=POVAMcJOp2DFavB+Vfm/B5d9rDOHt84K34wsdNuIYbptzaOHpTXKJjnkZH/u0rl1Vd
         o1Zuwvvw4YxRF66NcXwQ49kLfpd5DdW/B1dg8NBpsNrpg1i0bJazLnyx67Bm4GRwnKzt
         1PkG+F2RktCbIlKFG+qCcFi5Eu8Hn7heEiQKamVy8Ec8qRszyQFMtjeVtcNVs5Wb40m4
         tiNVMhTjwgx2vUfOWhVn8cFrngCTGxn1+felg3ncEUzVtrTqQXAkR+DcJhdSRmKs8j2r
         uMYFi5XVOpPowuAIJQ31tt+CCgpaWP+DmUkCs3iHbiSVXmqeMNCgfY2+DWxKG5ukT/7G
         kFCw==
X-Gm-Message-State: AOAM5304rle5EoPIpKGVjmeRThzVQw5mAX7dBn6NB4+yV6iv8IkEAGtV
	9vj2zgk38ArmmnFgNOzSbKjmRIooq9ewE9z9
X-Google-Smtp-Source: ABdhPJxEeJdQt1HAh1Y7Wx4DEJFMzRFMP8ZjbkQKM8w1WCIVv4HPjh8A4gJsNFANIwgMZAU8PT6KOA==
X-Received: by 2002:a05:6e02:cc3:: with SMTP id c3mr10704350ilj.207.1630174334464;
        Sat, 28 Aug 2021 11:12:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/36] gnupg: uprev 2.2.22 -> 2.2.23
Date: Sat, 28 Aug 2021 08:10:53 -1000
Message-Id: <4079feb6dc2876cc7f2d0a5582be98e01188c2d7.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Saul Wold <Saul.Wold@windriver.com>

Source: poky.org
MR: 105607
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-support/gnupg?h=hardknott&id=0c06506d42f9e1f43a54a178cda47cfea3f12f81
ChangeID: 4341d0331368d6cd51d635d2c70555b3dce61792
Description:

This addresses CVE-2020-25125 and provides some other minor
updates and translations.

Updated commits for reference:
  e234d04c3 Werner Koch Release 2.2.23
  aeb8272ca Werner Koch gpg: Fix AEAD preference list overflow
  038314665 Werner Koch po: auto update
  1a4b0fd79 Yuri Chornoivan po: Update Ukrainian translation
  93d10403a Jakub Bogusz po: Update Polish translation
  a8a8105bc Werner Koch po: Add key-check.c to the list of translatable sources.
  cad9955ac Petr Pisar po: Update Czech translation.
  896c528ba Werner Koch gpg: Fix segv importing certain keys.
  0a9665187 NIIBE Yutaka scd: Fix a regression for OpenPGP card.
  bcae9cd4e Nagy Ferenc László po: Minor update to the Hungarian translation.
  d2fe2ffd7 Werner Koch sm: Fix a bug in the rfc2253 parser
  f799b3ddb Werner Koch Post release updates

(From OE-Core rev: 965683336816eba7cb0548e59faf224f74b306b1)

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c06506d42f9e1f43a54a178cda47cfea3f12f81)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.22.bb => gnupg_2.2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.22.bb => gnupg_2.2.23.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.22.bb b/meta/recipes-support/gnupg/gnupg_2.2.23.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.2.22.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.23.bb
index 887ab0e1f2..fc157c7906 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.23.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "7c1370565e1910b9d8c4e0fb57b9de34aa062ec7bb91abad5803d791f38d855b"
+SRC_URI[sha256sum] = "10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

