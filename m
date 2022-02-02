Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456C1C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.2297.1643826508502791845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fHg02sU1;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id r10so437534edt.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6x9PU4K6bXgukvzizFlYv2a2KYObPjSjaS4t1COnNNw=;
        b=fHg02sU1Q1cW4c14Em6DWDAszbJzZpwY0MW4jR+vZWN2aa5McexbwmtqV0DsAngLqJ
         Ssj+E/DITpvKa8zhgv9Xgv2xcVUpPGeXpGIASfgCbm2MYbwedOUiNFbXQjMdh5eZ1aNz
         djKR9gsQToZSjvEwpNIRYjzWQWqlkioCERVw3Q/hqr4ZdIypEvayCOOPc6PQbklkfQ8K
         ls5gptonPggEJ44euOeqaHD+zpJ09qPYZdJppCj9DmU0ipbogOhwBwLcOgNCo9MWAg9J
         CYmeB7kLgquUrRgAvM/HX7HzvJ8at8e1biBguhYbgDetPWbXM2x3m7A9rqBi7uVOB0Pe
         Mnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6x9PU4K6bXgukvzizFlYv2a2KYObPjSjaS4t1COnNNw=;
        b=8H1SdaPdcvfcVwZdXh3IH6cU83gp9rXUgk0ewSCV87hsESTFpozC7P4wkz6yimTl+B
         ktFif384j0sJgRNr1S93K2d+OritzN4K1FVcsAcmuhSkLTD6fDD0EgEDVU9ZA2ncgUkP
         x08z5iynf6p0hln/CcKk2zVQMc+0McpFnKIa6ysh+NtkbU8GI5apSvI1R2ogHMESUgYV
         Qa5++2gF3JSbqUJrJTsqoLlbfppy4Or0hrrsh3Rn8i1+DK6ckbYzzLil9/XifxQhkbYi
         5ztr7lMxF4rgCX12cE4lch6CJjgTstwhNGCDnQiHIMnFTLcDzUXndriczBAh7cl+O8k0
         4Bog==
X-Gm-Message-State: AOAM530AsUPMVGlyg4tZNrLPrwAw2HJEjUuLBNW1SSnNM933Q7h3Ft+j
	ZMb/Uq/FaWNtsjU5xkzIylpP7AlGOXI=
X-Google-Smtp-Source: 
 ABdhPJxUA4FH2yqer03g+dkVRZVcvG//UrwV9JsjryAmZMitutqCtD/BCnLyqjaxLr67dl/tBgF5kA==
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr31174248edb.238.1643826507131;
        Wed, 02 Feb 2022 10:28:27 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/33] lttng-tools: upgrade 2.13.2 -> 2.13.4
Date: Wed,  2 Feb 2022 19:27:53 +0100
Message-Id: <20220202182758.919991-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161253

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lttng/{lttng-tools_2.13.2.bb => lttng-tools_2.13.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.2.bb => lttng-tools_2.13.4.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
index d6ce2c7e32..98b91270ba 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "ced2ba00020da77fd17ac92b5a53825502409a07e3aeca28f9515d4a844fd7bd"
+SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.20.1


