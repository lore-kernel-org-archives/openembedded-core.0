Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C604AC61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:22:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.39754.1700572938254609372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZwudy+3;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c431b91b2aso4793675b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700572937; x=1701177737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2Gl1Mq3Hr+Coj6dP2K/iDWoOGNAx+UJ0ld9HNzDeO8=;
        b=nZwudy+3uWcFSHXUqbuWVyo9EC8eQHx0fggOrL5t7RCXuLfpDDLYlKy+rFEIVcU+Xv
         qtNYnXsAYR0/7W0+6xAw+EIR2lx6vM+6MAtNPxQh9kRUcUlxCTKt17UBxvMgKc1FUNyW
         uXZSlRsTK5LWOoaBVUz5i8fyrtK5vkGaAlTzzIoZ8Zu1emQWS79GjLzgTftOdK7r0RPw
         fbm4ESGB+pXhham36Dh6HoGdaY6EwN2vKZaW8rM20vCxv+CGSARaAxpH5BLi/+Wio4Y2
         kODaewO1A/pKYbdpOjR2tkvn0Z+GEd94ooC9OEsJxT44ro+AazY4cGvgJwBPeT17M1sO
         wi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700572937; x=1701177737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2Gl1Mq3Hr+Coj6dP2K/iDWoOGNAx+UJ0ld9HNzDeO8=;
        b=mQGhL7MtlCUJpqW+xCv/tEjrRakxaEiHhCBUHFgcJJojOAyhar/mpgyr98wp6Z5qGi
         7m9mNvcdp47qiPKRsNaqWjCVqfXnh9Qzzv0Ji/l/vsOExsXKiwBI/Knhn8zb5yCLfAlV
         EF3pjyTXkqhJ0Ql6wWhEQ2ietfXQUjif5jWjRB0ypRtrpLY5+Ri9LcRTJaYpBH1Lm8pk
         x+7QDwjeKqpEZ65rFrFgKGPUkklFFEZQ1xigZVFvd1eESQWIBfW+dErt7W/g95Pe6CLc
         Up8gkkMMrabz9fgIoRI++454gkH+fYaJev2wGV+yOAoJBTS78tfZ/ZXhptONFK1pCljG
         hlZQ==
X-Gm-Message-State: AOJu0Yy0jWLzvYwWR4QwIUJhMByoXNYf1eH6olDaagHf3pgPFUTGn2vQ
	43KApmJRa+d4xQXYVV21wZT1yVJhqOc=
X-Google-Smtp-Source: AGHT+IFNZdQZw9iWnECpBDb0fV4Ahfz92Vfnbh98dl9PEfdMjTkXZrs3z1YdN58eNWCo4AjLczSDKA==
X-Received: by 2002:a05:6a00:2391:b0:6c3:74d6:595a with SMTP id f17-20020a056a00239100b006c374d6595amr9771421pfc.13.1700572937469;
        Tue, 21 Nov 2023 05:22:17 -0800 (PST)
Received: from L-14805.kpit.com ([43.231.237.137])
        by smtp.gmail.com with ESMTPSA id x19-20020a056a000bd300b006cbae51f335sm3313948pfu.144.2023.11.21.05.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 05:22:17 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][master][PATCH] ptest-packagelists: Add sdbus-c++
Date: Tue, 21 Nov 2023 18:52:03 +0530
Message-Id: <20231121132203.932559-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190974

From: Poonam Jadhav <poonam.jadhav@kpit.com>

Add sdbus-c++ in ptest-packagelists to run ptest

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 7ca23cb4f0..c75164da16 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -72,6 +72,7 @@ PTESTS_FAST = "\
     python3-webcolors \
     qemu \
     quilt \
+    sdbus-c++ \
     sed \
     slang \
     wayland \
-- 
2.25.1


