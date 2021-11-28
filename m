Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD04CC433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:45 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.52891.1638136785188244043
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hLbYMi6n;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id iq11so11009602pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xsFlCzS1BjMlP6vBqznRHsG2HjC2/RoOImR54kKKHh8=;
        b=hLbYMi6nMYu1Bsvbdkw6d51l4J9Bf9AMDfWlC+aRvfijVbwEq4tQR8hSNP+40G+I9E
         M+mgvMZZ1kU5W150VitpiK6ElU+XaVq4MOJ2yZWku7NJQWiPP0j7nKDv/uno9qJ2XOpi
         YoMcYB6fekAlNpQlfy9xDC533B45ONkaD5BJFa+6Gma2lsBmnRrWwkDDaIckjRrgLY/L
         gVb2mwOJzo7t+VRKPGO+aKwvsjyTRc3jN+3ZX3q1Ec5Gs+HdYNTtkbamuBN86y38Rl1A
         lG9/fHSH87MjxeGyv6VrGM7uTHzhmhK5ogjnJPLqBlZz5fvs4CPU6dv6RWT4CtTTmE8x
         QI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xsFlCzS1BjMlP6vBqznRHsG2HjC2/RoOImR54kKKHh8=;
        b=FPO6r35L9xo/lie7J+jZC0c5QIcTJ96BSKfociEWFHIF0AwabpHOqu9+ZbXKJo7a0h
         IHiQQaTwRQ6EclGZQQpxWcwILI56ORw9FKGz/lR44giUovOn8xeQaThX4q+nVa+jKx1M
         ikIdo9bhQ8+9hGI24gCW1PthVwxQUphLKboUFc/8P4oAZut4dno+CrC0Mg3gaBRy/RUm
         r9lS/mpSsD6/UVMNYM/gA4N/mb3P6b18ee4VdbunJa24K4Wt6AA/WY0tjPVZ6zqPCr/Q
         UMACFUEdRGvR9jgn5hqoVBXlYDU6CtacIoXG9usL6kcNfM7Wy0XvmqfeUr9hgafjclOD
         h2FQ==
X-Gm-Message-State: AOAM531iQNMU1xaI+z1dA4o1pHpT6CbsdAME52FR2fRbBQzxZdruThBa
	qWsQqy0YfNlPpMU2yiPzjNL2lVB9h4u6AGaaGsA=
X-Google-Smtp-Source: 
 ABdhPJzxywZoemOnosGkkTSiO+n9XYWz128fTyZVhR26GpOasJzov35Vo65CUdJ6teBfAcWecC7kQQ==
X-Received: by 2002:a17:90a:ec15:: with SMTP id
 l21mr33147218pjy.48.1638136783950;
        Sun, 28 Nov 2021 13:59:43 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/42] slang: mark patch as inappropriate for
 upstream submission
Date: Sun, 28 Nov 2021 11:57:46 -1000
Message-Id: 
 <0254470496931935e0671a31d439f025dc57cdfc.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158916

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a693275cbe710b140b0dca4e265fe812ad70a4e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/slang/slang/terminfo_fixes.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang/terminfo_fixes.patch b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
index 3e6d15aa79..3ca20a8cab 100644
--- a/meta/recipes-extended/slang/slang/terminfo_fixes.patch
+++ b/meta/recipes-extended/slang/slang/terminfo_fixes.patch
@@ -2,7 +2,9 @@ Do not use the JD_TERMCAP macro since we cannot get the terminfo from
 ncurses pkg-config, but fix the macro to not reference host directories.
 Also add src/test/Makefile.in so that we can use -ltermcap if we want to.
 
-Upstream-Status: Pending
+Upstream isn't going to take this, as it forces blank values and
+removes functionality without replacing it.
+Upstream-Status: Inappropriate [see above]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
-- 
2.25.1


