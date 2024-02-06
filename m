Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D9AC4829D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:45 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.4388.1707252822339033806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JELa3F7p;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-783d4b3a026so355902885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252821; x=1707857621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oYeVDid580g2UNHIISWGE04ruUu5BAJklNijtR4KGA=;
        b=JELa3F7p6VS9+d6RpPSMU8aDCxwJTG/vM8JgWdtltNtIfsklQH4UAjP6u+C5rHycxz
         YaKbqn2xTmx0UCgtnezxXnml8t34AWhS9XLSEooF8nlAxITlZwgjute19KgcxvADbF5V
         J4Z4CZTDL5YrQVqorbiaXwO82f74XtToDNmvTUdLpTMde/nzB7+8XYV/0I9gDj1ff3Bl
         VlRElFf5dDvzoa4B2qNKiklcF8CrhKYukb7gIr36hEyXTJy46OEtLLLRxPvnd4uiyv83
         SMbucfDCp/zYdESi3fksfKu6pSFBRS2UafkAiOj8RLitPs9WcG54TVj7/UZzfq7DINLx
         IkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252821; x=1707857621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oYeVDid580g2UNHIISWGE04ruUu5BAJklNijtR4KGA=;
        b=fiGiNx8F7uAlzB3r8//zIB63o1YEkJxwR3iJSFBClF9m+LuapKH7iWOztxJQJqHbNR
         y6QfIg7uQlaXQiUmtazBdS8Wp/sOp99QqMBvITgCNnW+nGQbSYAyFNyeuZOfjK1/P6BX
         wDYMQR4JxUS092H3KquEqVG4lLwuMpIOUdpH66X/f/X9ktr1NKQ0bewVw2J2xkIVTigg
         ZJ0oIcMOpQDsqiqn/T2IySTZbxvVpL/6dgZQ+xTn+V44qB7axYCZCDXZoI3l4HxTulOY
         fk9LFymHJOiY+He2+GnoZf6Z+LZ9p51OQ3+cC4bY0GRYB1gh/wxXj7E4nTF3eScvY3tk
         OWUQ==
X-Gm-Message-State: AOJu0Yy95/VXMdG7V4cPpAGM98RoHnkrDojYw2VuJeVbEnz63D3I9szS
	ncy3HhEsNVwXuzgaDIe6q62Pz4tQ6p64G5foHKNU+5fD1zW2GZBuDg/sJ6eFO7jcEA==
X-Google-Smtp-Source: AGHT+IFiVuM2+dK5n38CUm7TYAD5GiSeb+bJpIMagaMXdYGACwAmdfQ1q/h5us6X4DeiOujHFtpOig==
X-Received: by 2002:a05:620a:22ad:b0:785:96e4:2143 with SMTP id p13-20020a05620a22ad00b0078596e42143mr1108783qkh.60.1707252821354;
        Tue, 06 Feb 2024 12:53:41 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/6.6: update CVE exclusions
Date: Tue,  6 Feb 2024 15:53:31 -0500
Message-Id: <b5e1cafbaf782e9f6e7955ed27dbfc7a46c2cb55.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195030

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 15Jan24
        Date: Mon, 15 Jan 2024 12:48:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 3a4451b6f8..9398434082 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-18 21:07:26.764606+00:00 for version 6.6.12
+# Generated at 2024-01-25 01:32:27.591716+00:00 for version 6.6.13
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.12"
+    this_version = "6.6.13"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


