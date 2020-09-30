Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.6491.1601503972397910144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=thJfAVO5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id o20so2320586pfp.11
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8c5cDjkl2BXp8yzphqTs3N8GCuZeLOaEXc4J6a95QKU=;
        b=thJfAVO5vlc7ayqB9RvN2p7z7+xP/J/xxdflahu9kV4vfoXeU/pjo2LZEL9Y+TL8gI
         I+WUJI7RUmAXs0UyCZ+cZj+H+AUVrjCpUyTLBUfXUntJHZZk3oNoUyLb46XOxYd3BkVF
         fFK2C27C6FziBIG+vjqrCM80HZ+vrTXy21oHIZti/3mGCraOS7xnlBEqAjFi+N9zJxkY
         LPM5e6W/Xjw2kazP4i7dyzLRoIQi9xTrGx3RURf0uO7If1f7g7nB5lk3PZxqDRq+PhMt
         Khp1DuWl+i7PR5cjjFKPuAmxR3t0YZ06rTXskwUipBhzqIMpp9YvOjhJQcDubVmw0+op
         KoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8c5cDjkl2BXp8yzphqTs3N8GCuZeLOaEXc4J6a95QKU=;
        b=fUweNLcLBLHhKI0Str2OD3lbgh2iiK4J2RdQM/ltldOSpCh/tebg7/kQIWr5Cq8eAG
         YDH1VlqlB2S0LPanKjsjiKbFuAb6Zk6OMJRsW7HIjxyAE2K8tGrquvhO2p5npw4gKsZF
         ikDW+KA1rmYOa/CTaz0ubXbimT17kd4ScDpfNX4U9ebV6jav/t1qxHfCnSKkfEeeUS4J
         XpROn0NbbADn1eqhjebLofzuXrqQnDE6c6X/qX34crCkNrZXK6+AKkrrvwSRrBHJb8IK
         2usTfWhkwd4JDBscBX+0t6Igd9Jbl3DJG2a2BkczyHf+zJn639WdbUjtUpRuKAMZThD5
         PWvg==
X-Gm-Message-State: AOAM531Kf5mYuq1ALoA2KZPCLTWVaMQ8oyIz4fyFyIPXuInGDa8BKTU+
	y2PhLxiVpP2hmdiNkYBv/atNptqSEgiHJhhOQSc=
X-Google-Smtp-Source: ABdhPJw4n2RWSTap7ufG3AWEdaRW5MTT/LGMAGPcwMPCvIKIclxXKWI1O8BINFRZAlSvd/6NCjvIhA==
X-Received: by 2002:a17:902:203:b029:d2:5660:8c84 with SMTP id 3-20020a1709020203b02900d256608c84mr4225148plc.80.1601503971511;
        Wed, 30 Sep 2020 15:12:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/41] curl: Change SRC_URI from http to https
Date: Wed, 30 Sep 2020 12:11:22 -1000
Message-Id: <9f39e53b0e1bf74b233b3e33a9996934a198f533.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Randy MacLeod <randy.macleod@windriver.com>

The official links on:
   https://curl.haxx.se/download.html
use https now and we're seeing this warning:
   WARNING: curl-native-7.72.0-r0 do_fetch: Failed to fetch URL http://curl.haxx.se/download/curl-7.72.0.tar.bz2, attempting MIRRORS if available

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0aa24abf6c4d68efa63026d2496b6adc16734d35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index dfcd533c80..239852db09 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
 
-SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
+SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2020-8169.patch \
            file://CVE-2020-8177.patch \
-- 
2.17.1

