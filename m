Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C965CFB450
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 18:23:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2218.1728325421333592992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 11:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=em6Vg47y;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: skulkarni@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20b2ee76302so2661205ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 11:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1728325420; x=1728930220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fy/ajuwHyhvVIqdXf3ikIcW/sKpHR1WCmO5+9aUpNu4=;
        b=em6Vg47y5wHhB4JOZkrlEeB9v9YXx5Y3nv7VtvrcxUyCjbkF8SmzrsFxVueVM8opv4
         fgBsH8gOsOEhK7AMsuMIflUSSxiEZNDJQdWyPkC3BZxwFwYP9ByZSYut8YbO/CvQkVSz
         NXVppydMMJzanfmGSAGXNtVRBu0dNW/JpQZdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325420; x=1728930220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fy/ajuwHyhvVIqdXf3ikIcW/sKpHR1WCmO5+9aUpNu4=;
        b=lTT3SbNkW+TpHnLvnrf2MgQOrh/GY2cQth8RF1ja59OtrQ35QplP65mym+ns0xaYax
         RQBmYILuV7hF4+Zt+PBW2T7Ig/OgeIgRr47adj+xQIm5P2Va75kRBvqtNdpEpU3e+0g/
         QCwvpxzA6eUTvGOBr80CvLa+SEWWc4wQwQpVhkqRXxjI5w8PpCJiy6QPh5dU6mapqWD3
         HWP1ZkmiIeyu4Up88uvgOgl+mc8j7EjpAhDzq//mpwWHtpznqHYR37w4BIGxVtfYRAs0
         ft/K1D6dMV3cnNG7Wi0ZFs/RhxrLMaCjzBcIMtP7J7heaw57aIGKXy1e+/QTYJ1dW5vQ
         CRoA==
X-Gm-Message-State: AOJu0YyFXi1EdXWwmciqubC/yL4e/HdLVNJgAmDDVCTbsG612YiG7TUy
	FzItMtDs1X4xIYAxrRhgEx1gYiWvqYjU5XWuqiWNszOTLhgqFVRyLnr4nmnlug/n5BdKkQrMRr9
	p
X-Google-Smtp-Source: AGHT+IFnamUWhoxkV4vhb2SYuOdhg1DLMGQKpQd6//c+VXYdrCXRzjgfix2A+tURacFNiDX7OHY1Jg==
X-Received: by 2002:a17:902:cece:b0:206:a027:8aa3 with SMTP id d9443c01a7336-20bfd9b1d3cmr80883085ad.0.1728325419898;
        Mon, 07 Oct 2024 11:23:39 -0700 (PDT)
Received: from MVIN00025.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138b474bsm42441035ad.40.2024.10.07.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:23:38 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Massimiliano Minella <massimiliano.minella@se.com>,
	Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH] zstd: fix LICENSE statement
Date: Mon,  7 Oct 2024 23:51:57 +0530
Message-Id: <20241007182157.2005159-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 18:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205275

From: Massimiliano Minella <massimiliano.minella@se.com>

[Backport from OE-Core: 40f85de590c188c9c3985e64a83efaf06b0b4fbc]

zstd is dual-licensed under BSD _OR_ GPLv2 which was updated in the README for v1.5.6.
License wording in the README for v1.5.2 is misleading, but license headers in the code
clearly state that there is a choice between the two licenses.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-extended/zstd/zstd_1.5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.2.bb b/meta/recipes-extended/zstd/zstd_1.5.2.bb
index 3887f31ecf..591e823049 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.2.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
@@ -5,7 +5,7 @@ It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
 HOMEPAGE = "http://www.zstd.net/"
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause & GPL-2.0-only"
+LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-- 
2.34.1


