Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2CAC27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:28 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.4250.1719778108022759355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tHkZsGJO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d63332595cso1040012b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778107; x=1720382907; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXSwsmPNdWVyMIAWfcKRRtisLk1sOkfh3q5I9laWv3U=;
        b=tHkZsGJOniBIKdcsR90//I/9yKRXzD8zYLOtkOF688tPAC+xb74jxCPt7ugIafmsJM
         0NK7S1aQJlfTrDrdst5yg4Xu8JSIHnN7hA0lIQElKnx3KarCglfUc9R5wylHIzBtk9n2
         zbRLfsfYb+drohYT5hKtWp4QtnsnZLkmUoghFxprwZuszX/o6FAVDUsAg7Xn738nJxej
         Y6IqLgaKnGXjx8LjCk0S+7QxYZYOXgaMfqZXCPwVMiKS1orFFkIX776G80nlwmvZHs7R
         SWjtgq0UOEaratadX7eKhR+PN/8fI2GALD/5qIjo9BIzgyN73Ly1vpBe+feA8ACWWFHb
         7yMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778107; x=1720382907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXSwsmPNdWVyMIAWfcKRRtisLk1sOkfh3q5I9laWv3U=;
        b=TdUn0CrL5rTvWy5wIiAgWx5pdZT9LLnrZePSM9GtfELZS8O6Eb0S5OkqyUKWrChn9Q
         qPpyfCtXCZqnIpctrgIzO43RTGKx17NDBd8jeIc2tOD51A1nCLgEgBf1DZcSmnlHjaIp
         UeiRSiQKzqnr/hzfYmPBrBKVjBw7O6vSTPhHMU+bWMPD8tj3fALAw2ddcRhj/O96XknX
         R2kpLELzeP0Mg/wBGC0TWaFBONiHAqlc3Q7P7muDwpirtPwCFQK1bRdC3kl3MmJSsdBF
         t/oaIxROE5D+4eFIA2e06H0c2ip1NKQWqqB4xmWVN2WfcrdbDmVxquyj0wNjsAMC8o+s
         Hgjw==
X-Gm-Message-State: AOJu0Yz7LL5uipnCyq9H70r+kEBd1wmDWchVgvASOTC/hhER0gYclLUI
	rhnHioU/9qNIMngGZmcxpfxl9wLRcP47rdyvZ/jPvcsd9dov6a/LG0luKAOeFLfCo51YzMGCV6A
	HcfU=
X-Google-Smtp-Source: AGHT+IFwgZM49Y6ujeA+C2ztrfR4tU/IIj40Qh78FbweyjdcCaTGtHQKn38lvsUPMimjrWGrrVOXgQ==
X-Received: by 2002:a05:6808:1393:b0:3d5:63c2:17c1 with SMTP id 5614622812f47-3d6b2c1ebb3mr6045604b6e.8.1719778107184;
        Sun, 30 Jun 2024 13:08:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/35] linux-yocto/6.6: update CVE exclusions (6.6.28)
Date: Sun, 30 Jun 2024 13:07:30 -0700
Message-Id: <aa8325d9a499039bb2701ad10925c1aee02a22e2.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201255

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f0683a02772e83ef1c54a60664f68364079540f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


