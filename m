Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4F5C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.3088.1639000816229075201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LaaqgvVM;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id a18so6497986wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6UTn86eAWx3/J5z3Xedgcv+ZE/tSuFos+HsBXcS5RLU=;
        b=LaaqgvVMUfKwcJaDL/0lYjiowVFLgv9O6HJm7sPHLzDhxcPzQOz/tbDNBhSve12dOJ
         Aa6ZhIQOUokv45AzEhB4Uw6/Lk+Y9vp8snu7y0QItQpWY3LpseuyNuNQC5+EqcdN9H4m
         Zo5uBSizFR4geV/qr8JNejk1mFAGj8+Mj2nXVa3cBchAakuwesJkHZS42YA3tPgArKQp
         PJjYo8OtAlDCrxOPqK7J3Q1DWFy3TG6s77jBwiotd3Or9FctNCtSGDqi9BgGuN6CQPvY
         p+Z4m6dVJBYgcQPN8zq7V3AyyP7JrdaYJNV5rL0b/NyGD9dBYdK0DzELU7woJccDxCl+
         6l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6UTn86eAWx3/J5z3Xedgcv+ZE/tSuFos+HsBXcS5RLU=;
        b=GoWNEbXVIrvnRYLEOyH3vBmiHxE8ThItT9HhD/25NmqguUV8ylOSmQdCb/NdUq0kwd
         MUgv+dsfpDwN9oJ6W98kfzp7zVtXsl95jxDCPtg99lFkHx6eERbCvkQIxIiMLClDe+GF
         64FZsKpA8u3R7OXzWhI8p9+QAT/BwQSVGG3YKkLfiBUJgktqKnKn2QwBoemhtJvGcCg2
         i1HgIllkAR4lMX6rB1ObgcRWMsxxh5peUEBsiouJf7JdrYzaOocybDp0zuxbeEFEZCbF
         rOxnkv1+doI9G8FpuNTtJhU5PPdBmgQ/kkUhLFqbjanPStFYnT14cYuy6ygdXOWqJt+v
         wp8A==
X-Gm-Message-State: AOAM532Pfyys9T+un8aqha1zTuXUMJg2NnVKt2JFzkIyDZpauWKl8NEz
	+vII47/fqqV2Dw9hZarh/7de5JNkttD3/g==
X-Google-Smtp-Source: 
 ABdhPJzoK0h/gmaua1wGUuO/Dk/ojY7Rmb1ExF9Fx88N4PAXAXPU8WhasPC2Lvq6SQKCH4kbDPhJ2w==
X-Received: by 2002:adf:d082:: with SMTP id y2mr1614406wrh.214.1639000814849;
        Wed, 08 Dec 2021 14:00:14 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/29] libsoup: upgrade 3.0.2 -> 3.0.3
Date: Wed,  8 Dec 2021 22:59:44 +0100
Message-Id: <20211208215947.1979470-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159392

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup_3.0.2.bb => libsoup_3.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.2.bb => libsoup_3.0.3.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.2.bb b/meta/recipes-support/libsoup/libsoup_3.0.3.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.2.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.3.bb
index 3d90e79290..d169810e27 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.2.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "98ef53ed9b4815ec05232155371af803a9928f4652acc685ff02086be16a3ff5"
+SRC_URI[sha256sum] = "5165b04dadae3027e9a2882d868694b4586affd778c194982ae4de2373d2e25e"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.20.1


