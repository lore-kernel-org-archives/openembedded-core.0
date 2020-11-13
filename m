Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.5298.1605279172185011615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZhctE0lI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y7so7778132pfq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=lwApBvzP4nIgbqi+4A6SHz+2KEJ3U0acMmChuX98cRM=;
        b=ZhctE0lIvX0fysfTHIfUFHNlXAaRKF+bew5ya03FRr9XB7VWVON/2pNqTpGx+vvmzO
         7olAJFRwo+TlVwcGnFusSGQbXL0D+w+BV6qUT9Vd7TOsc0xC4spswHYEQV8ysaqRhqbb
         fGacf8M7bSfPzdRxTr108LdUNowbtwfZsq4C69NO1icFFQSIYPtTYI/IYTIBLN5DkFCu
         nKcKAVTd/Z37BuEvW2qblvOmSaCq5z924lPVupsMf7NgkVDRMdDL0mNXwKubN8ob59au
         OUqrhW8cmgtxizcmSxLY2sW6ccMlZZ8wpvRaMIduA0AdFDdmudfyEszNKOq4uhlAO2P1
         OyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=lwApBvzP4nIgbqi+4A6SHz+2KEJ3U0acMmChuX98cRM=;
        b=dukm4mcrF6VdX+nUO30COhjj1v8OcJ8ACeEjR0wDHJbjbBIhB/W+prV83PPK/0Huux
         PLNrqKIspMcfGSefT2VBm17sC5kl23tAsg0K84f/TAhRWyKWRP3qY5xrCvrDQ2K4HsyR
         dwBE9JoW6jenK2vOVyr2dEGuCzLtDA0yOiPma15xMMJiP/py+YMJkvCcjSZDWr4Pq/Ke
         J5iTF4awttfvvmj0ZlejdjlBIGktFvtPjzbEcwtADbWcW1hwjmNvKTZe8zZqfNTcrRGO
         hLhcuLmX91Y+wRgSZ3h/7Ie1PqCsG5UDOJcLdvFDQ8pTdNjLkCoqy+9ZrV3bg6nFVbvi
         mZHw==
X-Gm-Message-State: AOAM532FurrWARPYfFx0WmTLBj/Q3axa1/iLnkKmE0oxDdhnqUm/a6lS
	ZhxsWh9kY6RBIW+vuSS4lXf9EYquh66qLOKF
X-Google-Smtp-Source: ABdhPJwJn+vq8C/yal803FI5YsTfWWQE6mjcCEO5aaP/9+fc3WquHddPvb7j/oVhHY0LqNii6fM8nQ==
X-Received: by 2002:a17:90a:4742:: with SMTP id y2mr3469969pjg.228.1605279171286;
        Fri, 13 Nov 2020 06:52:51 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/18] syslinux: add link to upstream discussion in patch
Date: Fri, 13 Nov 2020 04:52:10 -1000
Message-Id: <d3fa8eb74252c1ccaeac761b5ff3d0e9255c5070.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfc2b114e9d62f0eee04129009a24a8edb2a8dd1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
index 3ab7875274..47a8dac10e 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
@@ -10,7 +10,7 @@ Subject: [PATCH 1/9] linux/syslinux: support ext2/3/4 device
 * The ext2/3/4 support doesn't require root privileges since it doesn't need
   mount (but write permission is required).
 
-Upstream-Status: Submitted
+Upstream-Status: Submitted [https://www.syslinux.org/archives/2015-January/023039.html]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
-- 
2.17.1

