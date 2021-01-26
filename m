Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.12899.1611672238761214805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MBRfUQ7M;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id t25so3632235pga.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4LZbpf3xg8JzYs2SZsX43IfZpEDDEn41cEATtV3+e8c=;
        b=MBRfUQ7M2EtekHf54Q4aTzsb0/M47VwPNpzzk6smbhG+gqGTOl0OLNfX7w6bFxWT8T
         /UxMhvjmNVpB+91aRohuRIvrBJnyJneffNZBP2FEye/q+bs6krX/oSkFKBl4MIZVVBFq
         OK78drJHYnEPtG+iTIlu3FeSZAs8mUdemD4zKurVQ4OA8KzYQQK4hWZeVKbXg6+qc6bG
         AkNZ+rVHyE+HbvmZkde4NtgZ7KGnzqMVgATlF/j282wlzOBnMDf3+/Lt0NgWsayS2DzB
         2bngzaDdXDb8K+wrbIdvikujko863oMMimFheMODlvhVSq8zCXVoeuUsJOZAD+m2Tq5Z
         4JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LZbpf3xg8JzYs2SZsX43IfZpEDDEn41cEATtV3+e8c=;
        b=C9Ug6jrrG3AP7+EwF0jtqEq7km+pX4MosVY33LHe3pRorc1jDcexJ/d2PFIc7HzS/H
         IluXeVojpJVPR26Xsk+ClTdbsEDFFAoPXHcCYC2eq47QCPhmuJv/70Xw9wSimVLeUVAA
         OnpOBHQE9glMQTjcPCgWQxw9DKjF8EeizaT3+kYl5yxgmMxOmE9diO226BgTNd+oZjgl
         m9YCZjzIUW0cr0HUdNhgxLtdRWTLVM4koO4c66jLl3LSLgY6geBQ8cSP+wmt+9/CO+U2
         Sbv2QPWmxpVhE8vvfSDqkAqTWR+bkNguL+Sns3tVqKJ6YtycpoF4SQui+++Dj7nU0ZKA
         d6eg==
X-Gm-Message-State: AOAM532uRVCRQFg5ktAU/RTH2EB9sTk/fGSkhAXB2jWCnJyihUwoceeo
	RdYcW3DP4IsPCDABYYYcS6KqSdpu32tdWvU5BIk=
X-Google-Smtp-Source: ABdhPJx0Iki2aBQdz+Vqb9Eq8YqY0fAG7YIiVZaGHsBBfeIx6VAZqpATNIrgls+5qLGVq5I9PhCXfw==
X-Received: by 2002:a65:5349:: with SMTP id w9mr5870434pgr.250.1611672237718;
        Tue, 26 Jan 2021 06:43:57 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 39/46] wic: Add workdir argument
Date: Tue, 26 Jan 2021 04:41:50 -1000
Message-Id: <7d349d08849ca200ec398956bdc5506be7cd70f3.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

