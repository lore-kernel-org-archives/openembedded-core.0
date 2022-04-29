Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA9DC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.12137.1651248142365576803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QoLNs56k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id j8so7497304pll.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=altBkWQWccBuFJ9UBI+xQTpSpnpdHHrlpJA3NDFWCGU=;
        b=QoLNs56kFha/qHyBYce1FSZqTxS1EQpUtKJlYhLw3BoneBiJbzNlml//PVvgQQuEvc
         +OoiWkGGdujPzCB4/ITabiwTGKBeX0jfBvrDSGh4RxbrVt4tXS1BSvCLlPWfk/cEJDo1
         bjLkerk42Q+QpoQOxzb4UbegB9HJE7K3ZSp6e8yPI9ktkj3HSsPWAq1XjfWhSKS2aTdL
         REiqyXjbZvbmaajWv0nr2fJbe4E81a/M7j6CpClmdLR0rHeTrrsGHQn/I9+m+ozG/RTJ
         6guo0FcjAJO1zAp+zBHr+gVS2lXF/Idf47mHk0qUkFyYorlPBuo1IfeG+nqFP7asF8iW
         28XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=altBkWQWccBuFJ9UBI+xQTpSpnpdHHrlpJA3NDFWCGU=;
        b=afCOVl/IphQILnQJ7gxIBu2twHkQ2b/WEG0w2WYLDwhrWSu6ox/qu92vcDRBzquB5G
         CUE4DMDEuu0xRcNGzGyuPQcug6Xx+6LcXrLCC4Qxa1p336Lw7Ylyz2Djjf622+as/obj
         p8J+n2h3v/DxZUS6jXXUaamh3o8SLKBcdA9nGMErwamUaCbhiIgducfQF4NXE6IJzk6N
         6YOyH2IONI4MWxFHtk6ZGOdXjhEEHS+XcXS4KC4PfU2RsdtAHDuwCyJMSsa2LUuk5SRr
         wTh2Q4z8br8acfcr3VPpmNOcrAh3S1z6HwOjFE+Cco+3D1Igs/m4foI4cQ8OundCmbXB
         U2Dg==
X-Gm-Message-State: AOAM532qwb6YO+3quEEx1iXUI8Q2uwcomk/+AWg3f9ko5YviJ6ly+RVM
	ijowW+zYlyqlQzwI+h+YAKjH4Spo1BhQ/NwFIyw=
X-Google-Smtp-Source: 
 ABdhPJzgxxA2OBLViq/ioEDK+FQLZmLFDpVUxYZ5lhbF8KOrkUw4Htle8y9rqDojICq2PKN7Pbl5rw==
X-Received: by 2002:a17:90a:7acb:b0:1d9:85a5:e1e3 with SMTP id
 b11-20020a17090a7acb00b001d985a5e1e3mr4677848pjl.172.1651248141132;
        Fri, 29 Apr 2022 09:02:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/34] cases/buildepoxy.py: fix typo
Date: Fri, 29 Apr 2022 06:00:43 -1000
Message-Id: 
 <ca92de4c2181cb4b93f0adfe7c2fde759f295cb7.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165043

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a9b6e71d1e7e8e2ebc0ed047841e36f09300387)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 385f8ccca8..f69f720cd6 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -17,7 +17,7 @@ class EpoxyTest(OESDKTestCase):
     """
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-meson")):
-            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain Meson")
+            raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
 
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix="epoxy", dir=self.tc.sdk_dir) as testdir:
-- 
2.25.1


