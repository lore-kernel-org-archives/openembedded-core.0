Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31609C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 00:15:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.4783.1639008943439003138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 16:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dd99jgMD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id o13so6872797wrs.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 16:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwB6dzPqBI9w31qnR1xp4gJdvDLsUx1JboqvleeE3GA=;
        b=Dd99jgMDrEoz6a8fNZhUPT+a7W3ncrTF6aFPeHqsF/cqJIwdwE351iukm5zZYy8IqK
         ze4/I4C2qrwGAyB9cz+WfMJEWxFhxXm6M/Yh4f9ZEtzwB2vi+Pu1wOBlG4M1OfTqNsQy
         Vy81CYAW2nOeFjms0FkGzMdaLEQgd9q9XjGOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwB6dzPqBI9w31qnR1xp4gJdvDLsUx1JboqvleeE3GA=;
        b=Ru6Fu/wJGgmdGWo7tD74MzWh8v07DApolkDaAqRxknDg8wgggi4iJjjbaPk0am3dbZ
         k+cSHJ7OpIJH/YypPu2zteX6dWbijJ8gz700/vhoc1FKDXUawYcY5Pz7xjjSYWOvLmLe
         exU2NOY3SsSZcKYSFKvSXxtqKfKUg3qYaQnFosKn/pKDLlktIWU8DrqDkjuibaNA3Xx0
         4OeyRbcbKVndgqSMvDU8WZ+4w4rtxrr6wYSCH4ZYULIZD4khEPpkP8f4w7+dLdApyyBH
         iTPaL1tZUCrFVmDYqetqS4vfwZ5sg+6VUQT0CPYclk2MHSpeDiWzxcHw7Zib6VtJGvnc
         TJjw==
X-Gm-Message-State: AOAM5337EvrBO6hcqdpQFYS9SviLBhmnlLZs2aZH8bvYvXUlDNnTZSed
	c02ZKyFRwxJGU0GWer5auXQVeWCvfT/LfA==
X-Google-Smtp-Source: 
 ABdhPJxzYiaRPGu2yACgtTtOT9dZZtKeY7E/JiR9G821sYdVnO7RUTZg0AYaAg2U/I2H2mqddmCWgw==
X-Received: by 2002:adf:8bda:: with SMTP id w26mr2376846wra.440.1639008941537;
        Wed, 08 Dec 2021 16:15:41 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed])
        by smtp.gmail.com with ESMTPSA id
 b11sm6951616wmj.35.2021.12.08.16.15.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 16:15:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gcc: Add CVE-2021-37322 to the list of CVEs to ignore
Date: Thu,  9 Dec 2021 00:15:40 +0000
Message-Id: <20211209001540.602804-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 00:15:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159400

The CVE applies to binutils 2.26 and not to gcc so ignore there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 29007d1f19e..e49c4e0b372 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -111,3 +111,6 @@ EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
+
+# Is a binutils 2.26 issue, not gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
-- 
2.32.0


