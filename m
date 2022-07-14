Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AE5CCA481
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:59 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.4064.1657773418903645910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mMrg1SbB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so1476378pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ypRG2YJyVM75yNWgEbK+yDvQSTdNGq3JvhjY08nl4dA=;
        b=mMrg1SbBcE1Tk4HRkhI3bRVm3NNZaLbtDIfLTGv1uVYJvLQB59zidddmu23K7NLSDo
         lrykKHrSIft15JhsSlCHe7Gq5kPKfQdoQ1H3K+WyDMvoJm5A1ltD6zlMuYQrkX6eHO63
         H0XM40Bu0OffEMfyBL/gOZjsKnxNN7uhvJR9fGdftETykvObyHcZv0a+LHPPNZJzxvgF
         RbeAXhDGQviybcq/43eZ5J+5MPf7hgTBZ9GpLOZmtm02KZDSdHYH4MM6AQSM0H2aZQk9
         QPUiRY7PLgj1CUiIjQOKB75VMA3tjmmmXvO4ykhaOJKlAE5VlGo4xHlplYxCMC8yxBPT
         e9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypRG2YJyVM75yNWgEbK+yDvQSTdNGq3JvhjY08nl4dA=;
        b=PMC/v0SrXupWjeYTVU08DNT7KdYQA/2gRP+Ui/wGkrsiFvZZ1LVvIqZpI7K2yNXt6y
         YWb108KCWvguQb7DGj5hymKY1c5/Lh11KJzqMQVkQi6i/WmlP1Ja6AO60eMP6Y6pa3py
         5QZikLDoxoF/zvBljUAwGaHE4FjIm6vfOPQdZsafm6g7cTJPzQlvwVVBl0g1Z/ig4dXa
         /tVlfOHZyWpO2K5Pd1dIFybsFSOkeawyomcmcqaEm0OXXv+GG4tauV1qlw+1XEX6MlVz
         51oczHYjzq9+CICMBDo5pEIXOmaq4byjQH+79b1t7Tv3VSbizoMuxBXyroHaukA4HdZF
         46Dg==
X-Gm-Message-State: AJIora/J7z7BWbjDeTDYDdsrUUZ9Asq5fEN8rZFPt0SrEbOZz4QKCIgL
	T5T+paydJVxr4dpPFNo1ZSct0x36DOJIHzHb
X-Google-Smtp-Source: 
 AGRyM1syIxMGMySw6EDLkFHkavbR9mR2C4EghVFk3mcsxtTE7EyKpHPgJa3x3LHoVVOK5pWakMUnHQ==
X-Received: by 2002:a17:90b:4f4c:b0:1f0:565a:35d8 with SMTP id
 pj12-20020a17090b4f4c00b001f0565a35d8mr14530336pjb.32.1657773417959;
        Wed, 13 Jul 2022 21:36:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/27] gstreamer1.0-plugins-ugly: upgrade 1.20.2
 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:40 -1000
Message-Id: 
 <e1dd7d56f54bb6d98a3f25103dc9697dc93a0d6c.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168017

From: wangmy <wangmy@fujitsu.com>

No changes from version 1.20.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e673f87339426eb952e035407c36e4dbaa133fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-ugly_1.20.2.bb => gstreamer1.0-plugins-ugly_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.2.bb => gstreamer1.0-plugins-ugly_1.20.3.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
index edc2ece979..ad7b84b5ab 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.3.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "b43fb4df94459afbf67ec22003ca58ffadcd19e763f276dca25b64c848adb7bf"
+SRC_URI[sha256sum] = "8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.25.1


