Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D47CC433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:19 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.4407.1651532597177918166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SEkF8zdB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id iq10so13914098pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=altBkWQWccBuFJ9UBI+xQTpSpnpdHHrlpJA3NDFWCGU=;
        b=SEkF8zdByI0T1G+NVJVIuNus6uVnyp/Jhp2u9LYszVgysUIF8wDUusr5kBVplCy/wM
         FnGfCbwYowTveWrD6PydJkWM4evrJQSqpPcZbTTD5IOlW2aGxXAO7Vh6rZtK2brXJFhJ
         +szN5PJZVXqM1wp2ySdSx9aMhKG1CEOft2iLq9KC5njtPzkkALneHHYmL0SMzi2UXXuj
         3mJt6pJ3Llnbs3loVINGtP0Lk0Mm9tKmVcJIOZuSI1Y3WMbwqIn/Wv2kgS/Mp36nafO7
         J70xo7F9UYfPUeiJUsq7MocUdw3kcSOVMYDErPekD3W5tQ2PZafHk4iANpLCcRFiIGK8
         ijMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=altBkWQWccBuFJ9UBI+xQTpSpnpdHHrlpJA3NDFWCGU=;
        b=YhlE/060YgiicMHC5mAj5CRzNhH9HxMm+RYwr+ceGrxfyTtwygA/RkpWZDprMmrxPJ
         PcwNmeSlX8Sz9+IaZLIQyuAVZiAbCTds0uu+XP6uigQmJUv+AIuJzwgpB4NlEwRMk+UG
         DtCUa5ZDZgmAdf/40SlvjfKxSi62PbOOi8MyKF14zNLjLKkH/pvBIdu7sd4Ncchbb3H4
         6dlejtuEbI38pkTCnGYKSGrIwlA0Eh07zfhLd2aNFid6whTh2p+LHCh8NxCbvjB63MnP
         sDkbs45tFp/QmeiKZNJTZt8MX/PcbDIf+InADb2GIHEb4ddgyBJPyi3qEYHYI7X59b+l
         6DVw==
X-Gm-Message-State: AOAM531ucxDeIeOfvXwBmonkU7i8zwfLZT9o+OMcvdNzzkH5hrRCSGOF
	Y0z5qFALwrxY7V2CJA7uWIrQ7Njx5b6uBMkxfxE=
X-Google-Smtp-Source: 
 ABdhPJxXMV/Bze0e3TMm8R1FhBn4crUSROBEohAquW2zkqBv2u6OUQrf5umn8eHI1/XajChePHdxKg==
X-Received: by 2002:a17:902:e550:b0:15c:f4f2:814f with SMTP id
 n16-20020a170902e55000b0015cf4f2814fmr13841253plf.123.1651532595878;
        Mon, 02 May 2022 16:03:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] cases/buildepoxy.py: fix typo
Date: Mon,  2 May 2022 13:02:49 -1000
Message-Id: 
 <20648dcc44213e9b9a089d72fbfae8e8c20f469d.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165183

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


