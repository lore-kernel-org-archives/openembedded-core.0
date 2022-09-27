Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89442C6FA90
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:25 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.14278.1664301260604376837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TAeRtcfj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so10809688pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=7PkWI7C33xEce2QnPyJGxxMiA/mvKp0m2o0Mhmk68g4=;
        b=TAeRtcfjo3PW+q0hhTYuL5ISP5uEv5j0TSeN9MN8xIqaEVHgCvoA9vKUtdQOZLe7ci
         e9l6cgiZGvypgqUmk9jDx2YOdbilKd34jiZeg7SYd39C4cnu7BpeDGy81V5ZqSu2tfkK
         xjqZnjPEeHNK50li9M340R/ODyiDJ5hNon1/bQ2JNfV+zYMOyG++CF1/IWoHb3UG1fk8
         2EM/L/TKDdH1izCzBxzWyOjYC6fCyjlJZ6csMfV84antjYizYLD9DPXzKlXmrHbw8uEY
         WD0WvvFadRTLLJBoM1xGR69QnlWR01/1jaTCwbZqg80HyCob2fx4AdfiqrtlZEl7IOGo
         X08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7PkWI7C33xEce2QnPyJGxxMiA/mvKp0m2o0Mhmk68g4=;
        b=Vpg3ksrapfbo7Q2UcclL1Fk4HsWMqypk9g8yOM4NvglEIjiotzdwjpim9FwPSmYE4y
         FoBtiZZna/R8rqL9IzO2A95Z9AmERsL0rwALlk9041gGDvf2PepTEsEpPMYraX7dG9L4
         fNxWBrzWBXLzcZ1m68UWifF6b/a0o/mhLmsJm350PM7F3pe4hTIdGY+1I0z0GJnffh0X
         4QjKBy6tGc+GrJYEG2Zk5W6DKF2KLavtK3D97lPGYBmQfXGVWK/Xou++10Fp5sW/gwsg
         aFaRUq5sX12RTYZTMQA3CCc+pg0S3eA3A5uVs4Y53v9kvy37cGjwyqZ6foCc4wJdpnxN
         cV7g==
X-Gm-Message-State: ACrzQf1LBDwhp/uLBJOtsTunOdm2XRAc/i6IT+BLrKElNt2CG6CDxAD2
	AZr/tbb1EyOSunimCz+/NzyqI5idThGDyUPx
X-Google-Smtp-Source: 
 AMsMyM5dpTtJ+T+HJdt0+lCJsQw3E0DmZEiSNEfOxP5S3LEVHDrK7tIF3oj2Y2sdhM6exgZUWcVxLw==
X-Received: by 2002:a17:90b:3510:b0:202:f18c:fdb6 with SMTP id
 ls16-20020a17090b351000b00202f18cfdb6mr5807987pjb.122.1664301259495;
        Tue, 27 Sep 2022 10:54:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] tzdata: Update from 2022b to 2022c
Date: Tue, 27 Sep 2022 07:53:56 -1000
Message-Id: 
 <efcb0b30244007545ab8b0231e003271dcd7fab2.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664301116.git.steve@sakoman.com>
References: <cover.1664301116.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171119

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ecf88d151f265e5efb8e1dde5aba3ee2a8b76d8d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2b956cf7c0..d032fed356 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022b"
+PV = "2022c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "bab20d943e59a3218435f48d868a4e552f18d6d7f3dd128660c5660c80b8a05f"
-SRC_URI[tzdata.sha256sum] = "f590eaf04a395245426c2be4fae71c143aea5cebc11088b7a0a5704461df397d"
+SRC_URI[tzcode.sha256sum] = "3e7ce1f3620cc0481907c7e074d69910793285bffe0ca331ef1a6d1ae3ea90cc"
+SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
 
-- 
2.25.1


