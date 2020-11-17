Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.17084.1605656917424562353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bVSCte25;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id n89so13175otn.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=k5qqoCSJCkB5I7yUQ/XEh3wIeQ4D1ogWVkUdB8MDSQQ=;
        b=bVSCte25Y1gez8EsJOfGXBufqpqBwJcjjhR1BQ2nwua99RT95jEWhuYpi3ZyyfxLVU
         WnGzSUd3PAq4To+oklU6YEbMknGcCnEHFFegYClXHHgAQH1iWDIiSkR0cNbqxN7jQd9n
         J23KrRD/rJFn6OfIa1Riwh4kLe9zj8bDrdaPBE/hftTkToyxUBqyJuFN/2IYTdePKRQa
         2Ob8rHgYyehrUIUAlPlZuBsFWlNR/XwNsw8jY3X6//t8LIjo2YAKppmz4YdeH+Bs6TwD
         7vRY/SQTQDte0fId0qGQMjkBFcPdOj4xWU9jtaY7abWblK9T9OLOv3xqECzRJCSGibgs
         t9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=k5qqoCSJCkB5I7yUQ/XEh3wIeQ4D1ogWVkUdB8MDSQQ=;
        b=YuA7CC57stkNJK89lv85nOd5abt9c+Pe2SOD7KRKe9zg7ztjO4P6OxEE+6gvORGpWz
         BJa9UcX/NYzrz+NHDuYcalWNEuZgy1HDl46rMDlaSPf9BEsZXJOgH46iKKYG5sm29Sch
         PuFLGOzZD+QFgFT6hVrV+cE8jZM2y9902jSZ+kJ8dtpGUyZm9qKZY61vL+uhQTZpqEWS
         GfO6NjNFeUmlaZ9Fiv0ULgRIzVogka0FgOvKDHotK31dsvIsU22WGDNHcYRFFOXHucEU
         pYrGnzx7t+UGC1tqKnDYYKYdrftTAaljC3JDmsUdc9XXnHgsLIIZKXYwURqrzRrd9iyG
         HkyQ==
X-Gm-Message-State: AOAM531tnfGe/92w+31+EGgiIaiWmvEoJs+YpaG04DkENVxG4KkJ5Bo6
	PIfr9x0ksWShVzvQRjoUCZww7sV9NgqYEyof
X-Google-Smtp-Source: ABdhPJxA3Ux/U6v66djB0+V5+QF3onzNaA+Mph6aKxsFhvDw8frWAP1xuFuGYlqBVvqjeSy0GjXJaQ==
X-Received: by 2002:a9d:69d2:: with SMTP id v18mr5022233oto.165.1605656916385;
        Tue, 17 Nov 2020 15:48:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] ptest-runner: fix upstream version check
Date: Tue, 17 Nov 2020 13:47:36 -1000
Message-Id: <83e9731584de86662c009201873759d1b1b3c317.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fd180d21ec907726b2fcd7709b93cb8e464390d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 9e62c486ac..73c08c6add 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -12,6 +12,7 @@ PV = "2.4.0+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
 "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

