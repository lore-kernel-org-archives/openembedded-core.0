Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91500C0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.58037.1697817116015317379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wmcIZFdk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cacde97002so3806985ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817115; x=1698421915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jClcPtENd1hj/vOnPWZFW7UjaQn3eO+zP0CZnaBaK4M=;
        b=wmcIZFdkUe25B3KPBK5dA5k/0w/dM2OLFBHHTwy4G5Dh80PI4UDXJnkuiL8Ik3tEBo
         tANtT8s/FQcwVqA0rerqIYIu5T4pSxAsSsam32TW7gN4rER3gXM7f0FGVIg2i///7aE7
         AjQMENk9U3E8lcf3YgFfRm3DsOAxdG1i8utJHAwdIIAtM/ivtZb4Y2azf5FI0448U7XV
         mgEUSvnMX3bFZrvAzdXKFaNpRPh+hgM5ELWZeerYvq8yo9vmIonxyOHpInqoPJF4fDno
         IzE2mPzZFA7ibb5N23TckvSm17axKhTMyF6Emj+L79+VBXicAvwfkxm5oKk24Jbf72Vs
         al0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817115; x=1698421915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jClcPtENd1hj/vOnPWZFW7UjaQn3eO+zP0CZnaBaK4M=;
        b=RkHhmWyhnf5qm0vL6lVErXb/A0rnrV2px4vkW2HhJf7G0RZt4ODIS0uxYckR38WDuO
         ey/EZVKi4IJu7FIosRhZZZXI8227jnzsWYI5I3sThAwKcmfPmZLSr3ZhBhxbQMZiXdBQ
         romKhrl6FKR8Ucpk9uyj/LHHb6JI+eJ3y3UZSnzzWIfyASdTQGLNicskHh2VMegmzHZM
         sOmo7Ps4LAkMaJ9+rlrvoFliYCBybv7sGKh/NLz4WspbhNIjKItv3XYKpIjewleNPjtj
         8+/x9r3Mq1rU4P/X3ne1bhGHfNhuDIlkOhBtFBOdtzoyKj3ZguHPChSqw89JCWUkvYXn
         4FCA==
X-Gm-Message-State: AOJu0Yy417dFMoKc75+tyBH4XXJkJjuDwrQq89x5SjF2YUgpYQ52aODg
	YB/0fDAt7CBBERyyS+NtpEEWJrifHIX+4iP8eZs=
X-Google-Smtp-Source: AGHT+IHlAO3Y0SI6dABfvOK5fBP2Ba36+2H2YdZ7jtoWwDROoBPDUWALhfSwKWYwbXkBNTqTgyjfmA==
X-Received: by 2002:a17:903:245:b0:1c6:d34:5279 with SMTP id j5-20020a170903024500b001c60d345279mr2249082plh.13.1697817115193;
        Fri, 20 Oct 2023 08:51:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/24] cve-exclusion_6.1.inc: update for 6.1.57
Date: Fri, 20 Oct 2023 05:51:14 -1000
Message-Id: <b7c6d43fbe84de9732329deed627e94ba5974213.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189557

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index b6b9ca00d4..d172261886 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-30 07:26:16.988526+00:00 for version 6.1.55
+# Generated at 2023-10-18 21:33:08.698393+00:00 for version 6.1.57
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.55"
+    this_version = "6.1.57"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


