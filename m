Return-Path: <gael.portay+rtone@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B50D3E1A8
	for <webhook@archiver.kernel.org>; Sat, 19 Oct 2024 02:22:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.37291.1729304521663574238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 19:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EKy2ji/X;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: gael.portay+rtone@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so4421005e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 19:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729304519; x=1729909319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b4rVafZAuC6bp1JswbUbf92cDtQpDCj4DFbOfWvv6F8=;
        b=EKy2ji/X8gSq67jfWYge2I9XN8M6CcAldq74U7tGYYNILP8A4fmuDIfnv6hGw2ydty
         BO+PnrpCuZEyWZjHv5Y0bPXDJdeKDlUNked3uMyfupgPstmVL6YeifWatEnwG8LDDYRq
         ltY3da/drvSPQKH2A1FGO8EMqCrl9v5A32efyvDWrwVWKyY2agdwoy35rdNBupJO0hIA
         UJGJ/XFjkHY31qHkOoitzA5+lxX086hI4OSEj0/puNdsHpsjbqISPyQNVA8AzS7rLw0r
         W/chDgztgu9mtJVFaYtP9idZFhwe8gD950WerMuA4YCN2NFG3AOQe9/bmoHkp4f0vDKG
         Btyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729304519; x=1729909319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4rVafZAuC6bp1JswbUbf92cDtQpDCj4DFbOfWvv6F8=;
        b=W+ycRqNYRKQy+yofIVfqJJw8GMptM1D5dgu1WHbYxNeHRG41i3z7caIvNiy6kR9MLg
         i+abhteM/VC7pGVtBJXXpmbyUd0NuJlo/tFYxvCbE0O465xB1eycn9vsItsASvoN2kKu
         T5BAhU+6himJ0mD35TUdScNV8ZusqDJqBlpxlqycQK3MPWv98qvrxtGwgeYqjyu08tC+
         IefwMOiHQEBUjxtSr0HDqGUcqfoLq/MbMo22uz3GCt/mvUtDPqc8VVap4ichEDAa/rQa
         CR7A3uhT8gU8ew0tYewkEF3gWNLyaoME5451I4Cx+UXGJjRqNKExPPbpRniTjFweqMRt
         Naow==
X-Gm-Message-State: AOJu0YwbqFNNVnsts6RnGpufHzmTzFMuhzRyQ8wEbQTzY0nX8rVjT+rO
	YfC5B3v7+Btjqk8wgdc3ZZDTbHtreayGtZyqS1EJdUQdsnK7FR5fJeq5m+M3
X-Google-Smtp-Source: AGHT+IFwoqARgbZ2/exbYC8PvIeyyAtbqb5/gba1uaeB62HSuvJdj59CbY8L8m/hCYVWstMFM++0vQ==
X-Received: by 2002:a05:600c:4509:b0:42c:b63d:df3 with SMTP id 5b1f17b1804b1-431615bd3ffmr14660795e9.0.1729304519137;
        Fri, 18 Oct 2024 19:21:59 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4fd60sm37596475e9.43.2024.10.18.19.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 19:21:58 -0700 (PDT)
Sender: =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay@gmail.com>
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
Subject: [PATCH] reproducible: fix typo
Date: Sat, 19 Oct 2024 04:21:53 +0200
Message-ID: <20241019022153.2106097-1-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Oct 2024 02:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206079

This fixes a typo in comment.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 1957c97434..cdb38d5aa4 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -47,7 +47,7 @@ import bb
 # 2. If there is a git checkout, use the last git commit timestamp.
 #    Git does not preserve file timestamps on checkout.
 #
-# 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
+# 3. Use the mtime of "known" files such as NEWS, CHANGELOG, ...
 #    This works for well-kept repositories distributed via tarball.
 #
 # 4. Use the modification time of the youngest file in the source tree, if
-- 
2.47.0


