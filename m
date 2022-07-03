Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0A2C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:55 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.64605.1656877072807813160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QC6UeHUY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id o18so6861850plg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=U5Tity0DTxxTE4RSV0i7PfhIIJZbjqhF5axqzv+oCGI=;
        b=QC6UeHUYeqzdXS8CdiMw61dl7fGAmoLS+SBf8qkyCGSXMHCwxwXoEfAiWlrfLF52cK
         YD267sCD3cUokYQivLVLx91UwodTfZNzY/mGjJJ1Mmp/73NzFG1of0JAb4O0f8qo4P3I
         ZoTagkeyAOGdeERQGICb+RcRPNzWdpKCA3PAj/HD9raWusDamxdZg/K8f2G4tjEslBuw
         aksKQmOkJ6Fum5nx6/wNhlHIueYmGwQWtn+dUxHvrTsM/q3NHqV7jUdj0e7D61ZqLXFh
         vk36Nm9NBW9OCNo1Cc90NpUqkGXVSCu24LqreKUqO1y2cKwQP49DrvT7sykt9tV9yPfR
         8YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U5Tity0DTxxTE4RSV0i7PfhIIJZbjqhF5axqzv+oCGI=;
        b=X5VnIaGhH8KGRyScahg0z593GXV8u7gpmj8ezc1diH70FuBrKAM0NYegPEDnYFEGi2
         8ZWvh2WDA4CtpsmEHEAAD6PELKvw4VW1Pvv6DgRHU/0jjjYDNcqs/uW07iGHIVZiGU7R
         AJYTU6m/uY+1Nq5kYJbuWo3DTJlS70+NaVbdWr8k3v3pJglMg6ogBfnpB7sCDcBjYsVz
         qchN6D09zJ7eXSR1j6oX/O6D5lHL+PNuJLMLrdXOf12FLQJ//Fo1VtvEW84fU0dhKcn0
         WUXLOVrQBXTpW0/tMV8gZtxTG8DKGS/tGABS+pg/qKsovP4VOCp7F1J0Dra437ex62tJ
         EPrw==
X-Gm-Message-State: AJIora+lrtmvxEi1/sgb8gXbbKB1FPOQNNi0L4MVj+HusYcpyI3ulc/0
	W2xsOeE6l2nNCwWfKw2wExvOvzzLxjZDhQgs
X-Google-Smtp-Source: 
 AGRyM1vkPQ6kdmwR7Bx6AfeA4prrHjqshO9txgxcQxRIsE8vPUalFbnsatwO012JpEXTEc/hknu6uA==
X-Received: by 2002:a17:90a:8915:b0:1ef:7e13:258a with SMTP id
 u21-20020a17090a891500b001ef7e13258amr6746068pjn.236.1656877071688;
        Sun, 03 Jul 2022 12:37:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.37.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:37:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/30] oeqa/sdk: drop the nativesdk-python 2.x
 test
Date: Sun,  3 Jul 2022 09:35:53 -1000
Message-Id: 
 <53eca714b874d2cd323ab6d3e11641fdf746a980.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167578

From: Alexander Kanavin <alex.kanavin@gmail.com>

Python 2.x has been EOL for a while, and so this test
never runs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b687627e9cffb8123c156413f55ea1929f1a7831)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/python.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index a334abce5f..d43354c32a 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -8,17 +8,6 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
-class Python2Test(OESDKTestCase):
-    def setUp(self):
-        if not (self.tc.hasHostPackage("nativesdk-python-core") or
-                self.tc.hasHostPackage("python-core-native")):
-            raise unittest.SkipTest("No python package in the SDK")
-
-    def test_python2(self):
-        cmd = "python -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
-        output = self._run(cmd)
-        self.assertEqual(output, "Hello, world\n")
-
 class Python3Test(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-python3-core") or
-- 
2.25.1


