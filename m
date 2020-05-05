Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.1492.1588648807920440497
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lFk3V5ie;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id p25so205832pfn.11
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3cZEPvAthgsXkxv+xFlAA9AmEOvCFkg6lFVoMqwjnDM=;
        b=lFk3V5ien7UAUoc83nHH80WUacRorAu9QI9LWL6bshwPDw6UMViJB3Ia/RZST10+Ib
         jXqyVA97s8/U2kUrcxncx1Hkglr0mO/5A0hSRcdTLyC/vWBE9fTAMYncGdD942sBuJW1
         p0Bl8c2g9dJD83oUl+H6FaRhYWvpOSVGHFshV11LIM3V7jOBxMZM8Dw2BZSHmJT3i+II
         Cx4x5UhJd44qtgvyVle1hUb7MeXEODaNHg8Wq81ji127KkSM/TWc31Cr4FPujmJOD/A3
         GMFSdb1MkeHL7EVVqwuZfPK1/qZD3AWxu7FAlarojat5ferk2ym9uJq9iRIHszJHY1DY
         MiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3cZEPvAthgsXkxv+xFlAA9AmEOvCFkg6lFVoMqwjnDM=;
        b=GYOiMxl4r7N2yFqCAZ2254LaF+sF+lbVU367bEazOYSrzNAJ9BYnpXz2TsAYHjH9vq
         KhZGjCEqNOf0CeK50qkRNBXBbNh9/K0tb/8KN9NI9utLZXk9JY1L82+OvExshluE+bri
         D9JFxHStK7+gnGl5aovlod6qu91NXFzUupX4VpPoHC2YfX9DxtD7kG7tB0zxCNttDPLi
         Ulaa/0ZSpkJMUtw8l1Vxgfcr/DhBDG079nXesgGXQo8WuhQubMQl7/+yDFW9PnkvjwtW
         V88P1xQ+mxUvkRdwYMnaYmGbgceCvC4NgIK6/XPBKEopBPW0Qfl22R9EIuLfG0vJOjv6
         wdBQ==
X-Gm-Message-State: AGi0PubJCPQoVkHnHoxUO4+0oNKNBxWNyh8r4lehl1NIv+K0EmCSLlfp
	KS2F9UO/GBwXPuzj40ZAchbpAnYDjpvb1A==
X-Google-Smtp-Source: APiQypIZg7/IBTFYBAAfy711AP8xNRwYwRHCtk+V0Vfu8wdjOr7Ts+bS36kpGKDBqr1qm+Qcp5RIZw==
X-Received: by 2002:aa7:9832:: with SMTP id q18mr1160049pfl.179.1588648806952;
        Mon, 04 May 2020 20:20:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/28] packagegroup-go-sdk-target: Enable on rv64
Date: Mon,  4 May 2020 17:18:59 -1000
Message-Id: <284060ed28862f287fde628cc42742aafa5baef1.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

RISCV64 now supports golang (starting dunfell), therefore limit
disabling to rv32 only.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 5afb490aac..86c71900ec 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -8,4 +8,4 @@ RDEPENDS_${PN} = " \
     go-runtime-staticdev \
 "
 
-COMPATIBLE_HOST = "^(?!riscv64).*"
+COMPATIBLE_HOST = "^(?!riscv32).*"
-- 
2.17.1

