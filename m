Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.12678.1594996732257647891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hTV8OxWk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id 72so5529360ple.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WOOxGd/cSSyNdsbDEk/Du8eU42OYkTUn6DLzNpx8wCA=;
        b=hTV8OxWk7g0pcDzfv42lVAlFiE5bQe+QxuQo9xHoHvyg4UiKrFbh/MHc8UZd+Bpq3k
         ITq4fsUmP3BqxvZKo3146eh/n4+bSz8Kt2yzjwRhz0ykviLtO9uFWOji5XeGg67MLoKW
         G/P6dlvJTEwQV9wxynaSDke6eQ9aZw7nLrFeTEIGf0ijKLgvduNuZVPC3lyJ/kLRwot4
         6b9mY6BgzZbnJVnkCOzFPQsAx6cvbqmqS0QVtZ07SYBkmsoaQ5iAk1KZgeMgleHHl3xb
         HEUYdFgJs32XCPdUxX6JmR4ChW6Xu11NJPO9tzhTCPzwtGvgDS/tOL/zAYmXUD0F/7Sk
         yBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WOOxGd/cSSyNdsbDEk/Du8eU42OYkTUn6DLzNpx8wCA=;
        b=gF0tUB031Ik/3BMthtkn7spv2CieHalD1DWJArz6TNYVRQws958mTujKqrHIOvTuqL
         mICOayYEY2tczXWAQApNL4UbT+8/eK3UYvlGL9WZB7QhIPfUjyVgboIyM+dzDqSytU+L
         1mQ5Hcq487iO/J1t/Qc7oxZsJKzswYGmptPhSNHcCZFEJbiK4j7Xq+2QpR2/8W4YnpEo
         QMf7omC+NtM3S4CFwOhlfcXBxTPskdfsb/PDDBF8+F8dDJ4SNinTZoKnFLAfPrZuae9h
         GKVmcof5jpPT09UzJ2VDN8rykLe/K/qWECGkjqC8wPi0K9iQJabwXAYCP1k2JRDGsVpX
         2p/Q==
X-Gm-Message-State: AOAM533eqdpUXSPb4Vzmw1TGyUPVYQ2n9sctdbC+g6eSKiKIJRTiIRyr
	2roOx12ynOOq50EpzHmZqiSY59qCds0=
X-Google-Smtp-Source: ABdhPJz+ukToRB1oa3B7pNkm4LzWiFoB24w5ogucDOWeOZOCnXyMrkYanQPQmCE922uNPICKOz+jAg==
X-Received: by 2002:a17:90a:b63:: with SMTP id 90mr10722173pjq.47.1594996731318;
        Fri, 17 Jul 2020 07:38:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/20] nativesdk: clear MACHINE_FEATURES
Date: Fri, 17 Jul 2020 04:37:18 -1000
Message-Id: <0cbae5aa12aa8f3e0865d36d665dfd4a5853a691.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Douglas <douglas.royds@taitradio.com>

Further to 96c20c9df7:
Try to avoid nativesdk recipes accidentally being dependent on MACHINE_FEATURES.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 956e5bd6862ca898143a234aa85cc83b1f2d1807)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/nativesdk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 7b75710726..cd389c9c77 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -9,6 +9,7 @@ NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
+MACHINE_FEATURES = ""
 
 MULTILIBS = ""
 
-- 
2.17.1

