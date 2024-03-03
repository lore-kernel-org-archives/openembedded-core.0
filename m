Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B299AC54E55
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 16:34:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.76532.1709483662721002960
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 08:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PULnZ6I4;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78825d29476so17632885a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 08:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709483662; x=1710088462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThyyXj44uZOLcxmVdsiadHow5tXDg+gp9EY8wxgIZRk=;
        b=PULnZ6I4KjDzG3jELWmTC9RC/HIuqUC+FXP8Mr1EFzXJKCRnGqIRrfIdojsmSgkWu2
         3B3Tp8ckTfusTzPAlRiceET7gDicnlg1HuNp4vL8M3gUmVR4Dcc6O5O5balND9F1web0
         XEexwZDfjvDKfePjfZ+wWkDV3DCrMHSWAnauPZAC9C8ec0tgw5RUFEjJnqM3FpKpBIkN
         27PERgGznQ4lyQkQdbXS8md+0WP4rBtJj8/5bnf+gC5siKc6PdrnbdvLJ87QleFKf1xq
         FE68fGOhJK7GQJ/DGBNEtFSatfMwzHyRQuyGTFgqsqmrl90X5jiIz32gTH2V+2nJZ9Ma
         abAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709483662; x=1710088462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThyyXj44uZOLcxmVdsiadHow5tXDg+gp9EY8wxgIZRk=;
        b=XkzKo4KkgAcxuAOGhQmamYpq6kCbdeP2ny3wiaHffsuxc5cgPj22+IwDVj/APSP96S
         joAHQZ+e0gTTQHbIdtP9LtFY28YuQFU1CjZu+K/dW4qELIbMXM580NFKxmcUe5MFyQ2r
         MumEomFv3H5TzDfHmOuOmEPTIQvRHOpWvYFXZHliwih3nHPsjlgtI1Q0+aRw3vBmDTHE
         Nyn1kNOQuQgA3qsnak8SZfKzZ+v9/ie0yy+89GDkS4xpyGcBSU6riWpFeoDsqhjtxnhj
         p44+LIj62Nfu87J1gCY/m28UN+Ed4IYOf+5OejRRtHFY09NtIUNQkdLla0nPSTpWsnr9
         YXPA==
X-Gm-Message-State: AOJu0Ywyq4f9O4b+5p5Z1Q4iNowsQ057vpKsQlTnNkGo/31fA2+5y3xJ
	hNux4OVKVL/65RtDenACAiWWxCbUYWV8TqqJnFE7wCF1U7ZVdHaS
X-Google-Smtp-Source: AGHT+IHRQg0hNVvwsvvi9I9Jo6X3hNwHZuX/eeYEJYDWv46eexvWGehhoCGuzwhksAst+NeGk0JY2g==
X-Received: by 2002:a05:620a:31a1:b0:788:1c3d:57b1 with SMTP id bi33-20020a05620a31a100b007881c3d57b1mr6387941qkb.32.1709483661730;
        Sun, 03 Mar 2024 08:34:21 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id t20-20020a05620a0b1400b007881ed0f87dsm1146313qkg.65.2024.03.03.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 08:34:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/6.6: update CVE exclusions
Date: Sun,  3 Mar 2024 11:34:16 -0500
Message-Id: <20240303163416.11875-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240303163416.11875-1-bruce.ashfield@gmail.com>
References: <20240303163416.11875-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 16:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196571

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 723a588429..5449b7ec55 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-26 20:14:05.493685+00:00 for version 6.6.18
+# Generated at 2024-03-03 16:30:03.739466+00:00 for version 6.6.20
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.18"
+    this_version = "6.6.20"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


