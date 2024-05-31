Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849DFC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 22:37:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.26184.1717195022022187499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 15:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mM9fPpb2;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a30b3a6cbso1799428a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717195020; x=1717799820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1yYBMub5lOK0Q+Nv51Vm12GgPz97RR4222IhNeI3y0=;
        b=mM9fPpb2KbxzlKFxSS3+1LulqXi2TvJGmTDAvTC3prmZQb4btL1L7EotbZnMKU7nLA
         UFFpbEML5qWNwi3mYJa0L9RXVnwt4anriQxoc/BrGwAbJxS2l1tL01NISwrXlMIrxQxY
         P35S49GCDD8WwCwvQZ2gCxDX5wG1/CgoonQffEmkxVeqltA9/H7GV3zg7aY//hVg5f0J
         h8OVTF2jmAaxJb5NzVILDBG5+jUzoIzFIietUQ3Gm/mdU/KmqQeJHEcMeECo2nQ2hAZN
         chIWS4B6RdWOIbbpKSvNPQIxPMZnbnch0y5VyIcVG0eYeCQu7nXol7Nwi9lS/Bmqlvij
         MSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717195020; x=1717799820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1yYBMub5lOK0Q+Nv51Vm12GgPz97RR4222IhNeI3y0=;
        b=nVMQY+jYeUZsNYUbhepwtZ9LfH5k31nVahZQIJol5WuHiIbKKdvDVyWHlW5xy+kpFo
         RgxibiJP6fAa05RVySKwudMh0bX/EqPt01ZnU28E6czDGT4QHlxZ2cz36CTpmVbakNa0
         pv3H4VGctexNRly1wK+8dICXJjTaMyHGe4NjKn7J501dLGwEL408vyiJrHUUZMfbIRHV
         vS9qNBWOJpWjMz22FJY43APfDM1G7Z8oUwfWTcM0n0eskYpGealMtCPktibCJKAYRvny
         GTAkXtlquWe0iYIJTFMawuwQfGMzhfpLy6QJD15iKzg+X53zk23PbjRgQrEuOYLlj8+8
         rDcw==
X-Gm-Message-State: AOJu0Yxnc3JHOKym0kC3OAoPitem17Rc2pJqkpGbcPdcRQoVQM1CdiNG
	18sy9EUUzqlMs1//lLhRbekRjGS0/eSEefFZa14+yEnNcQ6V975gSyQBfA==
X-Google-Smtp-Source: AGHT+IGEe4XaQ5Mn8BEk9F5JbSqO3oCC3cmb2M4mys7iN1UxV+IREOHF1iGU9qdJDs8weaX7l6Udag==
X-Received: by 2002:a50:8dc8:0:b0:57a:1c9:bf65 with SMTP id 4fb4d7f45d1cf-57a36542c15mr1947441a12.31.1717195020173;
        Fri, 31 May 2024 15:37:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b99450sm1511619a12.4.2024.05.31.15.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 15:36:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] gitrepotest: add Upstream-Status to 0001-testpatch.patch
Date: Sat,  1 Jun 2024 00:36:44 +0200
Message-ID: <20240531223644.1897964-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 22:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200086

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
index bccda17ee9..c3f99455ca 100644
--- a/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
+++ b/meta-selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [this is useless patch only for selftest]
+
 diff --git a/Makefile.am b/Makefile.am
 index 432a9b4..bbf7c74 100644
 --- a/Makefile.am
-- 
2.45.1


