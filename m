Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DD3C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:25:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.419.1677183915199688657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bRY+L0ov;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id s12so12358677qtq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUMSgmaLTNmQEVEtVf2jAX6QFL5vZQdwbt3SkIedhdI=;
        b=bRY+L0ovI4+8I5brT5hdj/R5OWxSoQcBEYGA3I9ZU+gDC8R9OFyD61pb0TG0/9L+Iv
         Pc4wGCuksgqXlHR3B7dZwZseL6QbVm+NvqunpJfH5Wy963+Y3Rc9AVtycJaDP9BTQxq8
         5xZwbBPKjCWhMOlPTZPpCcT6se50TO0arMV/5+Mtcx2HZv0YCx33PcB4uqzk5PjjYD/v
         QuzUv1W4QMdziZsdPEdyb2ONJjg4l8vnF+iT2EikCvsA4ZzT8/Xpxucre8igmO6AtOhW
         xttd1nzhCDu3aak5HKuXhqTWBqCENvfAMKE/ou/s5YtUz1cpVjL6FgFcgI/lY6GnMyGE
         nfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUMSgmaLTNmQEVEtVf2jAX6QFL5vZQdwbt3SkIedhdI=;
        b=b7h+XpHZHHP9BgK4nTQN8ysLtuQ02WnpEybSr+o1HBALYnB09QctMPpGY6GL3mc9Yd
         w2GHGkqSE59r9fFwUWO3qpqj0yOScA0nnvGjAZoxrPumOAJND0NtpIWVQK1tewym8i6S
         y0uNsvKdvzjgXeYSQPvbDFy6EMNj75v6rfXvXQOgi8Jl7uqzTRIoN2UTx/h/UpZ02ggT
         zupqKH2npkgvPOnP2KJBPFsGsmROOdrnnw9FrBdmJyJ9EkDAPpRKEBA9DqLC8PJXnU11
         WnO020zc0LQhirdVHa31SNTNWLmdz8Ym47sn7wD8q6PKaPsIt9RhJ0ChrGM7taQuzGYZ
         ZiXg==
X-Gm-Message-State: AO0yUKWXBZifcpO3aZQIZQ8xsvnADx5IKfOUgSLRCoCL4Cmrj+liyZvD
	ZL8TJ2R19P5mI+WK2dG5esegaavvHfw=
X-Google-Smtp-Source: AK7set+qybSBM5m/nSBIwWPpRmtvpoga0n8KvYdw62C3sRe/IkO4Q1CYxEbKLrf9msU/DsJEeqO4lw==
X-Received: by 2002:a05:622a:1196:b0:3b8:6814:ea20 with SMTP id m22-20020a05622a119600b003b86814ea20mr24630113qtk.67.1677183913863;
        Thu, 23 Feb 2023 12:25:13 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id j14-20020ac8404e000000b003b646123691sm4658210qtl.31.2023.02.23.12.25.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 12:25:12 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] dtc: update DESCRIPTION
Date: Thu, 23 Feb 2023 15:25:09 -0500
Message-Id: <20230223202509.32432-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230223202509.32432-1-twoerner@gmail.com>
References: <20230223202509.32432-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 20:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177629

Update the description to align with the current goals of the dtc project.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-kernel/dtc/dtc_1.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 7d064ed127c1..4ab8451c60fe 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Device Tree Compiler"
 HOMEPAGE = "https://devicetree.org/"
-DESCRIPTION = "The Device Tree Compiler is a tool used to manipulate the Open-Firmware-like device tree used by PowerPC kernels."
+DESCRIPTION = "The Device Tree Compiler is a toolchain for working with device tree source and binary files."
 SECTION = "bootloader"
 LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
-- 
2.36.0.rc2.17.g4027e30c53


