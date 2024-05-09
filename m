Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E97EC25B4F
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:30 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.8391.1715256322882922855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hpRLhhMz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f44dd41a5cso824647b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256322; x=1715861122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8xS94OyhNVzID9bHH7tBh5m87XGdo3gD3RGFCgYo3g=;
        b=hpRLhhMzojRXDs4ItmldN96q2nTaLiNRusi8BqqUT1hoM5FpK3K2vVHld/Tj2422vT
         bLYiUTL3hudkA2W0nuHMWdx35phRewHvUV3Pwsv36TEx8U01gDY2CrdhutJRlYOlqtXS
         F0gx59yLYsWt3v2wG5wZRXVQHlkUzWbLaM11UmyYHZwcwx4WxwJMLW2nmIDKYRUfUmlZ
         30wAiv0E1N/eQXiYshwLZm0oiMdGdb6N9iPW888Eif+FPN1RFrGVvcTeyTTp2gMMp/il
         gWA4rtMEeEWjOK+37HAWGiOEXojhk67Yn+SpMAoKpbGJpbLxYdCJWeKAt44Y2DlepYuX
         Kxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256322; x=1715861122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8xS94OyhNVzID9bHH7tBh5m87XGdo3gD3RGFCgYo3g=;
        b=D3fWic+lDA/xKxiJnurPfXZnju6MdXfmEhyBM/PPBwb/uZhmueQt3ffnCS59VSPQl/
         xgSkeiccSvquDuUTNF+4n1uxyJxdruIKjc5PKGayHjDLTS45/c04obGN6YMSzx1FquXB
         bEp51pdWDIgG5LZFQpHsYPGVZ4CO1k3b0D71zlKgfTbsoPjyZXJeg7RPb3xzz+4LwIBV
         UwMvSpk161a6KvTMJTQF0NDSa5DEF8p6eb+t9y5vWIzrS6XDbRdEKpX7DAlZv3y2dXST
         IbjWVT4A3vznVYyJpNRVlcd1XPpQrYW8cV3PtH3z3aWTCZaTaQMcXqlc+y00V0b/Vm1W
         QGnA==
X-Gm-Message-State: AOJu0YxVvdJ6nUZ9kQcuArobdPqCdM2llf77GxYqmvBUnHNBz0Ebr9fC
	XhiRgn9ixh2RleX3rNkcMaOC9lGy8OW5oqxhs6aV88qamUmAqbBoerbWRbPNo1ZwdoIKWeKf9hO
	o
X-Google-Smtp-Source: AGHT+IEtD9e56CoJ/a2mL5JWXB454g5I7WBKv3bNBD9AStyZL0NdKlKEHLmcKQRf6yuDgGg3ndBvvQ==
X-Received: by 2002:a05:6a20:9f09:b0:1af:d95d:98e with SMTP id adf61e73a8af0-1afd95d0c43mr605367637.29.1715256322170;
        Thu, 09 May 2024 05:05:22 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/23] linux-yocto/5.15: update CVE exclusions (5.15.151)
Date: Thu,  9 May 2024 05:04:47 -0700
Message-Id: <a77933a5a677add08a4f7b102a7ea839bb6be7dc.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199156

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


