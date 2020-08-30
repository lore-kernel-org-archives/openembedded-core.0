Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.36642.1598811483772977036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NTb/3h1i;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id m23so3807643iol.8
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PXy65Iu2a9QKFWUNAO+46KzcgyU3ongnIsqm+cqDLUQ=;
        b=NTb/3h1i54mzZbpe3fbHPwAi/hQKaLdpTJHhIuHJqJyiG+XIm3Kq0klf+A6ZH+lqH1
         tWumqcUQ309YbM5WUaroZBXNdJiImD53pcKS6C4fKYi6/WV3OYtX/wVKpNMmR2yqhUwx
         ER2vHc8nsDoTcBM+DmQIw66X5GJGBrdQNabApxoLjcwp/F+NpSCNjoAwOgQ7fhP9wAG5
         jiYHfDKJ9xdH5kK15qBCoz4UluzjpDH3X1htS26gX2mys73O7/3dpHngbHLGWFmH/pVm
         bPQ0KYMd14wGI684kB+OfCfZ++/ZhNhZrKdrFP405NEeUVz6rVubtUNXWtuPVg8/rsSY
         IWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PXy65Iu2a9QKFWUNAO+46KzcgyU3ongnIsqm+cqDLUQ=;
        b=h8erju0JzXfur3ooih0cMkDoIe71e4PrA9uzHRPtuDrgSBjc3pjR55/AZ4HFZhHsrf
         pwl8uwggY+BMX8ucyIZ/QLmmeg8ALDi8EY86oeqxiBOh1pUPH4oHt39YpNDa8WNIdZz2
         KpqKGHiWJmxABMLxit5252hBFpaXIyadSfpSqOgnITE7rtUF9TatCZyROAH4zzsXaP78
         7ERTkrEtRbC0eVIM6EAsw0DUTMFt4LLwMiSayVgMNEJoUSk08S9jOnXu6peJI1gX/tVY
         /SUd+Ye+25e8FhhqeZ+Um/b/jmS/7nn5VfXzQLwOb3pbUk3JF93OfUsIXPRDkToZD7y5
         mvIg==
X-Gm-Message-State: AOAM531I+Ry4qZmk5wjW2+aLElaYTotHm57OpveFKeOS7sJ2iGG9tSHG
	EO7Ut6xHBZO8mCex44WUr6gKAJgao3dJHmr+hTo=
X-Google-Smtp-Source: ABdhPJxGj9bcnL+6vb0HjRVfSFN88ka0cY65h+s5rESb2TeNDteWfXGf33+e308mhwUW7EpqXUHYFg==
X-Received: by 2002:a5d:819a:: with SMTP id u26mr6099092ion.151.1598811482678;
        Sun, 30 Aug 2020 11:18:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/25] oeqa/manual/bsp-hw.json : remove shutdown_system test
Date: Sun, 30 Aug 2020 08:15:57 -1000
Message-Id: <a0d678cd3b7b0193450abe00e58f71692a75360e.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: TeohJayShen <jay.shen.teoh@intel.com>

remove the test as shutdown function is already being validated

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 58281082fbed57298247c019c3d8149e688de161)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index a9bc7d4501..08132c0f97 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -123,28 +123,6 @@
             "summary": "boot_from_runlevel_5"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.shutdown_system",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot system",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "launch terminal and run \"shutdown -h now\" or \"poweroff\"",
-                    "expected_results": "System can be shutdown successfully . "
-                }
-            },
-            "summary": "shutdown_system"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.switch_among_multi_applications_and_desktop",
-- 
2.17.1

