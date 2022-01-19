Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0238EC4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.4645.1642588912247713194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OgD4hokC;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso1675128wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XCT4nfzyGd3OxfDFEdDMhNvPxyJKPc0fOTgdNFTibJQ=;
        b=OgD4hokC6gY2kFz7EmteWt4k/OjZjcRU6UZZjZgSuXdOI4Joow9M6tNlhgsb/VuhAG
         /QsLoZZa4oKcKWyEbwRpqEhfrhG150MND0T9KHpmk0Mhxcy9FMumYRrMaaLSdTJ/A0o7
         wr2xLG2wvzNGZqMQwBiZmgM61hh7PcCujka3KVvFhY7Wcjamrzxboq2muVg/TnwxIGVp
         XjRVL4R3B/KIvCu00nFl5mB23ygtzfhHwJMfxnkJgzpRQbl79CZMRmoGf44y6eAqzeSn
         9gVnjhbcvPb42w8oDsYNa2Y3REXi73AyiLVd62BYV4xcaDsKVh2HIEpJ2J98tXJFWx1G
         F9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCT4nfzyGd3OxfDFEdDMhNvPxyJKPc0fOTgdNFTibJQ=;
        b=xP4xDgY6V3SR6ksu9jDTT5BgLQHWp0lJeAwZPtKxhWlpK56tGK0pgOTMb530mXenVg
         xmuJ8ViAr9vGY9zGdcW8y8TZmX8aaGLSlpVOOkj06ApdI3pCelehYcV21SNfbp1SGhHd
         tdtDnTRvsUpAJX2hR0aCeCX5XRwoxEExatKiO9FmjU/ohul9IcXo2+49lSWvFP0iCcuK
         3BCJQioDtUR9NjxCptBtLOXZggu7Acb+1EEx9bbfPjjqYjEnpqpmx7oHAajP1sxISLik
         do9X3gzVT3zx2L797NZiYL0lZa3a3H2SICSUxYCggkvHA02yXgEpXHqwkRo8nKBvlX7M
         lFnw==
X-Gm-Message-State: AOAM533NSE22xdp4h22/ffJUQP9IGDqZ9d8JenfZOxZtD30qDGcVxc3x
	zt07qDKPo0nvvSCVdKVUyJn8aJFhWSs=
X-Google-Smtp-Source: 
 ABdhPJyj+3adOUggHAwelW5RTE4uRdN17EMQjTdPJy4KHpHN4aSPz03UQeBbBdD582lY9tdfAVCCJw==
X-Received: by 2002:adf:fe8e:: with SMTP id
 l14mr14482172wrr.678.1642588910900;
        Wed, 19 Jan 2022 02:41:50 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 34/39] webkitgtk: upgrade 2.34.2 -> 2.34.3
Date: Wed, 19 Jan 2022 11:41:12 +0100
Message-Id: <20220119104117.2120127-34-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160726

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.34.2.bb => webkitgtk_2.34.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.2.bb => webkitgtk_2.34.3.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.3.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.3.bb
index aa07139522..4b3d89ad82 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.3.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "584677d6e7cae12e27cdcc8e05b4cf73b54849a24afc3d7a40cec91016deff00"
+SRC_URI[sha256sum] = "0d2f37aa32e21a36e4dd5a5ce7ae5ce27435c29d6803b962b8c90cb0cc49c52d"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.20.1


