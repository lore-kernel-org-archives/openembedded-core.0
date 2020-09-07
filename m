Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1755.1599498167382869744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y2zAoSfd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id q3so2834202plr.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KHt7h0AP/XLch0FzNc9IfNRtY4tFvEni2/fyw3ZhGJI=;
        b=Y2zAoSfd91rIeBuCj7vaAPh7X/1UNjxlR9yMnQoQICunuSdqJ1lnNdFe+/C0JNQazY
         vC/rUREivxdD7iIYaA8Ne98NLi9fGkEYz2PRHpoOB4lt3Cl6sUy0oJ1U52SokCxHZYww
         qLXbxsLXMYA9qCUW65Ml8mz7TxSwXzD48E8bIV20N37wOl3wsTgZiB1z0BjYWb8EHGE+
         wYVkLrsFTqGnA/Dm9i7N9KjVDOEuvehTjbvjeFCkkglIOXXY2V03DnPUL6q7bAsbHc89
         XOZZjdpym5EMsAOn7ygT2EgNHAOSMEYrlm1ojS/8j39eqRfvzRG6IK5R/FAYb/ppYIKi
         naZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KHt7h0AP/XLch0FzNc9IfNRtY4tFvEni2/fyw3ZhGJI=;
        b=A1mbyPsslqSprmwGgZyK7M5pT5ZD8LFjTWsDplD+L3HBZSwq0P1Npaw3dDrBjEdgbV
         a0M1aktx2OYhegSu3n4ImUMp/CltcFao+I6vgWLpE5CIjNlzvUClYrlAiCkKV7w+0QG/
         8S65t8VDAhJHmuRR9VR8cixlbn5H+svN1CFL97ZgDO/iddNfXDlL7YGbRyJzSpqyKMB+
         7H5w2jQ0uIR1MIOoltXxfbtYQ3l1abc/qPkRwn6voWCu03rdkO2doyeCbPMAwugA7fBf
         mw9EZtkRvfJLOixNb0isDZ2GNhh89q5AJaBTUDjm4NLEbKB28Qk2fGAh6+/aONT5DzGH
         CGbQ==
X-Gm-Message-State: AOAM531EUdXAlO36aoiI7Bad4dKDaC/qEWjed9ohpLenY3Jv9qC+rEqW
	gmHmbOZoLfNiWed/+gdshzQuuLX61ZhahDly
X-Google-Smtp-Source: ABdhPJzeEVc5CbFAdhn1kWrd6fCa9rQK2Bh/qr49d1OijectOB/jZxtgpBPzTPAn5C8uXlmJndJk9Q==
X-Received: by 2002:a17:90b:357:: with SMTP id fh23mr182742pjb.221.1599498166503;
        Mon, 07 Sep 2020 10:02:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/18] wic: misc: Add /bin to the list of searchpaths
Date: Mon,  7 Sep 2020 07:02:07 -1000
Message-Id: <2427c872baf1be5ab9e9fcc0a17ee3b267db0edd.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>

/bin is also a valid path where one can find executables. Add
that to the search path.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca0a6025351cb2135e87cecf828633cf12aa34c6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/misc.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 1f199b9f23..fe4abe8115 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -128,8 +128,9 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
 
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
-                   (native_sysroot, native_sysroot, native_sysroot)
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin" % \
+                   (native_sysroot, native_sysroot,
+                    native_sysroot, native_sysroot)
 
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
-- 
2.17.1

