Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.11486.1607008169347792362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gh4gZmmP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id i38so1570283pgb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GnKiQtTtav6ZKJeHE498E+JD5SAE1YZIuQcBH60K4f0=;
        b=gh4gZmmPQ0VlJePUf2Cax4n+qX2YqM0VsTKMQSETq27t/NZuqtvx5GL2pyGV4BKgt9
         KGc5sfvdZAevYplFIQZwcYMFcjUw9QnLHccGWSfj+7wtSXLkzaInLeS0lJ7NdyUTzhvE
         FGhWdTi/bg6T9D+YA6XLoqCm1h6B0lKHP1mJLuj7JRobf0dNqO1hLO9oOWdGvO/XNpLk
         D0P+w3GoUiPeqbX9PdA3tIg1/vWfgHNXjkV0FcqD7ye25i8AMYJaGq45mM1vj0IZnbvD
         k+LEdx1T0UjQ5GNqsNW3OELBwUdrA4spWriToXygvLtzR6BeHVcOED3RP9J7isVtOrW9
         rAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GnKiQtTtav6ZKJeHE498E+JD5SAE1YZIuQcBH60K4f0=;
        b=ZHREJdknRHECtCldT0zKA31EZVeleAHsUOE8tuZ6y4XeaWWmOz+0nRI9sOLfVd93uC
         jAqED1dGp1Qa5QC6Lo74resAzM88eACgn6lOMX02gd/uQUgMaOru2mUdRADf+Gwd8kyc
         DixEwdeqhONMJ01eALBIjv41ObjstwuZ5uyk/Q6yB1gjI/ge+I0tn5xkEjdyu2Ez92nn
         j+ruXFPvclDTR1l5ItIWFOVDztCa3elRdwIwHPIqRkrz8kqXWlX7WyIDN1o74Rt7FKJ9
         AHP93JBt7JkwH4YbsW5T53NexsIfVPpcrH6bW6W5Od42JP4Z6tAN6gErYX3vFrqLTIEp
         6NXg==
X-Gm-Message-State: AOAM531ywJN6pBG1Oh/pMX5zCg/Ztyb3Azz69kYiWyvHO7swP9tv6vQb
	SXoXaKS4RXakYzVWS2DElwYzmLqE2TqlEUnG
X-Google-Smtp-Source: ABdhPJy3if3MXz1wIQAF1y/w5VXr9aIzy4hg2Wtbc5ZHNP9Xsz81jdX8UPR9bkCuzmOpNCkpr3x+JQ==
X-Received: by 2002:a62:7693:0:b029:19d:92fb:4ec1 with SMTP id r141-20020a6276930000b029019d92fb4ec1mr3562930pfc.4.1607008168375;
        Thu, 03 Dec 2020 07:09:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/28] devtool: remove unused variable
Date: Thu,  3 Dec 2020 05:08:09 -1000
Message-Id: <c82a24819e459367fff3eff3b5520a56c610b0f3.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

This variable isn't used at all.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9676ee24d190b144cb50be6ebde3990644a6df2a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d140b97de1..261d642d4a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -531,7 +531,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
 
     initial_rev = None
 
-    appendexisted = False
     recipefile = d.getVar('FILE')
     appendfile = recipe_to_append(recipefile, config)
     is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
-- 
2.17.1

