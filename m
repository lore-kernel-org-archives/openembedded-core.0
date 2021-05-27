Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web08.4010.1622103097151767809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 01:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNaftQ/7;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id a6so3966045ioe.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=WNaftQ/7zgs03yLbfQX1miz+jmA5fQ8T8Cgk49hSAlWmzUBwDo5aUFH2pcbnVNwl3j
         FkMmFqiD/T8FAnvW6XOAcUrg3hP8KZJ90LPvgX1U6ZAx15mTwJr0DLNykD4yI8AeG4ZP
         /aaPHXoUtGo1nRy8ZZDttYiZGC5UcvvGRfU6x0XLNLXWvf2k38LfuKHiftHoeMhEzMiG
         k2VJky7qTJwBMyy0TIyvTE1VIewBfsSRmvsUCVftQgfeCUvpR8x108cz88O3i5rm5G/x
         euZKDJ6XnEW7QQVzUUtpcH8Xa3kMKqHIwS9w+cFkr0xPu9MYLdb2xhrJc69DhWHthPHJ
         5Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d7B6fQbuVDDt8CMYtDgIclnQanGfSSTluca8SKK0Yu8=;
        b=KHStDL6iYI7DfJ9/f3oCsoyKNJy8nrnySou7hUCXsxB6ugoFVPFmx0Wm7BjA6HDdm5
         UHYWK3fOJEMCMWXEnSovV+p+ykJdn3viJbEXYgJTTQEKdUQDvE4y9apas3gx/GkxH8qx
         0Pb0WNwpajfNOZiLsIg5d6OQJYTAUIKI9iIjnA7YvNirl23BCwg5w3gBEvhz3GLNwLfk
         Ud9B1PUqWlwhrJ/sxzhHTBDBwBU1XelMQlWssedNyiEziJNG4yfCQVUELTMwDdUU3fx+
         8PK+VIdFw0bFVQWFu4VREAdGUTNGC37ACnO/ouWnGrMepXxqwJ8sGJaHC1yUPnX3Bf8Y
         WJIQ==
X-Gm-Message-State: AOAM530jmNUl8LoK6uxlQrg776s02mOiofd2bPM1E7erWYKRuc5c+B9L
	Q3EJmuP+2dby0VpdkkXJvNhX4JMMOwyvB8Zu
X-Google-Smtp-Source: ABdhPJwcGuf+mQeHlmZRZ93qCtcNmxvmwcqneJ7sW0whVMzpbwOe0tTHfKcsfEXjjXCCeaK7JTmYkQ==
X-Received: by 2002:a5d:89ce:: with SMTP id a14mr1905951iot.82.1622103096157;
        Thu, 27 May 2021 01:11:36 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id p2sm804981ilp.17.2021.05.27.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 01:11:35 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v5 3/5] rust.inc : Changed target cpu for powerpc to "7400"
Date: Thu, 27 May 2021 01:10:58 -0700
Message-Id: <20210527081100.1213973-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527081100.1213973-1-vinay.m.engg@gmail.com>
References: <CANUMPcVo=iH43q+70zHnsm5ktJR4D4AO+KZEzj8=0AQNaYFv0w@mail.gmail.com>
 <20210527081100.1213973-1-vinay.m.engg@gmail.com>

While executing rust-testing observed some ui testfailures due to
below warning message.

'powerpc' is not a recognized processor for this target in rust

So renamed target cpu for "powerpc" in "llvm_cpu" to "7400" as per
default tune for qemuppc.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index a1223f45e7..ee3176b559 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -290,7 +290,7 @@ def llvm_cpu(d):
     trans['x86-64'] = "x86-64"
     trans['i686'] = "i686"
     trans['i586'] = "i586"
-    trans['powerpc'] = "powerpc"
+    trans['powerpc'] = "7400"
     trans['mips64'] = "mips64"
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
-- 
2.17.1

