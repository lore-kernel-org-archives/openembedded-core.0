Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C59C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:12:44 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.48689.1693836759194452277
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pcDgByWz;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-56f84de64b9so887083a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693836758; x=1694441558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPOlE/4njFpo88gbWOLx1BHpCnKWKg/inWCRsHWLFT0=;
        b=pcDgByWzFQYSzIDIIKHd9gAtAi0CcAnd9KYf0vAPLpEi+INJ5aDoc9dmsnTICLWeHA
         8wdPm9HbtH+6dy3g/8NMNjWVGfTRb8MBlT5ik1p0nSlNpvRGYVGl1Cn3uTZPLC8HAqA4
         zAolU8QCjamULFn5AsKp3CumAZbhREyKQJxMXFvt6RRaeMiuHjkU0wV0PwBldGKAMAAq
         52GE+SnAmPpMuMaQqzehF0LVG3zgmXNoDPr4+CAa8XmeGKJi2RyYL3IjzozGlSuTbQWu
         EhMlg1l9wPZgcxntEQGE8FhXBtsnWHZlE60MLueIJ6bQBlmo7ZgMBWxRz6NYy30x5WBx
         lsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693836758; x=1694441558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPOlE/4njFpo88gbWOLx1BHpCnKWKg/inWCRsHWLFT0=;
        b=UZE7zricJHnGYIqBqie5ltL0eDlWeB0dT7xrkqXztl1yMr95F3iaTDK8IqgEn0i5Lq
         5JoghIgvyFg/PrLXsfMX3t01F1jdO2xyydepp7vXCWLL57qqPDXo/gnCkPPJPaXs1yzd
         FKsmzikpL4TUwRVWw5Tr8wYcjqsX/ULZL+i9s1hry9kkftW703MxoNscHxk1G1TtDtGe
         TmmpcCrvzymDY/uSwxg4FA9+0pd2RUzoTK28sbd7UKr2oo82ynUl+2j3cWYj8q91iyqw
         OBWni20WhHs2KhbUlEG98UF+KrMyu4nD4YSOvFW3wREVclQmocqCLXelLlV7dzltz0J2
         qarg==
X-Gm-Message-State: AOJu0YyH52BkeLUNfgpn81TvwVSKCbXzceGhJjJqkczHSIiRDTdiAXQE
	O06GNtXsFyxFNwxMveYlBga39XyfmRIdnw==
X-Google-Smtp-Source: AGHT+IE/fXGjX2IxF2idqyLF05eyh9YqvvfOfWWIlFAhQe9TjpUE/Ng7zoJupjCRys5RDdNTAUPDDg==
X-Received: by 2002:a05:6a20:e11e:b0:152:21a7:8824 with SMTP id kr30-20020a056a20e11e00b0015221a78824mr4624056pzb.18.1693836758090;
        Mon, 04 Sep 2023 07:12:38 -0700 (PDT)
Received: from L-14805.kpit.com ([43.231.237.211])
        by smtp.gmail.com with ESMTPSA id t18-20020a62ea12000000b00684ca1b45b9sm7658427pfh.149.2023.09.04.07.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:12:37 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] pixman: Remove 'PD' from 'LICENSE'
Date: Mon,  4 Sep 2023 19:42:16 +0530
Message-Id: <20230904141216.111840-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187179

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Remove 'PD' from 'LICENSE' for pixman recipe as it is not part of package.

PD license comes as a part of the generic do_populate_license task
and not as a part of the actual package. It is nowhere in the source
code pixman - Pixman: The pixel-manipulation library for X and cairo.
(mirrored from https://gitlab.freedesktop.org/pixman/pixman)
(cgit.freedesktop.org)

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index a580d73185..c227ad2a86 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & PD"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.25.1


