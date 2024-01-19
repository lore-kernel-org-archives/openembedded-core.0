Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3248C48277
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.6081.1705698866720425084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiVtN7mN;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6806914dba7so6707616d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698866; x=1706303666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJU/Lr6hhLd58bClo6cE49xbqTWVrgP9KKcaDIuI/EQ=;
        b=BiVtN7mNZNK/6uIS83fCn6V5Zs58hG7C1qBSi22El09d0pndO/dfl8V7n7mnsjoF3J
         Pd9/h9Zrb0FXaNZzDiz9Xl6NjgscPb0sayfKa7PfkAV6gsqDa+CWhmbIwdGdmQrP53Uf
         MTt0Pdo5rSZWwcGeNbk7ug7b/sme1Qimdeg02Uy3g9Q/5mEv8I4vLH+9pZXp733eArwi
         a33zduQDaH2uDXgLkmVhFPkCrxVgi1g98qX7nYO20972y0ffygbgR4hsQkedas5h6s6p
         71+xAXOD4iOLIX1KbYmpUR6oW9aTZwbkYOh+g3NnWNvSX4HVWeHO7dBM1zPoqWjAWX+W
         Na7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698866; x=1706303666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJU/Lr6hhLd58bClo6cE49xbqTWVrgP9KKcaDIuI/EQ=;
        b=hvNeGATk2fQ4Zn92yeTZ8KmGWa9W4lYgsSGyzi+Z6boPnLnYD+sy5fCRIObmQm/ZwY
         UOI13TvE0k4lZy6ES4uvkM4nY5IzG8CDXlV6z9lOJO7PHuQEvxW0iFwG1HjHwvWWvSSF
         MShrWOvILcy5LxA1+HmvNp8ihkoH1Qr1KQ8sFL5a0NQfopBvBJnmMUGxS3rFDgT5sNA6
         zxLPITRDOCPSojW8fW+3aDvJGCHen4FiDppohK47ODbtD4exPLZ8GwTyt4kCGcuMkvOK
         jr//abis80qhDxvkW/icin1G2IF1f5EU0/uz5DnVendccQdZtxeEksVMDlLjXqt8YFd1
         8cpA==
X-Gm-Message-State: AOJu0Yyb5Taz+z6LL0jlGenbuQvVN5sUiFkJyZAEkDHQ1F8p+u3/pE5+
	L/Ow3dlVt9v7f5lDDkBxdYBjBKThEZ07O47PHTAH0uL/9o+MSz/SiCiOiOVzWtg=
X-Google-Smtp-Source: AGHT+IHriAONRowfm637eFxHmlAG5ni5lk/kW3BY0n8tkQ2XRhj8O6KbgAgqw3m5UagnQBHD5Kl4aA==
X-Received: by 2002:a05:6214:21e3:b0:681:8739:9171 with SMTP id p3-20020a05621421e300b0068187399171mr507039qvj.119.1705698865763;
        Fri, 19 Jan 2024 13:14:25 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:25 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] linux-yocto/6.1: update CVE exclusions
Date: Fri, 19 Jan 2024 16:14:12 -0500
Message-Id: <e448aa602a899d30384f63b57ce5a124fb00d69f.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194070

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 27Dec23
        Date: Wed, 27 Dec 2023 19:47:13 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 8d345831d3..9e0c5bc49e 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-03 21:24:21.156991+00:00 for version 6.1.70
+# Generated at 2024-01-11 18:31:26.124059+00:00 for version 6.1.72
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.70"
+    this_version = "6.1.72"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


