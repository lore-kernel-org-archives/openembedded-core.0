Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09517C001B0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7482.1686734982137005031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bzKRPY9Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9823de726c3so86985566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734980; x=1689326980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vKB3LA35ozkt3DsgWtBFqPqWJ//JpjcrQHm3+iRRD4=;
        b=bzKRPY9ZfTZ5Ne3Q0EN4ZVyDKT6zXO+P/hfJNjmYQmQ2mu8ggpLmDoFtwYCch8gdyp
         Rro8xPTCvcXPdyZYs57diZagRbLeUK4ptP6KHvrAiM75fJbP6GUYOq/ck4MIsCxDct7E
         wkSkFraDiFVNmD5A//x9mkVXDz+Hpmf7ALR4Ygu5ekyRd6wIJk6bH+7jyzlHdD1RO9C0
         NqKDeWtMPQe1ri+bJl658QTP+5JdguJZnbhSO6arzt9o8UacuZlnCnBaPloAKBuEjO28
         UlSmD+a+JUCYrbuQgG6UB5pz+w6uKuULobF2WibZnm3LWHTHmOi3MFtHI6MWeEeFY+2X
         sCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734980; x=1689326980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vKB3LA35ozkt3DsgWtBFqPqWJ//JpjcrQHm3+iRRD4=;
        b=LmCbMKPYxu2+J2vgvzb1CIScCx3pcTA1J3VXhB9IuoLzjaYTuEHXDzbtNBXZYeVAfi
         BfZlPbXxuCELBAYz/Rw0aGSWhWAULFWrfj8AtY8uweNz5G+rnTj1aRyVBO84vj5zC0dx
         fBHMEFrOJAfmOqJjNwc2xobeLuAjlt8IBIjwouKy+5IdPnmrbFSZihnv5dYJXYH47yiS
         vfHZph90pQe7hE51MLTXpAUzM7cpmrJ44nR2E5J5I6+fInxTfL1uQfHObvYjeduPXDht
         cy1yLE5+V2Mbe1LP8c1lr4mZobvUdghVeg2mgYeiAS4YvzcLa8WbZd5xtcF1qsk5jfbG
         Xk9g==
X-Gm-Message-State: AC+VfDxZWy3t+4GCDjTEsp4GEd0d5LMuCW0Fukhul3qmlSqqn+cc0Her
	+f11FGczpZ40KvN67dRxt8Ng0GTXOgQ=
X-Google-Smtp-Source: ACHHUZ7h0IFV77KlWWtq8rEDjAOBcZQixidZ9Zg+YpLNoVNLzD5Dxh3q26P4xGuAasITxa0J55Z2sw==
X-Received: by 2002:a17:907:9724:b0:979:7624:1f70 with SMTP id jg36-20020a170907972400b0097976241f70mr18254947ejc.18.1686734980567;
        Wed, 14 Jun 2023 02:29:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/55] libuv: license file was split in two in the 1.45.0 version update
Date: Wed, 14 Jun 2023 11:28:47 +0200
Message-Id: <20230614092918.4065570-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182769

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/libuv/libuv_1.45.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb b/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
index 45b3a96f120..456cb2f9624 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.45.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/libuv/libuv"
 DESCRIPTION = "libuv is a multi-platform support library with a focus on asynchronous I/O. It was primarily developed for use by Node.js, but it's also used by Luvit, Julia, pyuv, and others."
 BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
+                    file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
 SRCREV = "96e05543f53b19d9642b4b0dd73b86ad3cea313e"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=master;protocol=https"
-- 
2.30.2


