Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D163C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:28 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.2930.1643917887784114761
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RFdCBLrh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 o16-20020a17090aac1000b001b62f629953so10988317pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TCgFNt37Ut8Ay9BhLjxMWvf1epipg2bXzcpRkxIfZgs=;
        b=RFdCBLrhwyNEQTfRZqt7kRZRxrnxnlmBsSCzdCehU9Lxb4uEguDicBWXOpt1YeN+zH
         nV5NQ/77yGsVJmk0/u4577ayxjjR1+7Rr9h+e0z1iSnnwXXeD6Fy3tkDqREYyHueE/Yj
         5AwXS+P7iScv7Hm7TtaW2yI3X+H2ovM0YW03DysN47RewVfAtu+3hPQPfI1V9J0ltc80
         I5SzP4XgTS+yUZEcnRGJFfzRMRFAIziACBeeU7mkxx9KDn/i2KPo4qbUt6HESXMe24v4
         b0oBOlgCMvNzycmV1bovxP2bkiXCZiX3IHEJkhHxQP+AXHkYuFxTfw3q3h3UTTGqfg2m
         HrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCgFNt37Ut8Ay9BhLjxMWvf1epipg2bXzcpRkxIfZgs=;
        b=l6VyGT/BoNV6S+s0bmDz+OO/1yjN8F/IfmzfTTYRUBaMWeR8GR5o3tyDY6HTqLq+zv
         FpklZEUUUyVXVQAjXRZfqNKNKmYCdzZF7swmKGPTK9no3YQV6wP3uotZKSAUjw9n+oBX
         lwwUhAc3HBZ6OlRsAEnXsOAQhd7TqPAhkV7B+vh3IeXibnQNDePYDL3BL4iy72c8ZUXY
         zd1Q+znKd8zSEIRvLWIF816bNcwWK14F9QJpe9VRaMkeL/H5ywpOrQ6ux7jwS75P3aID
         kR2ds7rFImY1LxphN4Se4F2YVozIQI/wCKZKu94BF8YTtVXDqKpCn2iSYX2dobeK9VYS
         Ihlw==
X-Gm-Message-State: AOAM531RmxjTw9EbnYYIX1RqXJ36NIxLa5LS70cYYQ8P6pNxPuQnO0qS
	dqwUtoAeYovIzoZTVdBW1RVoZlz7AQIBnv/e
X-Google-Smtp-Source: 
 ABdhPJyr0Iq3/L4zhq/WKCTTGZjf6mSdazZ6GJKfKUji10rMMcTPq7B/8sK/t6qsX1qxZnD++UUcFw==
X-Received: by 2002:a17:90b:1952:: with SMTP id
 nk18mr15529566pjb.101.1643917886640;
        Thu, 03 Feb 2022 11:51:26 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/20] common-licenses: add Spencer-94
Date: Thu,  3 Feb 2022 09:50:35 -1000
Message-Id: 
 <0814f13024d17b5e0f83597ce4a97e312aac97a5.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161306

Required to correct lsof licensing

Previously added in master (along with many others), trimmed to
just Spencer-94 for dunfell

(From OE-Core rev: e2f9092c37395f4e3ee9d0777e28c83cce6007ee)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/common-licenses/Spencer-94 | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/files/common-licenses/Spencer-94

diff --git a/meta/files/common-licenses/Spencer-94 b/meta/files/common-licenses/Spencer-94
new file mode 100644
index 0000000000..75ba7f7d2e
--- /dev/null
+++ b/meta/files/common-licenses/Spencer-94
@@ -0,0 +1,12 @@
+Copyright 1992, 1993, 1994 Henry Spencer.  All rights reserved.
+This software is not subject to any license of the American Telephone and Telegraph Company or of the Regents of the University of California.
+
+Permission is granted to anyone to use this software for any purpose on any computer system, and to alter it and redistribute it, subject to the following restrictions:
+
+1. The author is not responsible for the consequences of use of this software, no matter how awful, even if they arise from flaws in it.
+
+2. The origin of this software must not be misrepresented, either by explicit claim or by omission.  Since few users ever read sources, credits must appear in the documentation.
+
+3. Altered versions must be plainly marked as such, and must not be misrepresented as being the original software.  Since few users ever read sources, credits must appear in the documentation.
+
+4. This notice may not be removed or altered.
-- 
2.25.1


