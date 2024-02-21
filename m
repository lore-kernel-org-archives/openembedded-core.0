Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6502C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:18:43 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.4189.1708481921136240057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEWt7fQy;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68f51c5f9baso20439636d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708481920; x=1709086720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCchhXYEPJpgFTve8lmUPFt3cwjHiaEvy392/uykWQA=;
        b=OEWt7fQyj4+QEM6ZfmP0z9D7b58QjXSFnr9bzFbQGOMYzpkRWhKajr7TLE0u73IRA0
         KT7r5yRdztX2wNsfWUmf7ZMbVA3mo04URrn0a4FS3NV9PYtRwhv5p29iKUSzrNUUQqSZ
         ZNwbKPWHPB3UaoETwBHumj4exjf3ahhE/IKuLoHB3zfwcqIWR9CuPtpn4qI1X2gW4PQK
         HskkZkYmG4xrX92wXEzNe8rgeqVN5+LKNPIG4CxXDhbdI7F2tHJY1p0PgMdtJx/q/Ir2
         mkxOzsmIkpxYfXZR3Z5ZmOTHSvGK9uT9Tb/fCfgzRVZLScgnjIwrFWzHd32TC33f2L7W
         fmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708481920; x=1709086720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCchhXYEPJpgFTve8lmUPFt3cwjHiaEvy392/uykWQA=;
        b=suv4noztTUXkUPVNfeAaXIZAuQEoQV1QuxkgECgzaVg67ABgBylnSpBNJcW3xq17Ds
         I0bRXOX/D9zRT06FUXXxB4cqz+pA2XaTKTco+56TODgBEHZWSousynXePkvskRBWEY5+
         dACFx6PYQjT5xua2ydg1jivVrcD59uqaYvBcUGeZ844ZEvPwgcqyjpMkC/S8xDkzRsEY
         UzaTmsOZ85eWLWD+9jEl3KDszMBvLHTM0PV2MBVFbuOy6ZohfjF+aLVuboDjFoEejNtB
         zPwDKNg1ltqu7p1c/WYCDUjlzNW9qgf6dpWjovRe02467b8yVr+ba6pqhJcXAklFnq6g
         jkjA==
X-Gm-Message-State: AOJu0YykKZSXc1zyCiu3IwENpAUuZYtynae7pczy8gVysnDe/yyHV1K7
	jQXuf5X1j4tgeq7FaOWRUs4YGwcArGE6CJc+xnN0ftTElVdanOaWCcDU4s99
X-Google-Smtp-Source: AGHT+IGbh+XzJQ9pcVWPr110ZCr0M/ahzzbfi4pzJMDAzKtB3lGo5FhommUBsTzHSxZRQp0epUPY3g==
X-Received: by 2002:a0c:cc8e:0:b0:68f:2d61:e72c with SMTP id f14-20020a0ccc8e000000b0068f2d61e72cmr16513792qvl.28.1708481920053;
        Tue, 20 Feb 2024 18:18:40 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kf10-20020a056214524a00b0068f8d38135fsm1470360qvb.133.2024.02.20.18.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:18:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.6: update CVE exclusions
Date: Tue, 20 Feb 2024 21:18:37 -0500
Message-Id: <20240221021837.3233387-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221021837.3233387-1-bruce.ashfield@gmail.com>
References: <20240221021837.3233387-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195935

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 9Feb24
        Date: Fri, 9 Feb 2024 18:02:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 501e9541d4..0274496da3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-14 17:05:05.638255+00:00 for version 6.6.16
+# Generated at 2024-02-21 00:38:40.167585+00:00 for version 6.6.17
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.16"
+    this_version = "6.6.17"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


