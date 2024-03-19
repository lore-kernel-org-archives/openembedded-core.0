Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB75C54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.30896.1710889309434473580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GsH+2+3F;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-690bff9d4a6so42309046d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889308; x=1711494108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p+kZTuH/dgjw/6ZXKX/pvYc/FpnJgOwFaLkKvMB0w4=;
        b=GsH+2+3FgEpfG8ld1fPAtkKZlQ0fWFGVx63EcpYIz7JhROfgRc0l7Weud3M3MHxnoq
         krWeO5DtPuKwu+YkfnnLW5Ylpew07HwhBceA0IglgoaWKmA7pBtVC7A71PM/yxPI2C+t
         +ITY27gJKj7AaZIH/65N5RMtpi3wQZoCA8isGH5UWX/W4pBV3S9cx0lvzXc0FjhEattZ
         YEU1lBViLr8bOYTGpIbztGUB8A0EsiyFpev6hWJybhFF0PO2R7BR474HgmP2sU9KSTp+
         Opf7v63uNVbSzmPa9oQC6QdAZBLl6OFfEvoSU67lKn/Gd0Md9UIorbawLrQVfnNThFUL
         noVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889308; x=1711494108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p+kZTuH/dgjw/6ZXKX/pvYc/FpnJgOwFaLkKvMB0w4=;
        b=szuSZzvDhJMsApuSWAWE/HC7UDOaHKTvuzDDTmUqCGzWriteILwN1AGKm2mn75LJUO
         IddBH6XPKUfmjfsDptlmboLjB3Z5DJKEC+VS5IcoWtHCjgiLD4s4r08nIzWavm+LtqOL
         e8nA7ljnj43HFtoaGhMktir7g4wOStMTx9atB0Znv4P6ZTmDZI+lyNZBWhfHjWdWf5sX
         6+p4ZeA1LnYfh62uGOvFMdjnUANIbOlGl+0746vl0+vvnWXsYq1SLG7FQvAQrZNm27IB
         rOdc+EVKI/0bhiVjMHre2xn1QhtUcBgaOgZZmSy3B4A6yYWrnXw2hTU/hNq0opBBxyLq
         aHLQ==
X-Gm-Message-State: AOJu0YzAGqyIeVeQt3ouIu59voRzMQdZiGHYdQG3MtbdoiE2D79NMx6Y
	vGQtIaDT3z28Pj6OrtMpJhrnXtyMEoqdGW3Zb5b6KNwEexc9wgwR
X-Google-Smtp-Source: AGHT+IEa6YNxdvMA8QtpQ8tf0GYrwReU8uDdscga9+eqWkNwHeC6QgBIgO2WsTpoxQrCl7+HXOIRPg==
X-Received: by 2002:a05:6214:1847:b0:696:23b5:e7e7 with SMTP id d7-20020a056214184700b0069623b5e7e7mr400485qvy.61.1710889308458;
        Tue, 19 Mar 2024 16:01:48 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/6.6: update CVE exclusions (6.6.22)
Date: Tue, 19 Mar 2024 19:01:32 -0400
Message-Id: <f389b6b1962e7f4e9d5436c7b16e85ef579b144d.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197344

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
index 00e891fe9f..0e42cea24a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-11 03:13:59.040619+00:00 for version 6.6.21
+# Generated at 2024-03-19 21:27:37.303325+00:00 for version 6.6.22
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.21"
+    this_version = "6.6.22"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


