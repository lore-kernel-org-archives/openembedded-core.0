Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D15D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 10:39:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3669.1768905534260037528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 02:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f2hYPDJR;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47edffe5540so45084835e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 02:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768905532; x=1769510332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mOozIG5qiq1k6XEZayL8daL4h9+HGjHyZGW8h0BHMA=;
        b=f2hYPDJRA6vI/CR+HIfW9h/2A/EnebjWPKjsI2vDf3pPuvF4ZHoXfQJ7FgewejOhp8
         EbBPE91AAI590EaT4IAUuSw2h+wYSmUs9Z0OFnMroBiK95wEX5H3aEEtQpgL7PC0mdGy
         5UDj21XbzijvNP1kj7yg6d1hGgFapuv4MkmnOepOS8y96pDU7IA7Pi77fakytoxOXbVM
         eQDNc75aXVKE7CVolbs/2f5w7kInGtIeNgHTf5hWj3qs10E/EbITsyqhlsd0HFA0jcg1
         pIptn85asHXH4NRwTOmKliJxnopEZbvAzAld06lBsqkD0+82XF4AA4dqMoqZ2NqrPRUn
         YuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905532; x=1769510332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mOozIG5qiq1k6XEZayL8daL4h9+HGjHyZGW8h0BHMA=;
        b=voQaT0FSat43bv7YHd40napBn0Dr0/5441MvwMDQ3XHBzEeUYkDQMA9Uqb09xnV7YS
         WStRvV1NNRQZEeOJF20nDCgSgbRwNlTTxetql9cKEzUYYPLhkq4fwq46Nwo/6kq5Da7c
         r4AH1y3yerJE9TVjflu5aY5YhBq44MitDmJU3X1bNZ7oPtmeCs+QIV4L/DdE9E2lAYOY
         dpJ/QoxAZSZc3aMPtJqx0X0EJ2AA1QMARUnymRPiEraaUmjLOcwRcSZY06ojTycVn7wW
         xnBS6Umo7Bojl18f3OZo6dSEL5+FN//s27HZ28Pf9OUu6r53wOBRGV0u5APU9eLKrWfv
         6+Jg==
X-Gm-Message-State: AOJu0Yw1Hqi1zC7oVYE22IHjm2ibisFXdu/oxSFHD5Q5+zmzLWzM4Xv2
	00wf/aHOAoC5Wg7BW2P/nQnAY/3HtYyUVJCSQedj6ECSV6cpHr8KI4g66s8K7wro
X-Gm-Gg: AY/fxX6sHYsRnxF7ZRquZ12rlL3YCW/5T5WLZdpRIFl+8tuMPfbmXlLD6mewTGGH02Y
	KZKBwP8HlY+pnm1HLzQCK661GqCu3pbzm1Cv+C/EzDAnzG9KwMZlPDTEGi9ElE6FBKKkJNEh4FR
	jFf9Lmlo0Rv9vQAfiGxn56g4VM5LJAnKTtM+BGkRZ8D1sCqm3X5V+uUA6c6BWz1b94y5xJHgog/
	/sg1dz5OSz8ChUhtD6TZu7ypcydivb7b3R4lPHToB0T/gtoNtMQXthwN5JlqC1K8sQAmwQA0ATu
	gIrW/l5tk1bay1gRh7qu6fUMWI2k2mrafjsVMH4LRRCKcmDs3QzsUVowJwaQjhk66oXYMZ3g6HO
	1eLTWqSw/RWS2HKrEef0ADl+JZ5YPrjMuHNv2U44/vs1N19dYDfnr73lg+t95WDxbEPeJx9SXqy
	Hlx2MPz1JG0iY0
X-Received: by 2002:a05:600c:4ecd:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-4803e7f3c81mr17053525e9.29.1768905532003;
        Tue, 20 Jan 2026 02:38:52 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c1b2sm236881025e9.3.2026.01.20.02.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:38:51 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH] time64: Use consistent TIME defines
Date: Tue, 20 Jan 2026 10:38:34 +0000
Message-ID: <20260120103834.1780598-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229658

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Pipewire crashes when other dependent libraries are built with the
different TIME and FILE_OFFSET defines. pw-v4l2/libcamera will most
likely not work with 32-bits that have 64-bit time but that has to be
fixed in the respective projects.

Related bug report:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/5055

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
---
 meta/conf/distro/include/time64.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 24a81c83f1..3ed0a4253d 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -21,10 +21,6 @@ TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLI
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
-# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
-# both 32 and 64 bit file APIs.  But it does not handle the time side?
-# Needs further investigation
-GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
 # Undefines _FILE_OFFSET_BITS on purpose in
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""

