Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E87C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:37 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.55958.1722258814542993130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L8n9NT3N;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70ef732ff95so145344b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258814; x=1722863614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBvhNGD2joEcZKe9AaHw8BYK1nXPP/HA3XWfGWopguA=;
        b=L8n9NT3NVRe5yjMnTWtUfA5lOLMs4Xfx4ovjl8bCDOMfVeY4VueyBhbbGI6VUYLxAs
         U4UWowToMM+gGpUmFynjqCT3gqUBzo1Eqvbs7GgAWQhyqSvr/c6gZeOQQKrDB6HZhmUF
         EVAYk+DTQWJ2/ldTkBQjxYEICTsZ+hmqRRAQClFX5lQG7jsR1RT6MiM3VhszPYh3tQoJ
         t15AdKFbYpMKvIV7geIQsFQB9XKbe4uKuv1huDiteE1ntJ+0SI+QBapN92h4/MOZvq0+
         Wh+ZgniTtoTSZmJqvKuyPtTj5Qcv8MK5qDE+nrG6IfotS31O84O8pjzbuUpHEZskdRHz
         dJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258814; x=1722863614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBvhNGD2joEcZKe9AaHw8BYK1nXPP/HA3XWfGWopguA=;
        b=UbbJ7etzal3Ts6MpoKps/kOh6uoXFyBPB+PesIEGDMGaeLR3gFMzlHdaS7JiGK7WXl
         6L0sEkolPKXh1k6B6g/cwjTFky232UKStLYtp1jgE3MfgWLOhwnD2kK+19s/tXBQVanH
         NC9ez2OZ8KCm3viYuD5FE04LHJpyYetRpElZaVhl3j2tC7G9d7yccxRipebNxWvMZJeb
         8NKNzZqLASrqCAZdZvCx8JKQrvXY2gSq4Qfc60o3PGqV6gmbwX8LPkmnxN1U+JARd6en
         itIJg6T591mK5zdzMDNcP2Xn1XSLAR9lwqYgf0eYKe087TxK9I19iXVjMrhjQ2Nu20N9
         qHBg==
X-Gm-Message-State: AOJu0YzrVENNW2S1Qegs/5VljHtJNgdG+UY/o004ltWmqicGd71mUtk+
	bkWsLWozAJBVR9dklGB82lUws5pNrTgExHeBu/zf0z3Okl0tHc1MkqgbiX84rKLMnldVhCh8aVw
	Q2ewU/Q==
X-Google-Smtp-Source: AGHT+IHZpQJ60lfBdvwP94E1WWUxYc/80alvVXrMs54yPss3CpLaCdyvF9jwHuyHTCSbE3KgcPdy8g==
X-Received: by 2002:a05:6a21:3406:b0:1c2:93eb:c178 with SMTP id adf61e73a8af0-1c4a14ef873mr5603768637.51.1722258813684;
        Mon, 29 Jul 2024 06:13:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/37] glslang: mark 0001-generate-glslang-pkg-config.patch as Inappropriate
Date: Mon, 29 Jul 2024 06:12:37 -0700
Message-Id: <bdd67f045e1dd5e2b862cc364e42278f60362c9a.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202641

From: Alexander Kanavin <alex@linutronix.de>

Issue is already being independently fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e65af6571ad49d914c788b73f678e3565faac69e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 316a57fa4a..337a999bfa 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] generate glslang pkg-config
 
 Based on https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-compatibility.patch
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [independently developed patch submitted at https://github.com/KhronosGroup/glslang/pull/3371]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
-- 
2.34.1


