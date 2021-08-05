Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web12.10484.1628177777178684056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ufTYU1cy;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.47, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f47.google.com with SMTP id y16-20020a4ad6500000b0290258a7ff4058so1416649oos.10
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NTKnPgTZC2PlJi82h6/TEbtsuWlioM3dcKFrVLAdyQM=;
        b=ufTYU1cyMth/85NBZe5ddmCKhZDIjkCAjF/+d1WDaPzdQF5CYPQTL7act0Ap4l/r3f
         hW0sP5SsCi3Jw04atm8jwgYXafRN9bjEffC90i7Bxki08YXjLQNZjrK+dJaPgmxgJb2n
         sEecRj1BJ7fGdMKbWXohpbloXD7AQTH1B+icqHgkGMIg5QGyA7x7EQscM9m7deZ7A3bH
         q8qFfFaOAPlp+rQeMiKeWenmcn0kghLtqOAwYsISd0+FZMTpOvpSrLxNbUCzOILYw86D
         G8RXP8TZNfA74NyVuXfkT4bGt5TfpRnre/8oZdn/dsKLTMizrssCzclHFNY4B3oAx/hf
         yRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NTKnPgTZC2PlJi82h6/TEbtsuWlioM3dcKFrVLAdyQM=;
        b=leba1SbBQS6EG/cuusXlflsZpiH9Bk1aB1IQAEoqiLXVrjbi5eyiL9qo3kOdGAGW1J
         3cF6fWmcKbkBg+i+2NXFSt4u0W2BO83OD1o/Fji6j3UauF65bRsvUqWDhRc8nLCO1QZQ
         YW/ndlTRLt5ibV+UlbTR8QYZibC7R5jsKfR1oNKi5mdUuZ2eY1wATzqWWvZBPko9pbY3
         3I8+TH0K1bWym+L4mn2sNKNYB4JzGW7asMgSzXBrkh8IRPDQqZttUpHcXls/LnZpD5c9
         XWuc4wBrcRJY2ie4/BI+d+PPAoCM89eusbVXSUaPQf6jRWF41xZAq7V/7vdBn14lf2QA
         TJkA==
X-Gm-Message-State: AOAM533x+iUAfF50ZFm+e+iCQsbDl0CjtXUlN6Qv0p/FBB0yEqt4qV55
	jriMKgtGJcagM7/Pf13b1fCArydiZG4Dz9mX
X-Google-Smtp-Source: ABdhPJyEMHsamEqLh66kh0Tn4R4vkbYpogQIjm+z8vleaqnVLd2oQIPO4fyGpI6cWkkPUWaHzdKSUw==
X-Received: by 2002:a4a:98b0:: with SMTP id a45mr3760799ooj.22.1628177776120;
        Thu, 05 Aug 2021 08:36:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/33] initramfs-framework/setup-live: fix shebang
Date: Thu,  5 Aug 2021 05:33:50 -1000
Message-Id: <c9271a5882965d783a88d4f97d03d9bb2bc93c7c.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71f1f6bc9402ee0fad82aaf0757fffb73da4b706)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/setup-live | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
index 4c79f41285..7e92f93322 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -1,4 +1,4 @@
-#/bin/sh
+#!/bin/sh
 # Copyright (C) 2011 O.S. Systems Software LTDA.
 # Licensed on MIT
 
-- 
2.25.1

