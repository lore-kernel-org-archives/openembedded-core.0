Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19063C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.22424.1638602022703047601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WsChN1AV;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id u17so3212294wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+u7PNLVTiPerzMNUDP25iuNbQhgRkSKleH0OpPKaYI=;
        b=WsChN1AVDIGb2pfhMzLwZUeJGne8NP4P35EfeII5oFqiwN4JkZLVz7SDzwoCJAFvf9
         L8fOGEfjzwV2dsSbhSYbDbX22bfgyQeBPXnRwQVG8/cngfxPJPCan0GtRx0Yv8J0UA/n
         FTfTv/b+IncfqMIzNn3BUfev8nRD9Ijv4KrsNBbhtcLya7DrswHD4iZLRSmDXLxvDa52
         PGOndEIENcrJsk4cKtuNQ6hVqTV/vXMhMkDOE/iUfBj2mRz4HFdPSE0Yy20tbk1ps8QE
         q9UJygd9x7/USbYf9YLxR2LLCja44T79s06R20NMKCotGAGJfe7p+i/FGAhHhCL0g0hQ
         wkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+u7PNLVTiPerzMNUDP25iuNbQhgRkSKleH0OpPKaYI=;
        b=dlxGCy7C5lePI+SNof+RIoEaZCupWcWOVvYVGZcQTq0beDWbMO3p+1+CLxEJVGjBkE
         BA7ffzni4Wj3sUfBYhVpgDjpx33tDNDj9C+rsqDsxT9R3i5wnvLgrazIIsnGMMb7y7Sr
         zRjY+/O/faTbsP9g17Bhox+vpFxqNGBd4Q0c/lq4oX5imSyxlcyqqx1Df6jOeSfKKoCo
         p6ccib+vQgAfXJ7BndA5oDJR9KhfvTSfG8WjbbIvqntluthjotmXDKkcvO6Gm4PBkuZM
         sx6NvaeSnx2ZFaoZ945/UzYNLfsa8I44gdsavHbVTiITbkCD/rVjs+CE8DQlM22PqAgJ
         jqNA==
X-Gm-Message-State: AOAM533rKpjMI+T3Mo/YrQg3UkF/zEtX0MHKSgjo7o4SvVdtX0h677Ya
	e9W7SbesBLmjEREtE+VeXVEmduDDTukZ9g==
X-Google-Smtp-Source: 
 ABdhPJxhe3yrwU1YL24lv0Mnsyfi5m5sO7AgupZeLcozzIMyirc18VMlai+px63CncblFNUYdSdPxg==
X-Received: by 2002:adf:a48e:: with SMTP id
 g14mr27100658wrb.474.1638602021340;
        Fri, 03 Dec 2021 23:13:41 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/26] systemtap: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:18 +0100
Message-Id: <20211204071323.2480163-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159168

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../systemtap/0001-staprun-address-ncurses-6.3-failures.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
index b53e107d84..1decf21593 100644
--- a/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-staprun-address-ncurses-6.3-failures.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 17:59:24 +0200
 Subject: [PATCH] staprun: address ncurses 6.3 failures
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to smakarov@redhat.com,systemtap@sourceware.org]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  staprun/monitor.c | 24 ++++++++++++------------
-- 
2.20.1


