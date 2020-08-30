Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.36645.1598811487159407295
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZV6JWV/C;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.43, mailfrom: steve@sakoman.com)
Received: by mail-io1-f43.google.com with SMTP id d18so3784466iop.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7DZezd9J8qioE/6wuSv51QLHiDwyQzv5Q0lptmP1aPk=;
        b=ZV6JWV/CWruuOihbc+mJsuKoKNvlwpAOuVI1v7VPCFg1JS2IdaU+RCvY/pXTf2fZE7
         +JjDiMea0MgR9pF1IgPnKkmQzika1uq664eJpSRSe4VtOOwxXxAmkm3SibD+hZVZzDx7
         weA0Vnqrs4KuJrmeQgjweBTiie1FH5j4bD6UkpcdRIlJHyRIFvG0rLJO51sHv++rnpye
         sSFwy4RORgJJVVlJkN+nxg1+Jhbpf3r3lsaQ1JlbmMkbfuVVg0ZWtOeO87B0txaX5Ku4
         A7BkNZW4wQkAUSSjTD1N452oLlqzDUNMmWGZb54PMbO8fgiEjwTZpiO9vKeYUSab28jy
         TTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7DZezd9J8qioE/6wuSv51QLHiDwyQzv5Q0lptmP1aPk=;
        b=lIDkqI1FIzfAgA0/y3i4KBJNInAwIXga0ahWpXFKyG9zkYsRmyB9J9kIceqwUfdEVk
         b7xp7PSoh07IMqPJHICZF2L+3jq6a0LhBorGREzT6RJ+LhYJ4wjsysZpJvFHngenSZqK
         Rn3D7ljCmGm/Zhvv1Qsg3c5cijxuWR2VZfxPVUz7xPanditV73aNI7+x04V8A8hI/+X8
         oNd9dYS4kEVpwhhCInBUZsilfRYFZ8AV91RDD8nvL6AKXnz8reJxTlKhuB91YfnhOVVf
         60+yYsMk48HTv/oedOBtrNABr8owoRQ9MeduKGwhhZxJHJqYIFQj8VCFNO5PHicUbiXf
         I7Dg==
X-Gm-Message-State: AOAM532PNhWxkve+yATVd2fC5AdPc3mH2pGcRosQDbniSMXmUCiR/moX
	VawxeAJb/Q6vjn7CWvlbiWaqu0VzTie9vnqEo8c=
X-Google-Smtp-Source: ABdhPJwD9Dce1l0jfwZWAzxm/5N5imB9lYxzwKCv/drtutQcjG+3btPasPbqaTAGg/Ss83KZwVI4dw==
X-Received: by 2002:a05:6638:218a:: with SMTP id s10mr8945811jaj.117.1598811486080;
        Sun, 30 Aug 2020 11:18:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/25] oeqa/manual/bsp-hw.json : remove X_server_can_start_up_with_runlevel_5_boot test
Date: Sun, 30 Aug 2020 08:15:58 -1000
Message-Id: <2de541adc2dfc11be72446d3f80a9874f8be86c1.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: TeohJayShen <jay.shen.teoh@intel.com>

remove the test as graphical mode is already being validated

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad5b5ca9ec1d9106911a610bb36fb98e3f17748d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 08132c0f97..75b89758cb 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -239,28 +239,6 @@
             "summary": "connman_offline_mode_in_connman-gnome"
         }
     },
-    {
-        "test": {
-            "@alias": "bsps-hw.bsps-hw.X_server_can_start_up_with_runlevel_5_boot",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "boot up system with default runlevel  \n\n",
-                    "expected_results": "X server can start up well and desktop display has no problem .  \n\n"
-                },
-                "2": {
-                    "action": "type runlevel at command prompt",
-                    "expected_results": "Output:N 5"
-                }
-            },
-            "summary": "X_server_can_start_up_with_runlevel_5_boot"
-        }
-    },
     {
         "test": {
             "@alias": "bsps-hw.bsps-hw.standby",
-- 
2.17.1

