Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE45C25B75
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web10.3822.1714704048896559541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWfe8XbP;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4dabbf19e1eso2886171e0c.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704048; x=1715308848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd1tyxpYsZOGhh+yLZt5bnlydEejUZe4wVX8AxzBwuQ=;
        b=QWfe8XbPa/GVfogZQR14HrqtOoWxCb34rq+slsMQrQSzLee5+VRBOW/+8rjskIHkFX
         783dm3xag8F4gAkLAHBSIx8PXmOdI1oLmN3mkxplZTq3F6WAHycpoMgQD5tXahAXcriu
         VGoFvilcp5A0FX/K7G97ecygkBth+tVI8E0KsOquzUd6GlR5CjsKH0XZTY6Mh8dHA6jr
         ZDX7R5i9WR15CcxeZr/U9jrQsrLXcXuFpXS75dVNq1B61C1Z6Dc8KlzAWF12O2vXMc4t
         piwe2ZLQmpf09fujeaYgV1THMb0WpRaa1Bc8yYLlPxOZApnXaKVncEfl43vwypAoAroQ
         Rpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704048; x=1715308848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd1tyxpYsZOGhh+yLZt5bnlydEejUZe4wVX8AxzBwuQ=;
        b=CcqbmFRkWvEp0jMClUVocna1/EIAh8+iO6P/1DaHfoeYaW9gnl/r20zXlEH3ZslJgx
         8qsL5X6ii9/pZt3QVeNtDkjkO/NYzrZs74L9YnCQqxLDaVZtME/D4yJtwKrW0xLPeOIF
         JJPP9U+9zzBvGrwlRkNu5TlGHlA4FAT0Kwx1uI0FGUkpS5op8maP1fnLKVAXk/Y9Bss3
         vym/o9uNLtls4gIJK4JmClfC/8llwR7Tr/GulKquS5WT2/5EQXuvtxm+XT/nyfhQde/o
         qkkAtmTJsM97azqvJ+hVKJor4iiQOPMhmT0mQ3vNAMucJcEwEDGkylX3v5pC1W4WaICJ
         RumQ==
X-Gm-Message-State: AOJu0YxVgcTyBLPtquCT1Wdfgyn1jZ2ZtN++DEkz2yBiZoed1i77Xs5d
	0k6ebNUZrMyDMCf7Fe/fguaQUCuQY312wM4GpBE89DBg2mzLk8M0dIcKuw==
X-Google-Smtp-Source: AGHT+IEzSDd3z7qJlBqh5LWktFpMwhwMExKm6zEFQxvkpjqKPy02zMcuqG6QxduxcJs6nWyN09wWsQ==
X-Received: by 2002:a05:6122:3114:b0:4d4:1ec7:76e5 with SMTP id cg20-20020a056122311400b004d41ec776e5mr1478329vkb.16.1714704047741;
        Thu, 02 May 2024 19:40:47 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] linux-yocto/6.6: update CVE exclusions (6.6.25)
Date: Thu,  2 May 2024 22:40:32 -0400
Message-Id: <eedf7b23ae0ac48b1b161b3c688a698d8bac2cae.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198935

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
index 133cab88a3..4a7086a84b 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24
+# Generated at 2024-04-09 14:35:54.393486+00:00 for version 6.6.25
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.24"
+    this_version = "6.6.25"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


