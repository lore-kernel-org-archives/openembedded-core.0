Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08D8C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:41:04 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.3828.1714704057394855392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kaAXuLrl;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-790eedf44faso410606485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704056; x=1715308856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=as259wPBSvBWPDJBMpa3ab6XvtUiGlrKUzooSRjSXHo=;
        b=kaAXuLrlcY1ZnowZwOO3iUmJHMke1t9q7Ef9jl21r7X7PwQ7+5j72hr8opUiqwCLRj
         J54oV5OnpXIhW5UPLxbIXXMGSylNqR1NQmdRaALgPo0bep+KmvI5hP1JWfM83WYY2SRh
         IEbzumXYcoe6v0xuOaotJOLU9a433/ntAcBmmfR67sMZF0+U4G4M+iQkyXdqUqUXstyf
         9ltOpZ8kfgJzHrKeL16RxDEt6Lu/x3dtiP01WUX4mhD5oom2kT+d6uJH9YcS3siYX6z2
         7FsenWv74ProckKgCi5kN38qhQxPDS8bElaFQak184dgfjGureVdE3S+Tmu45BpdBmok
         7XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704056; x=1715308856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=as259wPBSvBWPDJBMpa3ab6XvtUiGlrKUzooSRjSXHo=;
        b=d5mntRxE5//N/uUDyxx45D/et9iJQkeDvzZXXqVCcET5nmHcj1zBqRbSsV+qwqtFYy
         PKctzLnVUsr1o8ayRsoSHIhmkSuLF4GUE7bub9m9oqc4JeW/kl14TwCMEU6HYPxYL2xD
         +3GRo0364ihrGsPqIDwCdWmUVxrOfLWa/lq9WezE5sNvRFEhxIq2QHnbK8TiWKrSiPhv
         N4l9VHQRlPU/Gq5vBuI7BBfxGPdxDxdoVM7U+W+KJ2BH8MLwTMqoTvb3QUvaPyAd85ju
         /IMQQdaoZbmtHVkaVEAjqcxh4qP/03Yyc6ZFlzdIz+l9x6HB8U+bJz1Af+kzhj/VIju7
         K3Ew==
X-Gm-Message-State: AOJu0Yzy9SRrzZ6g/HUjhGBzdu1zpUlX+Ycj5sQFCvz3qdMPrymtelpi
	Vk7nKZ6rO2ZV1GD51+ChZ3tInfqJ2c6IcTnVolet1ZMduapyI2YE
X-Google-Smtp-Source: AGHT+IE9LVidaJfjIs/+DBTmzqP3Soe/wLRvo3yc7HQXoQg1X8k1b5bBXvJ7+j/rn9JsnEG22VAeoQ==
X-Received: by 2002:a05:620a:294a:b0:792:7d61:1dd9 with SMTP id n10-20020a05620a294a00b007927d611dd9mr924929qkp.73.1714704056364;
        Thu, 02 May 2024 19:40:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] linux-yocto/6.6: update CVE exclusions (6.6.28)
Date: Thu,  2 May 2024 22:40:38 -0400
Message-Id: <af60fdc8b3f9540bcfc9888ba743e2097665f904.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198941

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 9e5be066a5..df09c1fd1d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-15 16:05:11.813475+00:00 for version 6.6.27
+# Generated at 2024-04-25 18:59:44.140399+00:00 for version 6.6.28
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.27"
+    this_version = "6.6.28"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


