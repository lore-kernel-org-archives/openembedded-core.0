Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FFFC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 08:48:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.2749.1636102103784105770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NOTYFmgc;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id c4so12539237wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fI1ue1NOxeuZj3qIbb/UHEdtvM4Loj3iTpk1MjIIV30=;
        b=NOTYFmgcasm+EGJIMK2sqbHf9H9DaPa7kZh7lXJXMZ2xlRZFCrx/e6xhCp3GbeUqCM
         Y0MOAmmJvC29KlYUMCDqHO8ltbMZ5P5ypLVQw0m1Bs1oGnvCsC4CjPrh9s6y2gl7FZyC
         y6D1t2ESZRG87J5kK/Gcj5a5INDZyYHhsFNwnixKD9AyYsRYJVzMU4yUhNx7cHU8hRDc
         XuZZOiu/w1zcvTyZevIOsk/aUleMlkDWTUGFR0E/JQL9F/aeLMhuhRGhUU1uK0gwjrX2
         igqJ5SKf6vOv/pomw3eGFi3ZwP6N7vDZx/TXEBPadqJIP8SHfhe1lyRsQU9DbtuiAmm/
         Wjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fI1ue1NOxeuZj3qIbb/UHEdtvM4Loj3iTpk1MjIIV30=;
        b=TdQaFoOcV+8U0HVP0NTp6/t40G/5DIm2wsWsvGTfily4utvrxRYZu+jUY7tNOXn44B
         QwGWfWQwzInNAwf22gUIRLryEqax8+L3Z8m/wM8QCGZo4+mBgRRVZdG50vZXncpjxu+I
         AXx/FSbUqonBIcjeFUpneiGuGZcWyzzdwbHP0CgnqEB0wStqgBVN2hKsSKE5DHQ/JTou
         UbLQ3fHsZQENG3Jto7uS7NZQ0SAQ3Sd3iXs+h7ymRgL26YjayhkcxuKlqRnIwNkiPte1
         6tkOMadiTcKeWNse5jvm1fimBxXFCbwh/CZdzihcuFzMJmdDEy00F7O7PZKQZ9jYxGDC
         F/ag==
X-Gm-Message-State: AOAM5309cRKpELNBLsikeAwDb6tRepu6K8sxOd5oTsnIf9FX7SN3TPox
	+kHl1RR9JJR6UdC+peZDa4ysld4dbdk=
X-Google-Smtp-Source: 
 ABdhPJyilG+X0WKrNTWrCGcl4XWjTG1vZgdBPuEkselA+rYi3vDB9KdXGpwrsdFUeaQXPl6RZtVnMg==
X-Received: by 2002:adf:e54a:: with SMTP id
 z10mr61194361wrm.328.1636102102470;
        Fri, 05 Nov 2021 01:48:22 -0700 (PDT)
Received: from nereus.lab.linutronix.de. ([109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d7sm7230432wrw.87.2021.11.05.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:48:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] libxml2: mark patch as non-upstreamable
Date: Fri,  5 Nov 2021 09:48:11 +0100
Message-Id: <20211105084812.1828227-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211105084812.1828227-1-alex@linutronix.de>
References: <20211105084812.1828227-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 08:48:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157887

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libxml/libxml2/libxml-m4-use-pkgconfig.patch            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index 90fa193775..a5c112db7b 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -5,7 +5,11 @@ Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
 
 binconfig-disabled.bbclass, so port it to use pkg-config instead.
 
-Upstream-Status: Pending
+This cannot be upstreamed, as the original macro supports various
+optional arguments which cannot be supported with a direct call
+to pkg-config.
+
+Upstream-Status: Inappropriate [oe-core specific; see above]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Rebase to 2.9.9
-- 
2.20.1


