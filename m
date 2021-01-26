Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.12890.1611672210423264437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ySGEJvTn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id n10so11547151pgl.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u0t8HaTna1WwrgP/fG22P4OogWlj2MjEz81xBgM1hk0=;
        b=ySGEJvTn8J55YD0wvw1eeZ3QnrThI/wXrzZY3lSI/0yi6pm3UZJUxUK7BcMrj0X9WF
         eKhaQfRI+f5tTBPEfQi2QhdUbcdiqYFLCvBC7Wd0rNba3gN1Mscq3mysuJfOPjke4iHv
         DiKFLvlroie12/t9b1o5BoAy1rOBSjdrEW1QYdQ7/eGaXczTqd5lw4MUsKTpBXMUvGM1
         BHJbUs/mh842Z8n9r7zP8EdLmjvflJGsYH5AbFjoTkazUIf4sUIc66O+toXLyr3LDu3n
         3M692aClyIv/gC4EEMGYWoJdixUj8TQlQE8q4PK0wnEe4tb2t0GzQwbdOx/UcjQlCRL6
         sSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u0t8HaTna1WwrgP/fG22P4OogWlj2MjEz81xBgM1hk0=;
        b=COBzpmEDdL2yKafSX+M4/4eSvPNO6onu+DS8Ndisgtn1FoU7ukUbx9qccBmBuDVCXD
         aJ7bB5KWVHDTqIFKnBeDkDs60avrAosR/ptaskVXwHAhXsDbp2e/L0vduTyTTY2AvKC/
         KkGPREivHipLFJRC98N+iItO8/X5f56WQhPlaHKbylwmwxgf8U3tc2Ie2pW7tlIRipo1
         w73K+ByfkGPxfHUenoiBpef/FJLcWmpEe7D9dPaUORaHuWR6LsFNtAwq+exx4TAYyRxm
         4xFemIjAtc3rFL4RGB7wUHOW5N6fy2gdVvsHtw4PUq6IWojkelFwr2BHok/H6jaC0w5T
         NjnA==
X-Gm-Message-State: AOAM530dUvOPA4bloXSMRceIdCN8fdptlcc1QuFM7La5yUDP/n3jP8V0
	SrR8YGjVOWxgx1gumrT6ta/XsjObicwS+Kx5dDk=
X-Google-Smtp-Source: ABdhPJwezI4KODRcHmGmkXl8r6fY5IF+jjRdKGECFgNGQT62hB7O5dBdDmdhljOIk8PdoRNz9xModg==
X-Received: by 2002:a63:455a:: with SMTP id u26mr5850301pgk.215.1611672209586;
        Tue, 26 Jan 2021 06:43:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 28/46] pseudo: Update to print PSEUDO_LOGFILE in abort message on path mismatches
Date: Tue, 26 Jan 2021 04:41:39 -1000
Message-Id: <f6f197a88c0d2f13c54f9bbfccdf72c7599b66e5.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9259d684415e3e7923de74359a4ed3487e0e9da7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 50933c4bc1..a9f7aa966a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch \
            "
 
-SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
+SRCREV = "69f205c41902e17933b81b1450636848e8da2126"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

