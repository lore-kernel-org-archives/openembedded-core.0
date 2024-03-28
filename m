Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B12CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 18:43:16 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.4474.1711651392678956421
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 11:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iUh6aD/j;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-690b8788b12so8235076d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651392; x=1712256192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpYy+TwCL4OXgCdaKSiHfL/9a6XSx5PYcC5POlAiOhM=;
        b=iUh6aD/j7wPkmbuPWWmjt0rexBF4z39hUJO1FprbRfeIP5snCkGxvY5mHxxFESXKC2
         urjIcmfL72jQXC7Fa1LVnpG/48qkPbtGglQrg1U4/GPb5tSGOJcNOOi4pN5esr4sFVpw
         /6N5GDeATRehCSMsPgq8LwzNKuA8Ln2wG8Fry2bNstVbQ1DWI2VjgEonDdpQyi7dVsRi
         EddB0frX/QG9Jr5PTopKNgGYLsa4cA0VDgOqPw3gNq6xoAzSVni7tXgNuE8aCiYDV2uD
         gOHY7OewldpQvuGxy0kczQ2N3qbnunZRwTHss49gFXQEXZyndaSxqEUd5iDeR20Ew0wv
         ugaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651392; x=1712256192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpYy+TwCL4OXgCdaKSiHfL/9a6XSx5PYcC5POlAiOhM=;
        b=UT1GAmqT1gMBFlyk3Jk2HjgxUC8cJZ8n5l9PtBVeJXLOGY45+RfPQl9OZxQZikS/oA
         DgkCTG69QBRYtqR7qqhXokYtBJDwljLyRxtwmhoZH+iHxWWGh5c9g79Z8fogt8aWHYW4
         w1puX58Y1hQ1tnKL5KvHgCQVsRIxycyDw2vjJRJsIKhxXrp8C72v8MOrzXIbTdoyHRhK
         Wsm/INeZgOZPhLgEdwUBd9EcciVSgNHZ9e32SXXKKr0YPGdTwzNloc10GJXWSWMfW0S3
         N1s3xIBMxUT3g+MdtUVMqelFRhU8lyqFgVmvawXCfgnWhdvzECUdfAX6VJfPsKQKUI37
         q9TQ==
X-Gm-Message-State: AOJu0YxL2hGH3MyBC5LxJVkGQFmmQYsLaMKvsOD+OAEBzHJCxwfgvch5
	NKwkVh7qvp8XoWdgyOkwuQ8QW3clkEItWkoZvA4RbTC/+FF+inIWPbThV+Ver/SozQ==
X-Google-Smtp-Source: AGHT+IE+qJrUNOASpSy0LOBJPblGDfFIrypOWKcgP1GV2MXzKmuX0BrRiP2eH9GM3oq+GDJ6/ywgUg==
X-Received: by 2002:a05:6214:529c:b0:691:3549:340a with SMTP id kj28-20020a056214529c00b006913549340amr53705qvb.42.1711651391699;
        Thu, 28 Mar 2024 11:43:11 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id oo14-20020a056214450e00b00690c9256676sm874425qvb.49.2024.03.28.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 11:43:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.6: update CVE exclusions (6.6.23)
Date: Thu, 28 Mar 2024 14:43:04 -0400
Message-Id: <96b3911106d73ca852c6f17736a14c57b5e916b5.1711651290.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711651290.git.bruce.ashfield@gmail.com>
References: <cover.1711651290.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197605

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
index 0e42cea24a..bb9ba49c48 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-19 21:27:37.303325+00:00 for version 6.6.22
+# Generated at 2024-03-28 16:40:04.102652+00:00 for version 6.6.23
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.22"
+    this_version = "6.6.23"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


