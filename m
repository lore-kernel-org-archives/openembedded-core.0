Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A75AC4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.70855.1669472164690029252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZF0jaG1H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id 140so6474891pfz.6
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC/XHtv65sAZlY/7ANDKSGiBEESvdAkwsblaKRYjuDg=;
        b=ZF0jaG1HlzLP/zE6/tCWmf/nTVBlfgZ1F8qoBvesErpeQ32zkFZ3UCuLE3Skj+kjnC
         pYF6UBIBbKSw60DBoAuGxGTJM5dHuM+fbBEjU+tFJaOv8No5gd9zeImdJR8vPohnog4F
         903Zg920a1O0IQ/Ia40wP/1MeBj+uRI0O0GW3G9VOpyVd6vpxpDgOByAXhoTrWC4zSdT
         sVNmDtiuLe/BOPtHnGv6ic51OGSTeDwfHZPc+5SUrNvUxWURJTSewpdWofBzuMUCqFli
         srFZr1n9k/STuYfwTnkpW3IoBrZ5P3RMNKUCTxRYWXjj6dHJJ5nFNTXad3ETjNv3M+p8
         TsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC/XHtv65sAZlY/7ANDKSGiBEESvdAkwsblaKRYjuDg=;
        b=InuNYWsrQayb5z6TmwpbmWGoNSk32/nhZoUKwRQTaiss2ma984/CFtS4uiRvnswhJK
         jsGcEQ2rWS4nY+dSPMuttxRL75t9IYrMfCEv1JzTL7NQ1cSeV4qxHK0hLPvx2cYhHhaP
         BXHawgHwQSC6W15i9Vgj4cWQAapz/PHCpjWDZI1vx27EggoC4qy3NkARnIqFqX7Hl7IU
         TTH60knliLDqo3aSBUe46YS/3YOD9p6rEGWtaH6pnm7o85m4wSW7cj0ukxemhpgdZ9jr
         mznzoF6zNhAPjFz6qDNxwVM+MFYkixZoFRdGjWfWnIeODZ/0HnNOt2xm0tis2KFNhYR8
         Gy1A==
X-Gm-Message-State: ANoB5pkyWLFrZQg0aueKi7chzQ98wP0AGmVHOKYPi1BWbxUZ7z3rqSpv
	n190eTj2EjvQeEJDVXBVCKJ0OhdAzi6THwtcnIU=
X-Google-Smtp-Source: AA0mqf5h45P2pT0+ZA61h38KLsA+2+pcOf3n5CgSgofn2sLXZ3ZNn3+4JSmht2qap4Wk54KKrTjNng==
X-Received: by 2002:aa7:91c9:0:b0:53e:7332:709d with SMTP id z9-20020aa791c9000000b0053e7332709dmr27485062pfa.56.1669472178323;
        Sat, 26 Nov 2022 06:16:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 36/37] meta-selftest/staticids: add render group for systemd
Date: Sat, 26 Nov 2022 04:14:40 -1000
Message-Id: <50499534bc8083f2f086ce171e9e09b5502a7470.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173829

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5b761270267063afb0462d1ebf99cabe32ff4e0a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/files/static-group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index b2e0e2f870..b13dde3218 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -23,3 +23,4 @@ _apt:x:523:
 weston-launch:x:524:
 weston:x:525:
 wayland:x:526:
+render:x:527:
-- 
2.25.1


