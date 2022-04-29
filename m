Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3C8C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:39 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.11931.1651248152644793805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AAV5mNaC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id a11so7292673pff.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BQ/cM1HFGI7JNVX0/+wWGBQCAEKgX0dQEI83N2C8OK8=;
        b=AAV5mNaCImt7N2e9WifEGNAHpPFcG5/3OWV6VA4LIaHDg6/RWinRPQSB/QSspi5Fc2
         f/RfVgYDX5yAik6mjcbjCk22TQM7Fwi0TP6tlhydt99kW6PtSpA5VTHVtkI/DhusZGTc
         BCvodRW40fH/drabKax/yuIRIjsu5jQ734w3hdMuteEpDstNu+Ad14H2bCsn/DR0fRYy
         fjlztccoBXzBkw+Y6bc/utmnO+Yo8q4mRi+cSh4xW54h9Y9MBAaSsG7GJ1wCCds0iysO
         12AO+ELxyhWwQ/+nSpa3m/llQTdmuY4iDZcgP4Tz8e0zNZaxNYIE7sUjkvBZgAE9VLqG
         d9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BQ/cM1HFGI7JNVX0/+wWGBQCAEKgX0dQEI83N2C8OK8=;
        b=x/Cn/bLbiQNnEeuVLZ+IqJhR5YpZHiUhbnhFnwrDAfs/ySi7UEwnQqV2ufTsnQW7Pl
         sqcGIXOacn4CEj3FELQRdpamkHNSiloGro9NL+1znViPUv40eNyf5uRYWBXGTn5n7DO8
         tZkxOf8QEf/YeiQKJL2McpPnnZYm4fgCtMclM2W5QlaJij9Y3L9DL7aYIxP/Dq15kZK9
         oiNWJ1sCH309Nx2L0l3xgNAPmTBHYA4rIbDmwqpZ2+nvrzNuqY+MNGZCIvaVObHYv7tP
         nhhCWu7oLzTAzzbrwXqx5tUng5X2kbQWBpqOHlalHGjrikR3Ko8RTXJMNXYXm8iuObg9
         9QNw==
X-Gm-Message-State: AOAM533ksYWg22FtY5+gMJgtcUo0Ls3qsHCV4ME60YlOukF1jGUN53kn
	YozEB4n/AnJRO/7DS0KA6HPAbpu7C7eJ6tQ8joE=
X-Google-Smtp-Source: 
 ABdhPJy/qzNTUQtaX8uQtOj23MqHVrU8WLmvVZ+gdMrjwimh2GMpOaK64XvTjkWffwp+RCL7O/RI1w==
X-Received: by 2002:a63:dd54:0:b0:3a8:f358:5b3f with SMTP id
 g20-20020a63dd54000000b003a8f3585b3fmr65585pgj.97.1651248151127;
        Fri, 29 Apr 2022 09:02:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/34] base: Drop git intercept
Date: Fri, 29 Apr 2022 06:00:47 -1000
Message-Id: 
 <1b807a0ad9cf5acdbe7fce588544f7eb8cbbd80d.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165047

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're going to use the environment approach for solving this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0982977dc052ad4e65608f6853f930121d08837a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b54b56d624..3515720bf9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -367,7 +367,6 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
-PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
-- 
2.25.1


