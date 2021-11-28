Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6659C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:11 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.53239.1638136750789950229
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XSs4B5Wq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so12243375pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wcLQRVNr4lCfK60C3DKbmcY515+NHq4CFrXjra78MtU=;
        b=XSs4B5Wq8074jA32dIFVMyvUrztQSyJYLxTP00+hKtuCMNsvRF1VZgrM2cjviep7wv
         kOsR6GQSFw2rEF6lP8qqwn8zXxGSjYu7756r4OzvV/ctnWaEQus+e+vTQKQAg2W1Xx3B
         PJjsKaL4PRI/IDdXsPcBmB1Q4aKWswoo5xNTD14TitNtF8jwsqBr4S3NsXB4KzmcYOC7
         isEaf7WEmEwzgLaCBFoIoByawEJ+Vukf0kyuC2JtuH8j1tG3Gi0mbGSJsDdIMX5WiWLJ
         XPFOUd78sY71GtcadqKDg0wlp3SIQk9EW0E0ZwsEunyxdXsxOOQ0IA3iRztvlZ37tlSq
         iMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wcLQRVNr4lCfK60C3DKbmcY515+NHq4CFrXjra78MtU=;
        b=t6EHcWQdzvw95Z8BlFEgnF3+Y2q2760JrcoQSBklqgI+H7uxhcODEZMZ0tJRH6Sgoq
         Fnc3Z89FRDG9LrsT/rmLaSG0MYdy4nke7yiZZCObmTo7QqTIKHMuAad70mWR9BdiJfCx
         ZQVKt5u3hCsTYiSrBdBM9K6PQl73FbwJ0qhDqIyMopUsCKs7lt5x9DMxChub3Ga10/qq
         9Ghslr7WsHZ9nQBPIDNSX5oGZ0Ye5TZDTZDhVz4aZi7QKKXJTbm2eRXJweRChRZBQm2k
         esnO7U0h4ZYF7k+xrRxTvoJea0XqcsvgP+SKQJ8QJhiE60/bifdid1ThlzJ8Ap0HGGb0
         Jg+Q==
X-Gm-Message-State: AOAM532r/VhytoxrhCgwGaXTzzks8gPTmUsRriK77GJRFqOCZ10UoeU6
	oZ7Mk4LKZWrOmo0mWmO6zsam3Zr8DPpb/m6q62M=
X-Google-Smtp-Source: 
 ABdhPJyCj2M64xhz2KVeLSLEWjCv7P8+iTei6E+En4+z+ZBvRsgqHPodk1k4C5vxTcT0EncFS92xyg==
X-Received: by 2002:a17:902:7e48:b0:142:728b:e475 with SMTP id
 a8-20020a1709027e4800b00142728be475mr54281861pln.15.1638136749700;
        Sun, 28 Nov 2021 13:59:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/42] libxml2: submit patch upstream
Date: Sun, 28 Nov 2021 11:57:32 -1000
Message-Id: 
 <0c6e1152c924b1d38a82a323d5da871e607635ce.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158902

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62d0992ae831caa4b6bda5a300db5e8068480a7b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2/runtest.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index c7a90cd3dc..a89dac8b75 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -7,7 +7,7 @@ Print a standard result line for each test.
 
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/137]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-- 
2.25.1


