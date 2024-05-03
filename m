Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD7FC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:54 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4190.1714704766461127121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JlDUBNNF;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-790f699eb2cso429619685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704765; x=1715309565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAV4yb4QDxE31f7dClG7HZYDcqxP5l0YZbZ31+AbznE=;
        b=JlDUBNNFihczkarwC7hjEBOnAG1Qh7RAyQEzJszV7YkL5sQcquvdR89IxYPohEFRQu
         J++A88XaLuec4l9f2jpGqVNRzrkmynInU8WubTZT3AmxPsJPXjvRT4CEzttCybg1AuUF
         Bi6tHnCKx2qP7z/YaS9rcuK3m8Qolfsu3EP0LNRQsaXf80Ddm1GK9hqWLpg06yQIMySV
         AcZ1HkQD+lBY4TZbDhXGwXNWkyTGjadzpPuEXoHYTPYNlVtLjY2IVYKir5KbC46BOUUZ
         7RHR6uTqkOcVVkLepg3W/Hmb3K+7WDYoGggKb7EiHXTTWRquf2r8ckcmpp0d2hlEnjRg
         2NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704765; x=1715309565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAV4yb4QDxE31f7dClG7HZYDcqxP5l0YZbZ31+AbznE=;
        b=LmU9rcMOth9cfUxtFQ+IrFegJ0sjC6jEo3JHpG5l5hsfrcSMc8fS0AKvP0NMsGwTXR
         kezKpNhTi+m1RHkzZdLfv0K7MePVqt8XMcYkI0jBHP9HjKh3ydZla2pZ9TYL5MIy9MIR
         ZUquQMeAveC+aKrgnShPIbN7vVX5Nl93zr+DiXeNQ8zIHJKGUOoNRkhP8XVa8yoirtxM
         iuU/nSC5Ruzf8rGVrYOnQZE0NmZy5Skt/dK/r4gosZ1x3FfJLoGc6Pz0GZS880v/3VTb
         Ky3vtwz+/uvOKAWEZHwTZbHo0RTiRxtfeo8/V7bSqqb81NPSJA+LRpSPbmFiKn0HaIlK
         JWTQ==
X-Gm-Message-State: AOJu0YzdvY5LaEWrJVasvkOF/g7hs3AOg9GUxc3dlRTD85/mtMsXhChn
	Rb2avQqS8tn0FG38ld+vWQeHPAv8PnzGMC+NcAub+TjbV7TQ01+r
X-Google-Smtp-Source: AGHT+IGSrCgGaq5qhA7oKjwJpwatZpt1h8bgUVvTB1oN6pDfc7u/V33itPQs6Z1zFF86srfqc+8ASw==
X-Received: by 2002:a05:6214:1d2a:b0:6a0:e0c9:edd with SMTP id f10-20020a0562141d2a00b006a0e0c90eddmr1645734qvd.50.1714704765199;
        Thu, 02 May 2024 19:52:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/12] linux-yocto/5.15: update CVE exclusions (5.15.152)
Date: Thu,  2 May 2024 22:52:32 -0400
Message-Id: <20240503025240.373184-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198947

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
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 32e066bda4..f60ba5177a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-12 23:12:55.402667 for version 5.15.151
+# Generated at 2024-03-19 17:41:49.053760 for version 5.15.152
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.151"
+    this_version = "5.15.152"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


