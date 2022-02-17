Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7470C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:16 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.1808.1645114215991528594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NhFtKX71;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id i11so8872111eda.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRqM3EYSzz3TzYDw2rHpEO0dTNrU5HQfthFyLVsLp34=;
        b=NhFtKX71KADgnhfDsoeSaVsogIH4tTJX3qL3tg8df6hbhsNiTLE7KLcngLp54k9WAk
         nJthX1KAx0B/8d5mSnQ/ZB5BJTkHWrjdgg2MxMRUMjVHLSLsZXNGO2TwqT1gj63JtxEt
         fmT7JmOsAUJnX2etCHFFJyqeyVbjAPAZN/LDWX3t03Q2IuBloXrvzLCzbEb8ZQSHLick
         wjZVoMQHTtXvz4vw1/RAlyvVNsRNh+VpRlyNqWqSCCXINDe33Pp6zVKyhLnyomaaPD/x
         aXVZ9XFS4tONH1Tg1EvC/vo2gboSW++0rrXMu3v3lPJ/RiR+BP7dKfy0pdSZS+0qRUsp
         6rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRqM3EYSzz3TzYDw2rHpEO0dTNrU5HQfthFyLVsLp34=;
        b=LktvSezlBFd+8YBHkHBhLlM74suXmUPvWxAXGT+CkHcDxm9/LG/3IknTOLPVH3/fPb
         otkpDzcorh8JG60zcihHuoMU15n+KPhWCSLaL0hThgdu4S61GepxmsdX2DvvtD78MPsg
         mzSRvLzdk5HsmfUHwscve+dK5Is7Xk1g9lQjo9CpmEjNUPY2eUHMxHRM2SeME0RETkOL
         AkEerUGbs32TQC2ZPkkwHvlLFd9LWBOe4GPROBxIEhhsFgE73eN7wWIuo0207laJvdoQ
         RadZWtFyuEudedzb7fKYRryvG0CY7F+6pDraeea4xKzewBFGEKg713iip9uHX28JomBI
         i+Ag==
X-Gm-Message-State: AOAM532l+h6CGUKayIm8eDe3JgauK7GSqfbSZI/hrARPofvgTaCyAtti
	/lLsDhOuHgaOWO4xZawv91+I1aikn8I=
X-Google-Smtp-Source: 
 ABdhPJxtcVelBtg/3l8Vyk6rFQ1LTPuJTSrwZacAz2Q40IdoKuggRUj3kVMIenw5VoUhoHSpYLr4Pw==
X-Received: by 2002:a50:e0ca:0:b0:410:8306:3be7 with SMTP id
 j10-20020a50e0ca000000b0041083063be7mr3386985edl.172.1645114214589;
        Thu, 17 Feb 2022 08:10:14 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/28] libical: upgrade 3.0.13 -> 3.0.14
Date: Thu, 17 Feb 2022 17:09:39 +0100
Message-Id: <20220217160939.1424397-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161845

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libical/{libical_3.0.13.bb => libical_3.0.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.13.bb => libical_3.0.14.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.13.bb b/meta/recipes-support/libical/libical_3.0.14.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.13.bb
rename to meta/recipes-support/libical/libical_3.0.14.bb
index cfd62ea672..756100297e 100644
--- a/meta/recipes-support/libical/libical_3.0.13.bb
+++ b/meta/recipes-support/libical/libical_3.0.14.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
 SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "02543b08897f3b75c76c360a335900ccfb027d2f5120176c777340e67e763ad4"
+SRC_URI[sha256sum] = "4284b780356f1dc6a01f16083e7b836e63d3815e27ed0eaaad684712357ccc8f"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig gobject-introspection vala
-- 
2.20.1


