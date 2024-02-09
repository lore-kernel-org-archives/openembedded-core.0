Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB85BC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 13:58:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.12155.1707487098358295527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 05:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fik+PDnZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b66883de9so378184f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 05:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707487096; x=1708091896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTAwRqBMXP8ziM7R4o1Hkt5IS7WCJ56EBw0eIPgtK1Y=;
        b=fik+PDnZ2mDRYMFyJ3RTx7lyznC6p8YjFO7jBESIzRBLdnPcwTyZ9FstB/GJJ78lVs
         tBfqqfTz8nl8eVD6L9CbnyKDrp6OghhAQUtVpSqTUmlc0vafJFGjALSV6CMuB8hyFici
         KFBTwCP+wQGei6P9p1WbaLf8AyGU8cs172Yso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707487096; x=1708091896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTAwRqBMXP8ziM7R4o1Hkt5IS7WCJ56EBw0eIPgtK1Y=;
        b=agq04z6RCcR+NOkdWnfalxK8slY5PKvkD5RFLg7yqkA+ofBIvhSmmlUccpDHhf6vUu
         CeB2xYcudETccsezetSYM2w9irgVHwokUy+5dwwsZ5FQciA4ivuoH2E46N7B3CFF1FTo
         wPR2Y+ydDoCGDLE40MItjzGLonXOYdCfIX6XvzFiIRkJcNNZDj2fBelzeV5zqpKipMMz
         WV9aDuZCOOiPap9xohetjXavYuH6b6l07G/oE9ICotJMNxxo0zHswOGCFjcyWloh6i2+
         UoAJDNFP6YrAuSB8vIbF2mh4eirm/Uumf1RNqpw5XlbRZdEiyP4NxMhOXWqF35J1Z2gH
         Nhng==
X-Gm-Message-State: AOJu0YxFACr1cw9M8MyhEELruLmWGFX0oj6rnM4fGs58DX9tzlsfyoM4
	Ohg0TTk3cZnUkr8EZ9SMdXFVD1yTY3iL+eXl3UY910R1L1payZag1/XaY0pyKV75CsPsJCcDgVe
	7
X-Google-Smtp-Source: AGHT+IGkdWgjmL0o0JDVX+r/ZTIMS1ksibt/lQpcqwkhTbz97DOQFxe6NDPSmzC9RqYB7oBqtzlvtg==
X-Received: by 2002:adf:f5ca:0:b0:33b:2f8f:da32 with SMTP id k10-20020adff5ca000000b0033b2f8fda32mr1125224wrp.10.1707487095877;
        Fri, 09 Feb 2024 05:58:15 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id r4-20020a05600c298400b0040fdc7f4fcdsm738397wmd.4.2024.02.09.05.58.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 05:58:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Update for the scarthgap release series
Date: Fri,  9 Feb 2024 13:58:14 +0000
Message-Id: <20240209135814.3393123-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 13:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195212

Prepare for the scarthgap release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/conf/layer.conf | 2 +-
 meta-skeleton/conf/layer.conf | 2 +-
 meta/conf/layer.conf          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index cc65b461ba7..48ca8464f9c 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -11,4 +11,4 @@ BBFILE_PRIORITY_selftest = "5"
 
 addpylib ${LAYERDIR}/lib oeqa
 
-LAYERSERIES_COMPAT_selftest = "nanbield"
+LAYERSERIES_COMPAT_selftest = "scarthgap"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index b180e61d03b..0414fb51b60 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_skeleton = "1"
 
 LAYERDEPENDS_skeleton = "core"
 
-LAYERSERIES_COMPAT_skeleton = "nanbield"
+LAYERSERIES_COMPAT_skeleton = "scarthgap"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index bb8b1c81b12..2418ee7d53b 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,12 +7,12 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "nanbield"
+LAYERSERIES_CORENAMES = "nanbield scarthgap"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_core = "15"
-LAYERSERIES_COMPAT_core = "nanbield"
+LAYERSERIES_COMPAT_core = "scarthgap"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.40.1


