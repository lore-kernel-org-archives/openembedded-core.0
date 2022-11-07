Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4DAC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.112.1667835455134310911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2JBugVq3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id p21so11390020plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sd/zh/k22QUMfQuXp/q74POYxclWEQAkDGE8VfY1rE=;
        b=2JBugVq39jIk3ng4xLZZtB/+q1JaMXcBvalWz6RvCvRHk124gOkm2+JoKk3Nj/2l5/
         W3MevfegoN/7MFU7i0MzN5DSMapKrTsyelcp/tr4Wwq1vMlt4fROQqaiM5NzkT2ajs1u
         I7FsrtG9ajx1HZEl80QTOCg3tHfjsscqdKaNs5YPt9E6Zc5kYNcYYcs5QVT+Nv78gtut
         dg71QVAMcpKjy2yu2CcJjkHJ/VXTcXGVUM83pMbA9WDBEE9IusroBsZit1ENfQWtQfyd
         Wdmism5Vrfia8IVQpNjPqo59mxbN8Fo0uGCr24KjnaZz07cy5uf4X7c8rDWebMActGG8
         mCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sd/zh/k22QUMfQuXp/q74POYxclWEQAkDGE8VfY1rE=;
        b=qiQ4O27ST2tuFhzvi2EFWAJxxporet/l+MOEYOLhzX+PoTo8tYhXNAr/LYdRWM7C53
         GRpo8PqxFcbWCg2/jhR3GtQ4AVw2KYlDl1DI9yvP1UcyzS+YpjN/x4B4BsKPiimSftdk
         q84MRH5Sk1oNaOH4lslxPs0UBFX/Jm40EEEnKkMjfe4GeGx9ouAxKGXf7c7N3OYO95Ve
         av48yPbYi+W1dXl+/zng2GvCNFZRq1NDki8QoKryTMMwoxdINiDDpK3oF3C+7RuNdcS9
         jOhPF3gT+Sk5cm54uudT/V4G6vjbwwp/3zxjlv2p2U7xZPkyxUY++ovMRdP1/2p9fWlL
         TX/g==
X-Gm-Message-State: ACrzQf2GNnF0GQWe1MrI6QpDuZEF92OC8M6QiLsMWuW8rLzwBIxm2II0
	u83hr1HkydFKOyXhwopObX9PVnJHQY3gJU0b
X-Google-Smtp-Source: AMsMyM5q0D9WwhXoaXWtfdPCxMCV7XM5Aj81XdG66gnTfMG2DJF9a8Sj5RxoQEpQX+tIF7ubzDSzCA==
X-Received: by 2002:a17:90a:7c47:b0:212:ea80:8b02 with SMTP id e7-20020a17090a7c4700b00212ea808b02mr51681825pjl.60.1667835452046;
        Mon, 07 Nov 2022 07:37:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/25] create-spdx: Remove ";name=..." for downloadLocation
Date: Mon,  7 Nov 2022 05:36:37 -1000
Message-Id: <8a13c860338a4b1d7d971760c467f2f2d3ee393a.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172918

From: Keiya Nobuta <nobuta.keiya@fujitsu.com>

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bbecab53d1b27f3bb8c5882cb0ec39b04ef300a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index d735f20c20..d0bfcc7de6 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -451,6 +451,7 @@ python do_create_spdx() {
 
     for s in d.getVar('SRC_URI').split():
         if not s.startswith("file://"):
+            s = s.split(';')[0]
             recipe.downloadLocation = s
             break
     else:
-- 
2.25.1


