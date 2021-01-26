Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13163.1611672145640320497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zf69gdT6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id 31so9861240plb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o5qXktwHUDMIpkJtEIEve8h6xBtrvxk1cxrNs5eDe5E=;
        b=zf69gdT6u33q6C1Nksa55R7l/FHrVLY6GBXXJTtsNqw2gbFTIYDdJL72ATL+wr0UnG
         BVD921H/1WDpswonU+1y+l8qfUiByv4GnhpPG0vbbWbcNwQPijRPKVOJWFfczF24QodD
         M6Ql4LpwmBlQOl/bFqP75/hmytQ1MLRKINu5IO5jv6EWXUQ0cBWwLbRM1amGurMAsZxn
         nAvWOBCOvt1IEirRXS8T3Yy169SifJvETs/Pwz5VFbGWvvIKlVHHNuFoKog6Cjm/BmXg
         l/qsKaudzjiper+OSST+L55eWD4Jkd4WMqFutnh1posftskht/i5DshAYFxxQYTBJbj4
         7pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o5qXktwHUDMIpkJtEIEve8h6xBtrvxk1cxrNs5eDe5E=;
        b=M3G5bzFGxoUpMmNyTn8EelQHFfq/J9NcNlT2+0Vf97B19qW2IWPC476qbQocUMcCxa
         qf4Zz1N+k3oBjIlDpdjen2gxohQ7WyM5dqbY/NmY9t5Ew0Banc+ImQx28HCwqvQKGLqr
         blG25YQur/yODjGU8bqdI6QfZpae+FMvD0Bd4NRhXRG0E54USPO63q62cE38HfRovpzn
         LowxR0kF9xFcYkHAgI5MsliqjOHlAs2RiEMamtCEfeKuzNqWXjMY9hynda5Nyk99Phb5
         n8WQHzN3WLbJXI64+aUdaYYpJt4paP+WZHaOuHhf7k6zYvRnXMSPKUYHfNAhLRKcbQH8
         scpA==
X-Gm-Message-State: AOAM533nSB9comQ4BHU5X+z3d8s3cTLATpS9E9toRjccDBFcwW26jXaS
	bxNrwWdV9rDa84znVfiTXFPqoI1w6mcEufz6AYI=
X-Google-Smtp-Source: ABdhPJyWiWIQVKaNRDqxwRCfT36vMkMCD6lAzqKUUvonpGyl87j99cqRXmzTbPWQPB2Bq59lTjYHig==
X-Received: by 2002:a17:90b:3507:: with SMTP id ls7mr97207pjb.208.1611672144716;
        Tue, 26 Jan 2021 06:42:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 04/46] pseudo: fix renaming to self
Date: Tue, 26 Jan 2021 04:41:15 -1000
Message-Id: <158e8078b8c50fa6f6f82bd51d0a3567ab807103.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Pseudo tests for an item being renamed to itself only after
information about it has been deleted.  Move the test to before
we change the database.

Note that pseudo does not support renameat2(), but neither does
glibc.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b3d109f42385ad1cf1f297a6c06ea7eb6509f26)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9a22304bba..3b623d8bd7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
+SRCREV = "d6b1b13c268d7246f0288d32d6b5eccc658cff4e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

