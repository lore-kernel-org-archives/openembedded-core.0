Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B465DEE57F9
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:07 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.35238.1726097041736787730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cpn4yqGC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d7a9200947so275922a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097041; x=1726701841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNvT32lI8LlgwtIJhAEV/qWlxyPN4FKq69WCQw1xoYM=;
        b=cpn4yqGCLcJ+EtddtsJ3mcGW5Bsj6GMAeGNv01fR5aPYTm7JU1GxpAHPJ74LOQ/b8k
         adZ9+qS1pc5dwr23VuYTweTn6qxCnM0moV2RncHv/u7W8cLRMXU4LpajXc7U/2x2WHea
         XiXhFxPyeXmR95Czy46gvjr4wZtkV4kiK/C1IY4fL3xyjiMrXA2AL88aQlf191Nj4eep
         XyyvIagFgFSHiK4wt+MFbT1FK8JftXOsbq7gPAEZp4Xea1tcbbtHWLZ/Ne8Y8x9+tTSH
         2N0P2ewnzCWUbeYseFekTK0xN0SilGkf9ulS0k+1gJLvaTnNRrMSy1anXwGPvZyA2GZv
         PtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097041; x=1726701841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNvT32lI8LlgwtIJhAEV/qWlxyPN4FKq69WCQw1xoYM=;
        b=OJV1ztrfEzBRU4z9T+5SUKLslT2kYV9IsCjauGvz6KYOxDMxOCdU0KlYMrd6bhU2Kj
         6Md8ClpiHLSE93dtbtvHaZ4nDH2Dxae02TA6YXnD0ZuiVTXFjDcLE/MhBtX/C5ZVo/OJ
         uY+fxc+5NFuDuGVWnSzE6WQfY15fEMjDqKBfc4wHuLCIFQYmS/PzgMQaEAW6UR0Bky5D
         i7K6lCAIy0noOpwQP1Vr5TaYKxOHJ5qQItgRAmGOPaRKzLlqSbbWCFNPIWeVyoIN0mwM
         UTnMqFeV8+0FIG8OS4xwvWoqD1WPoB4kb0/YjL0ndweYX59SmlT5rGjQlKe4x3lGfw3F
         h3Vw==
X-Gm-Message-State: AOJu0YxNAoBrDi6rB1L51wgAw4/QTGax3DQ7B7Ebkwr7U29Pxc7LRrL8
	GA3FkpVMrt6GBbyR56T67YOpDMj4NBpVtlUdtlCuTJipYGXlWkCpX6olapgwWBcoshV4EUQTMTj
	V
X-Google-Smtp-Source: AGHT+IHYUrGuPqIqyrHnxFMQe9usrEW4o449sjtjOGoCDZReHTrt1HqtymcHycO+AIT2R/zcvNB/LQ==
X-Received: by 2002:a05:6a20:2d2c:b0:1cf:66a1:4d8e with SMTP id adf61e73a8af0-1cf75ee48b3mr914832637.17.1726097040892;
        Wed, 11 Sep 2024 16:24:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.24.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:24:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/22] zip: Fix LICENSE
Date: Wed, 11 Sep 2024 16:23:15 -0700
Message-Id: <1aeb18b575ab31f779599ffd108d578012a8b800.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204412

From: Niko Mauno <niko.mauno@vaisala.com>

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2007:

  This is version 2007-Mar-4 of the Info-ZIP license.

(From OE-Core rev: 3739a1af61ff6f0faca23bb565f9e71666953715)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 83e1e52e97..e1e6be6225 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.info-zip.org"
 DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
 
-LICENSE = "BSD-3-Clause"
+LICENSE = "Info-ZIP"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=04d43c5d70b496c032308106e26ae17d"
 
 PR = "r2"
-- 
2.34.1


