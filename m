Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA30ECD98DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:59:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127857.1781524765728302273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ggZGqegC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso20614415e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781524764; x=1782129564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4GhAQSe2+Kt6r8MalR+Q9YZsCMCKAEnSJR6UsCJwxw=;
        b=ggZGqegCC8wPB8PdmpV/ftVltT0zvs7sR8/AIW7IiDr5BRNZTsUflmdhmnLKN4gkKz
         3g/xm8HGyGGWRQj2MMNxRGx7rWsrppz7q9NY5vV/rLfLRplQnWTpnnLQsI4KvEPsCtv2
         8isl+bUauW1r56aR4tLqMx9T1oWlX5/BDoDiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524764; x=1782129564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p4GhAQSe2+Kt6r8MalR+Q9YZsCMCKAEnSJR6UsCJwxw=;
        b=LiyjVkJktt2MXeLT5joUV3Ar8m5ZWgqOAsGezgf3jOBDMEVER0kg43WG1zjFGMrr0L
         /ozWaKZiancXupk/MBHAmxT5IybwL47KEgK5Be2pMEULsM7GfBk4S8sBWip7e13yMBUh
         nIcN0ewYZLisM4Uzirr7DvdRsctxV4CZj/FnqlxZLbQD2CSiQjKgLdH4nwve2LYYJrGR
         /0d3IvxmZ5zfMeFVg0ZAk3bOyap8XDZTyrRL+QZX1ErFJqloCEduNR4KpXt5qCCgFLvZ
         AhqAgfFY5VYNfFtPJK2uYO5RVY/SB41phagtEoAo01XT678msz+RLf/fBnrh6WPIaOF5
         PJYQ==
X-Gm-Message-State: AOJu0Yx3b1C+pb0MPhVm36rtiGfXjBJNlV45Nerp6c+TgzuPoLUwFc6V
	3swLlyiNgcojHSbycyTmW14UeJLm7SYkf9t0heU6RbgTSp/Kd/+AJcxBgKwPL3CJyPs7Ge5BKQ+
	iedCp
X-Gm-Gg: Acq92OG7pbIaLF1mfyZXZ5J6DA8di5r86nELUdafvA/1WLKEbB/0+FAfvlQn+FurPGI
	QzfbgP72xwrmXycC1G5nBalj3iQJ8FL/hxytmWpmF5F1oURAZ8YZBnuiHuX2stOESkMjdaotURd
	elGyvBEdgO5AusOTBlt8NHfnZSjWWIjkXGW8nkZS3/Xcz1e7lTXCQJXVERr50lxoCYdxtTD851R
	S5OKBzwi9V3q8dAzrCzDM4a6kvdkV23k/4VRos/C89yq8FmJfY0Z62dPJrwat4mc0+5lFCxDKUQ
	ZcNCgeeDEsum7b4P7quLsUB9hxkL44IFRZzPBhjKxZOOxAyi2zTwX5TiBTCOo8eHrWH9iv25vda
	H5nCRcroxIrZOy0WP/Wju/G2WkbGffK95uafd3Fxnx4PbtPs0b8LDafWIq6+w0qNVQFiYsV+Ffn
	3xWxjnq9CcGueU2Ykeyqhb5klB+y/lcJ1syNiyx7op8wi/ep6ivvPb
X-Received: by 2002:a05:600c:1553:b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-4921e362042mr143547955e9.37.1781524763782;
        Mon, 15 Jun 2026 04:59:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2da:88d9:f720:efe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm273306935e9.3.2026.06.15.04.59.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:59:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] fastfloat: upgrade 8.2.5 -> 8.2.10
Date: Mon, 15 Jun 2026 12:59:19 +0100
Message-ID: <20260615115921.706829-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
References: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238839

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.5.bb => fastfloat_8.2.10.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
index cbd7151f851..f537bab56c7 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.5.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "05087a303dad9c98768b33c829d398223a649bc6"
+SRCREV = "34164f547b7df3f5d794ff67e9f885c36819ebfc"
 
 inherit cmake

