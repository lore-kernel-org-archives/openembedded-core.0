Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA82C55188
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.8110.1650463714260748139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HJwYFpG0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso2118867pjk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S+Dm4bga7uJQ2VW6HIzaUbXpWqlc9D2lodXWz1s8WTA=;
        b=HJwYFpG0ZLnRNADteiIavdafz8SA29ejYcEjaCdTOHScHHroqPlNdzxWaWhyNTTLBT
         92Ld82K1/wS+we/Jph5Xx3IX25YEX4RfmFOHBinV6iC+hXulexCdbAzWfyKcoYaAnI+x
         IHUaspGI9NPB5ANs4QQAyiVSnZ7Mk1IqBfUf8KFBtK4sYRBEZiK/zw77BT6XKN6dCxTy
         C6ABQSKMfFmc5/hMZJum/he/1/kGJQCC+vxg2CYQNscXGM6nBFQH8hyjHTGdY9Ov49zl
         lPSfbsnMTO2goBO2ZLkbMW6YcQKWDtLzEbR1/9zmZWAipa8CYzLYua8PD4UMkKDHIUio
         O52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S+Dm4bga7uJQ2VW6HIzaUbXpWqlc9D2lodXWz1s8WTA=;
        b=2/qWwSaXQQ+6mBbIMWXvI1NQaXJgUIJOj/rPQxv0MiMcXa1B5gYDbqqCxHjeNO29jM
         4EnjCc4bb1rSCGSEx9/A2e6YkK6gnyzJK0Wa+47QoKUfqhZBXa4UE4F+tLpZJwR67DxB
         p3VKVj0u2FZipqj1iPrPw6FQPlLQD4HQjGu9zEv15DMVpxID3X7FXx+IJ9yrvltYpvpw
         prpHWsClSd3fXtffMWXaOSMXKun1cC/QTkq5Q65hsoOLuz36Rpul+2xiFgdXED9aL+T7
         +3VSvvlLKnkibJhq+Yf0OD5mK3H+OUzvhkEAMjBsM9idrca320qIc3T/rj8aNMD+QWCE
         Rjfg==
X-Gm-Message-State: AOAM532i7pY9In7NGzAnLliiIv82TJWS++d7mgGQt0+B39wfc6O/cL4s
	wTIOmGK8HnJ7WMcEkr5Ak1cP6kYBEI0qYKJ6tpo=
X-Google-Smtp-Source: 
 ABdhPJzIri50kRsMwQeMsHLySol9kFjokcDLoIsvrnSk9Kzwo13yNqgWIshoiGx3PWcgXqkQB0Uw+w==
X-Received: by 2002:a17:90b:4a09:b0:1d2:de49:9be8 with SMTP id
 kk9-20020a17090b4a0900b001d2de499be8mr4791710pjb.68.1650463713168;
        Wed, 20 Apr 2022 07:08:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/27] systemd-boot: remove outdated EFI_LD
 comment
Date: Wed, 20 Apr 2022 04:07:49 -1000
Message-Id: 
 <fdb5a0520fc3c041789c94a94cd1f6428a4f71c7.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164669

From: Martin Jansa <Martin.Jansa@gmail.com>

* efi-ld meson option was changed in systemd 250:
  https://github.com/systemd/systemd/commit/fe330f02dfebbaa462e0f4590de1049e47da54b9

  the value was changed with the systemd upgrade in:
  https://git.openembedded.org/openembedded-core/commit/?id=e22188e47d2fce2406d9db9c95289b3878eda69f
  but the comment originally from:
  https://git.openembedded.org/openembedded-core/commit/?id=603e50f3db224a0e36a65decb9a98df41b9e22b3
  no longer makes any sense, remove it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c14dbe3d3c1abf5f95310162288f861bfd312900)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-boot_250.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_250.4.bb b/meta/recipes-core/systemd/systemd-boot_250.4.bb
index 23a64bf30d..b67706b731 100644
--- a/meta/recipes-core/systemd/systemd-boot_250.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_250.4.bb
@@ -19,7 +19,6 @@ objcopy = ${@meson_array('OBJCOPY', d)}
 EOF
 }
 
-# need to use ${HOST_PREFIX} here, otherwise ld.bfd could be used from HOSTTOOLS_NONFATAL
 EFI_LD = "bfd"
 
 EXTRA_OEMESON += "-Defi=true \
-- 
2.25.1


