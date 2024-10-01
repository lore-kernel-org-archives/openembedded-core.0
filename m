Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1806CE7D00
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:40:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.77028.1727775616364353902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PdX1CElQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso64929595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727775614; x=1728380414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5A1ROvHhJdS4/HaDPnMhjewHq4Jo/hkYTzf1c2X7T4=;
        b=PdX1CElQ/z5xq9H0Um6DCfV6058PmHKaMY1ZyrV9Cr7mH+VW51IuqHQHyOrWZstnC+
         lkKYoMaZZhOahYatoaPWxrawT5Z1Na801Lt6grblol1OwJJyJkJ3vM77UM6cVEX43zLJ
         Yy2yI7IWtMiNMFLvFwopbVylfqgbVBn8ffyX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775614; x=1728380414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5A1ROvHhJdS4/HaDPnMhjewHq4Jo/hkYTzf1c2X7T4=;
        b=mzpqO5yycYINcxo/A1ZhQ/pnqSCQZkfmTmr7gIxtSq7Ej/7CgoaQVUcr6sI3GIS7YU
         RqlwZGil3Sb5rEhyZsivyAiHWyC84T/qDcQpq5nbrvC6EwWPr+hm3Gtu3cG7YOGYy842
         C3/4osSDZlxS3b44daaRoGYbq0AQm0hUnhmhCQ9SHzdNOvVWHG1O+k0I8G3bE0xXdDG2
         sIlOkvDAukN9iPODNdEhXBF5BX+u/5CbOIZVom/5pEo1F542nMCdVD9Qz5NOw2MSHk+T
         GDhczxiu9o1BUThhITTCoOwel6yecJM954r5cqF8pveEdf97KPHC9HKoFvkx8dS/G7q3
         dTtg==
X-Gm-Message-State: AOJu0Yw/GxsIIg+JrXlxVz4RwDrDZf+98y7J5KktWn9aYy58xfudbko5
	5DbClbcwTYF9kHi0Wdci0TEkEwFxDGOQSe+CD5GyJQz+tbr4bSSV5zgkI6vq3AAkCDbCPrltWUb
	H
X-Google-Smtp-Source: AGHT+IEQln99EglrNEHvgQUDkIqYS6x8NMQzHuMbcYZYq13W4UcLX2SQa5oDqSf1wVm4oSsby2Zr9w==
X-Received: by 2002:a05:600c:4447:b0:42c:b74c:d8c4 with SMTP id 5b1f17b1804b1-42f584a18a1mr164730925e9.31.1727775614499;
        Tue, 01 Oct 2024 02:40:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57de10e8sm127445635e9.13.2024.10.01.02.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:40:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update to new layer/release series post-release
Date: Tue,  1 Oct 2024 10:40:13 +0100
Message-ID: <20241001094013.2862789-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205152

Switch from styhead to walnascar (aka walna).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index 763ea011d4a..c2767eb6050 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -11,4 +11,4 @@ BBFILE_PRIORITY_selftest = "5"
 
 addpylib ${LAYERDIR}/lib oeqa
 
-LAYERSERIES_COMPAT_selftest = "styhead"
+LAYERSERIES_COMPAT_selftest = "walnascar"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 963d2d5ce90..ad62721e41d 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "styhead"
+LAYERSERIES_COMPAT_skeleton = "walnascar"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0e54ad7eccd..f475de386cb 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "styhead"
+LAYERSERIES_CORENAMES = "styhead walnascar"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "15"
-LAYERSERIES_COMPAT_core = "styhead"
+LAYERSERIES_COMPAT_core = "walnascar"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 

