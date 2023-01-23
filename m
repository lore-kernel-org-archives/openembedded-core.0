Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FC4C54EED
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:26 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.33739.1674440540170678885
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oxcr/XIH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id s67so7956374pgs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WcwEuDcVSRp0+ES+TOGsCdoM9W2pwo69wqOnORfv+0=;
        b=oxcr/XIHIUg1HMeiokhNs4UDjHusvOXiHYD0GVQo5ufcVj1qA3qORQM5auq3fsJDUw
         pvII0+6VR3MMsaflfDB7Wh8m82VZucpqCA2sUSCChwGpSZT39Od5KOMeW6jFJrfFk94j
         63nS2ODnSkN+Yqzr72mKsgM2AGEfE93z+duVcobvZUglUa5LTqmOGMaqI68Zgq+OcUs1
         Lo6DKiPpoOuy/3S2h+x+Bg0jncJO9mUia37805WxdQNnpCFxd8Y81JtAWqR0+EivB/BS
         XKUJPDz/cVEbl8eMx2mgbfT3aazKLGzDpA9ccD07p6iB8z9xBxpr10y5gfNXLCFLyXCS
         PsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WcwEuDcVSRp0+ES+TOGsCdoM9W2pwo69wqOnORfv+0=;
        b=Ar2Ixus/L3NDXix/Git7s0kd3FoRwO/T5c3EQ2rCDR1r2dZ/oflqZC8VE6b56DYvuu
         /pIXy8/tgK0JuEijP67C8IwmhDS2ds5ZqgBCF64FivKMfNDMZhArFk43j9tt3Jb62QGC
         zm9PbcU1GS3thUcq2LLAvpQvlx6vgw4rino/w0CRG0a/shZPeXjGnWPMe9fQeXJWYDc7
         6h6d39kqfsP7PCqiFoE8H4b6CdD5RIX4KjoBsgol5M92Jlkn9nc9qxxVX2EtNFZIBsG0
         MFhotBhDy5o+oaCRk9WrZQiDpxmp8R4kLPtdBaQRW6klnwvCto4vk07AYrlHO6Sl/uGN
         aNcw==
X-Gm-Message-State: AFqh2kqKEcS0BMfsluRRgvthjd5FtFb6j5OwB/lS8gyU65/6ZBmc4dh7
	RHD4ZzBy384TX1z8PNq6azv+36UzNgowLHkGUcg=
X-Google-Smtp-Source: AMrXdXvAbgwX8eo9yNADJcDJOQjw0B835TGWFrCu3ACy3DUSKMDu3+cWctiri8BQSk8dIQuGZwEbRA==
X-Received: by 2002:aa7:8681:0:b0:58d:c7de:b32c with SMTP id d1-20020aa78681000000b0058dc7deb32cmr23274395pfo.30.1674440539259;
        Sun, 22 Jan 2023 18:22:19 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/32] vim: upgrade 9.0.0947 -> 9.0.1211
Date: Sun, 22 Jan 2023 16:21:12 -1000
Message-Id: <d4887e2e43e3d66e0f64299a8189b26d5aff31ef.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176282

From: Randy MacLeod <randy.macleod@windriver.com>

Includes fixes for:
   https://nvd.nist.gov/vuln/detail/CVE-2023-0049
   https://nvd.nist.gov/vuln/detail/CVE-2023-0051
   https://nvd.nist.gov/vuln/detail/CVE-2023-0054
   https://nvd.nist.gov/vuln/detail/CVE-2023-0288

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c51068c78d12ee02789a6dbecf5e7e91d141af5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d86841efaa..9bc6881fce 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0947"
-SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
+PV .= ".1211"
+SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


