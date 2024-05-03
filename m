Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7FEC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.4189.1714704763766109569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fgErUqkg;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a0ce3e823fso26063966d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704763; x=1715309563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=danxkV8pUt29LCe5lXQBrB7VQZhsrOIRIM89B2txcLw=;
        b=fgErUqkg0bXoSMkXlRes+tWc6GaS6uONzmRigpJpiKbm30B5atty/zQU79A0qJD2Wo
         BjcSg2Ii+L4Oq4mi8kX8ehJpRn6WQGyWn07+4TBGc9zEz6y3GUry9QVLzsdt/fXRCMME
         2vtjJqVYEU7zn9/c3PD5ov2VZyN1EemMRJIZuzt05iQmf00Jzs0E1VH4CE0tZUjT/zgQ
         zN2LkpTEQLlx6RsTU+YyomH3wvCl6Y0QIJyAAXRQWIPCSV76BHcJgHGLNoKXDeFOZ5bj
         TqcelvPr06mDPDzB6YwMGghWMQxuEeowKHUWtL9nroFGF4fykuPmtwVSLrG5bIZA9/Qd
         pIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704763; x=1715309563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=danxkV8pUt29LCe5lXQBrB7VQZhsrOIRIM89B2txcLw=;
        b=uXbvmH8iXqHkKBDiTI3u2+XDUeQcpdoOsaKb4zRq+q5twS2tiHo+HpX/pzoV+TqSYG
         KGEF/VG369Klkn+Us37qnmsPckDDBp0G5uK7lp9R+8D8C92mKu5WErIo1UqSDxlMAcxA
         AR867kHvBolZURdTdLwCBZ00fcjDxHZ4mPBSHFOJPVT+2SBo80vtKZ+byOhZKtEK6BZi
         727KofKQH3M8SQGhGJqPlZTD6G83WQ4CcK5Nk4x9XigTz/m2rdeM54/gOVH4mRM140Go
         uoueczYH39dgUv7Idj2E4riZDlonPhGQf7GOOfk1k9T1DBK+MRBMKPQ442OD6yI/CzZ0
         +yHQ==
X-Gm-Message-State: AOJu0Yw7HbLyUR1zB8RH1DRuXh8xKm5ZfYAuvLGIZRx6JR1IPvRygTi1
	2kVCA8+iQ0goDM9DYVJibqPE+sr8bYEBdHskyUEbP6LwcgsOami/
X-Google-Smtp-Source: AGHT+IFmsT28VMW+eryW4vzBjEkqNp75QFN/6L3TCBXwOhFW1ibnIk6N3mbBz05qdDvyAVURDM7ODA==
X-Received: by 2002:a05:6214:dc1:b0:6a0:a745:b2f8 with SMTP id 1-20020a0562140dc100b006a0a745b2f8mr1805715qvt.27.1714704762749;
        Thu, 02 May 2024 19:52:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/12] linux-yocto/5.15: update CVE exclusions (5.15.151)
Date: Thu,  2 May 2024 22:52:30 -0400
Message-Id: <20240503025240.373184-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198945

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
index 922d7f457f..32e066bda4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-08 10:36:30.059302 for version 5.15.150
+# Generated at 2024-03-12 23:12:55.402667 for version 5.15.151
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.150"
+    this_version = "5.15.151"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


