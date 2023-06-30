Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C45C0015E
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.3859.1688092183798387190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Pr5DAJR0;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-39e9d1bf835so948433b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092183; x=1690684183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFGpndMgDULFSbILf4kO8OGGvcYFkWZuUkO7xUUjnoA=;
        b=Pr5DAJR0S67mqTlQZ+lHykyO0uGvk3pnhgkF5XdmnWoGwJNk5iVeAMFLobW9lirz+w
         lAkrvdNvppsmMD836lNLXvZG1F2P8PfxSn7fazUDHST8gNSUJOZ8o3mCixAL6Dy2Y4Mv
         sJhN82C7kRKgKEW5YEQBTfGUqArbTEbd6hquMLrH1DjoRZmrk9gg7L9CL0KIRcArKLsy
         /StE6LXK4ZFSfw0eID7WtObRyuvy5e2UC4qoPlwIyGSpzUCRW1Is+w5xy21FtPFjj3jF
         1yxRiTFDml9UL4THEE1lZA0VZF6iO7fQlMkS7O6aSAlTzUQ1NB3Bw6ghfYbFtUcFUK49
         e4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092183; x=1690684183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFGpndMgDULFSbILf4kO8OGGvcYFkWZuUkO7xUUjnoA=;
        b=N6gZmzqYstNTJMX53DRqc0kXe7Hb9vImepzpqQhCHNUupfuqoas0Z/sAbJWDkfgsy9
         oDMjeBE4elX/XIkbmxMKuW4B4rOxol2jmBC1XfY+uBhn152b9yT5ny7+lY5ZLVZV2nNp
         eJrRBMiqlViRQQQ4LxFCgWMpRq89yEIgeYW+uL2TUaOpyuUIX7tA/U2z/ndJN2qkI6IP
         4P6VKLdNXJOHT7YGwpUznrS0vUnTdot5fc9Px/Svo7Tpm1cziLfoD508r/EivQWvrEq8
         9yre34RSzDNAv7MIidtVVvWBvC/3oQHnJJF7yvYNNziwP5NpC1FxlM9zLkf5481sTdWx
         y88A==
X-Gm-Message-State: AC+VfDxuIsfqDd5todirEB88eIGLgy3SIHw+sXv22fBswuZxCnMWJHlg
	H+wh6/p5ouflKXFJbJjqT8SEzDJSmuwf/5kewy2PTQ==
X-Google-Smtp-Source: ACHHUZ7/eriKX2oanu96SXLJNiVwHZIkRWSOulMUZQR/iUGTPBGbhqiJc6Y3iCxFosRek9UeUHVvmA==
X-Received: by 2002:a05:6808:8eb:b0:3a0:50c0:4a5d with SMTP id d11-20020a05680808eb00b003a050c04a5dmr1036673oic.56.1688092182812;
        Thu, 29 Jun 2023 19:29:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/30] qemu: a pending patch was submitted and accepted upstream
Date: Thu, 29 Jun 2023 16:28:55 -1000
Message-Id: <13c9eba31a848450b1502c1677536ce42576ed08.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183659

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f59df55d63a8841c834bbc488589209e7f23f803)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-tracetool-use-relative-paths-for-line-preprocessor-d.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
index 5ef1184e3c..36c537eee1 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
@@ -8,7 +8,7 @@ The event filename is an absolute path. Convert it to a relative path when
 writing '#line' directives, to preserve reproducibility of the generated
 output when different base paths are used.
 
-Upstream-Status: Pending
+Upstream-Status: Accepted [https://gitlab.com/qemu-project/qemu/-/commit/9d672e290475001fcecdcc9dc79ad088ff89d17f]
 
 ---
  scripts/tracetool/backend/ftrace.py | 4 +++-
-- 
2.34.1


