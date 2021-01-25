Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.375.1611586414367939918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JrHaxyiQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id u4so8870266pjn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4LZbpf3xg8JzYs2SZsX43IfZpEDDEn41cEATtV3+e8c=;
        b=JrHaxyiQt6J4Xb+P0NMMOdfm+bGEIBxb0KGWOeYTxBr/vAe79dOgY1Bb3CkxFis7AK
         Kt/Xyjj8iRa17RrfX1JhPtigBWIUJigrVErK1DvyX15NMTc200lVKrQtObAjThcquJhX
         OWYeB9iRF2zGlYP2dGLoVmV6l7UXgSvNNhTfcd0p6gAsh26FQutvCi0NzRm1LHmt/bvE
         l1PAruSK5FLgobbuZvPwjfX38GRXfvRPyrwOGH5M/LuC30NjRLJ5KNdV2IsxToL7pEUe
         CGsX+zKiBsJguJ9zY/MdXE5vFtZE6yilwQHLkOO9BdIKMFvuReIWhF44DTJd++EwnJRj
         oevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LZbpf3xg8JzYs2SZsX43IfZpEDDEn41cEATtV3+e8c=;
        b=blA1XYNWM7umgn3aAxjnvqwmwOKmei2rADiLamzo/CT4+cBybBvcspyFrdlNOYrY4p
         ob1y1Cd9xI6GyNUvbdgGqQityYmiqFhtP9si9vk+Q3r3y6oZ6lUN4nuSFboU65cDTICa
         jVy4XmajG/ZJXUN21j+SlRZKdX7hjd8vJ2rEh2zVNWlstxgX4u9rOCDj5M5gqbpi5VvU
         2OJ7l9MN/Vh3n7Z6iapfN2Alw6RfpgIYfDfGs9gAgF2kzLyczMk9gYccfVaw75jGTpGG
         jWlz8mRk/UgnjK8qv1y9+5R6rPI/7tYPA+XhkkPmwnuLkwXKw8gdewA9b1F0Etvth1JQ
         MFlA==
X-Gm-Message-State: AOAM531PcPO1VyypcgBUuYiIB8y2w6iM2341qrfTfICyZ3Im6RIEkq1v
	akh6qIveE3Ma9Tmn8sl0uVcKXQhqlMqQKf616dY=
X-Google-Smtp-Source: ABdhPJxfvk2uAXFwiQw5HD9tTgvZSiqmtum24Mdma1uulqFPhhqdf9wKWdVTSq+j/JbU0LyR6ixgRg==
X-Received: by 2002:a17:90a:e006:: with SMTP id u6mr527106pjy.201.1611586413583;
        Mon, 25 Jan 2021 06:53:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 40/47] wic: Add workdir argument
Date: Mon, 25 Jan 2021 04:51:12 -1000
Message-Id: <26ba2aeb55082aaeb12ab98fd70777f653719f25.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This allows the path for the temporary workdir used by wic to be set
when running wic from bitbake or directly from the command line.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e7314ac3a3cab89de93c932e8efc75de0feb0a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit a2308800b7eb5215982db7269d74d6292075f19f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 scripts/wic                              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 0ca67b77d5..b329568c7a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -62,7 +62,7 @@ class DirectPlugin(ImagerPlugin):
 
         self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
                                strftime("%Y%m%d%H%M"))
-        self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
+        self.workdir = options.workdir or tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
         self._image = None
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
diff --git a/scripts/wic b/scripts/wic
index 24700f380f..a741aed364 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -312,6 +312,8 @@ def wic_init_parser_create(subparser):
 
     subparser.add_argument("-o", "--outdir", dest="outdir", default='.',
                       help="name of directory to create image in")
+    subparser.add_argument("-w", "--workdir",
+                      help="temporary workdir to use for intermediate files")
     subparser.add_argument("-e", "--image-name", dest="image_name",
                       help="name of the image to use the artifacts from "
                            "e.g. core-image-sato")
-- 
2.25.1

