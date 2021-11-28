Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6869C433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:08 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.53232.1638136748265260446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hurJPkI6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 200so13895747pga.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fsE3tqRLwpxtbka00/e1ehpP4Uf/vqyy8T/FukHgZEE=;
        b=hurJPkI6wc+SLDtp85WNQoF6DdyA+XnJ9/YAeNnjtLqNjYYRlNRpZDX718D/9D52ol
         VVWa4wgWhy+0clOoTkgl1sPGSEEaOo3RDaOAecRFZcZJLb+CCOBAAC8L6JgB3NVtsurQ
         WAjzkzs7/jtUSOzxMnKrpXw380qAQ+jvZJO+2rAaR5RFnnWWGafccsR/CF8+jZzJ1+Jf
         RKdQcekumiViVGQsFkoNsqxq2y3NSlwawuKeSWtbci23SIBP1vBi5Y3ODic5+Pzyd9oq
         kWxAxBEnUU+UAqLQ6jehN5kZsUcvYizic2WPjCspVdxbBdoNsiOgSPFe5WJlvYxTTaUj
         BNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fsE3tqRLwpxtbka00/e1ehpP4Uf/vqyy8T/FukHgZEE=;
        b=Zv6HNMtmTlyn6gby4YX48pWNQbnvOW+MB5uSTlVoyfVQhwmXR9lNnEgT85549hMXgS
         fAFWin1p/A4HkLs26GywSFHJ8VywwSuzyxMv4B7LfOCSmn/mh+WjDPvAzJJtJagw0lK2
         TGDugZdCoU+kD2PAwtQoOTeszgBBwqIf+5OqGZtLnU30WCKeehv6+emnwYcMq5IyngXC
         kMR81ns1HWxaKB5DuQ3ZiGeh98cbaQv7eQ+3vJRdTZr5pHUf+/wEtWrCfmdZBBXm8Oxc
         +lOwH/kImQ8ILrrMdKCKivdDAOjx5iNGACP5z4vubcS9LiYotqivl7Bnxz93Hv8vVZvf
         Fsug==
X-Gm-Message-State: AOAM5339hRjKBf88NxwABgpaDm8jTqGMgl0dr5Ill6j+cD+PPiHHhurq
	bkhXLh2ezdcKjLe58Vx3rp43i8UrUPYF4BtXT30=
X-Google-Smtp-Source: 
 ABdhPJxoYPoSKT69DjXu7eD1r+3LGO1bZgz5bZJ+v3euoTTxp3nZxG8ymSK1yOb9WiM6JO/wYl/TcA==
X-Received: by 2002:a05:6a00:14ce:b0:49f:dc1c:a0fb with SMTP id
 w14-20020a056a0014ce00b0049fdc1ca0fbmr35883109pfu.56.1638136747173;
        Sun, 28 Nov 2021 13:59:07 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/42] curl: submit patch upstream
Date: Sun, 28 Nov 2021 11:57:31 -1000
Message-Id: 
 <457deeada8894ff11728b5be20a659cfa0acdde2.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158901

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b1dba1a8e56f95bb3ab44130da293795975b67d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/0001-replace-krb5-config-with-pkg-config.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
index a7db1b3c9e..330c6b67c3 100644
--- a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
+++ b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
@@ -3,7 +3,7 @@ From: Roy Li <rongqing.li@windriver.com>
 Date: Tue, 26 Apr 2016 13:13:01 +0800
 Subject: [PATCH] replace krb5-config with pkg-config
 
-Upstream-Status:  Pending
+Upstream-Status: Accepted [https://github.com/curl/curl/pull/7916]
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
-- 
2.25.1


